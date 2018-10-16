unit HTML;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces,

  Generics.Collections,
  {$IFDEF HAS_FMX}
    {$IFDEF ANDROID}
      FMX.StdCtrls,
      FMX.WebBrowser,
    {$ELSE}
      FMX.StdCtrls,
      FMX.WebBrowser,
      Registry,
    {$IFEND}
  {$ELSE}
    {$IF RTLVERSION > 20 }
      VCL.StdCtrls,
      VCL.Buttons,
      SHDocVw,
      VCL.Dialogs,
      Registry,
    {$IFEND}
    {$IF RTLVERSION < 20 }
      StdCtrls,
      Buttons,
      SHDocVw,
      Dialogs,
      Registry,
    {$IFEND}



  {$ENDIF}
  {$IF RTLVERSION > 20 }
    {$IFDEF FULL}
      CallBackJS,
      Button,
    {$ENDIF}
  {$IFEND}
  Classes, PackJS, PackCss;

Type
  TModelHTML = class(TInterfacedObject, iModelHTML, iCallbackJS)
  private
    FHTML: String;
    FWebBrowser: TWebBrowser;
    FContainer : Boolean;
    FFolderDefaultRWC : String;
    function Container(Value : Boolean) : iModelHTML;
   {$IFDEF HAS_FMX}
   {$ELSE}
    procedure DefineIEVersion(Versao: Integer);
    //procedure ExtractResources;
    {$IFEND}
    procedure GeneratedCssResourcesList(var Lista : TStringList);
    procedure GeneratedJSResourcesList(var Lista : TStringList);
    procedure _DeleteFileOld;
    function FolderDefaultRWC(Value : String) : iModelHTML;
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
    {$IFDEF FULL}
    function Table : iModelTable;
    function Cards : iModelCards;
    {$IF RTLVERSION > 20 }
    function CallbackJS : iCallbackJS;
    function Buttons : iModelButton;
    function ClassProvider(Value : TObject) : iCallbackJS;
    function &End : iModelHTML;
    {$IFEND}
    function Image : iModelImage;
    {$ENDIF}
  end;

implementation

uses
  Factory, SysUtils,
  {$IFDEF HAS_FMX}
   {$ELSE}
    Windows,
  {$IFEND}
  Injection;

{ TModelHTML }

function TModelHTML.&End : iModelHTML;
begin
  Result := Self;
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

function TModelHTML.Container(Value: Boolean): iModelHTML;
begin
  Result := Self;
  FContainer := Value;
end;

constructor TModelHTML.Create;
begin
  FContainer := True;
  {$IFDEF HAS_FMX}
  {$ELSE}
  DefineIEVersion(11000);
  //ExtractResources;
  {$IFEND}
  _DeleteFileOld;
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
{$IFEND}
destructor TModelHTML.Destroy;
begin
  inherited;
end;

{$IFDEF HAS_FMX}
{$ELSE}
//procedure TModelHTML.ExtractResources;
//var
//  Arq : TResourceStream;
//  Lista : TStringList;
//  I : Integer;
//begin
//  if FFolderDefaultRWC = '' then FFolderDefaultRWC := ExtractFilePath(ParamStr(0));
//
//  if not DirectoryExists(FFolderDefaultRWC + 'css' ) then
//    ForceDirectories(FFolderDefaultRWC + 'css');
//
//  Lista := TStringList.Create;
//  try
//    GeneratedCssResourcesList(Lista);
//     for I := 0 to Pred(Lista.Count) do
//     begin
//      if not FileExists(FFolderDefaultRWC + 'css\' + Lista[I]) then
//      begin
//        Arq := TResourceStream.Create(HInstance,'RCL_' + IntToStr(I),RT_RCDATA);
//        try
//          Arq.SaveToFile(FFolderDefaultRWC + 'css\' + Lista[I]);
//        finally
//          FreeAndNil(Arq);
//        end;
//      end;
//     end;
//  finally
//    Lista.Free;
//  end;
//
//  if not DirectoryExists(FFolderDefaultRWC + 'js' ) then
//    ForceDirectories(FFolderDefaultRWC + 'js');
//
//  Lista := TStringList.Create;
//  try
//     for I := 0 to Pred(Lista.Count) do
//     begin
//      if not FileExists(FFolderDefaultRWC + 'js\' + Lista[I]) then
//      begin
//        Arq := TResourceStream.Create(HInstance,'JSR_' + IntToStr(I),RT_RCDATA);
//        try
//          Arq.SaveToFile(FFolderDefaultRWC + 'js\' + Lista[I]);
//        finally
//          FreeAndNil(Arq);
//        end;
//      end;
//     end;
//  finally
//    Lista.Free;
//  end;
//end;
{$IFEND}
function TModelHTML.FolderDefaultRWC(Value : String) : iModelHTML;
begin
  Result := Self;
  FFolderDefaultRWC := Value;
  {$IFDEF HAS_FMX}
  {$ELSE}
  //ExtractResources;
  {$ENDIF}
  _DeleteFileOld;
end;

function TModelHTML.Generated: iModelHTML;
var
  SL: TStringList;
  Arquivo: string;
begin
  if FFolderDefaultRWC = '' then FFolderDefaultRWC := ExtractFilePath(ParamStr(0));

  GenerateFooter;
  {$IFDEF HAS_FMX}
  FWebBrowser.LoadFromStrings(FHTML,'TBG');
  {$ELSE}
    FWebBrowser.Silent := True;
  SL := TStringList.Create;
  try
      SL.Add(FHTML);
      Arquivo := FormatDateTime('{ddhhyyyyMMnnss-MMyyyyhhssdd}', now) + '.rwc';
      if FFolderDefaultRWC = '' then FFolderDefaultRWC := ExtractFilePath(ParamStr(0));
      SL.SaveToFile(FFolderDefaultRWC + Arquivo, TEncoding.UTF8);
  finally

      FWebBrowser.Navigate(WideString(FFolderDefaultRWC + Arquivo));
    SL.Free;
  end;
  {$ENDIF}
end;

procedure TModelHTML.GeneratedCssResourcesList(var Lista: TStringList);
begin
  Lista.Clear;
  Lista.Add('bootstrap.css');
  Lista.Add('bootstrap.css.map');
  Lista.Add('bootstrap.min.css');
  Lista.Add('bootstrap.min.css.map');
  Lista.Add('bootstrap-grid.css');
  Lista.Add('bootstrap-grid.css.map');
  Lista.Add('bootstrap-grid.min.css');
  Lista.Add('bootstrap-grid.min.css.map');
  Lista.Add('bootstrap-reboot.css');
  Lista.Add('bootstrap-reboot.css.map');
  Lista.Add('bootstrap-reboot.min.css');
  Lista.Add('bootstrap-reboot.min.css.map');
  Lista.Add('custom.min.css');
  Lista.Add('fa-brands.css');
  Lista.Add('fa-brands.min.css');
  Lista.Add('fa-regular.css');
  Lista.Add('fa-regular.min.css');
  Lista.Add('fa-solid.css');
  Lista.Add('fa-solid.min.css');
  Lista.Add('fontawesome.css');
  Lista.Add('fontawesome.min.css');
  Lista.Add('fontawesome-all.css');
  Lista.Add('fontawesome-all.min.css');
  Lista.Add('green.css');
end;

procedure TModelHTML.GeneratedJSResourcesList(var Lista: TStringList);
begin
  Lista.Clear;
  Lista.Add('bootstrap.js');
  Lista.Add('bootstrap.min.js');
  Lista.Add('Chart.bundle.js');
  Lista.Add('Chart.min.js');
  Lista.Add('fa-brands.js');
  Lista.Add('fa-brands.min.js');
  Lista.Add('fa-regular.js');
  Lista.Add('fa-regular.min.js');
  Lista.Add('fa-solid.js');
  Lista.Add('fa-solid.min.js');
  Lista.Add('fa-v4-shims.js');
  Lista.Add('fa-v4-shims.min.js');
  Lista.Add('fontawesome.js');
  Lista.Add('fontawesome.min.js');
  Lista.Add('fontawesome-all.js');
  Lista.Add('fontawesome-all.min.js');
  Lista.Add('jquery-3.3.1.min.js');
  Lista.Add('popper.js');
  Lista.Add('popper.min.js');
  Lista.Add('tether.min.js');
  Lista.Add('utils.js');
end;

function TModelHTML.GenerateFooter: iModelHTML;
begin
  Result := Self;
  if FContainer then
    FHTML := FHTML + '</div> ';
  FHTML := FHTML + '</body> ';
  FHTML := FHTML + '</html> ';
end;

function TModelHTML.GenerateHead(Value: TList<String>): iModelHTML;
var
  I: Integer;
begin
  Result := Self;
  FHTML := FHTML + '<!DOCTYPE html> ';
  FHTML := FHTML + '<html lang="pt-br"> ';
  FHTML := FHTML + '<head> ';
  FHTML := FHTML + '<meta charset="UTF-8"> ';
  FHTML := FHTML + '<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />';
  FHTML := FHTML + '<title></title> ';
  FHTML := FHTML + TPackCss.New.PackCSS;
  FHTML := FHTML + TPackJS.New.PackJS;
  if Assigned(Value) then
  begin
    for I := 0 to Pred(Value.Count) do
      FHTML := FHTML + Value[I];
  end;
  FHTML := FHTML + '</head> ';
  FHTML := FHTML + '<body> ';
  if FContainer then
  begin
    FHTML := FHTML + '<div class="container"> ';
    FHTML := FHTML + '<br><br> ';
  end;

end;

function TModelHTML.GenerateHead: iModelHTML;
begin
  Result := Self;
  FHTML := FHTML + '<!DOCTYPE html> ';
  FHTML := FHTML + '<html lang="pt-br"> ';
  FHTML := FHTML + '<head> ';
  FHTML := FHTML + '<meta charset="UTF-8"> ';
  FHTML := FHTML + '<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />';
  FHTML := FHTML + '<title></title> ';
  FHTML := FHTML + '<link rel="stylesheet" href="css/bootstrap.min.css"> ';
  FHTML := FHTML + '<link href="css/font-awesome.min.css" rel="stylesheet">';
  FHTML := FHTML + '<script src="js/Chart.min.js"></script> ';
  FHTML := FHTML + '<script src="js/jquery-3.3.1.min.js"></script> ';
  FHTML := FHTML + '<script src="js/tether.min.js"></script> ';
  FHTML := FHTML + '<script src="js/bootstrap.min.js" ></script> ';
  FHTML := FHTML + '<script src="js/Chart.bundle.js"></script> ';
  FHTML := FHTML + '<script src="js/utils.js"></script>';
  FHTML := FHTML + '<script src="js/popper.js"></script>';
  FHTML := FHTML + '</head> ';
  FHTML := FHTML + '<body> ';
  if FContainer then
    FHTML := FHTML + '<div class="container"> ';
  FHTML := FHTML + '<br><br> ';
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

{$IF RTLVERSION > 20 }
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

procedure TModelHTML._DeleteFileOld;
var
  SearchRec: TSearchRec;
begin
  if FFolderDefaultRWC = '' then FFolderDefaultRWC := ExtractFilePath(ParamStr(0));

  try
    FindFirst(FFolderDefaultRWC + '*.rwc', faAnyFile, SearchRec);
    repeat
      DeleteFile(PWideChar(FFolderDefaultRWC + SearchRec.name));
    until FindNext(SearchRec) <> 0;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

end.
