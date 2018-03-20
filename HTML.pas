unit HTML;

interface

uses
  Interfaces,
  SHDocVw,
  System.Win.Registry, VCL.Dialogs, System.Generics.Collections,
  System.Classes;

Type
  TModelHTML = class(TInterfacedObject, iModelHTML)
  private
    FHTML: String;
    FWebBrowser: TWebBrowser;
    procedure DefineIEVersion(Versao: Integer);
    procedure ExtractResources;
    procedure GeneratedCssResourcesList(var Lista : TStringList);
    procedure GeneratedJSResourcesList(var Lista : TStringList);
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
    {$ENDIF}
  end;

implementation

uses
  Factory, System.SysUtils, Winapi.Windows;

{ TModelHTML }

function TModelHTML.Charts: iModelHTMLCharts;
begin
  Result := TModelHTMLFactory.New.Charts(Self);
end;

function TModelHTML.ClearHTML: iModelHTML;
begin
  Result := Self;
  FHTML := '';
end;

constructor TModelHTML.Create;
begin
  DefineIEVersion(11000);
  ExtractResources;
  //GenerateHead;
end;

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
    ;
  end;

  if (Assigned(Reg)) then
    FreeAndNil(Reg);
end;

destructor TModelHTML.Destroy;
begin

  inherited;
end;

procedure TModelHTML.ExtractResources;
var
  Arq : TResourceStream;
  Lista : TStringList;
  I : Integer;
begin
  if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'css' ) then
    ForceDirectories(ExtractFilePath(ParamStr(0)) + 'css');

  Lista := TStringList.Create;
  try
    GeneratedCssResourcesList(Lista);
     for I := 0 to Pred(Lista.Count) do
     begin
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'css\' + Lista[I]) then
      begin
        Arq := TResourceStream.Create(HInstance,'RCL_' + IntToStr(I),RT_RCDATA);
        try
          Arq.SaveToFile(ExtractFilePath(ParamStr(0)) + 'css\' + Lista[I]);
        finally
          FreeAndNil(Arq);
        end;
      end;
     end;
  finally
    Lista.Free;
  end;

  if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'js' ) then
    ForceDirectories(ExtractFilePath(ParamStr(0)) + 'js');

  Lista := TStringList.Create;
  try
    GeneratedJSResourcesList(Lista);
     for I := 0 to Pred(Lista.Count) do
     begin
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'js\' + Lista[I]) then
      begin
        Arq := TResourceStream.Create(HInstance,'JSR_' + IntToStr(I),RT_RCDATA);
        try
          Arq.SaveToFile(ExtractFilePath(ParamStr(0)) + 'js\' + Lista[I]);
        finally
          FreeAndNil(Arq);
        end;
      end;
     end;
  finally
    Lista.Free;
  end;

end;

function TModelHTML.Generated: iModelHTML;
var
  SL: TStringList;
  Arquivo: string;
  SearchRec : TSearchRec;
begin
   try
      FindFirst(ExtractFilePath(ParamStr(0)) + '*.rwc', faAnyFile, SearchRec );
      repeat
         DeleteFile(PWideChar(ExtractFilePath(ParamStr(0)) + SearchRec.name) );
      until FindNext( SearchRec ) <> 0;
   finally
      //
   end;

  GenerateFooter;
  FWebBrowser.Silent := True;
  SL := TStringList.Create;
  try
    SL.Add(FHTML);
    Arquivo := TGuid.NewGuid.ToString + '.rwc';
    SL.SaveToFile(ExtractFilePath(ParamStr(0)) + Arquivo);
  finally
    FWebBrowser.Navigate(WideString(ExtractFilePath(ParamStr(0)) + Arquivo));
    SL.Free;
  end;
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
  FHTML := FHTML + '<link rel="stylesheet" href="css/bootstrap.min.css"> ';
  FHTML := FHTML + '<script defer src="js/fontawesome-all.js"></script>';
  FHTML := FHTML + '<script src="js/Chart.min.js"></script> ';
  FHTML := FHTML + '<script src="js/jquery-3.3.1.min.js"></script> ';
  FHTML := FHTML + '<script src="js/tether.min.js"></script> ';
  FHTML := FHTML + '<script src="js/bootstrap.min.js" ></script> ';
  FHTML := FHTML + '<script src="js/Chart.bundle.js"></script> ';
  FHTML := FHTML + '<script src="js/utils.js"></script>';
  FHTML := FHTML + '<script src="js/popper.js"></script>';
  if Assigned(Value) then
  begin
    for I := 0 to Pred(Value.Count) do
      FHTML := FHTML + Value[I];
  end;
  FHTML := FHTML + '</head> ';
  FHTML := FHTML + '<body> ';
  FHTML := FHTML + '<div class="container"> ';
  FHTML := FHTML + '<br><br> ';
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
{$ENDIF}

function TModelHTML.WebBrowser(Value: TWebBrowser): iModelHTML;
begin
  Result := Self;
  FWebBrowser := Value;
end;

end.
