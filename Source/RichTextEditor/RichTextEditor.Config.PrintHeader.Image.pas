unit RichTextEditor.Config.PrintHeader.Image;

interface

uses
  Interfaces,
  System.Classes;

Type
  TModelRichTextEditorConfigPrintHeaderImage = class(TInterfacedObject, iModelRichTextEditorConfigPrintHeaderImage)
  private
    [weak]
    FParent : iModelRichTextEditorConfigPrintHeaderDiv;
    FImage : String;
    FStyle : iModelGenericStyle<iModelRichTextEditorConfigPrintHeaderImage>;
  public
    constructor Create(Parent : iModelRichTextEditorConfigPrintHeaderDiv);
    destructor Destroy; override;
    class function New(Parent : iModelRichTextEditorConfigPrintHeaderDiv) : iModelRichTextEditorConfigPrintHeaderImage;
    function HTML : String;
    function Image (aValue : TCustomMemoryStream) : iModelRichTextEditorConfigPrintHeaderImage; overload;
    function Image (aValue : String) : iModelRichTextEditorConfigPrintHeaderImage; overload;
    function Style : iModelGenericStyle<iModelRichTextEditorConfigPrintHeaderImage>;
    function &End : iModelRichTextEditorConfigPrintHeaderDiv;
  end;

implementation

uses

  Injection,
  Generic.Style,
  Utilities.Encoder;

{ TModelRichTextEditorConfigPrintHeaderImage }

function TModelRichTextEditorConfigPrintHeaderImage.&End: iModelRichTextEditorConfigPrintHeaderDiv;
begin
  Result := FParent;
end;

function TModelRichTextEditorConfigPrintHeaderImage.HTML: String;
begin
  Result := '';
  if FImage <> '' then
    Result := '<img src= "' + FImage + '" ' + FStyle.ResultStyle + '/>'
end;

constructor TModelRichTextEditorConfigPrintHeaderImage.Create(Parent : iModelRichTextEditorConfigPrintHeaderDiv);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FStyle := TModelGenericStyle<iModelRichTextEditorConfigPrintHeaderImage>.New(Self).Width(50).Height(50);
end;

destructor TModelRichTextEditorConfigPrintHeaderImage.Destroy;
begin

  inherited;
end;

function TModelRichTextEditorConfigPrintHeaderImage.Image(
  aValue: TCustomMemoryStream): iModelRichTextEditorConfigPrintHeaderImage;
begin
  Result := Self;
  FImage := TUtilitiesEncoder.ImageToBase64URI(aValue);
end;

function TModelRichTextEditorConfigPrintHeaderImage.Image(
  aValue: String): iModelRichTextEditorConfigPrintHeaderImage;
begin
  Result := Self;
  FImage := aValue;
end;

class function TModelRichTextEditorConfigPrintHeaderImage.New (Parent : iModelRichTextEditorConfigPrintHeaderDiv) : iModelRichTextEditorConfigPrintHeaderImage;
begin
  Result := Self.Create(Parent);
end;

function TModelRichTextEditorConfigPrintHeaderImage.Style: iModelGenericStyle<iModelRichTextEditorConfigPrintHeaderImage>;
begin
  Result := FStyle;
end;

end.
