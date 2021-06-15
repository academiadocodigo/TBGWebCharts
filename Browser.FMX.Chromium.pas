unit Browser.FMX.Chromium;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  uCEFFMXChromium,
  uCEFFMXWindowParent;

type
  TModelBrowserFMXChromium = class(TInterfacedObject, iModelBrowser)
  private
    FChromium : TFMXChromium;
    FWindowParent : TFMXWindowParent;

  public
    constructor Create(Chromium : TFMXChromium; WindowParent : TFMXWindowParent);
    destructor Destroy; override;
    class function New(Chromium : TFMXChromium; WindowParent : TFMXWindowParent) : iModelBrowser;
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    procedure ExecuteScriptCallback(Value: iModelJSCommand);
    function Generated(FHTML : string) : iModelBrowser;
  end;

implementation
uses
//  {$IF RTLVERSION > 22 }
    CallBackJS,
//  {$ENDIF}
  Browser.Chromium.Events, System.SysUtils, FMX.Forms, Winapi.Windows,
  System.Types, FMX.Platform.Win;

{ TModelBrowserFMXChromium }

constructor TModelBrowserFMXChromium.Create(Chromium: TFMXChromium;
  WindowParent: TFMXWindowParent);
begin
  FChromium := Chromium;
  FWindowParent := WindowParent;

  FChromium.OnBeforePopup := vChromiumEvents.Chromium_OnBeforePopup;
  FChromium.OnGetResourceHandler := vChromiumEvents.Chromium_OnGetResourceHandler;
//  {$IF RTLVERSION > 22 }
    FChromium.OnBeforeBrowse := vChromiumEvents.Chromium_BeforeBrowse;
//  {$ENDIF}
  FChromium.OnConsoleMessage := vChromiumEvents.Chromium_ConsoleMessage;
end;

destructor TModelBrowserFMXChromium.Destroy;
begin

  inherited;
end;

procedure TModelBrowserFMXChromium.ExecuteScript(Value: iModelJSCommand);
begin
  FChromium.ExecuteJavaScript(value.ResultCommand , 'about:blank', 0);
end;

procedure TModelBrowserFMXChromium.ExecuteScriptCallback(
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

function TModelBrowserFMXChromium.ExecuteScriptResult(
  Value: iModelJSCommand): string;
begin
  Result := 'Use ExecuteScriptCallback';
end;

function TModelBrowserFMXChromium.Generated(FHTML: string): iModelBrowser;
var
  Key : string;
  TempHandle : HWND;
  TempRect   : System.Types.TRect;
  TempClientRect : TRectF;
begin
  Result := Self;
  Key := vChromiumEvents.Resources.Pages.add(FHTML);

  TempHandle      := FmxHandleToHWND(FWindowParent.Handle);
  TempClientRect  := FWindowParent.ClientRect;
  TempRect.Left   := round(TempClientRect.Left);
  TempRect.Top    := round(TempClientRect.Top);
  TempRect.Right  := round(TempClientRect.Right);
  TempRect.Bottom := round(TempClientRect.Bottom);

  FChromium.CreateBrowser(TempHandle, TempRect);

  while not FChromium.Initialized do
    Application.ProcessMessages;
  FChromium.loadURL(WEBCHART_PREAMBLE + Key);
end;

class function TModelBrowserFMXChromium.New(Chromium: TFMXChromium;
  WindowParent: TFMXWindowParent): iModelBrowser;
begin
  Result := Self.Create(Chromium, WindowParent);
end;

end.
