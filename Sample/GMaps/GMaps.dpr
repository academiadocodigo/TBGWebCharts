program GMaps;

uses
  Vcl.Forms,
  UCEFApplication,uCEFConstants,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  GlobalCEFApp := TCefApplication.Create;

  GlobalCEFApp.FrameworkDirPath     := 'D:\Repositorios\CEF4Delphi\dll_64bits\Release';
  GlobalCEFApp.ResourcesDirPath     := 'D:\Repositorios\CEF4Delphi\dll_64bits\Resource';
  GlobalCEFApp.LocalesDirPath       := 'D:\Repositorios\CEF4Delphi\dll_64bits\Resources\locales';

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

