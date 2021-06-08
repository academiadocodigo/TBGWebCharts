unit Browser.VCL.Chromium;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  uCEFChromium,
  uCEFWindowParent,
  uCEFInterfaces;

Type
  TModelBrowserVCLChromium = class(TInterfacedObject, iModelBrowser)
  private
    FChromium : TChromium;
    FWindowParent : TCEFWindowParent;

  public
    constructor Create(Chromium : TChromium; WindowParent : TCEFWindowParent);
    destructor Destroy; override;
    class function New(Chromium : TChromium; WindowParent : TCEFWindowParent) : iModelBrowser;
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    procedure ExecuteScriptCallback(Value: iModelJSCommand);
    function Generated(FHTML : string) : iModelBrowser;
  end;

implementation

uses
  {$IF RTLVERSION > 22 }
    CallBackJS,
  {$ENDIF}
  System.SysUtils,
  System.Classes,
  VCL.Forms,
  Browser.Chromium.Events;

  { TModelBrowserVCLChromium }

constructor TModelBrowserVCLChromium.Create(Chromium : TChromium; WindowParent : TCEFWindowParent);
begin
  FChromium := Chromium;
  FWindowParent := WindowParent;

  FChromium.OnBeforePopup := vChromiumEvents.Chromium_OnBeforePopup;
  FChromium.OnGetResourceHandler := vChromiumEvents.Chromium_OnGetResourceHandler;
  {$IF RTLVERSION > 22 }
    FChromium.OnBeforeBrowse := vChromiumEvents.Chromium_BeforeBrowse;
  {$ENDIF}
  FChromium.OnConsoleMessage := vChromiumEvents.Chromium_ConsoleMessage;
end;

destructor TModelBrowserVCLChromium.Destroy;
begin
  inherited;
end;

procedure TModelBrowserVCLChromium.ExecuteScript(Value: iModelJSCommand);
begin
  FChromium.ExecuteJavaScript(value.ResultCommand , 'about:blank', 0);
end;

procedure TModelBrowserVCLChromium.ExecuteScriptCallback(
  Value: iModelJSCommand);
var
  key : String;
begin
  if not Assigned(Value.CallBack) then
    raise Exception.Create('Procedure para Callback inválida');
  key := vChromiumEvents.Resources.JSCallback.Add(Value.Callback);
  FChromium.ExecuteJavaScript(
   Value.ResultCommand + ';' +
  'console.log(''' + CONSOLE_MSG_PREAMBLE + Key + '|'' + document.getElementById(''' + Value.TagID + ''').' + Value.TagAttribute + ');'
  ,'about:blank', 0);
end;

function TModelBrowserVCLChromium.ExecuteScriptResult(
  Value: iModelJSCommand): string;
begin
  Result := 'Use ExecuteScriptCallback';
end;

function TModelBrowserVCLChromium.Generated(FHTML: string): iModelBrowser;
var
  Key : string;
begin
  Result := Self;
  Key := vChromiumEvents.Resources.Pages.add(FHTML);
  FChromium.CreateBrowser(FWindowParent, '');

  while not FChromium.Initialized do
    Application.ProcessMessages;
  FChromium.loadURL(WEBCHART_PREAMBLE + Key);
end;

class function TModelBrowserVCLChromium.New(Chromium : TChromium; WindowParent : TCEFWindowParent): iModelBrowser;
begin
  Result := Self.Create(Chromium, WindowParent);
end;

end.
