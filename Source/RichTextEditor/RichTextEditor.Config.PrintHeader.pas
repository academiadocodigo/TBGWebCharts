unit RichTextEditor.Config.PrintHeader;

interface

uses
  Interfaces,
  Generics.Collections;

Type
  TModelRichTextEditorConfigPrintHeader = class(TInterfacedObject, iModelRichTextEditorConfigPrintHeader)
  private
    [weak]
    FParent : iModelRichTextEditorConfig;
    FDiv : TList<iModelRichTextEditorConfigPrintHeaderDiv>;
  public
    constructor Create(Parent : iModelRichTextEditorConfig);
    destructor Destroy; override;
    class function New(Parent :iModelRichTextEditorConfig) : iModelRichTextEditorConfigPrintHeader;
    function &Div : iModelRichTextEditorConfigPrintHeaderDiv;
    function HTML : String;
    function &End : iModelRichTextEditorConfig;
  end;

implementation

uses
  Injection,
  RichTextEditor.Config.PrintHeader.Divv;

{ TModelRichTextEditorConfigPrintHeader }

constructor TModelRichTextEditorConfigPrintHeader.Create(Parent : iModelRichTextEditorConfig);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDiv := TList<iModelRichTextEditorConfigPrintHeaderDiv>.Create;
end;

function TModelRichTextEditorConfigPrintHeader.&Div: iModelRichTextEditorConfigPrintHeaderDiv;
begin
  FDiv.Add(TModelRichTextEditorConfigPrintHeaderDiv.New(Self));
  Result := FDiv[Pred(FDiv.Count)];
end;

function TModelRichTextEditorConfigPrintHeader.&End: iModelRichTextEditorConfig;
begin
  Result := FParent;
end;

function TModelRichTextEditorConfigPrintHeader.HTML: String;
var
  I: Integer;
begin
  Result := '<div id="cabecalho-impressao" class="row" style="padding-bottom: 20px">';
  for I := 0 to Pred(FDiv.Count) do
    Result := Result + FDiv[I].HTML;
    Result := Result + '</div>';
end;

destructor TModelRichTextEditorConfigPrintHeader.Destroy;
begin
  FDiv.Free;
  inherited;
end;

class function TModelRichTextEditorConfigPrintHeader.New (Parent :iModelRichTextEditorConfig) : iModelRichTextEditorConfigPrintHeader;
begin
  Result := Self.Create(Parent);
end;

end.
