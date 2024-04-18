unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  System.ImageList,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ActnList,
  Vcl.ImgList,
  Vcl.CategoryButtons,
  Vcl.WinXCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.OleCtrls,
  SHDocVw,
  View.WebCharts,
  MidasLib;

type
  TForm1 = class(TForm)
    actBtnBootstrapAlerts: TAction;
    actBtnBootstrapButtons: TAction;
    actBtnBootstrapCards: TAction;
    actBtnBootstrapCardsStyled: TAction;
    actBtnBootstrapImages: TAction;
    actBtnBootstrapJumbotron: TAction;
    actBtnBootstrapListgroup: TAction;
    actBtnBootstrapProgress: TAction;
    actBtnChartjsBars: TAction;
    actBtnChartjsBarsCallback: TAction;
    actBtnChartjsBarsHorizontal: TAction;
    actBtnChartjsBarsLabel: TAction;
    actBtnChartjsBarsLines: TAction;
    actBtnChartjsBarsStacked: TAction;
    actBtnChartjsDoughnut: TAction;
    actBtnChartjsLines: TAction;
    actBtnChartjsolarArea: TAction;
    actBtnChartjsPie: TAction;
    actBtnChartjsPieEasy: TAction;
    actBtnChartjsRadar: TAction;
    actBtnChartjsRealTime: TAction;
    actBtnChartjsSemiCircle: TAction;
    actBtnDashboards1: TAction;
    actBtnDashboards2: TAction;
    actBtnDashboards3: TAction;
    actBtnDashboards4: TAction;
    actBtnDashboards5: TAction;
    actBtnMainBootstrap: TAction;
    actBtnMainChartjs: TAction;
    actBtnMainCustom: TAction;
    actBtnMainDashboards: TAction;
    actBtnMainTables: TAction;
    ActionCharts: TActionList;
    ActionDashBoard: TActionList;
    ActionMain: TActionList;
    ActionsBootstrap: TActionList;
    ActionTable: TActionList;
    actTablesCallback: TAction;
    actTablesCallbackImages: TAction;
    actTablesPivot: TAction;
    actTablesRest: TAction;
    btnMain: TSpeedButton;
    CategoryBootstrap: TCategoryButtons;
    CategoryCharts: TCategoryButtons;
    CategoryDashBoard: TCategoryButtons;
    CategoryMain: TCategoryButtons;
    CategoryTable: TCategoryButtons;
    ClientDataSet1: TClientDataSet;
    ClientDataSet10: TClientDataSet;
    ClientDataSet11: TClientDataSet;
    ClientDataSet12: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    ClientDataSet4Label: TStringField;
    ClientDataSet4RGB: TStringField;
    ClientDataSet4Value: TStringField;
    ClientDataSet5: TClientDataSet;
    ClientDataSet5City: TStringField;
    ClientDataSet5Company: TStringField;
    ClientDataSet5Contact: TStringField;
    ClientDataSet5Country: TStringField;
    ClientDataSet5CustNo: TFloatField;
    ClientDataSet5Phone: TStringField;
    ClientDataSet5State: TStringField;
    ClientDataSet5TaxRate: TFloatField;
    ClientDataSet5Zip: TStringField;
    ClientDataSet6: TClientDataSet;
    ClientDataSet6ACCT_NBR: TFloatField;
    ClientDataSet6ADDRESS_1: TStringField;
    ClientDataSet6BIRTH_DATE: TDateField;
    ClientDataSet6CITY: TStringField;
    ClientDataSet6DATE_OPEN: TDateField;
    ClientDataSet6FIRST_NAME: TStringField;
    ClientDataSet6IMAGE: TBlobField;
    ClientDataSet6INTERESTS: TStringField;
    ClientDataSet6LAST_NAME: TStringField;
    ClientDataSet6OBJECTIVES: TStringField;
    ClientDataSet6OCCUPATION: TStringField;
    ClientDataSet6PICTURE: TStringField;
    ClientDataSet6RISK_LEVEL: TStringField;
    ClientDataSet6SS_NUMBER: TFloatField;
    ClientDataSet6STATE: TStringField;
    ClientDataSet6TELEPHONE: TStringField;
    ClientDataSet6ZIP: TStringField;
    ClientDataSet7: TClientDataSet;
    ClientDataSet7ACCT_NBR: TFloatField;
    ClientDataSet7BIRTH_DATE: TDateField;
    ClientDataSet7CITY: TStringField;
    ClientDataSet7DATE_OPEN: TDateField;
    ClientDataSet7FIRST_NAME: TStringField;
    ClientDataSet7LAST_NAME: TStringField;
    ClientDataSet7OBJECTIVES: TStringField;
    ClientDataSet7OCCUPATION: TStringField;
    ClientDataSet7RISK_LEVEL: TStringField;
    ClientDataSet7SS_NUMBER: TFloatField;
    ClientDataSet7STATE: TStringField;
    ClientDataSet7TELEPHONE: TStringField;
    ClientDataSet7ZIP: TStringField;
    ClientDataSet8: TClientDataSet;
    ClientDataSet8AmountPaid: TCurrencyField;
    ClientDataSet8CustNo: TFloatField;
    ClientDataSet8EmpNo: TIntegerField;
    ClientDataSet8Freight: TCurrencyField;
    ClientDataSet8ItemsTotal: TCurrencyField;
    ClientDataSet8OrderNo: TFloatField;
    ClientDataSet8PaymentMethod: TStringField;
    ClientDataSet8PO: TStringField;
    ClientDataSet8SaleDate: TDateTimeField;
    ClientDataSet8ShipDate: TDateTimeField;
    ClientDataSet8ShipToAddr1: TStringField;
    ClientDataSet8ShipToAddr2: TStringField;
    ClientDataSet8ShipToCity: TStringField;
    ClientDataSet8ShipToContact: TStringField;
    ClientDataSet8ShipToCountry: TStringField;
    ClientDataSet8ShipToPhone: TStringField;
    ClientDataSet8ShipToState: TStringField;
    ClientDataSet8ShipToZip: TStringField;
    ClientDataSet8ShipVIA: TStringField;
    ClientDataSet8TaxRate: TFloatField;
    ClientDataSet8Terms: TStringField;
    ClientDataSet9: TClientDataSet;
    ClientDataSetReal1: TClientDataSet;
    ClientDataSetReal2: TClientDataSet;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    SplitBootStrap: TSplitView;
    SplitCharts: TSplitView;
    SplitDashBoard: TSplitView;
    SplitMain: TSplitView;
    SplitTable: TSplitView;
    Timer1: TTimer;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    WebCharts2: TWebCharts;
    procedure actBtnBootstrapAlertsExecute(Sender: TObject);
    procedure actBtnBootstrapButtonsExecute(Sender: TObject);
    procedure actBtnBootstrapCardsExecute(Sender: TObject);
    procedure actBtnBootstrapCardsStyledExecute(Sender: TObject);
    procedure actBtnBootstrapImagesExecute(Sender: TObject);
    procedure actBtnBootstrapJumbotronExecute(Sender: TObject);
    procedure actBtnBootstrapListgroupExecute(Sender: TObject);
    procedure actBtnBootstrapProgressExecute(Sender: TObject);
    procedure actBtnChartjsBarsCallbackExecute(Sender: TObject);
    procedure actBtnChartjsBarsExecute(Sender: TObject);
    procedure actBtnChartjsBarsHorizontalExecute(Sender: TObject);
    procedure actBtnChartjsBarsLabelExecute(Sender: TObject);
    procedure actBtnChartjsBarsLinesExecute(Sender: TObject);
    procedure actBtnChartjsBarsStackedExecute(Sender: TObject);
    procedure actBtnChartjsDoughnutExecute(Sender: TObject);
    procedure actBtnChartjsLinesExecute(Sender: TObject);
    procedure actBtnChartjsolarAreaExecute(Sender: TObject);
    procedure actBtnChartjsPieEasyExecute(Sender: TObject);
    procedure actBtnChartjsPieExecute(Sender: TObject);
    procedure actBtnChartjsRadarExecute(Sender: TObject);
    procedure actBtnChartjsRealTimeExecute(Sender: TObject);
    procedure actBtnChartjsSemiCircleExecute(Sender: TObject);
    procedure actBtnDashboards1Execute(Sender: TObject);
    procedure actBtnDashboards2Execute(Sender: TObject);
    procedure actBtnDashboards3Execute(Sender: TObject);
    procedure actBtnDashboards4Execute(Sender: TObject);
    procedure actBtnDashboards5Execute(Sender: TObject);
    procedure actBtnMainBootstrapExecute(Sender: TObject);
    procedure actBtnMainChartjsExecute(Sender: TObject);
    procedure actBtnMainCustomExecute(Sender: TObject);
    procedure actBtnMainDashboardsExecute(Sender: TObject);
    procedure actBtnMainTablesExecute(Sender: TObject);
    procedure actTablesCallbackExecute(Sender: TObject);
    procedure actTablesCallbackImagesExecute(Sender: TObject);
    procedure actTablesPivotExecute(Sender: TObject);
    procedure actTablesRestExecute(Sender: TObject);
    procedure btnMainClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SplitClosed(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ViewSplit(Sender: TSplitView);
  strict private
    FPivotConfig : string;
    FSplitAtual : TSplitView;
    FSplitExibir : TSplitView;
    function CSSPersonalizado: string;
  public
    procedure CallBack(Value: string);
    procedure PivotConfigLoad;
    procedure PivotConfigSave;
    procedure PivotHideUI;
    procedure PivotShowUI;
    procedure RelAvatar(const Value: Currency);
    procedure RelContato(const Value: string);
    procedure RelCust(const Value: Integer);
    procedure ShowButtons(const Value: string);
  end;

var
  Form1: TForm1;

implementation

uses
  Charts.Types,
  Unit2,
  Colors.Bootstrap;

{$R *.dfm}

procedure TForm1.actBtnBootstrapAlertsExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Alerts')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Alerts
      .Title('primary')
      .AlertsClass
        .Primary
      .&End
    .&End
    .Alerts
      .Title('secondary')
      .AlertsClass
        .Secondary
      .&End
    .&End
    .Alerts
      .Title('succes')
      .AlertsClass
        .Success
      .&End
    .&End
    .Alerts
      .Title('danger')
      .AlertsClass
        .Danger
      .&End
    .&End
    .Alerts
      .Title('warning')
      .AlertsClass
        .Warning
      .&End
    .&End
    .Alerts
      .Title('info')
      .AlertsClass
        .Info
      .&End
    .&End
    .Alerts
      .Title('light')
      .AlertsClass
        .Light
      .&End
    .&End
    .Alerts
      .Title('dark')
      .AlertsClass
        .Dark
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnBootstrapButtonsExecute(Sender: TObject);
begin
  WebCharts1
    .NewProject
    .Rows
      .Title
        .Config
          .H1('Buttons')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Buttons
      .Title('Primary')
      .ButtonClass
        .Primary
      .&End
      .CallbackLink('Primary', 'ShowButtons')
    .&End
    .Buttons
      .Title('secondary')
      .ButtonClass
        .Secondary
      .&End
      .CallbackLink('secondary', 'ShowButtons')
    .&End
    .Buttons
      .Title('success')
      .ButtonClass
        .Success
      .&End
      .CallbackLink('success', 'ShowButtons')
    .&End
    .Buttons
      .Title('danger')
      .ButtonClass
        .Danger
      .&End
      .CallbackLink('danger', 'ShowButtons')
    .&End
    .Buttons
      .Title('warning')
      .ButtonClass
        .Warning
      .&End
      .CallbackLink('warning', 'ShowButtons')
    .&End
    .Buttons
      .Title('info')
      .ButtonClass
        .Info
      .&End
      .CallbackLink('info', 'ShowButtons')
    .&End
    .Buttons
      .Title('light')
      .ButtonClass
        .Light
      .&End
      .CallbackLink('light', 'ShowButtons')
    .&End
    .Buttons
      .Title('dark')
      .ButtonClass
        .Dark
      .&End
      .CallbackLink('dark', 'ShowButtons')
    .&End
    .Jumpline
    .Jumpline
    .Buttons
      .Title('outline')
      .ButtonClass
        .Outline
        .Primary
      .&End
      .CallbackLink('outline', 'ShowButtons')
    .&End
    .Buttons
      .Title('small')
      .ButtonClass
        .Secondary
        .Small
      .&End
      .CallbackLink('small', 'ShowButtons')
    .&End
    .Buttons
      .Title('large')
      .ButtonClass
        .Success
        .Large
      .&End
      .CallbackLink('large', 'ShowButtons')
    .&End
    .Jumpline
    .Jumpline
    .Buttons
      .Title('block')
      .ButtonClass
        .Danger
        .Block
      .&End
      .CallbackLink('block', 'ShowButtons')
    .&End
    .Jumpline
    .Jumpline
    .Buttons
      .Title('active')
      .ButtonClass
        .Warning
        .Active
      .&End
      .CallbackLink('active', 'ShowButtons')
    .&End
    .Buttons
      .Title('disabled')
      .ButtonClass
        .Info
        .Disabled
      .&End
      .CallbackLink('disabled', 'ShowButtons')
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm1.actBtnBootstrapCardsExecute(Sender: TObject);
begin
  WebCharts1
    .NewProject
    .Rows
      .Title
        .Config
          .H1('Cards')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Cards
      .FieldHeader('Company')
      .FieldTitle('City')
      .FieldBody('Contact')
      .ColSpan(4)
      .Colors
        .Secondary
      .&End
      .DataSet
        .DataSet(ClientDataSet5)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.actBtnBootstrapCardsStyledExecute(Sender: TObject);
begin
  WebCharts1
    .NewProject
    .Rows
      .Title
        .Config
          .H1('Cards')
        .&End
      .&End
    .&End
    .Jumpline
    .Rows
      .HTML(
        WebCharts1
        .ContinuosProject
        .CardStyled
          .CardType(CardStyledIconBackground)
            .Col(3)
            .BackgroundColor('linear-gradient(to right,#493240,#f09)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Novas Vendas')
            .&End
            .Body
              .Text('3.243')
            .&End
            .Footer
              .Text('30%')
            .&End
            .Shape
              .Icon('fas fa-shopping-cart')
            .&End
            .Progress
              .Background('linear-gradient(135deg, #289cf5, #84c0ec)')
              .Value('30')
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardStyledIconBackground)
            .Col(3)
            .BackgroundColor('linear-gradient(to right, #373b44, #4286f4)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Clientes')
            .&End
            .Body
              .Text('15.07K')
            .&End
            .Footer
              .Text('9.37%')
            .&End
            .Shape
              .Icon('fas fa-users')
            .&End
            .Progress
              .Background('linear-gradient(135deg, #23bdb8 0%, #43e794 100%)')
              .Value('40')
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardStyledIconBackground)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#f5365c,#f56036)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Receita Hoje')
            .&End
            .Body
              .Text('110.000')
            .&End
            .Body
              .Text(',00')
              .Style
                .FontSize(14)
              .&End
            .&End
            .Footer
              .Text('60%')
            .&End
            .Shape
              .Icon('fas fa-dollar-sign')
            .&End
            .Progress
              .Sytle(bg_warning)
              .Value('60')
            .&End
          .&End
        .&End
        .HTML
       )
    .&End
    .Jumpline
    .Rows
      .HTML(
        WebCharts1
        .ContinuosProject
        .CardStyled
          .CardType(CardstyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#50EB76,#269E44)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Vendas')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text('R$ 56,58')
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('10 Cancelamentos')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-dollar-sign')
              .Style
                .BackgroundColor('#EB5059')
              .&End
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardstyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#EBDB56,#FFF178)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Performance')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text('15%')
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('5 desistências')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-tachometer-alt')
              .Style
                .BackgroundColor('#7757EB')
              .&End
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardstyledIconLeft)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#57D1EB,#2B8A9E)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Usuários')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text('15')
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('5 acessos simultâneos')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-user-plus')
              .Style
                .BackgroundColor('#EB9C57')
              .&End
            .&End
          .&End
        .&End
        .HTML
       )
    .&End
    .Jumpline
    .Rows
      .HTML(
        WebCharts1
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
              .Text('R$ 56,58')
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('10 Cancelamentos')
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
            .Callback
              .MethodName('CallBack')
              .ParamValue('Card Usuários R$ 56,58')
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardstyledIconRight)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#11cdef,#1171ef)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Performance')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text('15%')
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('5 desistências')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Shape
              .Icon('fas fa-tachometer-alt')
              .Style
                .BackgroundColor('#2DC7F8')
              .&End
            .&End
            .Callback
              .MethodName('CallBack')
              .ParamValue('Card Usuários 15%')
            .&End
          .&End
        .&End
        .CardStyled
          .CardType(CardstyledIconRight)
            .Col(3)
            .BackgroundColor('linear-gradient(87deg,#f5365c,#f56036)')
            .DefaultFontColor('255,255,255')
            .Title
              .Text('Usuários')
              .Style
                .FontSize(15)
              .&End
            .&End
            .Body
              .Text('15')
              .Style
                .FontSize(20)
              .&End
            .&End
            .Footer
              .Text('5 acessos simultâneos')
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
            .Callback
              .MethodName('CallBack')
              .ParamValue('Card Usuários 15')
            .&End
          .&End
        .&End
        .HTML
       )
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm1.actBtnBootstrapImagesExecute(Sender: TObject);
begin
  WebCharts1
    .NewProject
    .Rows
      .Title
        .Config
          .H1('Images')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Image
      .ImageClass
        .Rounded
        .ImgThumbnail
      .&End
      .DataSet
        .Field('PICTURE')
        .DataSet(ClientDataSet6)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.actBtnBootstrapJumbotronExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Jumbotron')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Jumbotron
      .Title('Título')
      .Description('Descrição')
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnBootstrapListgroupExecute(Sender: TObject);
begin
  WebCharts1//.CDN(True)
  .NewProject
    .Rows
      .Title
        .Config
          .H1('List Group')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Rows
      .Title
        .Config
          .H4('Basic')
        .&End
      .&End
    .&End
    .ListGroup
      .ListGroupType
        .Basic
      .&End
      .DataSet
        .DataSet(ClientDataSet7)
        .LabelName('FIRST_NAME')
      .&End
    .&End
    .Jumpline
    .Rows
      .Title
        .Config
          .H4('Action')
        .&End
      .&End
    .&End
    .ListGroup
      .ListGroupType
        .Action
      .&End
      .DataSet
        .DataSet(ClientDataSet7)
        .LabelName('FIRST_NAME')
        .CallbackLink('FIRST_NAME', 'CallBack')
      .&End
    .&End
    .Jumpline
    .Rows
      .Title
        .Config
          .H4('Flush com Badges')
        .&End
      .&End
    .&End
    .ListGroup
      .ListGroupType
        .Flush
      .&End
      .DataSet
        .DataSet(ClientDataSet7)
        .LabelName('FIRST_NAME')
        .ValueName('RISK_LEVEL')
        .CallbackLink('FIRST_NAME', 'CallBack')
      .&End
    .&End
    .Jumpline
    .Rows
      .Title
        .Config
          .H4('Horizontal')
        .&End
      .&End
    .&End
    .ListGroup
      .ListGroupType
        .Horizontal
      .&End
      .DataSet
        .DataSet(ClientDataSet7)
        .LabelName('FIRST_NAME')
      .&End
    .&End
    .Jumpline
  .WebBrowser(WebBrowser1)
  .CallbackJS
      .ClassProvider(Self)
    .&End
  .Generated;
end;

procedure TForm1.actBtnBootstrapProgressExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Progress')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Progress
      .Info
        .Title
          .Text('Recebimentos')
        .&End
        .Value
          .Text('19% (R$ 4.703,00)')
        .&End
        .Icon
          .Up(True)
          .Positive(True)
        .&End
      .&End
      .ProgressBar
        .Value('19')
        .Sytle(bg_success)
      .&end
    .&End
    .Progress
      .Info
        .Title
          .Text('Despesas Gerais')
        .&End
        .Value
          .Text('85% (R$ 30.000,00)')
        .&End
        .Icon
          .Up(True)
          .Positive(False)
        .&End
      .&End
      .ProgressBar
        .Value('85')
        .Sytle(bg_danger)
      .&end
    .&End
    .Progress
      .Info
        .Title
          .Text('Despesas Fixas')
        .&End
        .Value
          .Text('60% (R$ 40.852,00)')
        .&End
        .Icon
          .Up(False)
          .Positive(False)
        .&End
      .&End
      .ProgressBar
        .Value('60')
        .Sytle(bg_warning)
      .&end
    .&End
    .Jumpline
    .Jumpline
    .Progress
      .ProgressBar
        .Value('50')
        .DisplayLabel(True)
      .&end
    .&End
    .Jumpline
    .Jumpline
    .Progress
      .Height(1)
      .ProgressBar
        .Value('50')
      .&end
    .&End
    .Progress
      .Height(20)
      .ProgressBar
        .Value('50')
      .&end
    .&End
    .Jumpline
    .Jumpline
    .Progress
      .ProgressBar
        .Sytle(bg_success)
        .Value('25')
      .&end
    .&End
    .Progress
      .ProgressBar
        .Sytle(bg_info)
        .Value('50')
      .&end
    .&End
    .Progress
      .ProgressBar
        .Sytle(bg_warning)
        .Value('75')
      .&end
    .&End
    .Progress
      .ProgressBar
        .Sytle(bg_danger)
        .Value('100')
      .&end
    .&End
    .Jumpline
    .Jumpline
    .Progress
      .ProgressBar
        .Value('15')
      .&end
      .ProgressBar
        .Sytle(bg_success)
        .Value('30')
      .&end
      .ProgressBar
        .Sytle(bg_danger)
        .Value('20')
      .&end
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsBarsCallbackExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Bar Chart - CallBack')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .CallBackLink('CallBack')
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
      .ClassProvider(Self)
    .&End
  .Generated;
end;

procedure TForm1.actBtnChartjsBarsExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Bar Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsBarsHorizontalExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Horizontal Bar Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(horizontalBar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .Options
            .Scales
              .Axes
                .XAxe
                  .ScaleLabel
                    .Display(True)
                    .LabelString('Faturamento por Mês')
                  .&End
                .&End
                .YAxe
                  .ScaleLabel
                    .Display(True)
                    .LabelString('Total de Vendas')
                  .&End
                .&End
              .&End
            .&End
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsBarsLabelExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Bar Chart - Label')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Labelling
            .Format('$0,0.00') //Consultar em http://numeraljs.com/#format
            .RGBColor('102,102,102') //Cor RGB separado por Virgula
            .FontSize(10) //Tamanho da Fonte
            .FontStyle('normal') //normal, bold, italic
            .FontFamily('Open Sans') //Open Sans, Arial, Helvetica e etc..
            .Padding(5) //Numeros negativos e positivos
          .&End
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsBarsLinesExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Bar/Line Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .Types('line')
            .Fill(False)
            .BorderWidth(2)
            .BorderColor('30,182,203')
          .&End
          .DataSet
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
          .DataSet
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsBarsStackedExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Stacked Bar Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .Options
            .Scales
              .Axes
                .XAxe
                  .Stacked(True)
                .&End
                .YAxe
                  .Stacked(True)
                .&End
              .&End
            .&End
          .&End
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsDoughnutExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Doughnut Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Labelling
            .Format('0%') //Consultar em http://numeraljs.com/#format
            .RGBColor('255,255,255') //Cor RGB separado por Virgula
            .FontSize(12)
            .FontStyle('bold') //normal, bold, italic
            .FontFamily('Arial') //Open Sans, Arial, Helvetica e etc..
            .Padding(5) //Numeros negativos e positivos
          .&End
          .Name('Meu Grafico Doughnut')
          .ColSpan(12)
          .DataSet
            .TextLabel('Meu DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
          .DataSet
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsLinesExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Lines Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(line)
        .Attributes
          //.Labelling(True)
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Grafico de Barras')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .BackgroundColor('227,233,235')
            .BorderColor('227,233,235')
            .Fill(False)
          .&End
          .DataSet
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
            .BackgroundColor('30,182,203')
            .BorderColor('30,182,203')
            .Fill(False)
          .&End
        .&End
      .&End
    .&End
    .Charts
      ._ChartType(line)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Grafico de Barras')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .BackgroundColor('227,233,235')
            .BorderColor('227,233,235')
            .Fill(False)
          .&End
          .DataSet
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
            .BackgroundColor('30,182,203')
            .BorderColor('30,182,203')
            .Fill(False)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsolarAreaExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Polar Area Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(polarArea)
        .Attributes
          .Options
            .Legend
              .position('bottom')
            .&End
          .&End
          .Name('Meu Grafico Polar Area')
          .ColSpan(12)
          .DataSet
//            .BackgroundColor('26,187,156')
            .RGBName('RGB')
//            .BorderColor('26,187,156')
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet12)
            .Fill(False)
          .&End
//          .DataSet
//            .BackgroundColor('30,182,203')
////            .BorderColor('30,182,203')
//            .textLabel('Meu DataSet 2')
//            .DataSet(ClientDataSet2)
////            .Fill(False)
//          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsPieEasyExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Easy Pie Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .ChartEasyPie
      .DataPercent('73')
      .Animate('1000')
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsPieExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Pie Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(pie)
        .Attributes
          .Name('Meu Grafico Pie')
          .ColSpan(12)
          //.Title('Meu Grafico Pie')
          .DataSet
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsRadarExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Radar Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(radar)
        .Attributes
          .Options
            .Legend
              .position('bottom')
            .&End
          .&End
          .Name('Meu Grafico Radar')
          .ColSpan(12)
          .DataSet
            .BackgroundColor('26,187,156')
            .BorderColor('26,187,156')
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('242,112,91')
            .BorderColor('242,112,91')
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnChartjsRealTimeExecute(Sender: TObject);
begin
  WebCharts1
  .Container(fluid)
  .AddResource('<style> body { margin : 50px; } </style>')
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Real Time')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(line)
        .Attributes
          .Name('linestacked1')
          .ColSpan(12)
          .DataSet
            .TextLabel('Meu DataSet 1')
            .RealTimeDataSet(ClientDataSetReal1)
            .BackgroundColor('242,112,91')
            .BorderColor('242,112,91')
            .Fill(False)
          .&End
          .DataSet
            .TextLabel('Meu DataSet 2')
            .RealTimeDataSet(ClientDataSetReal2)
            .BackgroundColor('26,187,156')
            .Fill(False)
            .BorderColor('26,187,156')
            .LineTension(0)
            .BorderDash(8, 4)
          .&End
          .Options
            .Scales
              .Axes
                .XAxe
                  .RealTime
                  .&End
                .&End
              .&End
            .&End
            .Tooltip
              .Intersect(False)
            .&End
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;

end;

procedure TForm1.actBtnChartjsSemiCircleExecute(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Semi Circle Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Name('Meu Grafico Semicírculo')
          .ColSpan(12)
          .Options
            .SemiCircule(True)
          .&End
          .DataSet
            .TextLabel('Meu DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnDashboards1Execute(Sender: TObject);
begin
  WebCharts1
    .NewProject
      .Jumpline
      .Rows
        .Title
          .Configuracoes
            .H2('Dashboard 1')
          .&End
        .&End
      .&End
      .Jumpline
      .Rows
        .Title
          .Configuracoes
            .H4('Movimento Financeiro')
          .&End
        .&End
      .&End
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('analiseMensal')
            .Heigth(80)
            .DataSet
              .TextLabel('Saídas')
              .DataSet(ClientDataSet1)
            .&End
          .&End
        .&End
      .&End
      .Jumpline
      .Rows
        .Title
          .Configuracoes
            .H4('Entradas/Saidas')
          .&End
        .&End
      .&End
      .Rows
        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(doughnut)
                  .Attributes
                    //.Legend(False)
                    .Name('movimento1')
                    .ColSpan(4)
                    .DataSet
                      .TextLabel('Movimento 1')
                      .DataSet(ClientDataSet3)
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
        .&End
        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(doughnut)
                  .Attributes
                    //.Legend(False)
                    .Name('movimento2')
                    .ColSpan(4)
                    .DataSet
                      .TextLabel('Movimento 2')
                      .DataSet(ClientDataSet4)
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
        .&End
        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(doughnut)
                  .Attributes
                    //.Legend(False)
                    .Name('movimento3')
                    .ColSpan(4)
                    .DataSet
                      .TextLabel('Movimento 3')
                      .DataSet(ClientDataSet3)
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
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('graficolinhas')
                      .ColSpan(12)
                      .Heigth(50)
                      .DataSet
                        .DataSet(ClientDataSet2)
                        .TextLabel('Analise de Compras Mensal')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .TextLabel('Analise de Compras Mensal')
                        .BackgroundColor('30,182,203')
                        .BorderColor('30,182,203')
                        .Fill(False)
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
        .Title
          .Configuracoes
            .H4('Registros de Atividades')
          .&End
        .&End
      .&End
      .Jumpline
      .Jumpline
      .Table
      .TableClass
        .TableSm
        .TableHover
      .EndTableClass
      .TableOptions
        .Responsive(True)
      .&End
      .TableFeatures
        .AutoWidth(False)
        .LengthChange(False)
        .Info(False)
      .&End
      .DataSet
        .CallbackLink('CustNo', 'RelCust')
        .CallbackLink('Contact', 'RelContato')
        .DataSet(ClientDataSet5)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm1.actBtnDashboards2Execute(Sender: TObject);
begin
  WebCharts2
//  .CDN(True)
    .BackgroundColor('#23272b')
    .FontColor('#8f9894')
    .AddResource('<style> body { margin : 50px; } </style>')
    .Container(Fluid)
    .NewProject
      //Criando uma Linha com 6 Colunas e Adicionando conteudo HTML em cada uma
      //dessas colunas
      .Rows
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-user"></i> Total Users ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>4% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="far fa-clock"></i> Average Time ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">123</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>3% </i> From last Week' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-male"></i> Total Males ' +
               '</span>' +
               '<div class="count" style="font-size: 40px; color: #1ABB9C;">2,500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fas fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-female"></i> Total Females ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">4,567</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="red"><i class="fas fa-angle-down"></i>12% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-user"></i> Total Collections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2,315</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fas fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-user"></i> Total Connections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">7,325</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fas fa-angle-up"></i>54% </i> From last Week ' +
               '</span> ')
        .&End
      .&End

//
      //Adicionando uma nova linha com um gráfico LineStack e Barras Horizontal
      .Rows
        //Adicionando Grafico LineStacked
        .Tag
          .Add(
            WebCharts2
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('linestacked1')
                      .ColSpan(8)
                      .Heigth(140)
                      .DataSet
                        .TextLabel('Meu DataSet 1')
                        .RealTimeDataSet(ClientDataSetReal1)
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .TextLabel('Meu DataSet 2')
                        .RealTimeDataSet(ClientDataSetReal2)
                        .BackgroundColor('26,187,156')
                        .Fill(False)
                        .BorderColor('26,187,156')
                        .LineTension(0)
                        .BorderDash(8, 4)
                      .&End
                      .Options
                        .Scales
                          .Axes
                            .XAxe
                              .RealTime
                              .&End
                            .&End
                          .&End
                        .&End
                        .Tooltip
                          .Intersect(False)
//                          .Format('$0,0.00')
                        .&End
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
        //Adicionando Grafico Barras Horizontal
        .Tag
          .Add(
            WebCharts2
              .ContinuosProject
                .Charts
                  ._ChartType(bar)
                    .Attributes
                      .Name('horizontabar1')
                      .ColSpan(4)
                      .Heigth(285)
                      //.Title('Top Campaign Performance')
                      .DataSet
                        .TextLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
              .HTML
          )
        .&End
      .&End
      .Rows
        .Tag
          .Add(
            WebCharts2
              .ContinuosProject
                .Charts
                  ._ChartType(bar)
                    .Attributes
                      .Name('horizontabar2')
                      .ColSpan(4)
                      //.Heigth(295)
                      //.Title('App Usage across versions')
                      .DataSet
                        .TextLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
        .Tag
          .Add(
            WebCharts2
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Doughnut')
                      .ColSpan(4)
                      //.Heigth(295)
                      //.Title('Device Usage')
                      .DataSet
                        .TextLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet4)
                        .BackgroundColor('26,187,156')
                        .BorderColor('227,233,235')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
        .Tag
          .Add(
            WebCharts2
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Pie1')
                      .ColSpan(4)
                      //.Heigth(250)
                      //.Title('Device Usage')
                      .DataSet
                        .TextLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('227,233,235')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
      .&End
//
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.actBtnDashboards3Execute(Sender: TObject);
begin
  WebCharts1
  .Container(fluid)
  .BackgroundColor('#1f2327')
  .FontColor('#FFF')
  .NewProject
    .Jumpline
    .Rows
      ._Div
        .ColSpan(12)
        .Add('<h2 style="color : #FFF";>Dashboard 3</h2>')
      .&End
    .&End
    .Jumpline
    .Rows
      ._Div
        .ColSpan(12)
        .Add('<div style="padding: 2%;  background-color: #292e32">' +
             WebCharts1
             .ContinuosProject
             .Charts
              ._ChartType(line)
                .Attributes
                  .Name('g1')
                  .ColSpan(12)
                  .Heigth(60)
                  .Options
                    .Title
                      .Text('Total Points')
                      .Display(True)
                      .Position('top')
                      .FontColorHEX('#a6a7aa')
                      .FontSize(25)
                      .Padding(10)
                    .&End
                  .&End
                  .DataSet
                    .TextLabel('Total Points')
                    .DataSet(ClientDataSet9)
                    .BackgroundColor('90,142,244')
                    .BorderColor('90,142,244')
                  .&End
                .&End
              .&End
            .&End
            .HTML +
             '</div>')
      .&End
    .&End
    .Jumpline
    .Rows
      ._Div
        .ColSpan(6)
        .Add(
        '<div style="padding: 2%; background-color: #292e32">' +
        WebCharts1
          .ContinuosProject
          .Jumpline
          .Rows
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#50cc89">' +
                   '$1,002.24' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Tax Deduction</p>')
            .&End
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#ff8801">' +
                   '$2,075' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Miles Driven</p>')
            .&End
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#29a0fe">' +
                   '$1,856' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Business Miles</p>')
            .&End
          .&End
          .Jumpline
          .Jumpline
          .Jumpline
          .Rows
            ._Div
              .ColSpan(6)
              .Add(
                WebCharts1
                 .ContinuosProject
                 .Charts
                  ._ChartType(pie)
                    .Attributes
                      .Name('g3')
                      .ColSpan(12)
                      .Options
                        .SemiCircule(True)
                        .Legend
                          .Display(False)
                        .&End
                        .Title
                          .Text('Entrada x Saída')
                          .Display(True)
                          .Position('top')
                          .FontColorHEX('#a6a7aa')
                          .FontSize(16)
                          .Padding(10)
                        .&End
                      .&End
                      .DataSet
                        .TextLabel('Entrada x Saída')
                        .DataSet(ClientDataSet10)
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
              )
            .&End
            ._Div
              .ColSpan(6)
              .Add(
                WebCharts1
                 .ContinuosProject
                   .Charts
                    ._ChartType(pie)
                      .Attributes
                        .Name('g4')
                        .ColSpan(12)
                        .Options
                          .SemiCircule(True)
                          .Legend
                            .Display(False)
                          .&End
                          .Title
                            .Text('Mídias Sociais')
                            .Display(True)
                            .Position('top')
                            .FontColorHEX('#a6a7aa')
                            .FontSize(16)
                            .Padding(10)
                          .&End
                        .&End
                        .DataSet
                          .TextLabel('Midias Sociais')
                          .DataSet(ClientDataSet11)
                        .&End
                      .&End
                    .&End
                  .&End
                  .HTML
              )
            .&End
          .&End
        .HTML +
        '</div>'
        )
      .&End
      ._Div
        .ColSpan(6)
        .Add('<div style="padding: 2%;  background-color: #292e32">' +
             WebCharts1
               .ContinuosProject
               .Charts
                ._ChartType(horizontalBar)
                  .Attributes
                    .Name('g2')
                    .ColSpan(12)
                    .Options
                      .Title
                        .Text('Mídias Sociais')
                        .Display(True)
                        .Position('top')
                        .FontColorHEX('#a6a7aa')
                        .FontSize(16)
                        .Padding(10)
                      .&End
                    .&End
                    .DataSet
                      .TextLabel('Midias Sociais')
                      .DataSet(ClientDataSet11)
                    .&End
                  .&End
                .&End
              .&End
              .HTML +
            '</div>')
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnDashboards4Execute(Sender: TObject);
begin
  WebCharts1
    .Container(Fluid)
    .AddResource('<style> body { margin : 50px; } </style>')
    .NewProject
      .Rows
        .Title
          .Configuracoes
            .H2('Dashboard 4')
          .&End
        .&End
      .&End
      .Jumpline
      .Rows
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('graficolinhas')
                      .ColSpan(8)
                      .Heigth(100)
                      .DataSet
                        .DataSet(ClientDataSet2)
                        .TextLabel('Analise de Vendas Mensal')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .TextLabel('Analise de Compras Mensal')
                        .BackgroundColor('30,182,203')
                        .BorderColor('30,182,203')
                        .Fill(False)
                      .&End
                    .&End
                  .&End
                .&End
              .HTML
          )
        .&End
        .Tag
          .Add(
           WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(radar)
                  .Attributes
                    .Options
                      .Legend
                        .Display(False)
                      .&End
                    .&End
                    .Heigth(200)
                    .Name('Meu Grafico Radar')
                    .ColSpan(4)
                    .DataSet
                      .BackgroundColor('26,187,156')
                      .BorderColor('26,187,156')
                      .TextLabel('Meu DataSet 1')
                      .DataSet(ClientDataSet1)
                    .&End
                    .DataSet
                      .BackgroundColor('242,112,91')
                      .BorderColor('242,112,91')
                      .TextLabel('Meu DataSet 2')
                      .DataSet(ClientDataSet2)
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
          .ColSpan(6)
          .Add(
            WebCharts1
              .ContinuosProject
                .Alerts
                  .Title('Vendas do Mês em Andamento')
                  .AlertsClass
                    .Primary
                  .&End
                .&End
                .Alerts
                  .Title('Verificar as Vendas de Junho')
                  .AlertsClass
                    .Secondary
                  .&End
                .&End
                .Alerts
                  .Title('Volume de Vendas Acima da Média')
                  .AlertsClass
                    .Success
                  .&End
                .&End
                .Alerts
                  .Title('Volume de Vendas Abaixo da Média')
                  .AlertsClass
                    .Danger
                  .&End
                .&End
                .Alerts
                  .Title('Volume de Vendas na Média')
                  .AlertsClass
                    .Warning
                  .&End
                .&End
                .Alerts
                  .Title('Existem Vendas a Processar')
                  .AlertsClass
                    .Info
                  .&End
                .&End
                .Alerts
                  .Title('Existem Compras a Processar')
                  .AlertsClass
                    .Light
                  .&End
                .&End
                .Alerts
                  .Title('Existem Vendas não Transmitidas')
                  .AlertsClass
                    .Dark
                  .&End
                .&End
              .HTML
          )
        .&End
        ._Div
          .ColSpan(6)
          .Add(
            WebCharts1
              .ContinuosProject
                .ListGroup
                  .ListGroupType
                    .Flush
                  .&End
                  .DataSet
                    .DataSet(ClientDataSet2)
                    .LabelName('LABEL')
                    .ValueName('VALUE')
                  .&End
                .&End
              .HTML
          )
        .&End
      .&End
    .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.actBtnDashboards5Execute(Sender: TObject);
begin
   WebCharts1
    .BackgroundColor('#F8F8FA')
    .FontColor('#585858')
    .Container(Fluid)
    .AddResource(Self.CSSPersonalizado)
    .NewProject
      .Jumpline
      .Rows
        ._Div
          .ColSpan(2)
          .Add('<div class="box primary"> ' +
               '<span class="count_top">' +
               '  <i class="fas fa-id-card"></i> Horas Vendidas ' +
               '</span>' +
               '<div class="count" > 121.223,44</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i></i> Mês Atual' +
               '</span> ' +
               '</div>' )
        .&End
        ._Div
          .ColSpan(2)
          .Add('<div class="box secundary" style=" ' +
               '<span class="count_top">' +
               '  <i class="fa fa-id-card"></i> Horas Vendidas ' +
               '</span>' +
               '<div class="count">138.000,00</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-down"></i></i> Mês Anterior' +
               '</span> ' +
               '</div>' )
        .&End
        ._Div
          .ColSpan(2)
          .Add('<div class="box""> ' +
               '<span class="count_top">' +
               '  <i class="far fa-money-bill-alt"></i> Valor Peças ' +
               '</span>' +
               '<div class="count">45.123,45</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i></i> Mês Atual' +
               '</span> ' +
               '</div>' )
        .&End
        ._Div
          .ColSpan(2)
          .Add('<div class="box" > ' +
               '<span class="count_top">' +
               '  <i class="fas fa-clock fa-1x"></i> Valor Serviços ' +
               '</span>' +
               '<div class="count">125.345,56</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i></i> Mês Atual' +
               '</span> ' +
               '</div>' )
        .&End
        ._Div
          .ColSpan(2)
          .Add('<div class="box"> ' +
               '<span class="count_top">' +
               '  <i class="fas fa-wrench"></i> Serviço Terceiro ' +
               '</span>' +
               '<div class="count">5.445,24</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i></i> Mês Atual' +
               '</span> ' +
               '</div>' )
        .&End
        ._Div
          .ColSpan(2)
          .Add('<div class="box" > ' +
               '<span class="count_top">' +
               '  <i class="fab fa-algolia"></i> Total Vendido ' +
               '</span>' +
               '<div class="count">198.345,22</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i></i> Mês Atual' +
               '</span> ' +
               '</div>' )
        .&End
      .&End
      .Jumpline
    .Rows
    ._Div
        .ColSpan(4)
        .Add(
          WebCharts1
          .ContinuosProject
          .ListGroup
            .ListGroupType
              .Flush
            .&End
            .DataSet
              .DataSet(ClientDataSet11)
              .LabelName('Label')
              .ValueName('Value')
            .&End
          .&End
          .HTML)
      .&End
     ._Div
      .Add('<div class="box graphic" ">')
      .ColSpan(8)
      .Add(
        WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(line)
                .Attributes
                  .Name('linestacked1')
                  .Heigth(120)
                  .DataSet
                    .TextLabel('OS - 2020')
                    .DataSet(ClientDataSet1)
                    .BackgroundColor('82,115,233')
                    .BorderColor('82,115,233')
                  .&End
                  .DataSet
                    .TextLabel('OS - 2019')
                    .DataSet(ClientDataSet2)
                    .BackgroundColor('54,194,207')
                    .BorderColor('54,194,207')
                  .&End
                .&End
              .&End
            .&End
            .HTML
          )
       .Add('</div>')
    .&End
    .&End
    .Jumpline
    .Rows
     ._Div
      .Add('<div class="box" >')
      .ColSpan(4)
      .Add(
        WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(pie)
                .Attributes
                  .Name('valorvendido')
                    .BackgroundColor('#111111')
                  .DataSet
                    .TextLabel('OS - 2020')
                    .DataSet(ClientDataSet4)
                    .BackgroundColor('82,115,233')
                    .BorderColor('255,255,255')
                  .&End
                .&End
              .&End
            .&End
          .HTML
        )
      .Add('</div>')
    .&End
     ._Div
      .Add('<div class="box" >')
      .ColSpan(4)
      .Add(
        WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(bar)
                .Attributes
                  .Name('porseguradora')
                    .BackgroundColor('#111111')
                  .DataSet
                    .TextLabel('OS - 2020')
                    .DataSet(ClientDataSet2)
                    .BackgroundColor('82,115,233')
                    .BorderColor('255,255,255')
                  .&End
                .&End
              .&End
            .&End
            .HTML
          )
    .Add('</div>')
    .&End
     ._Div
     .Add('<div class="box" >')
      .ColSpan(4)
      .Add(
        WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(horizontalBar)
                .Attributes
                  .BackgroundColor('#111111')
                  .Name('qtdeprodutivo')
                  .DataSet
                    .TextLabel('OS - 2020')
                    .DataSet(ClientDataSet4)
                    .BackgroundColor('82,115,233')
                    .BorderColor('255,255,255')
                  .&End
                .&End
              .&End
            .&End
            .HTML
          )
    .Add('</div>')
    .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.actBtnMainBootstrapExecute(Sender: TObject);
begin
  ViewSplit(SplitBootStrap);
end;

procedure TForm1.actBtnMainChartjsExecute(Sender: TObject);
begin
  ViewSplit(SplitCharts);
end;

procedure TForm1.actBtnMainCustomExecute(Sender: TObject);
begin
  Form2.ShowModal
end;

procedure TForm1.actBtnMainDashboardsExecute(Sender: TObject);
begin
  ViewSplit(SplitDashBoard);
end;

procedure TForm1.actBtnMainTablesExecute(Sender: TObject);
begin
  ViewSplit(SplitTable);
end;

procedure TForm1.actTablesCallbackExecute(Sender: TObject);
var
  Imagem: TResourceStream;
begin
  Imagem := nil;
  try
    Imagem := TResourceStream.Create(HInstance, 'PngFilter', RT_RCDATA);
    WebCharts1
      .Container(Fluid)
      .AddResource('<style> body { margin : 50px; } </style>')
      .NewProject
      .Rows
        .Title
          .Config
            .H1('Table - CallBack')
          .&End
        .&End
      .&End
      .Jumpline
      .Jumpline
      .Table
        .TableClass
          .TableSm
          .TableHover
          .TableResponsive
        .EndTableClass
        .DataSet
          .CallbackLink('CustNo', 'RelCust')
          .CallbackLink('Contact', 'RelContato')
          .DataSet(ClientDataSet5)
          .ActionEdit
            .CallbackLink('CustNo', 'RelCust')
          .&End
          .ActionDelete
            .CallbackLink('CustNo', 'RelCust')
          .&End
          .Action
            .ActionHeader('Filtrar')
            .Image
              .Image(Imagem)
              .Tooltip('Filtrar')
            .&End
            .CallbackLink('CustNo', 'RelCust')
          .&End
        .&End
      .&End
      .WebBrowser(WebBrowser1)
      .CallbackJS
        .ClassProvider(Self)
      .&End
      .Generated;
  finally
    Imagem.free;
  end;
end;

procedure TForm1.actTablesCallbackImagesExecute(Sender: TObject);
begin
  WebCharts1
    .NewProject
    .Rows
      .Title
        .Config
          .H1('Table - CallBack - Images')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Table
      .TableClass
        .TableSm
        .TableHover
      .EndTableClass
      .DataSet
        .CallbackLink('ACCT_NBR', 'RelAvatar')
        .DataSet(ClientDataSet7)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm1.actTablesPivotExecute(Sender: TObject);
begin
  WebCharts1
  .Container(fluid)
  .NewProject
    .Jumpline
    .Rows
      ._Div
        .Add('<h1>Pivot Table</h1>')
        .ColSpan(7)
      .&End
      ._Div
        .ColSpan(5)
        .Add(
          WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Save Config')
                .CallbackLink('','PivotConfigSave')
                .ButtonClass
                  .Success
                  .Small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Load Config')
                .CallbackLink('','PivotConfigLoad')
                .ButtonClass
                  .Primary
                  .Small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Show UI')
                .CallbackLink('','PivotShowUI')
                .ButtonClass
                  .Secondary
                  .Small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Hide UI')
                .CallbackLink('','PivotHideUI')
                .ButtonClass
                  .Info
                  .Small
                .&End
              .&End
            .HTML

        )
      .&End
    .&End
    .Jumpline
    .PivotTable
      .Attributes
        .DataSet
          .DataSet(ClientDataSet8)
        .&End
        .ConfigBackgroundColor('#b0ceeb')
        .PivotType
          .Tabela
        .&End
        .ConfigHeadStyle
//          .BackgroundColor('#faee7f')
//          .FontColor('#8d0101')
//          .FontSize(20)
        .&End

        .ConfigBodyStyle
//          .BackgroundColor('#bdbdbd')
//          .FontColor('#ffffff')
//          .FontSize(20)
         .&End
        .Rows
          .Add('Transportadora')
        .&End
        .Cols
          .Add('Forma de Pagamento')
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated;
end;

procedure TForm1.actTablesRestExecute(Sender: TObject);
begin
  WebCharts1
    .Container(Fluid)
    .AddResource('<style> body { margin : 50px; } </style>')
    .NewProject
    .Rows
      .Title
        .Config
          .H1('Table - REST')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Table
      .TableClass
        .TableSm
        .TableHover
      .EndTableClass
      .Datatable(True)
      .TableOptions
        .Responsive(True)
      .&End
      .TableData
        .Server('http://viacep.com.br/ws/RS/Porto Alegre/Domingos/json/')
        .Columns(['cep','logradouro','complemento','bairro','localidade','uf','ibge','gia'])
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.btnMainClick(Sender: TObject);
begin
  if SplitMain.Opened then
    SplitMain.Close
  else
    SplitMain.Open;
end;

procedure TForm1.CallBack(Value: string);
begin
  ShowMessage(value);
end;

function TForm1.CSSPersonalizado: string;
begin
  Result := Result + '<style>';
  Result := Result + '.box {';
  Result := Result + 'background-color: #FFFFFF;';
  Result := Result + 'box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.1), 0 2px 20px 0 rgba(0, 0, 0, 0.1);';
  Result := Result + 'border-radius: 2px;';
  Result := Result + 'width: 100%;';
  Result := Result + 'margin: auto;';
  Result := Result + 'padding: 0.75rem;';
  Result := Result + 'text-align: center;';
  Result := Result + '}';
  Result := Result + '.primary {';
  Result := Result + 'background-color: #5273E9;';
  Result := Result + 'color: #FFFFFF;';
  Result := Result + '}';
  Result := Result + '.secundary {';
  Result := Result + 'background-color: #36C2CF;';
  Result := Result + 'color: #FFFFFF;';
  Result := Result + '}';
  Result := Result + '.count {';
  Result := Result + 'font-size: 20px;';
  Result := Result + '}';
  Result := Result + '.boxoffpadding {';
  Result := Result + 'padding: 0rem;';
  Result := Result + 'height: 100%;';
  Result := Result + '}';
  Result := Result + '.list-group {';
  Result := Result + 'background-color: #FFFFFF;';
  Result := Result + 'box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.1), 0 2px 20px 0 rgba(0, 0, 0, 0.1);';
  Result := Result + 'border-radius: 2px;';
  Result := Result + 'width: 100%;';
  Result := Result + 'margin: auto;';
  Result := Result + 'padding: 0.75rem;';
  Result := Result + 'text-align: center;';
  Result := Result + 'height: 100%;';
  Result := Result + '}';
  Result := Result + '.list-group-item {';
  Result := Result + 'padding: 5%;';
  Result := Result + '}';
  Result := Result + '</style>';
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  SSplitMainLength: UInt8 = 50;
begin
  actbtnDashboards2Execute(self);
  FSplitAtual := SplitBootStrap;
  ReportMemoryLeaksOnShutdown := True;
  SplitMain.CompactWidth := SSplitMainLength;
end;

procedure TForm1.PivotConfigLoad;
begin
  if not FPivotConfig.IsEmpty then
    WebCharts1.ContinuosProject
      .WebBrowser(WebBrowser1)
      .PivotTable.LoadConfig(FPivotConfig);
end;

procedure TForm1.PivotConfigSave;
begin
  FPivotConfig := WebCharts1.ContinuosProject
    .WebBrowser(WebBrowser1)
    .PivotTable.SaveConfig;
  ShowMessage(FPivotConfig);
end;

procedure TForm1.PivotHideUI;
begin
  WebCharts1.ContinuosProject
    .WebBrowser(WebBrowser1)
    .PivotTable.HideUI;
end;

procedure TForm1.PivotShowUI;
begin
  WebCharts1.ContinuosProject
    .WebBrowser(WebBrowser1)
    .PivotTable.ShowUI;
end;

procedure TForm1.RelAvatar(const Value: Currency);
begin
  ClientDataSet6.Filtered := False;
  ClientDataSet6.Filter := 'ACCT_NBR = ' + CurrToStr(Value);
  ClientDataSet6.Filtered := True;
  WebCharts1
  .NewProject
    .Rows
      ._Div
        .ColSpan(3)
        .Add(
          WebCharts1
          .ContinuosProject
          .Image
            .ImageClass
              .Rounded
              .ImgThumbnail
            .&End
            .DataSet
              .Field('PICTURE')
              .DataSet(ClientDataSet6)
            .&End
          .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(6)
        .Add(
          WebCharts1
          .ContinuosProject
          .Rows
            .Title
              .Config
                .H1(
                  ClientDataSet6.FieldByName('FIRST_NAME').AsString + ' ' +
                  ClientDataSet6.FieldByName('LAST_NAME').AsString
                )
              .&End
            .&End
          .&End
          .HTML
          +
          WebCharts1
          .ContinuosProject
          .Rows
            .Title
              .Config
                .H5(
                  ClientDataSet6.FieldByName('CITY').AsString + ' - ' +
                  ClientDataSet6.FieldByName('STATE').AsString
                )
              .&End
            .&End
          .&End
          .HTML
          +
          WebCharts1
          .ContinuosProject
          .Jumpline
          .Rows
            ._P
              ._Class('text-muted')
              .Add('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dictum nisl ut porttitor feugiat. ')
              .Add('Mauris et velit id diam laoreet efficitur. Sed a accumsan ligula, ut interdum risus. Donec vel libero')
              .Add('id enim efficitur lobortis. Nulla aliquam felis at nisi pretium porta. Sed id leo sem. Suspendisse consequat,')
              .Add(' purus at aliquet auctor, dolor felis sollicitudin massa, ut vestibulum est ipsum eu tortor.')
            .&End
          .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(3)
        .Add(
          '<ul class="list-group">' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Cras justo odio' +
          '<span class="badge badge-primary badge-pill">$ 14.256,23</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Dapibus ac facilisis' +
          '<span class="badge badge-primary badge-pill">$ 236,22</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-success badge-pill">#1</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-danger badge-pill">-561</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-warning badge-pill">1</span>' +
          '</li>' +
          '</ul>')
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Rows
      ._Div
        .ColSpan(3)
        .Add(
          '<ul class="list-group">' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Cras justo odio' +
          '<span class="badge badge-light badge-pill">$ 14.256,23</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Dapibus ac facilisis' +
          '<span class="badge badge-light badge-pill">$ 236,22</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-light badge-pill">#1</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-light badge-pill">-561</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-light badge-pill">1</span>' +
          '</li>' +
          '</ul>')
      .&End
      ._Div
        .ColSpan(9)
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(line)
              .Attributes
                .ColSpan(12)
                .Name('l1')
                .Heigth(100)
                //.Legend(False)
                .DataSet
                  .TextLabel('l1')
                  .DataSet(ClientDataSet3)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
    .&End
    .Jumpline
    .Rows
      .Tag
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(doughnut)
              .Attributes
                .ColSpan(4)
                .Name('d1')
                //.Legend(True)
                .DataSet
                  .TextLabel('d1')
                  .DataSet(ClientDataSet4)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
      .Tag
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(doughnut)
              .Attributes
                .ColSpan(4)
                .Name('d2')
                //.Legend(True)
                .DataSet
                  .TextLabel('d2')
                  .DataSet(ClientDataSet4)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
      .Tag
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(doughnut)
              .Attributes
                .ColSpan(4)
                .Name('d3')
                //.Legend(True)
                .DataSet
                  .TextLabel('d3')
                  .DataSet(ClientDataSet4)
                  .Fill(False)
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

procedure TForm1.RelContato(const Value: string);
begin
  WebCharts1
    .NewProject
      .Rows
        .Title
          .Configuracoes
            .H2(Value)
          .&End
        .&End
      .&End
      .Charts
        ._ChartType(line)
          .Attributes
            .Name('l1')
            .ColSpan(12)
            .DataSet
              .DataSet(ClientDataSet1)
              .TextLabel('Vendas do Mes')
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.RelCust(const Value: Integer);
begin
  ShowMessage(IntToStr(Value));
end;

procedure TForm1.ShowButtons(const Value: string);
begin
  ShowMessage(Value);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SplitClosed(Sender: TObject);
begin
  if not TSplitView(Sender).Equals(FSplitExibir) and Assigned(FSplitExibir) then
    FSplitExibir.Open;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ClientDataSetReal1.AppendRecord([EmptyStr, IntToStr(Random(200)), EmptyStr]);
  ClientDataSetReal2.AppendRecord([EmptyStr, IntToStr(Random(200)), EmptyStr]);

  WebCharts1
    .ContinuosProject
    .WebBrowser(WebBrowser1)
    .Charts
      ._ChartType(line)
        .Attributes
          .Name('linestacked1')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .RealTimeDataSet(ClientDataSetReal1)
          .&End
          .DataSet
            .TextLabel('Meu DataSet 2')
            .RealTimeDataSet(ClientDataSetReal2)
          .&End
        .&End
        .UpdateRealTime
      .&End
    .&End
end;

procedure TForm1.ViewSplit(Sender: TSplitView);
begin
  if Sender <> FSplitAtual then
  begin
    FSplitExibir := Sender;
    FSplitAtual.Close;
    FSplitAtual := FSplitExibir;
  end
  else
  begin
    if Sender.Opened then
      Sender.Close
    else
      Sender.Open;
  end;
end;

end.
