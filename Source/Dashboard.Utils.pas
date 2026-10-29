unit Dashboard.Utils;

interface

uses
  System.SysUtils;


type
  TDashboardUtils = class
  public
    class function HtmlEncode(const Value: string): string; static;
    class function AttrEncode(const Value: string): string; static;
    class function JsNumber(const Value: Double): string; static;
    class function CompactCurrency(const Value: Double; const Prefix: string = 'R$ '): string; static;
    class function ClampPercent(const Value: Double): Double; static;
    class function StatusClass(const Value: string): string; static;
    class function ActionHref(const MethodName, Param: string): string; static;
    class function IconHTML(const Icon: string = ''; const CssClass: string = ''; const AltText: string = ''): string; static;
  end;

type
  TIconBytes = array of Byte;

implementation

uses
  Classes,
  IdCoderMIME;

function Base64EncodeBytes(const Data: TIconBytes): string;
const
  Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I, L, Remaining: Integer;
  B0, B1, B2: Byte;
  C1, C2, C3, C4: Integer;
begin
  Result := '';
  I := 0;
  L := Length(Data);
  while I < L do
  begin
    B0 := Data[I];
    Remaining := L - I;
    if Remaining > 1 then B1 := Data[I + 1] else B1 := 0;
    if Remaining > 2 then B2 := Data[I + 2] else B2 := 0;

    C1 := B0 shr 2;
    C2 := ((B0 and $03) shl 4) or (B1 shr 4);
    C3 := ((B1 and $0F) shl 2) or (B2 shr 6);
    C4 := B2 and $3F;

    Result := Result + Alphabet[C1 + 1] + Alphabet[C2 + 1];
    if Remaining > 1 then Result := Result + Alphabet[C3 + 1]
    else Result := Result + '=';
    if Remaining > 2 then Result := Result + Alphabet[C4 + 1]
    else Result := Result + '=';
    Inc(I, 3);
  end;
end;

function MimeTypeForFile(const FileName: string): string;
var
  Ext: string;
begin
  Ext := LowerCase(ExtractFileExt(FileName));
  if Ext = '.svg' then Result := 'image/svg+xml'
  else if Ext = '.png' then Result := 'image/png'
  else if (Ext = '.jpg') or (Ext = '.jpeg') then Result := 'image/jpeg'
  else if Ext = '.gif' then Result := 'image/gif'
  else if Ext = '.webp' then Result := 'image/webp'
  else if Ext = '.ico' then Result := 'image/x-icon'
  else Result := 'application/octet-stream';
end;

function FileToDataURI(const FileName: string): string;
var
  Stream: TFileStream;
  Data: TIconBytes;
  FileSize: Int64;
begin
  Result := '';

  if not FileExists(FileName) then
    Exit;

  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    try
      FileSize := Stream.Size;

      if FileSize > MaxInt then
        Exit;

      SetLength(Data, Integer(FileSize));
      if Length(Data) > 0 then
      begin
        Stream.Position := 0;
        Stream.ReadBuffer(Data[0], Length(Data));
      end;

      Result := 'data:' + MimeTypeForFile(FileName) + ';base64,' + Base64EncodeBytes(Data);
    except
      Result := '';
    end;
  finally
    Stream.Free;
  end;
end;

function StartsWithText(const Value, Prefix: string): Boolean;
begin
  Result := Copy(LowerCase(Trim(Value)), 1, Length(Prefix)) = LowerCase(Prefix);
end;

function ResolveIconFileName(const Value: string): string;
var
  Candidate: string;
begin
  Result := Value;
  if FileExists(Result) then Exit;
  if ExtractFileExt(Value) = '' then Exit;
  Candidate := ExpandFileName(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + Value);
  if FileExists(Candidate) then
    Result := Candidate;
end;

function CompatibleIconClass(const Value: string): string;
begin
  Result := Trim(Value);
  if SameText(Result, 'fas fa-file-invoice-dollar') then
    Result := 'fas fa-file-alt'
  else if SameText(Result, 'fas fa-wallet') then
    Result := 'fas fa-dollar-sign'
  else if SameText(Result, 'fas fa-seedling') then
    Result := 'fas fa-leaf';
end;

function LooksLikeImage(const Value: string): Boolean;
var
  S: string;
begin
  S := LowerCase(Trim(Value));
  Result := StartsWithText(S, 'data:image/') or StartsWithText(S, 'http://') or
    StartsWithText(S, 'https://') or StartsWithText(S, 'file:///') or
    SameText(ExtractFileExt(S), '.svg') or
    SameText(ExtractFileExt(S), '.png') or
    SameText(ExtractFileExt(S), '.jpg') or
    SameText(ExtractFileExt(S), '.jpeg') or
    SameText(ExtractFileExt(S), '.gif') or
    SameText(ExtractFileExt(S), '.webp') or
    SameText(ExtractFileExt(S), '.ico');
end;

class function TDashboardUtils.HtmlEncode(const Value: string): string;
begin
  Result := StringReplace(Value, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
end;

class function TDashboardUtils.AttrEncode(const Value: string): string;
begin
  Result := HtmlEncode(Value);
end;

class function TDashboardUtils.JsNumber(const Value: Double): string;
var
  FS: TFormatSettings;
begin
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := '.';
  FS.ThousandSeparator := #0;
  Result := FloatToStr(Value, FS);
end;

class function TDashboardUtils.CompactCurrency(const Value: Double;
  const Prefix: string): string;
var
  N, AbsValue: Double;
  Suffix, Sign: string;
begin
  AbsValue := Abs(Value);
  Suffix := '';
  N := Value;
  if AbsValue >= 1000000000 then
  begin
    N := Value / 1000000000;
    Suffix := 'B';
  end
  else if AbsValue >= 1000000 then
  begin
    N := Value / 1000000;
    Suffix := 'M';
  end
  else if AbsValue >= 1000 then
  begin
    N := Value / 1000;
    Suffix := 'k';
  end;
  if N < 0 then Sign := '-' else Sign := '';
  if Suffix = '' then
    Result := Prefix + Sign + FormatFloat('#,##0.00', Abs(N))
  else
    Result := Prefix + Sign + FormatFloat('0.##', Abs(N)) + Suffix;
end;

class function TDashboardUtils.ClampPercent(const Value: Double): Double;
begin
  Result := Value;
  if Result < 0 then Result := 0;
  if Result > 100 then Result := 100;
end;

class function TDashboardUtils.StatusClass(const Value: string): string;
var
  S: string;
begin
  S := LowerCase(Trim(Value));
  if (S = 'success') or (S = 'sucesso') or (S = 'ok') then
    Result := 'success'
  else if (S = 'warning') or (S = 'aviso') or (S = 'atencao') then
    Result := 'warning'
  else if (S = 'danger') or (S = 'erro') or (S = 'critico') then
    Result := 'danger'
  else if (S = 'info') then
    Result := 'info'
  else if (S = 'dark') then
    Result := 'dark'
  else
    Result := 'primary';
end;

class function TDashboardUtils.ActionHref(const MethodName, Param: string): string;
begin
  if Trim(MethodName) = '' then Exit('');
  Result := 'ActionCallBackJS:' + MethodName + '(' +
    TIdEncoderMIME.EncodeString(Param) + ')';
end;

class function TDashboardUtils.IconHTML(const Icon: string = ''; const CssClass: string = ''; const AltText: string = ''): string;
var
  Source, Classes, LocalFileName: string;
begin
  Result := '';
  Source := Trim(Icon);
  if Source = '' then Exit;

  Classes := Trim(CssClass);
  LocalFileName := ResolveIconFileName(Source);
  if FileExists(LocalFileName) then
  begin
    Source := FileToDataURI(LocalFileName);
    if Source = '' then Exit;
  end;

  if StartsWithText(Source, 'data:image/') or StartsWithText(Source, 'http://') or
    StartsWithText(Source, 'https://') or StartsWithText(Source, 'file:///') or
    LooksLikeImage(Source) then
  begin
    Result := '<img';
    if Classes <> '' then
      Result := Result + ' class="' + AttrEncode(Classes) + '"';
    Result := Result + ' src="' + AttrEncode(Source) + '"';
    if AltText <> '' then
      Result := Result + ' alt="' + AttrEncode(AltText) + '"';
    Result := Result + ' />';
  end
  else
  begin
    Source := CompatibleIconClass(Source);
    if Classes <> '' then Classes := Classes + ' ';
    Result := '<i class="' + AttrEncode(Classes + Source) + '"';
    if AltText <> '' then
      Result := Result + ' title="' + AttrEncode(AltText) + '"';
    Result := Result + '></i>';
  end;
end;

end.
