program GMaps;

uses
  Vcl.Forms,
  UCEFApplication,uCEFConstants,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  GlobalCEFApp := TCefApplication.Create;

  GlobalCEFApp.FrameworkDirPath     := 'C:\Componentes\CEF4Delphi\Dlls_32';
  GlobalCEFApp.ResourcesDirPath     := 'C:\Componentes\CEF4Delphi\Dlls_32';
  GlobalCEFApp.LocalesDirPath       := 'C:\Componentes\CEF4Delphi\Dlls_32\locales';

  GlobalCEFApp.AllowRunningInsecureContent := true;
//  GlobalCEFApp.LogSeverity := LOGSEVERITY_DEBUG;
//  GlobalCEFApp.LogFile := '\debug.l og';

  if GlobalCEFApp.StartMainProcess then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end;
  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.

