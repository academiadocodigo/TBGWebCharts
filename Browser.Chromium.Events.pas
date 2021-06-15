unit Browser.Chromium.Events;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  uCEFInterfaces,
  uCEFTypes,
  Generics.Collections,
  System.SysUtils;

const
  CONSOLE_MSG_PREAMBLE = 'DOMVISITOR';
  WEBCHART_PREAMBLE = 'TBGWebCharts_';

type
  TChromiumEvents = class
    private
      FChromiumResources : iModelChromiumResources;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Chromium_ConsoleMessage(Sender: TObject; const browser: ICefBrowser; level: Cardinal; const message, source: ustring; line: Integer; out Result: Boolean);
//    {$IF RTLVERSION > 22 }
      procedure Chromium_BeforeBrowse(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const request: ICefRequest; user_gesture, isRedirect: Boolean; out Result: Boolean);
//    {$ENDIF}
      procedure Chromium_OnBeforePopup(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const targetUrl, targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean; const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo; var client: ICefClient; var settings: TCefBrowserSettings; var extra_info: ICefDictionaryValue; var noJavascriptAccess: Boolean; var Result: Boolean);
      procedure Chromium_OnGetResourceHandler(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const request: ICefRequest; var aResourceHandler : ICefResourceHandler);
      function Resources : iModelChromiumResources;

  end;

var
  vChromiumEvents : TChromiumEvents;

implementation

uses
//  {$IF RTLVERSION > 22 }
    CallBackJS,
//  {$ENDIF}
  Browser.Chromium.Resources,
  System.Classes;

{ TVCLChromiumEvents }

//{$IF RTLVERSION > 22 }
procedure TChromiumEvents.Chromium_BeforeBrowse(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; user_gesture, isRedirect: Boolean;
  out Result: Boolean);
var
  Target : String;
  Aux, Method: string;
  Params : TStringList;
begin
  Target := request.Url;
  if UpperCase(Target).StartsWith('ACTIONCALLBACKJS') then
  begin
    Method := Copy(Target, Pos(':', Target) + 1, Length(Target));
    Method := Copy(Method, 1, Pos('(', Method) - 1);
    Params := TStringList.Create;
    try
      Aux := Copy(Target, Pos('(', Target) + 1, Length(Target));
      Aux := Copy(Aux, 1, LastDelimiter(')', Aux)-1);
      Params.CommaText := Aux;
      if not Method.IsEmpty then
        if vCallBackJS.TryGetValue(Method, Params) then
          Result := True;
    finally
      Params.Free;
    end;
  end;
end;
//{$ENDIF}

procedure TChromiumEvents.Chromium_ConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; level: Cardinal; const message, source: ustring;
  line: Integer; out Result: Boolean);
var
  Key : string;
  position : integer;
  FMessage : string;
  Proc : TProc<String>;
begin
  if (length(message) > 0) and
     (copy(message, 1, length(CONSOLE_MSG_PREAMBLE)) = CONSOLE_MSG_PREAMBLE) then
    begin
      position := Pos('|', message) + 1;
      Key := Copy(message, Succ(Length(CONSOLE_MSG_PREAMBLE)), position -2 - Length(CONSOLE_MSG_PREAMBLE));
      Fmessage := Copy(message, position, Length(message));
      Proc := FChromiumResources.JSCallback.Extract(key);
      if Assigned (Proc) then
        Proc(FMessage);
    end;
end;

procedure TChromiumEvents.Chromium_OnBeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition;
  userGesture: Boolean; const popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings; var extra_info: ICefDictionaryValue;
  var noJavascriptAccess, Result: Boolean);
begin
  Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

procedure TChromiumEvents.Chromium_OnGetResourceHandler(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; var aResourceHandler: ICefResourceHandler);
var
    Key: String;
    position : integer;
begin
    if UpperCase(request.Url).StartsWith('HTTP://TBGWEBCHARTS_') then
    begin
      position := Pos('_', request.Url) + 1;
      Key := Copy(request.Url, position, Length(request.Url) - position);
      aResourceHandler := FChromiumResources.Pages.extract(Key);
    end;
end;

constructor TChromiumEvents.Create;
begin
  FChromiumResources := TChromiumResources.New;
end;

destructor TChromiumEvents.Destroy;
begin

  inherited;
end;

function TChromiumEvents.Resources: iModelChromiumResources;
begin
  Result := FChromiumResources;
end;

initialization
  vChromiumEvents := TChromiumEvents.Create;

finalization
  FreeAndNil(vChromiumEvents);

end.

