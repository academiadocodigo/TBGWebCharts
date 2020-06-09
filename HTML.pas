unit HTML;

{$I TBGWebCharts.inc}
{$HINTS OFF}

interface

uses
  Interfaces,

  Generics.Collections,
  {$IFDEF HAS_FMX}
    {$IF Defined(ANDROID) or Defined(IOS)}
      FMX.StdCtrls,
      FMX.WebBrowser,
    {$ELSE}
      FMX.StdCtrls,
      FMX.WebBrowser,
      Registry,
    {$ENDIF}
  {$ELSE}
    {$IF RTLVERSION > 27 }
      VCL.StdCtrls,
      VCL.Buttons,
      SHDocVw,
      VCL.Dialogs,
      {$IF RTLVERSION > 31 }
        Win.Registry,
      {$IFEND}
      {$IF RTLVERSION < 32 }
        Registry,
      {$IFEND}
    {$IFEND}
    {$IF RTLVERSION < 28 }
      StdCtrls,
      Buttons,
      SHDocVw,
      Dialogs,
      Registry,
    {$IFEND}
  {$ENDIF}
  {$IF RTLVERSION > 22 }
    {$IFDEF FULL}
      CallBackJS,
      Button,
    {$ENDIF}
  {$IFEND}
  Classes, PackJS, PackCss, Charts.Types;

Type
  {$IFDEF HAS_FMX}
    TModelHTML = class(TInterfacedObject, iModelHTML)
  {$ELSE}
    TModelHTML = class(TInterfacedObject, iModelHTML {$IF RTLVERSION > 22} , iCallbackJS {$IFEND})
  {$ENDIF}
  private
    FHTML: String;
    FWebBrowser: TWebBrowser;
    FContainer : Boolean;
    FFolderDefaultRWC : String;
    FBackgroundColor : String;
    FFontColor : String;
    FCDN : Boolean;
    function Container(Value : Boolean) : iModelHTML;
   {$IFDEF HAS_FMX}
   {$ELSE}
    procedure DefineIEVersion(Versao: Integer);
    {$ENDIF}
    function FolderDefaultRWC(Value : String) : iModelHTML;
    procedure HtmlBrowserGenerated(CONST HTMLCode: string);
    function ConvertString(aValue : String) : String;
    procedure _DivContainer(Value : String);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelHTML;
    function GenerateHead: iModelHTML; overload;
    function GenerateHead(Value : TList<String>) : iModelHTML; overload;
    function GenerateFooter: iModelHTML;
    function Jumpline: iModelHTML;
    function HTML: String; overload;
    function HTML(Value: String): iModelHTML; overload;
    function Charts: iModelHTMLCharts;
    function Rows: IModelHTMLRows;
    function ClearHTML : iModelHTML;
    function WebBrowser(Value: TWebBrowser): iModelHTML;
    function Generated: iModelHTML;
    function BackgroundColor( Value : String) : iModelHTML;
    function FontColor ( Value : String) : iModelHTML;
    function ContainerClass(Value : TTypeContainer) : iModelHTML;
    function CDN(Value : Boolean) : iModelHTML;
    function Jumbotron : iModelJumbotron;
    function Alerts : iModelAlerts;
    function ListGroup : iModelListGroup;
    function PivotTable : iModelPivotTable;
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    {$IFDEF FULL}
    function Table : iModelTable;
    function Cards : iModelCards;
    function ChartEasyPie : iModelChartEasyPie;
    {$IFDEF HAS_FMX}
    {$ELSE}
    {$IF RTLVERSION > 22 }
    function CallbackJS : iCallbackJS;
    function Buttons : iModelButton;
    function ClassProvider(Value : TObject) : iCallbackJS;
    function &End : iModelHTML;
    {$IFEND}
    {$ENDIF}
    function Image : iModelImage;
    {$ENDIF}
  end;

implementation

uses
  Factory, SysUtils,
  {$IFDEF HAS_FMX}
   {$ELSE}
    Windows,
    ActiveX,
    MSHTML,
    OleCtrls,
  {$ENDIF}
  Injection,
  Charts.Easy.Pie,
  Jumbotron,
  Alerts,
  ListGroup,
  PivotTable;

{ TModelHTML }
  {$IFDEF HAS_FMX}
procedure TModelHTML.ExecuteScript(Value : iModelJSCommand);
begin
end;

function TModelHTML.ExecuteScriptResult(Value : iModelJSCommand) : string;
begin
end;
   {$ELSE}
procedure TModelHTML.ExecuteScript(Value : iModelJSCommand);
var
  Doc : IHTMLDocument2;
  HTMLWindow: IHTMLWindow2;
begin
  Doc := FWebBrowser.Document as IHTMLDocument2;
  if Assigned(Doc) then
  begin
    HTMLWindow := Doc.parentWindow;
    if Assigned(HTMLWindow) then
    begin
      try
        HTMLWindow.execScript(Value.ResultCommand , 'javascript');
      except on E: Exception do
       raise Exception.Create('Erro ao Executar Script');
      end;
    end;
  end;
end;

function TModelHTML.ExecuteScriptResult(Value : iModelJSCommand) : string;
var
  Doc : IHTMLDocument2;
  body : IHTMLElement2;
  Tags : IHTMLElementCollection;
  Tag : IHTMLElement;
  I : Integer;
begin
  Result := '';
  ExecuteScript(Value);

  if not Supports(FWebBrowser.Document, IHTMLDocument2, Doc) then
    raise Exception.Create('Documento HTML Inválido');
  if not Supports(Doc.body, IHTMLElement2, Body) then
    raise Exception.Create('Não Foi Possível Encontrar o Elemento <body>');
  Tags := body.getElementsByTagName(UpperCase(Value.TagName));
  for I := 0 to Pred(Tags.length) do
  begin
    Tag := Tags.item(I, EmptyParam) as IHTMLElement;
    if Tag.id = Value.TagId then
    begin
      Result := Tag.getAttribute(Value.TagAttribute, 0);
      break;
    end;
  end;
end;
  {$ENDIF}

function TModelHTML.PivotTable : iModelPivotTable;
begin
  Result := TModelPivotTable.New(Self);
end;

function TModelHTML.ListGroup : iModelListGroup;
begin
  Result := TModelListGroup.New(Self);
end;

function TModelHTML.Alerts : iModelAlerts;
begin
  Result := TModelAlerts.New(Self);
end;

function TModelHTML.Jumbotron : iModelJumbotron;
begin
  Result := TModelJumbotron.New(Self);
end;

function TModelHTML.BackgroundColor( Value : String) : iModelHTML;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TModelHTML.FontColor ( Value : String) : iModelHTML;
begin
  Result := Self;
  FFontColor := Value;
end;

procedure TModelHTML._DivContainer(Value : String);
begin
    FHTML := FHTML + '<div class="'+Value+'">';
//    FHTML := FHTML + '<br><br>';
end;

function TModelHTML.ContainerClass(Value : TTypeContainer) : iModelHTML;
begin
  Result := Self;
  case Value of
    _container: _DivContainer(Copy(TTypeContainer(Value).ToString,2,Length(TTypeContainer(Value).ToString)));
    fluid,
    lg,
    md,
    sm,
    xl: _DivContainer('container-'+TTypeContainer(Value).ToString);
  end;
end;

function TModelHTML.CDN(Value : Boolean) : iModelHTML;
begin
  Result := Self;
  FCDN := Value;
end;

function TModelHTML.ConvertString(aValue : String) : String;
var
  rbs : RawByteString;
begin
  rbs := UTF8Encode(aValue);
  SetCodePage(rbs,0,false);
  Result := UnicodeString(rbs);
end;

procedure TModelHTML.HtmlBrowserGenerated(CONST HTMLCode: string);
var
  sl : TStringList;
  ms : TMemoryStream;
begin
  {$IFDEF HAS_FMX}
   {$ELSE}

   if NOT Assigned(FWebBrowser.Document) then
    FWebBrowser.Navigate('about:blank');

   sl := TStringList.Create;
   try
     ms := TMemoryStream.Create;
     try
       sl.Text := HTMLCode;
       sl.SaveToStream(ms) ;
       ms.Seek(0, 0);
       (FWebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
     finally
       ms.Free;
     end;
   finally
     sl.Free;
   end;
  {$ENDIF}
end;

function TModelHTML.ChartEasyPie : iModelChartEasyPie;
begin
  Result := TModelHTMLFactory.New.ChartEasyPie(Self);
end;

function TModelHTML.Charts: iModelHTMLCharts;
begin
  Result := TModelHTMLFactory.New.Charts(Self);
end;

function TModelHTML.ClearHTML: iModelHTML;
begin
  Result := Self;
  FHTML := '';
end;

function TModelHTML.Container (Value : Boolean) : iModelHTML;
begin
  Result := Self;
  FContainer := Value;
  FCDN := False;
end;

constructor TModelHTML.Create;
begin
  FContainer := True;
  {$IFDEF HAS_FMX}
  {$ELSE}
  DefineIEVersion(11000);
  {$ENDIF}
end;

{$IFDEF HAS_FMX}
{$ELSE}
procedure TModelHTML.DefineIEVersion(Versao: Integer);
const
  REG_KEY = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
var
  Reg: TRegistry;
  AppName: String;
begin
  AppName := ExtractFileName(ExtractFileName(ParamStr(0)));
  Reg := nil;
  try
    Reg := TRegistry.Create();
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(REG_KEY, True) then
    begin
      if Versao = 0 then
        Reg.DeleteValue(AppName)
      else
        Reg.WriteInteger(AppName, Versao);
      Reg.CloseKey;
    end;
  except

  end;

  if (Assigned(Reg)) then
    FreeAndNil(Reg);
end;
{$ENDIF}
destructor TModelHTML.Destroy;
begin
  inherited;
end;

function TModelHTML.FolderDefaultRWC(Value : String) : iModelHTML;
begin
  Result := Self;
end;

function TModelHTML.Generated: iModelHTML;
var
  SL: TStringList;
  Arquivo: string;
begin
  GenerateFooter;
  {$IFDEF HAS_FMX}
    {$IF Defined(ANDROID) or Defined(IOS)}
      FWebBrowser.LoadFromStrings(FHTML,'TBG');
    {$ELSE}
      FWebBrowser.LoadFromStrings(ConvertString(FHTML),'TBG');
    {$ENDIF}
  {$ELSE}
    FWebBrowser.Silent := True;
    HtmlBrowserGenerated(ConvertString(FHTML));
  {$ENDIF}
end;

function TModelHTML.GenerateFooter: iModelHTML;
begin
  Result := Self;
  if FContainer then
    FHTML := FHTML + '</div> ';
  FHTML := FHTML + '</body> ';
  FHTML := FHTML + '</html>';
end;

function TModelHTML.GenerateHead(Value: TList<String>): iModelHTML;
var
  I: Integer;
begin
  {Alterado para compatiblidade com IOS Contribuicao do Guilherme Lanius}
  Result := Self;
  FHTML := FHTML + '<!DOCTYPE html> ';
  FHTML := FHTML + '<html lang="pt-br"> ';
  FHTML := FHTML + '<head> ';
  FHTML := FHTML + '<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />';
  {$IFDEF IOS}
  FHTML := FHTML + '<meta name="viewport" content="width=device-width, initial-scale=0.86, maximum-scale=3.0, minimum-scale=0.86"/>';
  {$ENDIF}
  FHTML := FHTML + '<meta charset="UTF-8"/> ';
  FHTML := FHTML + '<title></title> ';
  FHTML := FHTML + TPackCss.New
                    .BackgroundColor(FBackgroundColor)
                    .FontColor(FFontColor)
                    .CDN(FCDN)
                    .PackCSS;
  FHTML := FHTML + TPackJS.New.CDN(FCDN).PackJS;
  if Assigned(Value) then
  begin
    for I := 0 to Pred(Value.Count) do
      FHTML := FHTML + Value[I];
  end;
  FHTML := FHTML + '</head> ';
  FHTML := FHTML + '<body> ';
end;

function TModelHTML.GenerateHead: iModelHTML;
begin
  {Alterado para compatiblidade com IOS Contribuicao do Guilherme Lanius}
  Result := Self;
  FHTML := FHTML + '<!DOCTYPE html> ';
  FHTML := FHTML + '<html lang="pt-br"> ';
  FHTML := FHTML + '<head> ';
  FHTML := FHTML + '<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />';
  {$IFDEF IOS}
  FHTML := FHTML + '<meta name="viewport" content="width=device-width, initial-scale=0.86, maximum-scale=3.0, minimum-scale=0.86"/>';
  {$ENDIF}
  FHTML := FHTML + '<meta charset="UTF-8"/> ';
  FHTML := FHTML + '<title></title> ';
  FHTML := FHTML + TPackCss.New
                      .BackgroundColor(FBackgroundColor)
                      .FontColor(FFontColor)
                      .CDN(FCDN)
                      .PackCSS;
  FHTML := FHTML + TPackJS.New
                      .CDN(FCDN)
                      .PackJS;
  FHTML := FHTML + '</head> ';
  FHTML := FHTML + '<body> ';
end;

function TModelHTML.HTML(Value: String): iModelHTML;
begin
  Result := Self;
  FHTML := FHTML + Value;
end;

function TModelHTML.Jumpline: iModelHTML;
begin
  Result := Self;
  FHTML := FHTML + '<br>';
end;

function TModelHTML.HTML: String;
begin
  Result := FHTML;
end;

class function TModelHTML.New: iModelHTML;
begin
  Result := Self.Create;
end;

function TModelHTML.Rows: IModelHTMLRows;
begin
  Result := TModelHTMLFactory.New.Rows(Self);
end;

{$IFDEF FULL}
function TModelHTML.Table: iModelTable;
begin
  Result := TModelHTMLFactory.New.Table(Self);
end;
{$IFDEF HAS_FMX}
{$ELSE}
{$IF RTLVERSION > 22 }
function TModelHTML.&End : iModelHTML;
begin
  Result := Self;
end;

function TModelHTML.CallbackJS : iCallbackJS;
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create('Para usar CallbackJS primeiro é preciso setar o WebBrowser');

  Result := Self;
end;

function TModelHTML.ClassProvider(Value : TObject) : iCallbackJS;
begin
  Result := Self;
  vCallBackJS
    .ClassProvider(Value)
    .WebBrowser(FWebBrowser)
    .ActionMethod('ActionCallBackJS');
end;

function TModelHTML.Buttons : iModelButton;
begin
  Result := TModelButton.New(Self);
end;
{$IFEND}
{$ENDIF}

function TModelHTML.Cards : iModelCards;
begin
  Result := TModelHTMLFactory.New.Cards(Self);
end;

function TModelHTML.Image : iModelImage;
begin
  Result := TModelHTMLFactory.New.Image(Self);
end;

{$ENDIF}

function TModelHTML.WebBrowser(Value: TWebBrowser): iModelHTML;
begin
  Result := Self;
  FWebBrowser := Value;
end;

end.
