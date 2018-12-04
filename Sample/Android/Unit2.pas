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
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
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
begin
WebCharts1
  .NewProject
    .Charts
      .Bar
        .Attributes
          .Name('Meu Gráfico de Barras')
          .ColSpan(12)
         .Title('Meu Gráfico de Barras')
         .Heigth(250)
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
        .&End
      .&End
    .&End
    .Charts
      .Pie
        .Attributes
          .Name('Meu Gráfico de Pie')
          .ColSpan(12)
         .Title('Meu Gráfico de Pie')
         .Legend(False)
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
        .&End
      .&End
    .&End
    .Jumpline
    .Rows
      .Title
        .Configuracoes
          .H4('&nbsp&nbsp&nbsp Tabela de clientes')
        .&End
      .&End
    .&End
    .Table
      .TableClass
        .tableSm
      .EndTableClass
      .DataSet
        .DataSet(ClientDataSet2)
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

end.
