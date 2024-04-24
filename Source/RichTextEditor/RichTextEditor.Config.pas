unit RichTextEditor.Config;

interface

uses
  interfaces;

Type
  TModelRichTextEditorConfig = class(TInterfacedObject, iModelRichTextEditorConfig)
  private
    [weak]
    FParent : iModelRichTextEditor;
    FContent : String;
    FHeight : String;
    FWidth : String;
    FMargin : String;
    FMaxHeight : String;
    FMaxWidth : String;
    FPrintHeader : iModelRichTextEditorConfigPrintHeader;
    FPlaceHolder : String;
    FReadOnly : Boolean;
  public
    constructor Create(Parent : iModelRichTextEditor);
    destructor Destroy; override;
    class function New(Parent : iModelRichTextEditor) : iModelRichTextEditorConfig;
    function Content(aValue : String) : iModelRichTextEditorConfig;
    function Height(aValue : string) : iModelRichTextEditorConfig;
    function Width(aValue : string) : iModelRichTextEditorConfig;
    function Margin(aValue : string) : iModelRichTextEditorConfig;
    function MaxHeight(aValue : string) : iModelRichTextEditorConfig;
    function MaxWidth(aValue : string) : iModelRichTextEditorConfig;
    function PrintHeader : iModelRichTextEditorConfigPrintHeader;
    function PlaceHolder(aValue : String) : iModelRichTextEditorConfig;
    function ReadOnly(aValue : Boolean) : iModelRichTextEditorConfig;
    function ResultStyleContainer : String;
    function ResultStyleEditor : String;
    function ResultConfig : String;
    function ResultContent : String;
    function ResultPrintHeader : String;
    function &End : iModelRichTextEditor;
  end;

implementation

uses
  Injection,
  System.SysUtils,
  RichTextEditor.Config.PrintHeader;

{ TModelRichTextEditorConfig }

function TModelRichTextEditorConfig.&End: iModelRichTextEditor;
begin
  Result := FParent;
end;

function TModelRichTextEditorConfig.Content(
  aValue: String): iModelRichTextEditorConfig;
begin
  Result := Self;
  FContent := aValue;
end;

constructor TModelRichTextEditorConfig.Create(Parent : iModelRichTextEditor);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FMargin := 'margin: 50px auto; ';
  FHeight := 'height: 200px; ';
end;

destructor TModelRichTextEditorConfig.Destroy;
begin

  inherited;
end;

function TModelRichTextEditorConfig.Height(
  aValue: string): iModelRichTextEditorConfig;
begin
  Result := Self;
  FHeight := Format('height: %s; ', [aValue]);
end;

function TModelRichTextEditorConfig.Margin(
  aValue: string): iModelRichTextEditorConfig;
begin
  Result := Self;
  FMargin := Format('margin: %s; ', [aValue]);
end;

function TModelRichTextEditorConfig.MaxHeight(
  aValue: string): iModelRichTextEditorConfig;
begin
  Result := Self;
  FMaxHeight := Format('max-height: %s; ', [aValue]);
end;

function TModelRichTextEditorConfig.MaxWidth(
  aValue: string): iModelRichTextEditorConfig;
begin
  Result := Self;
  FMaxWidth := Format('max-width: %s; ', [aValue]);
end;

class function TModelRichTextEditorConfig.New (Parent : iModelRichTextEditor) : iModelRichTextEditorConfig;
begin
  Result := Self.Create(Parent);
end;

function TModelRichTextEditorConfig.PlaceHolder(
  aValue: String): iModelRichTextEditorConfig;
begin
  Result := Self;
  FPlaceHolder := aValue;
end;

function TModelRichTextEditorConfig.PrintHeader: iModelRichTextEditorConfigPrintHeader;
begin
  if not Assigned(FPrintHeader) then
    FPrintHeader := TModelRichTextEditorConfigPrintHeader.New(Self);
  Result := FPrintHeader;
end;

function TModelRichTextEditorConfig.ReadOnly(
  aValue: Boolean): iModelRichTextEditorConfig;
begin
  Result := Self;
  FReadOnly := aValue;
end;

function TModelRichTextEditorConfig.ResultConfig: String;
begin
  Result:= '{';
  Result := Result + 'modules: {';
  Result := Result + 'formula: false,';
  Result := Result + 'syntax: false,';
  Result := Result + 'toolbar: "#toolbar-container",';
  Result := Result + '},';
  Result := Result + 'placeholder: "' + FPlaceHolder + '",';
  Result := Result + 'readOnly: ' + LowerCase(BoolToStr(FReadOnly, true)) + ',';
  Result := Result + 'theme: "snow",';
  Result := Result + '}';
end;

function TModelRichTextEditorConfig.ResultContent: String;
begin
  Result := '';
  if FContent <> '' then
    Result := Format('LoadQuillContent(''%s'');', [ FContent ]);
end;

function TModelRichTextEditorConfig.ResultPrintHeader: String;
begin
  Result := '';
  if Assigned(FPrintHeader) then
    Result := FPrintHeader.HTML;
end;

function TModelRichTextEditorConfig.ResultStyleContainer: String;
begin
  Result := format('style="%s%s%s%s%s"', [ FMargin, FWidth, FMaxWidth, FHeight, FMaxHeight ]);
end;

function TModelRichTextEditorConfig.ResultStyleEditor: String;
begin
  Result := 'style="font-size: 20px"';
end;

function TModelRichTextEditorConfig.Width(
  aValue: string): iModelRichTextEditorConfig;
begin
  Result := Self;
  FWidth := Format('width: %s; ', [aValue]);
end;

end.
