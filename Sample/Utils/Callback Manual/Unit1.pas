unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.WebCharts, Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CallBackFuntion( aValue : String );
  end;

var
  Form1: TForm1;

implementation

uses
  IdCoderMIME;

{$R *.dfm}

procedure TForm1.CallBackFuntion(aValue: String);
begin
  ShowMessage( aValue );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TWebCharts.New
  .NewProject
  .Rows
    ._Div
      .Add('<a href="ActionCallBackJS:CallBackFuntion('+TIdEncoderMIME.EncodeString('1024034')+')">1024034</a>')
    .&End
  .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated
end;

end.
