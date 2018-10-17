unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Controls.Presentation, FMX.StdCtrls, View.WebCharts, Data.DB,
  Datasnap.DBClient;

type
  TForm2 = class(TForm)
    WebCharts1: TWebCharts;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2FIRST_NAME: TStringField;
    ClientDataSet2CITY: TStringField;
    ClientDataSet2STATE: TStringField;
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
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TForm2.Button1Click(Sender: TObject);
begin
WebCharts1
  .NewProject
    .Charts
      .Bar
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
         .Title('Meu Grafico de Barras')
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
          .Name('Meu Grafico de Pie')
          .ColSpan(12)
         .Title('Meu Grafico de Pie')
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
