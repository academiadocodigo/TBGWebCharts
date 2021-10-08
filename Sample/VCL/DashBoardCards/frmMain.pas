unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.WebCharts, Vcl.OleCtrls, SHDocVw,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet1RGB: TStringField;
    ClientDataSet2: TClientDataSet;
    Panel3: TPanel;
    ClientDataSet12: TClientDataSet;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    function generateCard : string;
  public
    { Public declarations }
    procedure GerarGrafico(Value : string);
  end;

var
  Form6: TForm6;

implementation

uses
  Charts.Types;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  WebCharts1
  .CDN(true)
  .NewProject
    .Rows
      .ID('teste')
      .HTML(
          generateCard
      )
    .&End
    .Jumpline
    .Rows
      .HTML(
        '<div class="col-sm-6"><h3>Relatório de Vendas</h3></div>' +
        '<div class="col-sm-6" style="text-align: right">' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .ButtonClass
                  .outline
                  .info
                .&End
                .Title('2020')
                .CallbackLink('2020', 'GerarGrafico')
              .&End
              .Buttons
                .ButtonClass
                  .outline
                  .info
                .&End
                .Title('2021')
                .CallbackLink('2021', 'GerarGrafico')
              .&End
              .Buttons
                .ButtonClass
                  .outline
                  .info
                .&End
                .Title('2022')
                .CallbackLink('2022', 'GerarGrafico')
              .&End
            .HTML +
        '</div>'
      )
    .&End
    .Rows
      ._Div
        .ColSpan(12)
        .Add(
          Webcharts1
            .ContinuosProject
            .Charts
              ._ChartType(bar)
                .Attributes
                  .Name('GraficolLive')
                  .ColSpan(12)
                  .Heigth(80)
                  .DataSet
                    .DataSet(ClientDataSet1)
                    .textLabel('Analise de Atendimentos')
                    .BackgroundColor('4,218,89')
                    .BorderColor('4,218,89')
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
                  .DataSet
                    .DataSet(ClientDataSet12)
                    .textLabel('Analise de Novos Usuários')
                    .BackgroundColor('248,151,20')
                    .BorderColor('248,151,20')
                    .BackgroundOpacity(4)
                    .Fill(False)
                    .Types('line')
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
    .Jumpline
    .Rows
      ._Div
        .ColSpan(3)
        .Add(
          Webcharts1
          .ContinuosProject
            .LiquiFillGauge
              .Name('fillgauge1')
              .Value('35')
              .Height('120')
              .Width('120')
              .Align('center')
              .Title
                .Text('Vendas')
                .TextAlignment('center')
                .FontSize(20)
                .FontColor('102,102,102')
              .&End
              .Config
                .CircleColor('96,114,229')
                .TextColor('248,57,215')
                .WaveTextColor('248,170,170')
                .WaveColor('118,90,213')
                .CircleThickness(20)
                .WaveAnimateTime(2000)
                .WaveHeight(30)
                .WaveCount(1)
              .&End
            .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(3)
        .Add(
          WebCharts1
          .ContinuosProject
            .LiquiFillGauge
              .Name('fillgauge2')
              .Value('28')
              .Height('120')
              .Width('120')
              .Align('center')
              .Title
                .Text('Atendimentos')
                .TextAlignment('center')
                .FontSize(20)
                .FontColor('102,102,102')
              .&End
              .Config
                .CircleColor('17,117,239')
                .TextColor('45,199,248')
                .WaveTextColor('18,255,255')
                .WaveColor('17,197,239')
                .CircleThickness(20)
                .TextVertPosition(20)
                .WaveAnimateTime(1000)
              .&end
            .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(3)
        .Add(
          WebCharts1
          .ContinuosProject
            .LiquiFillGauge
              .Name('fillgauge3')
              .Value('60.1')
              .Height('120')
              .Width('120')
              .Align('center')
              .Title
                .Text('Novos Usuários')
                .TextAlignment('center')
                .FontSize(20)
                .FontColor('102,102,102')
              .&End
              .Config
                .CircleColor('246,57,90')
                .TextColor('245,94,55')
                .WaveTextColor('245,70,70')
                .WaveColor('248,151,20')
                .CircleThickness(10)
                .CircleFillGap(20)
                .TextVertPosition(80)
                .WaveAnimateTime(2000)
                .WaveHeight(30)
                .WaveCount(1)
              .&end
            .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(3)
        .Add(
          WebCharts1
          .ContinuosProject
            .LiquiFillGauge
              .Name('fillgauge4')
              .Value('60.44')
              .Height('120')
              .Width('120')
              .Align('center')
              .Title
                .Text('Performance')
                .TextAlignment('center')
                .FontSize(20)
                .FontColor('102,102,102')
              .&End
              .Config
                .CircleColor('7,239,159')
                .TextColor('4,217,206')
                .WaveTextColor('4,255,255')
                .WaveColor('4,218,89')
                .CircleThickness(15)
                .TextVertPosition(80)
                .WaveAnimateTime(1000)
                .WaveHeight(5)
                .WaveAnimate(True)
                .WaveRise(False)
                .WaveHeightScaling(False)
                .WaveOffset(25)
                .TextSize(75)
                .WaveCount(3)
              .&end
            .&End
          .HTML
        )
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  Webcharts1
    .ContinuosProject
    .WebBrowser(WebBrowser1)
    .DOMElement
      .Id('teste')
      .Html(generateCard)
      .Update;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  WebCharts1
    .ContinuosProject
    .WebBrowser(WebBrowser1)
    .LiquiFillGauge
      .Name('fillgauge2')
      .Value(IntToStr(Random(100)))
      .UpdateValue;
end;

function TForm6.GenerateCard: String;
begin
  Result := WebCharts1
        .ContinuosProject
        .CardStyled
          .CardType(CardstyledIconRight)
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
          .CardType(CardstyledIconRight)
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
          .CardType(CardstyledIconRight)
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
          .CardType(CardstyledIconRight)
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

procedure TForm6.GerarGrafico(Value: string);
var
  dataset1 : TClientDataset;
  dataset2 : TClientDataset;
  dataset3 : TClientDataset;
begin
  case StrToInt(Value) of
    2020 : 
    begin  
      dataset1 := ClientDataSet1;
      dataset2 := ClientDataSet2;
      dataset3 := ClientDataset12;
    end;
    2021 : 
    begin  
      dataset1 := ClientDataSet2;
      dataset2 := ClientDataSet1;
      dataset3 := ClientDataset12;
    end;
    else 
    begin  
      dataset1 := ClientDataSet1;
      dataset2 := ClientDataSet12;
      dataset3 := ClientDataset2;
    end;
  end;
  
  Webcharts1
    .ContinuosProject
    .WebBrowser(WebBrowser1)
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('GraficolLive')
            .DataSet
              .DataSet(dataset1)
              .textLabel('Analise de Atendimentos')
              .BackgroundColor('4,218,89')
              .BorderColor('4,218,89')
              .BackgroundOpacity(4)
              .Fill(False)
            .&End
            .DataSet
              .DataSet(dataset2)
              .textLabel('Analise de Novos Usuários')
              .BackgroundColor('17,120,239')
              .BorderColor('17,120,239')
              .BackgroundOpacity(4)
              .Fill(False)
            .&End
            .DataSet
              .DataSet(dataset3)
              .textLabel('Analise de Novos Usuários')
              .BackgroundColor('248,151,20')
              .BorderColor('248,151,20')
              .BackgroundOpacity(4)
              .Fill(False)
              .Types('line')
            .&End
        .&End
        .UpdateChart;
end;

end.
