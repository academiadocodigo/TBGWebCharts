unit RichTextEditor;

interface

uses
  Interfaces,
  System.SysUtils;

Type
  TModelRichTextEditor = class(TInterfacedObject, iModelRichTextEditor)
  private
    [weak]
    FParent : iModelHTML;
    FConfig : iModelRichTextEditorConfig;
    function ResultScript : String;
  public
    constructor Create(Parent : IModelHTML);
    destructor Destroy; override;
    class function New(Parent : IModelHTML) : iModelRichTextEditor;
    function Attributes : iModelRichTextEditorConfig;
    function LoadContent(aValue : String) : iModelRichTextEditor;
    function SaveContent(Value : TProc<String>) : iModelRichTextEditor;
    function SaveContentHtml(Value : TProc<String>) : iModelRichTextEditor;
    function SaveContentText(Value : TProc<String>) : iModelRichTextEditor;
    function &End : iModelHTML;
  end;

implementation

uses
  Injection, RichTextEditor.Config, JSCommand;

{ TModelRichTextEditor }

function TModelRichTextEditor.Attributes: iModelRichTextEditorConfig;
begin
  Result := FConfig;
end;

function TModelRichTextEditor.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML(ResultScript);
end;

constructor TModelRichTextEditor.Create(Parent : IModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FConfig := TModelRichTextEditorConfig.New(Self);
end;

destructor TModelRichTextEditor.Destroy;
begin

  inherited;
end;

function TModelRichTextEditor.LoadContent(aValue: String): iModelRichTextEditor;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('LoadQuillContent')
    .Paramters
      .Add(QuotedStr(aValue))
    .&End;
    FParent.ExecuteScript(CommandJS);
end;

class function TModelRichTextEditor.New (Parent : IModelHTML) : iModelRichTextEditor;
begin
  Result := Self.Create(Parent);
end;

function TModelRichTextEditor.ResultScript: String;
begin
  Result := FConfig.resultPrintHeader;
  Result := Result + '<div id="standalone-container" ' + FConfig.ResultStyleContainer + '>';
  Result := Result + '<div id="toolbar-container">';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<select class="ql-font" title="Fonte">';
  Result := Result + '<option selected value="sans-serif">Sans Serif</option>';
  Result := Result + '<option value="serif">Serif</option>';
  Result := Result + '<option value="monospace">Monospace</option>';
  Result := Result + '<option value="cursive">Cursive</option>';
  Result := Result + '<option value="fantasy">Fantasy</option></select>';
  Result := Result + '<select class="ql-size" title="Tamanho da fonte">';
  Result := Result + '<option value="small">Pequeno</option>';
  Result := Result + '<option selected value="normal">Normal</option>';
  Result := Result + '<option value="large">Grande</option>';
  Result := Result + '<option value="huge">Enorme</option>';
  Result := Result + '</select></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<button class="ql-bold" title="Negrito (Ctrl+B)"></button>';
  Result := Result + '<button class="ql-italic" title="Itálico (Ctrl+I)"></button>';
  Result := Result + '<button class="ql-underline" title="Sublinhado (Ctrl+U)"></button>';
  Result := Result + '<button class="ql-strike" title="Tachado"></button></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<select class="ql-color" title="Cor do texto"></select>';
  Result := Result + '<select class="ql-background" title="Cor de destaque">';
  Result := Result + '</select></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<button class="ql-script" value="sub" title="Subscrito"></button>';
  Result := Result + '<button class="ql-script" value="super" title="Sobrescrito">';
  Result := Result + '</button></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<button class="ql-list" value="ordered" title="Lista ordenada">';
  Result := Result + '</button>';
  Result := Result + '<button class="ql-list" value="bullet" title="Lista com marcadores">';
  Result := Result + '</button>';
  Result := Result + '<button class="ql-indent" value="-1"title="Diminuir recuo">';
  Result := Result + '</button>';
  Result := Result + '<button class="ql-indent" value="+1" title="Aumentar recuo">';
  Result := Result + '</button></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<select class="ql-align" title="Alinhamento do texto">';
  Result := Result + '</select></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<button class="ql-link" title="Inserir link"></button>';
  Result := Result + '<button class="ql-image" title="Inserir imagem"></button></span>';
  Result := Result + '<span class="ql-formats">';
  Result := Result + '<button class="ql-clean" title="Limpar formatação"></button>';
  Result := Result + '</span>';
  Result := Result + '</div>';
  Result := Result + '<div id="editor-container" ' + FConfig.ResultStyleEditor + '></div>';
  Result := Result + '<input type="hidden" id="quillContent" value="" />';
  Result := Result + '<input type="hidden" id="quillText" value="" />';
  Result := Result + '<input type="hidden" id="quillHtml" value="" />';
  Result := Result + '</div>';
  Result := Result + '<script>';
  Result := Result + 'var Font = Quill.import("attributors/class/font");';
  Result := Result + 'Font.whitelist = [';
  Result := Result + '"sans-serif",';
  Result := Result + '"serif",';
  Result := Result + '"monospace",';
  Result := Result + '"cursive",';
  Result := Result + '"fantasy",';
  Result := Result + '];';
  Result := Result + 'Quill.register(Font, true);';
  Result := Result + 'var quill = new Quill("#editor-container",' + FConfig.ResultConfig + ');';
  Result := Result + FConfig.ResultContent;
  Result := Result + 'function SaveQuillContent() {';
  Result := Result + 'var jsonContent = quill.getContents();';
  Result := Result + 'document.getElementById("quillContent").value = JSON.stringify(jsonContent);';
  Result := Result + '}';
  Result := Result + 'function SaveQuillText() {';
  Result := Result + 'var result = quill.getText();';
  Result := Result + 'document.getElementById("quillText").value = result;';
  Result := Result + '}';
  Result := Result + 'function SaveQuillHtml() {';
  Result := Result + 'var cfg = { inlineStyles: true };';
  Result := Result + 'var deltaOps = quill.getContents();';
  Result := Result + 'var converter = new QuillDeltaToHtmlConverter(deltaOps.ops, cfg);';
  Result := Result + 'var result = converter.convert();';
  Result := Result + 'document.getElementById("quillHtml").value = result;';
  Result := Result + '}';
  Result := Result + 'function LoadQuillContent(content) {';
  Result := Result + 'try {';
  Result := Result + 'var jsonContent = JSON.parse(content.replace(/\n/g, "\\n"));';
  Result := Result + 'quill.setContents(jsonContent);';
  Result := Result + '} catch (e){';
  Result := Result + 'quill.setText(content);';
  Result := Result + '}';
  Result := Result + '}';
  Result := Result + '</script>';
end;

function TModelRichTextEditor.SaveContent(
  Value: TProc<String>): iModelRichTextEditor;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('SaveQuillContent')
    .TagName('input')
    .TagID('quillContent')
    .TagAttribute('value')
    .CallBack(Value);
  FParent.ExecuteScriptCallback(CommandJS);
end;

function TModelRichTextEditor.SaveContentHtml(
  Value: TProc<String>): iModelRichTextEditor;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('SaveQuillHtml')
    .TagName('input')
    .TagID('quillHtml')
    .TagAttribute('value')
    .CallBack(Value);
  FParent.ExecuteScriptCallback(CommandJS);
end;

function TModelRichTextEditor.SaveContentText(
  Value: TProc<String>): iModelRichTextEditor;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('SaveQuillText')
    .TagName('input')
    .TagID('quillText')
    .TagAttribute('value')
    .CallBack(Value);
  FParent.ExecuteScriptCallback(CommandJS);
end;

end.
