unit Browser.VCL.WebBrowser;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  SHDocVw;

Type
  TModelBrowserVCLWebBrowser = class(TInterfacedObject, iModelBrowser)
  private
    FActionMethod : String;
    FWebBrowser : TWebBrowser;
    procedure HtmlBrowserGenerated(CONST HTMLCode: string);
    function ConvertString(aValue : String) : String;
    procedure DefineIEVersion;
    {$IF RTLVERSION > 22 }
      procedure BeforeNavigate(ASender: TObject; const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
    {$ENDIF}
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
  MSHTML,
  System.SysUtils,
  System.Variants,
  System.Classes,
  {$IF RTLVERSION > 22 }
    CallBackJS,
  {$ENDIF}
  {$IF RTLVERSION > 31 }
    Win.Registry,
  {$ELSE}
    Registry,
  {$ENDIF}
  Winapi.ActiveX, Winapi.Windows;

{ TModelHTMLFactory }

{$IF RTLVERSION > 22 }
procedure TModelBrowserVCLWebBrowser.BeforeNavigate(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  Target : String;
  Aux, Method: string;
  Params : TStringList;
begin
  Target := URL;
  if UpperCase(Target).StartsWith(UpperCase(FActionMethod)) then
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
          Cancel := True;
    finally
      Params.Free;
    end;
  end;
end;
{$ENDIF}

function TModelBrowserVCLWebBrowser.ConvertString(aValue: String): String;
var
  rbs : RawByteString;
begin
  rbs := UTF8Encode(aValue);
  SetCodePage(rbs,0,false);
  Result := UnicodeString(rbs);
end;

constructor TModelBrowserVCLWebBrowser.Create(Value: TObject);
begin
  FWebBrowser :=  Value as TWebBrowser;
  FActionMethod := 'ActionCallBackJS';
  DefineIEVersion;
  {$IF RTLVERSION > 22 }
    FWebBrowser.OnBeforeNavigate2 := BeforeNavigate;
  {$ENDIF}
end;

procedure TModelBrowserVCLWebBrowser.DefineIEVersion;
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
//      if Versao = 0 then
//        Reg.DeleteValue(AppName)
//      else
        Reg.WriteInteger(AppName, 11000);
      Reg.CloseKey;
    end;
  except

  end;

  if (Assigned(Reg)) then
    FreeAndNil(Reg);
end;

destructor TModelBrowserVCLWebBrowser.Destroy;
begin

  inherited;
end;

procedure TModelBrowserVCLWebBrowser.ExecuteScript(Value: iModelJSCommand);
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

procedure TModelBrowserVCLWebBrowser.ExecuteScriptCallback(
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

function TModelBrowserVCLWebBrowser.ExecuteScriptResult(Value: iModelJSCommand): string;
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

function TModelBrowserVCLWebBrowser.Generated(FHTML: string): iModelBrowser;
begin
  Result := Self;
  FWebBrowser.Silent := True;
  HtmlBrowserGenerated(ConvertString(FHTML));
end;

procedure TModelBrowserVCLWebBrowser.HtmlBrowserGenerated(const HTMLCode: string);
var
  sl : TStringList;
  ms : TMemoryStream;
begin
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
end;

class function TModelBrowserVCLWebBrowser.New(Value: TObject): iModelBrowser;
begin
  Result := Self.Create(Value);
end;

end.
