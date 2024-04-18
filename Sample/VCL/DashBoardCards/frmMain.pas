unit frmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.OleCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  View.WebCharts,
  SHDocVw;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet12: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1RGB: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet2: TClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  strict private
  const
    FAttributNameChartlLive = 'ChartlLive';
    FAttributTextLabelAnalysingCalls = 'Analysing calls';
    FAttributTextLabelAnalysingCustomerService = 'Analysing customer service';
    FAttributTextLabelAnalysingNewUsers = 'Analysing new users';
    FFooterText15Percent = '16%';
    FFooterTextMoreThanLastMonth = ' more than last month';
    FFooterTextPercentMoreThanLastMonth = '%f%% more than last month';
    FMethodNameGenerateChart = 'GenerateChart';
    FTitleText = 'Sales';
    FTitleTextAttendances = 'Attendances';
    FTitleTextNewUsers = 'New users';
    FTitleTextPerformance = 'Performance';
    FTitleTextSales = 'Sales';
    FYear2022 = '2022';
    FYear2023 = '2023';
    FYear2024 = '2024';
    function GenerateCard: string;
  public
    procedure GenerateChart(const Value: string);
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
      .ID('Test')
      .HTML(GenerateCard)
    .&End
    .Jumpline
    .Rows
      .HTML(
        '<div class="col-sm-6"><h3>Sales Report</h3></div>' +
        '<div class="col-sm-6" style="text-align: right">' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .ButtonClass
                  .outline
                  .info
                .&End
                .Title(FYear2022)
                .CallbackLink(FYear2022, FMethodNameGenerateChart)
              .&End
              .Buttons
                .ButtonClass
                  .outline
                  .info
                .&End
                .Title(FYear2023)
                .CallbackLink(FYear2023, FMethodNameGenerateChart)
              .&End
              .Buttons
                .ButtonClass
                  .outline
                  .info
                .&End
                .Title(FYear2024)
                .CallbackLink(FYear2024, FMethodNameGenerateChart)
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
                  .Name(FAttributNameChartlLive)
                  .ColSpan(12)
                  .Heigth(80)
                  .DataSet
                    .DataSet(ClientDataSet1)
                    .TextLabel(FAttributTextLabelAnalysingCustomerService)
                    .BackgroundColor('4,218,89')
                    .BorderColor('4,218,89')
                    .BackgroundOpacity(4)
                    .Fill(False)
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet2)
                    .TextLabel(FAttributTextLabelAnalysingNewUsers)
                    .BackgroundColor('17,120,239')
                    .BorderColor('17,120,239')
                    .BackgroundOpacity(4)
                    .Fill(False)
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet12)
                    .TextLabel(FAttributTextLabelAnalysingNewUsers)
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
                .Text(FTitleText)
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
                .Text(FTitleTextAttendances)
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
                .Text(FTitleTextNewUsers)
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
                .Text(FTitleTextPerformance)
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
      .Id('Test')
      .Html(GenerateCard)
      .Update;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  WebCharts1
    .ContinuosProject
    .WebBrowser(WebBrowser1)
    .LiquiFillGauge
      .Name('fillgauge2')
      .Value(Random(100).ToString)
      .UpdateValue;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  Self.WindowState := TWindowState.wsMaximized;
end;

function TForm6.GenerateCard: string;
begin
  Result := WebCharts1
        .ContinuosProject
        .CardStyled
          .CardType(CardstyledIconRight)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#5e72e4,#825ee4)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text(FTitleTextSales)
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(Format('%m', [Random(3500000) * 0.1]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text(Format(FFooterTextPercentMoreThanLastMonth, [10.0]))
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
              .Text(FTitleTextAttendances)
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
              .Text(Format(FFooterTextPercentMoreThanLastMonth, [3.48]))
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
              .Text(FTitleTextNewUsers)
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(Format('%n', [Random(30000) * 1.0]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text(Format(FFooterTextPercentMoreThanLastMonth, [7.0]))
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
              .Text(FTitleTextPerformance)
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text(Format('%n%', [Random(1000) * 0.1]))
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text(FFooterText15Percent)
              .Style
                .FontSize(15)
              .&End
            .&End
            .Footer
              .Text(FFooterTextMoreThanLastMonth)
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

procedure TForm6.GenerateChart(const Value: string);
var
  Dataset1: TClientDataset;
  Dataset2: TClientDataset;
  Dataset3: TClientDataset;
begin
  case Value.ToInteger of
    2022:
      begin
        Dataset1 := ClientDataSet1;
        Dataset2 := ClientDataSet2;
        Dataset3 := ClientDataSet12;
      end;
    2023:
      begin
        Dataset1 := ClientDataSet2;
        Dataset2 := ClientDataSet1;
        Dataset3 := ClientDataSet12;
      end;
  else
    begin
      Dataset1 := ClientDataSet1;
      Dataset2 := ClientDataSet12;
      Dataset3 := ClientDataSet2;
    end;
  end;

  Webcharts1
    .ContinuosProject
    .WebBrowser(WebBrowser1)
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name(FAttributNameChartlLive)
            .DataSet
              .DataSet(Dataset1)
              .TextLabel(FAttributTextLabelAnalysingCalls)
              .BackgroundColor('4,218,89')
              .BorderColor('4,218,89')
              .BackgroundOpacity(4)
              .Fill(False)
            .&End
            .DataSet
              .DataSet(Dataset2)
              .TextLabel(FAttributTextLabelAnalysingNewUsers)
              .BackgroundColor('17,120,239')
              .BorderColor('17,120,239')
              .BackgroundOpacity(4)
              .Fill(False)
            .&End
            .DataSet
              .DataSet(Dataset3)
              .TextLabel(FAttributTextLabelAnalysingNewUsers)
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
