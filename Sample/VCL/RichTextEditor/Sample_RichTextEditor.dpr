program Sample_RichTextEditor;

{$R *.dres}

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form7},
  frmMain2 in 'frmMain2.pas' {Form8},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
