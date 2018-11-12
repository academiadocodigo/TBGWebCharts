unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, Datasnap.DBClient,
  View.WebCharts, FMX.WebBrowser;

type
  TForm2 = class(TForm)
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var a,b:string;
begin
a:='Meu Gráfico de Barras';
b:='Meu Gráfico de Pie';
WebCharts1
  .NewProject
    .Charts
      .Bar
        .Attributes
          .Name(a)
          .ColSpan(12)
         .Title(a)
         .Heigth(250)
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

end.
