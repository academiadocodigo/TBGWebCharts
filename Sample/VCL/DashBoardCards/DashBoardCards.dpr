program DashBoardCards;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form6};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
