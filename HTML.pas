unit HTML;

{$I TBGWebCharts.inc}
{$HINTS OFF}

interface

uses
  {$IF RTLVERSION > 22 }
    {$IFDEF HAS_FMX}
      {$IFDEF HAS_CHROMIUM}
        {$DEFINE HAS_CALLBACK}
      {$ENDIF}
    {$ELSE}
      {$DEFINE HAS_CALLBACK}
    {$ENDIF}
  {$ENDIF}


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
  {$IFDEF HAS_CALLBACK}
    CallBackJS,
    Button,
  {$ENDIF}
  {$IFDEF HAS_CHROMIUM}
    {$IFDEF HAS_FMX}
      uCEFFMXChromium,
      uCEFFMXWindowParent,
    {$ELSE}
      uCEFChromium,
      uCEFWindowParent,
    {$ENDIF}
  {$ENDIF}
  Classes,
  PackJS,
  PackCss,
  Charts.Types;

Type
    TModelHTML = class(TInterfacedObject, iModelHTML {$IFDEF HAS_CALLBACK} , iCallbackJS {$ENDIF})
  private
    FHTML: String;
    FWebBrowser : iModelBrowser;
    {$IFDEF HAS_CHROMIUM}
      {$IFDEF HAS_FMX}
        FWindowParent: TFMXWindowParent;
      {$ELSE}
        FWindowParent: TCEFWindowParent;
      {$ENDIF}
    {$ENDIF}
    FContainer : Boolean;
    FFolderDefaultRWC : String;
    FBackgroundColor : String;
    FFontColor : String;
    FCDN : Boolean;
    FCredenciais : IModelCredenciais;
    function Container(Value : Boolean) : iModelHTML;
    function FolderDefaultRWC(Value : String) : iModelHTML;
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
    function WebBrowser(Value: TWebBrowser): iModelHTML; overload;
    {$IFDEF HAS_CHROMIUM}
      {$IFDEF HAS_FMX}
        function WebBrowser(Value : TFMXChromium) : iModelHTML; overload;
        function WindowParent(Value: TFMXWindowParent) : iModelHTML; overload;
      {$ELSE}
        function WebBrowser(Value : TChromium) : iModelHTML; overload;
        function WindowParent(Value: TCEFWindowParent) : iModelHTML; overload;
      {$ENDIF}
      function Maps : iModelMaps;
    {$ENDIF}
    function Generated: iModelHTML;
    function BackgroundColor( Value : String) : iModelHTML;
    function FontColor ( Value : String) : iModelHTML;
    function ContainerClass(Value : TTypeContainer) : iModelHTML;
    function CDN(Value : Boolean) : iModelHTML;
    function Jumbotron : iModelJumbotron;
    function Alerts : iModelAlerts;
    function ListGroup : iModelListGroup;
    function PivotTable : iModelPivotTable;
    function LiquiFillGauge : iModelLiquidFillGauge;
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    procedure ExecuteScriptCallback(Value: iModelJSCommand);
    function Credenciais(Value : iModelCredenciais) : iModelHTML;
    function DOMElement : iModelDomElement;
    function RichTextEditor : iModelRichTextEditor;
    function Print : iModelHTML;
    function Progress : iModelProgress;
    {$IFDEF FULL}
      function Table : iModelTable;
      function Cards : iModelCards;
      function CardStyled : iModelCardStyled;
      function ChartEasyPie : iModelChartEasyPie;
      {$IFDEF HAS_CALLBACK}
        function CallbackJS : iCallbackJS;
        function Buttons : iModelButton;
        function ClassProvider(Value : TObject) : iCallbackJS;
        function &End : iModelHTML;
      {$ENDIF}
      function Image : iModelImage;
    {$ENDIF}
  end;

implementation

uses
  Factory, SysUtils,
  {$IFDEF HAS_FMX}
    Browser.FMX.WebBrowser,
  {$ELSE}
    Windows,
    ActiveX,
    MSHTML,
    Browser.VCL.WebBrowser,
    System.Variants,
  {$ENDIF}
  Injection,
  Charts.Easy.Pie,
  Jumbotron,
  Alerts,
  ListGroup,
  {$IFDEF HAS_CHROMIUM}
    {$IFDEF HAS_FMX}
      Browser.FMX.Chromium,
    {$ELSE}
      Browser.VCL.Chromium,
    {$ENDIF}
    Maps,
  {$ENDIF}
  PivotTable,
  LiquidFillGauge,
  CardStyled, DomElement, RichTextEditor, JSCommand, Progress;

{ TModelHTML }
procedure TModelHTML.ExecuteScript(Value : iModelJSCommand);
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create('Primeiro é preciso setar o WebBrowser');
  FWebBrowser.ExecuteScript(Value);
end;

function TModelHTML.ExecuteScriptResult(Value : iModelJSCommand) : string;
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create('Primeiro é preciso setar o WebBrowser');
  Result := FWebBrowser.ExecuteScriptResult(Value);
end;

procedure TModelHTML.ExecuteScriptCallback(Value: iModelJSCommand);
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create('Primeiro é preciso setar o WebBrowser');
  FWebBrowser.ExecuteScriptCallback(Value);
end;

function TModelHTML.Credenciais(Value : iModelCredenciais) : iModelHTML;
begin
  Result := Self;
  FCredenciais := Value;
end;

function TModelHTML.Progress : iModelProgress;
begin
  Result := TModelProgress.New(Self)
end;

function TModelHTML.DOMElement : iModelDomElement;
begin
  Result := TModelDomElement.New(Self);
end;

function TModelHTML.Print : iModelHTML;
var
  CommandJS : iModelJSCommand;
begin
  CommandJS := TModelJSCommand.New
    .Command('window.print');
  ExecuteScript(CommandJS);
end;

function TModelHTML.RichTextEditor : iModelRichTextEditor;
begin
  Result := TModelRichTextEditor.New(Self);
end;

function TModelHTML.PivotTable : iModelPivotTable;
begin
  Result := TModelPivotTable.New(Self);
end;

function TModelHTML.LiquiFillGauge : iModelLiquidFillGauge;
begin
  Result := TModelLiquidFillGauge.New(Self);
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
end;

destructor TModelHTML.Destroy;
begin
  inherited;
end;

function TModelHTML.FolderDefaultRWC(Value : String) : iModelHTML;
begin
  Result := Self;
end;

function TModelHTML.Generated: iModelHTML;
begin
  Result := Self;
  GenerateFooter;
  FWebBrowser.Generated(FHTML);
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
  FHTML := FHTML + TPackJS.New
                    .CDN(FCDN)
                    .Credenciais(FCredenciais)
                    .PackJS;
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
                      .Credenciais(FCredenciais)
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

{$IFDEF HAS_CALLBACK}
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
end;

function TModelHTML.Buttons : iModelButton;
begin
  Result := TModelButton.New(Self);
end;
{$ENDIF}

function TModelHTML.Cards : iModelCards;
begin
  Result := TModelHTMLFactory.New.Cards(Self);
end;

function TModelHTML.CardStyled : iModelCardStyled;
begin
  Result := TModelHTMLCardStyled.New(Self);
end;

function TModelHTML.Image : iModelImage;
begin
  Result := TModelHTMLFactory.New.Image(Self);
end;

{$ENDIF}

function TModelHTML.WebBrowser(Value: TWebBrowser): iModelHTML;
begin
  Result := Self;
  {$IFDEF HAS_FMX}
    FWebBrowser := TModelBrowserFMXWebBrowser.New(Value);
  {$ELSE}
    FWebBrowser := TModelBrowserVCLWebBrowser.New(Value);
  {$ENDIF}

end;

{$IFDEF HAS_CHROMIUM}
  {$IFDEF HAS_FMX}
function TModelHTML.WebBrowser(Value : TFMXChromium) : iModelHTML;
begin
  Result := Self;

  if not Assigned(FWindowParent) then
    raise Exception.Create('Para usar Chromium, primeiro é preciso setar o FFMXWindowParent');

  FWebBrowser := TModelBrowserFMXChromium.New(Value, FWindowParent);
end;

function TModelHTML.WindowParent(Value: TFMXWindowParent) : iModelHTML;
begin
  Result := Self;
  FWindowParent := Value;
end;
  {$ELSE}
function TModelHTML.WebBrowser(Value: TChromium): iModelHTML;
begin
  Result := Self;
  if not Assigned(FWindowParent) then
    raise Exception.Create('Para usar Chromium, primeiro é preciso setar o FCEFWindowParent');

  FWebBrowser := TModelBrowserVCLChromium.New(Value, FWindowParent);
end;

function TModelHTML.WindowParent(Value: TCEFWindowParent) : iModelHTML;
begin
   Result := Self;
   FWindowParent := Value;
end;
  {$ENDIF}
function TModelHTML.Maps : iModelMaps;
begin
  Result := TModelMaps.New(Self);
end;
{$ENDIF}

end.
