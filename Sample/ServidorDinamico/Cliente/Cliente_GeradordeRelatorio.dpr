program Cliente_GeradordeRelatorio;

uses
  Vcl.Forms,
  Editor.View.Principal in 'Editor.View.Principal.pas' {Form5},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
