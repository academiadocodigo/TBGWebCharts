unit frmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.OleCtrls,
  Vcl.ExtCtrls,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  View.WebCharts,
  SHDocVw;

type
  TForm11 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet11: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1RGB: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet2: TClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  strict private
  const
    FAttributeNameChartLive: string = 'ChartLive';
    FAttributeNameChartLive2: string = 'ChartlLive2';
    FAttributeNameChartLive3: string = 'ChartLive3';
    FDatadbXml: string = 'datadb.xml';
    FDisplayTextAverageNnumberOfAttendancesUsers: string = 'Average number of attendances/users';
    FFooterText15Percent: string = '15%';
    FFooterTextMoreThanLastMonth: string = ' more than last month';
    FFooterTextPercentMoreThanLastMonth: string = '%f%% more than last month';
    FTextLabelAnalysisOfAttendances: string = 'Analysis of attendances';
    FTextLabelAnalysisOfNewUsers: string = 'Analysis of new users';
    FTextLabelUsersOnSocialNetworks: string = 'Users on social networks';
    FTitleTextAttendances: string = 'Attendances';
    FTitleTextNewUsers: string = 'New users';
    FTitleTextPerformance: string = 'Performance';
    FTitleTextSales: string = 'Sales';
    FTitleTextSalesInPeriod: string = 'Sales in the period';
    FTitleTextUsersOnSocialMedia: string = 'Users on social media';
    function GenerateCard: string;
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
    .HTML(GenerateCard)
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
                  .Name(FAttributeNameChartLive)
                  .ColSpan(12)
                  .Heigth(170)
                  .Options
                    .Title
                      .Display(True)
                      .Text(FDisplayTextAverageNnumberOfAttendancesUsers)
                      .FontSize(20)
                    .&End
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet1)
                    .TextLabel(FTextLabelAnalysisOfAttendances)
                    .BackgroundColor('245,54,92')
                    .BorderColor('245,54,92')
                    .BackgroundOpacity(4)
                    .Fill(False)
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet2)
                    .TextLabel(FTextLabelAnalysisOfNewUsers)
                    .BackgroundColor('17,120,239')
                    .BorderColor('17,120,239')
                    .BackgroundOpacity(4)
                    .Fill(False)
                  .&End
                  .Options
                    .Tooltip.DisplayTitle(True)
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
                  .Name(FAttributeNameChartLive2)
                  .ColSpan(12)
                  .Options
                    .Title
                      .Display(True)
                      .Text(FTitleTextUsersOnSocialMedia)
                      .FontSize(20)
                    .&End
                    .Legend
                      .Display(True)
                      .position('right')
                    .&End
                    .Tooltip
                      .DisplayTitle(True)
                    .&End
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet11)
                    .TextLabel(FTextLabelUsersOnSocialNetworks)
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
                  .Name(FAttributeNameChartLive3)
                  .ColSpan(12)
                  .Heigth(80)
                  .Labelling
                    .Format('0')
                    .FontSize(15)
                  .&End
                  .Options
                    .Legend
                      .Display(false)
                    .&End
                    .Title
                      .Display(True)
                      .Text(FTitleTextSalesInPeriod)
                      .FontSize(20)
                    .&End
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet2)
                    .TextLabel(FTitleTextSalesInPeriod)
                    .BackgroundColor('121,54,245')
                    .BorderColor('121,54,245')
                    .BackgroundOpacity(4)
                    .Fill(True)
                  .&End
                  .Options
                    .Tooltip.DisplayTitle(True)
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
  clientdataset11.SaveToFile(FDatadbXml);
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
  Self.WindowState := TWindowState.wsMaximized;
end;

function TForm11.GenerateCard: string;
begin
  Result := WebCharts1
        .ContinuosProject
        .CardStyled
          .CardType(CardStyledIconLeft)
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
              .Text(Format(FFooterTextPercentMoreThanLastMonth, [10.]))
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
          .CardType(CardStyledIconLeft)
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
              .Text(Format(FFooterTextPercentMoreThanLastMonth, [7.]))
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

end.
