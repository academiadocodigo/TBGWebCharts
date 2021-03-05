program Chromium_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UCEFApplication,
  uCEFConstants,
  Unit9 in 'Unit9.pas' {Form9};

{$R *.res}

begin
  GlobalCEFApp := TCefApplication.Create;

  GlobalCEFApp.FrameworkDirPath := 'C:\Componentes\CEF4Delphi\Dlls_32';
  GlobalCEFApp.ResourcesDirPath := 'C:\Componentes\CEF4Delphi\Dlls_32';
  GlobalCEFApp.LocalesDirPath := 'C:\Componentes\CEF4Delphi\Dlls_32\locales';
  GlobalCEFApp.AllowRunningInsecureContent := true;
//  GlobalCEFApp.LogFile := '\debug.log';
//  GlobalCEFApp.LogSeverity := LOGSEVERITY_DEBUG;

  if GlobalCEFApp.StartMainProcess then
  begin
    Application.Initialize;
    Application.CreateForm(TForm9, Form9);
    Application.Run;
  end;
  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.
