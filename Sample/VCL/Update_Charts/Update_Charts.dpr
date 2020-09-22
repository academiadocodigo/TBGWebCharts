program Update_Charts;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form13};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
