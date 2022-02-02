unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, View.WebCharts,
  Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient  ;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet1RGB: TStringField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet11: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function GenerateCard : String;
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses
  Charts.Types;

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
    .HTML(
        generateCard
    )
    .&End
    .Jumpline
    .Rows
      ._Div
        .ColSpan(7)
        .Add(
          Webcharts1
            .ContinuosProject
            .Charts
              ._ChartType(bar)
                .Attributes
                  .Name('GraficolLive')
                  .ColSpan(12)
                  .Heigth(170)
                  .Options
                    .Title
                      .display(true)
                      .text('Média de Atendimentos/Usuários')
                      .fontSize(20)
                    .&End
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet1)
                    .textLabel('Analise de Atendimentos')
                    .BackgroundColor('245,54,92')
                    .BorderColor('245,54,92')
                    .BackgroundOpacity(4)
                    .Fill(False)
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet2)
                    .textLabel('Analise de Novos Usuários')
                    .BackgroundColor('17,120,239')
                    .BorderColor('17,120,239')
                    .BackgroundOpacity(4)
                    .Fill(False)
                  .&End
                  .Options
                    .Tooltip.DisplayTitle(true)
                      .InteractionModeIndex
                    .&End
                  .&End
                .&End
              .&End
            .&End
            .HTML
        )
      .&End
      ._Div
        .ColSpan(5)
        .Add(
          Webcharts1
            .ContinuosProject
            .Charts
              ._ChartType(Pie)
                .Attributes
                  .Heigth(230)

                  .Name('GraficolLive2')
                  .ColSpan(12)
                  .Options
                    .Title
                      .display(true)
                      .text('Usuários nas Mídias Sociais')
                      .fontSize(20)
                    .&End
                    .Legend
                      .display(true)
                      .position('right')
                    .&End
                    .Tooltip
                      .DisplayTitle(true)
                    .&End
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet11)
                    .textLabel('Usuários nas Redes Sociais')
                    .BackgroundOpacity(4)
                  .&End
                .&End
              .&End
            .&End
            .HTML
        )
      .&End
    .&End
    .Rows
      ._Div
        .ColSpan(12)
        .Add(
          Webcharts1
            .ContinuosProject
            .Charts
              ._ChartType(line)
                .Attributes
                  .Name('GraficolLive3')
                  .ColSpan(12)
                  .Heigth(80)
                  .Labelling
                    .Format('0')
                    .FontSize(15)
                  .&End
                  .Options
                    .Legend
                      .display(false)
                    .&End
                    .Title
                      .display(true)
                      .text('Vendas no Período')
                      .fontSize(20)
                    .&End
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet2)
                    .textLabel('Vendas no Período')
                    .BackgroundColor('121,54,245')
                    .BorderColor('121,54,245')
                    .BackgroundOpacity(4)
                    .Fill(True)
                  .&End
                  .Options
                    .Tooltip.DisplayTitle(true)
                      .InteractionModeIndex
                    .&End
                  .&End
                .&End
              .&End
            .&End
            .HTML
        )
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  clientdataset11.SaveToFile('datadb.xml');
end;

function TForm11.GenerateCard: String;
begin
  Result := WebCharts1
        .ContinuosProject
        .CardStyled
          .CardType(CardStyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#5e72e4,#825ee4)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Vendas')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(Format('%m', [Random(3500000)*0.1]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('10% a mais que o último mês')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-dollar-sign')
              .Style
                .BackgroundColor('#F839D7')
              .&End
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardStyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#11cdef,#1171ef)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Atendimentos')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(Format('%d', [Random(1000)]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('3,48% a mais que o último mês')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-people-arrows')
              .Style
                .BackgroundColor('#2DC7F8')
              .&End
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardStyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#f5365c,#f56036)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Novos Usuários')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(format('%n', [Random(30000)*1.0]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('7% a mais que o último mês')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-user-plus')
              .Style
                .BackgroundColor('#F89714')
              .&End
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardStyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#07F0A2,#04D956)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Performance')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(format('%n%', [Random(1000)*0.1]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('15%')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Footer
              .Text(' a mais que o último mês')
              .Style
                .FontSize(10)
              .&End
            .&End
            .Shape
              .Icon('fas fa-tachometer-alt')
              .Style
                .BackgroundColor('#04D9CE')
              .&End
            .&End
          .&End
        .&End
        .HTML;
end;

end.
