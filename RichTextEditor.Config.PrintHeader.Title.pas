unit RichTextEditor.Config.PrintHeader.Title;

interface

uses
  Interfaces;

Type
  TModelRichTextEditorConfigPrintHeaderTitle = class(TInterfacedObject, iModelRichTextEditorConfigPrintHeaderTitle)
  private
    [weak]
    FParent : iModelRichTextEditorConfigPrintHeaderDiv;
    FStyle : iModelGenericStyle<iModelRichTextEditorConfigPrintHeaderTitle>;
    FText : String;
  public
    constructor Create(Parent : iModelRichTextEditorConfigPrintHeaderDiv);
    destructor Destroy; override;
    class function New(Parent : iModelRichTextEditorConfigPrintHeaderDiv) : iModelRichTextEditorConfigPrintHeaderTitle;
    function HTML : String;
    function Text (aValue : String) : iModelRichTextEditorConfigPrintHeaderTitle; overload;
    function Style : iModelGenericStyle<iModelRichTextEditorConfigPrintHeaderTitle>;
    function &End : iModelRichTextEditorConfigPrintHeaderDiv;
  end;

implementation

uses
  Injection,
  Generic.Style, System.SysUtils;

{ TModelRichTextEditorConfigPrintHeaderTitle }

function TModelRichTextEditorConfigPrintHeaderTitle.&End: iModelRichTextEditorConfigPrintHeaderDiv;
begin
  Result := FParent;
end;

function TModelRichTextEditorConfigPrintHeaderTitle.HTML: String;
begin
  Result := '';
  if FText <> '' then
    Result := Result + Format('<h5 %s>%s</h5>', [FStyle.ResultStyle, FText]);
end;

constructor TModelRichTextEditorConfigPrintHeaderTitle.Create(Parent : iModelRichTextEditorConfigPrintHeaderDiv);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FStyle := TModelGenericStyle<iModelRichTextEditorConfigPrintHeaderTitle>.New(Self).FontSize(40);
end;

destructor TModelRichTextEditorConfigPrintHeaderTitle.Destroy;
begin

  inherited;
end;

class function TModelRichTextEditorConfigPrintHeaderTitle.New (Parent : iModelRichTextEditorConfigPrintHeaderDiv) : iModelRichTextEditorConfigPrintHeaderTitle;
begin
  Result := Self.Create(Parent);
end;

function TModelRichTextEditorConfigPrintHeaderTitle.Style: iModelGenericStyle<iModelRichTextEditorConfigPrintHeaderTitle>;
begin
  Result := FStyle;
end;

function TModelRichTextEditorConfigPrintHeaderTitle.Text(
  aValue: String): iModelRichTextEditorConfigPrintHeaderTitle;
begin
  Result := Self;
  FText := aValue;
end;

end.
