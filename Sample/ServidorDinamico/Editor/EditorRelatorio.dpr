program EditorRelatorio;

uses
  Vcl.Forms,
  Editor.View.Principal in 'Editor.View.Principal.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
