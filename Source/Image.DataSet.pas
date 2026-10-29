unit Image.DataSet;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces, DB, Classes, Generics.Collections;

Type
  TModelImageDataSet = class(TInterfacedObject, iModelImageDataSet)
    private
      [weak]
      FParent : iModelImage;
      FDataSet : TDataSet;
      FField : String;
      FCallbackField : String;
      FCallbackMethod : String;
      FAlt : String;
      FAltField : String;
      FTooltip : String;
      FTooltipField : String;
      FWidth : Integer;
      FHeight : Integer;
      FObjectFit : String;
    public
      constructor Create(Parent : iModelImage);
      destructor Destroy; override;
      class function New(Parent : iModelImage) : iModelImageDataSet;
      function DataSet (Value : TDataSet) : iModelImageDataSet;
      function ResultScript : String;
      function Field(Value : String) : iModelImageDataSet;
      function CallbackLink(const Field, MethodName: string): iModelImageDataSet;
      function Alt(const Value: string): iModelImageDataSet;
      function AltField(const FieldName: string): iModelImageDataSet;
      function Tooltip(const Value: string): iModelImageDataSet;
      function TooltipField(const FieldName: string): iModelImageDataSet;
      function Width(Value: Integer): iModelImageDataSet;
      function Height(Value: Integer): iModelImageDataSet;
      function ObjectFitCover: iModelImageDataSet;
      function ObjectFitContain: iModelImageDataSet;
      function &End : iModelImage;
  end;

implementation

uses
  SysUtils,
  {$IFDEF HAS_FMX}
      FMX.ExtCtrls,
  {$ELSE}
    {$IF RTLVERSION > 27 }
      VCL.ExtCtrls,
    {$IFEND}
    {$IF RTLVERSION < 28 }
      ExtCtrls,
    {$IFEND}
  {$ENDIF}
  Injection, IdCoderMIME;

function HtmlAttrEncode(const Value: string): string;
begin
  Result := StringReplace(Value, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
end;

function FieldText(ADataSet: TDataSet; const FieldName: string): string;
var
  F: TField;
begin
  Result := '';
  if not Assigned(ADataSet) then Exit;
  if Trim(FieldName) = '' then Exit;
  F := ADataSet.FindField(FieldName);
  if Assigned(F) and not F.IsNull then
    Result := F.AsString;
end;

{ TModelImageDataSet }

function TModelImageDataSet.&End: iModelImage;
begin
  Result := FParent;
end;

function TModelImageDataSet.Field(Value: String): iModelImageDataSet;
begin
  Result := Self;
  FField := Value;
end;

constructor TModelImageDataSet.Create(Parent : iModelImage);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FWidth := 0;
  FHeight := 0;
end;

function TModelImageDataSet.DataSet(Value: TDataSet): iModelImageDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelImageDataSet.Destroy;
begin
  inherited;
end;

class function TModelImageDataSet.New(Parent : iModelImage) : iModelImageDataSet;
begin
  Result := Self.Create(Parent);
end;

function TModelImageDataSet.CallbackLink(const Field,
  MethodName: string): iModelImageDataSet;
begin
  Result := Self;
  FCallbackField := Field;
  FCallbackMethod := MethodName;
end;

function TModelImageDataSet.Alt(const Value: string): iModelImageDataSet;
begin
  Result := Self;
  FAlt := Value;
end;

function TModelImageDataSet.AltField(const FieldName: string): iModelImageDataSet;
begin
  Result := Self;
  FAltField := FieldName;
end;

function TModelImageDataSet.Tooltip(const Value: string): iModelImageDataSet;
begin
  Result := Self;
  FTooltip := Value;
end;

function TModelImageDataSet.TooltipField(const FieldName: string): iModelImageDataSet;
begin
  Result := Self;
  FTooltipField := FieldName;
end;

function TModelImageDataSet.Width(Value: Integer): iModelImageDataSet;
begin
  Result := Self;
  if Value < 0 then Value := 0;
  FWidth := Value;
end;

function TModelImageDataSet.Height(Value: Integer): iModelImageDataSet;
begin
  Result := Self;
  if Value < 0 then Value := 0;
  FHeight := Value;
end;

function TModelImageDataSet.ObjectFitCover: iModelImageDataSet;
begin
  Result := Self;
  FObjectFit := 'cover';
end;

function TModelImageDataSet.ObjectFitContain: iModelImageDataSet;
begin
  Result := Self;
  FObjectFit := 'contain';
end;

function TModelImageDataSet.ResultScript: String;
var
  Bookmark: TBookmark;
  HasBookmark: Boolean;
  Src, Param, Img, Href, AltValue, TooltipValue, Style: string;
begin
  Result := '';
  if not Assigned(FDataSet) then Exit;
  if not FDataSet.Active then Exit;
  if Trim(FField) = '' then Exit;
  if not Assigned(FDataSet.FindField(FField)) then Exit;

  HasBookmark := False;
  if not FDataSet.IsEmpty then
  begin
    try
      Bookmark := FDataSet.Bookmark;
      HasBookmark := True;
    except
      HasBookmark := False;
    end;
  end;

  FDataSet.DisableControls;
  try
    FDataSet.First;
    while not FDataSet.Eof do
    begin
      Src := FieldText(FDataSet, FField);
      if Src <> '' then
      begin
        AltValue := FAlt;
        if FAltField <> '' then
          AltValue := FieldText(FDataSet, FAltField);

        TooltipValue := FTooltip;
        if FTooltipField <> '' then
          TooltipValue := FieldText(FDataSet, FTooltipField);

        Style := '';
        if FWidth > 0 then
          Style := Style + 'width:' + IntToStr(FWidth) + 'px;';
        if FHeight > 0 then
          Style := Style + 'height:' + IntToStr(FHeight) + 'px;';
        if FObjectFit <> '' then
          Style := Style + 'object-fit:' + FObjectFit + ';';

        Img := '<img class="' + HtmlAttrEncode(FParent.ImageClass.ResultClass) + '" src="' +
          HtmlAttrEncode(Src) + '" data-holder-rendered="true"';
        if AltValue <> '' then
          Img := Img + ' alt="' + HtmlAttrEncode(AltValue) + '"';
        if TooltipValue <> '' then
          Img := Img + ' title="' + HtmlAttrEncode(TooltipValue) + '"';
        if Style <> '' then
          Img := Img + ' style="' + HtmlAttrEncode(Style) + '"';
        Img := Img + '>';

        if (Trim(FCallbackMethod) <> '') and (Trim(FCallbackField) <> '') then
        begin
          Param := FieldText(FDataSet, FCallbackField);
          Href := 'ActionCallBackJS:' + FCallbackMethod + '(' +
            TIdEncoderMIME.EncodeString(Param) + ')';
          Result := Result + '<a href="' + HtmlAttrEncode(Href) +
            '" class="tbg-image-link">' + Img + '</a>';
        end
        else
          Result := Result + Img;
      end;
      FDataSet.Next;
    end;
  finally
    if HasBookmark then
    begin
      try
        if FDataSet.BookmarkValid(Bookmark) then
          FDataSet.Bookmark := Bookmark;
      except
        { Datasets unidirecionais podem nao suportar bookmark. }
      end;
    end;
    FDataSet.EnableControls;
  end;
end;

end.
