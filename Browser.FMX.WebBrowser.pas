unit Browser.FMX.WebBrowser;
{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  FMX.WebBrowser;

Type
  TModelBrowserFMXWebBrowser = class(TInterfacedObject, iModelBrowser)
  private
    FWebBrowser : TWebBrowser;
    function ConvertString(aValue : String) : String;
  public
    constructor Create(Value : TObject);
    destructor Destroy; override;
    class function New(Value : TObject) : iModelBrowser;
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    procedure ExecuteScriptCallback(Value: iModelJSCommand);
    function Generated(FHTML : string) : iModelBrowser;
  end;
implementation

uses
  System.SysUtils;

{ TModelBrowserFMX }

function TModelBrowserFMXWebBrowser.ConvertString(aValue: String): String;
var
  rbs : RawByteString;
begin
  rbs := UTF8Encode(aValue);
  SetCodePage(rbs,0,false);
  Result := UnicodeString(rbs);
end;

constructor TModelBrowserFMXWebBrowser.Create(Value: TObject);
begin
  FWebBrowser :=  Value as TWebBrowser;
end;

destructor TModelBrowserFMXWebBrowser.Destroy;
begin

  inherited;
end;

procedure TModelBrowserFMXWebBrowser.ExecuteScript(Value: iModelJSCommand);
begin
  FWebBrowser.EvaluateJavaScript(Value.ResultCommand);
end;

procedure TModelBrowserFMXWebBrowser.ExecuteScriptCallback(
  Value: iModelJSCommand);
var
  ValueCallback : string;
  proc : TProc<string>;
begin
  if not Assigned(Value.CallBack) then
    raise Exception.Create('Procedure para Callback inválida');
  ValueCallback := ExecuteScriptResult(Value);
  proc := Value.CallBack;
  proc(ValueCallback);
end;

function TModelBrowserFMXWebBrowser.ExecuteScriptResult(Value: iModelJSCommand): string;
var
  URL : string;
begin
  FWebBrowser.EvaluateJavaScript(
    value.ResultCommand + ';' +
    'try {'+
      'var e = "#" + document.getElementById(''' + Value.TagID + ''').' + Value.TagAttribute + ';' +
      'history.replaceState(null, null, e);'+
    '} catch (n) {' +
      'document.location.href = e'+
    '}');
  URL := FWebBrowser.URL;
  URL := Copy(URL, Pos('#', URL) + 1, Length(URL));
  Result := URL;
end;

function TModelBrowserFMXWebBrowser.Generated(FHTML: string): iModelBrowser;
begin
  Result := Self;
  {$IF Defined(ANDROID) or Defined(IOS)}
    FWebBrowser.LoadFromStrings(FHTML,'TBG');
  {$ELSE}
    FWebBrowser.LoadFromStrings(ConvertString(FHTML),'TBG');
  {$ENDIF}
end;

class function TModelBrowserFMXWebBrowser.New(Value: TObject): iModelBrowser;
begin
  Result := Self.Create(Value);
end;

end.
