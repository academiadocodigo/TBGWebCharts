unit Image;

interface

uses
  Interfaces, Generics.Collections, Classes;

Type
  TModelImage = class(TInterfacedObject, iModelImage)
    private
      [weak]
      FParent : iModelHTML;
      FDataSet : TList<iModelImageDataSet>;
      FImageClass : iModelImageClass;
      FSource : string;
      FWidth : Integer;
      FHeight : Integer;
      FAlt : string;
      FTooltip : string;
      FObjectFit : string;
      FCallbackParam : string;
      FCallbackMethod : string;
      function RenderStandalone: string;
    public
      constructor Create(Parent : iModelHTML);
      destructor Destroy; override;
      class function New(Parent : iModelHTML) : iModelImage;
      function &End : iModelHTML;
      function DataSet : iModelImageDataSet;
      function ImageClass : iModelImageClass;
      function Source(Value: string): iModelImage; overload;
      function Source(Value: TCustomMemoryStream): iModelImage; overload;
      function Width(Value: Integer): iModelImage;
      function Height(Value: Integer): iModelImage;
      function Alt(const Value: string): iModelImage;
      function Tooltip(const Value: string): iModelImage;
      function ObjectFitCover: iModelImage;
      function ObjectFitContain: iModelImage;
      function CallbackLink(const Param, MethodName: string): iModelImage;
  end;

implementation

uses
  Injection, SysUtils, Image.DataSet, Image.Classes, Utilities.Encoder,
  IdCoderMIME;

function HtmlAttrEncode(const Value: string): string;
begin
  Result := StringReplace(Value, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
end;

{ TModelImage }

function TModelImage.&End: iModelHTML;
var
  I: Integer;
  H: string;
begin
  Result := FParent;

  H := RenderStandalone;
  if H <> '' then
    FParent.HTML(H);

  for I := 0 to Pred(FDataSet.Count) do
    FParent.HTML(FDataSet[I].ResultScript);
end;

function TModelImage.ImageClass: iModelImageClass;
begin
  Result := FImageClass;
end;

constructor TModelImage.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TList<iModelImageDataSet>.Create;
  FImageClass := TModelImageClass.New(Self);
  FWidth := 0;
  FHeight := 0;
end;

function TModelImage.DataSet: iModelImageDataSet;
begin
  FDataSet.Add(TModelImageDataSet.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

destructor TModelImage.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

class function TModelImage.New(Parent : iModelHTML) : iModelImage;
begin
  Result := Self.Create(Parent);
end;

function TModelImage.Source(Value: string): iModelImage;
begin
  Result := Self;
  FSource := Value;
end;

function TModelImage.Source(Value: TCustomMemoryStream): iModelImage;
begin
  Result := Self;
  if Assigned(Value) then
    FSource := TUtilitiesEncoder.ImageToBase64URI(Value)
  else
    FSource := '';
end;

function TModelImage.Width(Value: Integer): iModelImage;
begin
  Result := Self;
  if Value < 0 then Value := 0;
  FWidth := Value;
end;

function TModelImage.Height(Value: Integer): iModelImage;
begin
  Result := Self;
  if Value < 0 then Value := 0;
  FHeight := Value;
end;

function TModelImage.Alt(const Value: string): iModelImage;
begin
  Result := Self;
  FAlt := Value;
end;

function TModelImage.Tooltip(const Value: string): iModelImage;
begin
  Result := Self;
  FTooltip := Value;
end;

function TModelImage.ObjectFitCover: iModelImage;
begin
  Result := Self;
  FObjectFit := 'cover';
end;

function TModelImage.ObjectFitContain: iModelImage;
begin
  Result := Self;
  FObjectFit := 'contain';
end;

function TModelImage.CallbackLink(const Param, MethodName: string): iModelImage;
begin
  Result := Self;
  FCallbackParam := Param;
  FCallbackMethod := MethodName;
end;

function TModelImage.RenderStandalone: string;
var
  Img, Style, Href: string;
begin
  Result := '';
  if Trim(FSource) = '' then Exit;

  Style := '';
  if FWidth > 0 then
    Style := Style + 'width:' + IntToStr(FWidth) + 'px;';
  if FHeight > 0 then
    Style := Style + 'height:' + IntToStr(FHeight) + 'px;';
  if FObjectFit <> '' then
    Style := Style + 'object-fit:' + FObjectFit + ';';

  Img := '<img class="' + HtmlAttrEncode(FImageClass.ResultClass) + '" src="' +
    HtmlAttrEncode(FSource) + '" data-holder-rendered="true"';
  if FAlt <> '' then
    Img := Img + ' alt="' + HtmlAttrEncode(FAlt) + '"';
  if FTooltip <> '' then
    Img := Img + ' title="' + HtmlAttrEncode(FTooltip) + '"';
  if Style <> '' then
    Img := Img + ' style="' + HtmlAttrEncode(Style) + '"';
  Img := Img + '>';

  if Trim(FCallbackMethod) <> '' then
  begin
    Href := 'ActionCallBackJS:' + FCallbackMethod + '(' +
      TIdEncoderMIME.EncodeString(FCallbackParam) + ')';
    Result := '<a href="' + HtmlAttrEncode(Href) + '" class="tbg-image-link">' + Img + '</a>';
  end
  else
    Result := Img;
end;

end.
