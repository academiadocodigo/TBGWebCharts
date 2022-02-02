program DashBoardCards2;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
