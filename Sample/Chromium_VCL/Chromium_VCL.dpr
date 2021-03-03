program Chromium_VCL;

uses
  Vcl.Forms,
  UCEFApplication,uCEFConstants,
  Unit1 in 'Unit1.pas' {Form5};

{$R *.res}

begin
  GlobalCEFApp := TCefApplication.Create;

  GlobalCEFApp.FrameworkDirPath := 'C:\Componentes\CEF4Delphi\Dlls_32';
  GlobalCEFApp.ResourcesDirPath := 'C:\Componentes\CEF4Delphi\Dlls_32';
  GlobalCEFApp.LocalesDirPath := 'C:\Componentes\CEF4Delphi\Dlls_32\locales';
//  GlobalCEFApp.LogFile := '\debug.log';
//  GlobalCEFApp.LogSeverity := LOGSEVERITY_DEBUG;
  GlobalCEFApp.AllowRunningInsecureContent := true;

  if GlobalCEFApp.StartMainProcess then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TForm5, Form5);
    Application.Run;
  end;
  GlobalCEFApp.Free;
  GlobalCEFApp := nil;


end.
