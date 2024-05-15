program Sample_RichTextEditor;

{$R *.dres}

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form7},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
