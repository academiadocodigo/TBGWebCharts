unit Unit2;

interface

uses
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.OleCtrls,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.ValEdit,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  Winapi.Windows,
  Winapi.Messages,
  Forms,
  View.WebCharts,
  SHDocVw,
  Interfaces;

type
  TForm2 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Carregar: TButton;
    cbTypeChart: TComboBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
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
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    Table: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    ValueListEditor1: TValueListEditor;
    ValueListEditor10: TValueListEditor;
    ValueListEditor11: TValueListEditor;
    ValueListEditor12: TValueListEditor;
    ValueListEditor13: TValueListEditor;
    ValueListEditor14: TValueListEditor;
    ValueListEditor15: TValueListEditor;
    ValueListEditor16: TValueListEditor;
    ValueListEditor17: TValueListEditor;
    ValueListEditor18: TValueListEditor;
    ValueListEditor2: TValueListEditor;
    ValueListEditor3: TValueListEditor;
    ValueListEditor4: TValueListEditor;
    ValueListEditor5: TValueListEditor;
    ValueListEditor6: TValueListEditor;
    ValueListEditor7: TValueListEditor;
    ValueListEditor8: TValueListEditor;
    ValueListEditor9: TValueListEditor;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btnBarCallClick(Sender: TObject);
    procedure btnBarLabelClick(Sender: TObject);
    procedure btnBarsStackedClick(Sender: TObject);
    procedure btnSemiCirculeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  strict private
    FPivotConfig : string;
  public
    procedure CallBack(const Value: string);
    procedure RelAvatar(const Value: Currency);
    procedure RelContato(const Value: string);
    procedure RelCust(const Value: Integer);
    procedure SampleWC(const Value: Currency);
    procedure ShowButtons(const Value: string);
  end;
var
  Form2: TForm2;

implementation
uses
  Charts.Types,
  TypInfo,
  MSHTML;

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Jumbotron
      .Title('Title')
      .Description('Description')
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
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

procedure TForm2.btn3Click(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  PageControl1.ActivePageIndex := 0;
  WebCharts1//.CDN(True)
  .NewProject
    .ListGroup
      .ListGroupType
        .Horizontal
      .&End
      .DataSet
        .DataSet(ClientDataSet7)
        .LabelName('FIRST_NAME')
        .ValueName('RISK_LEVEL')
        .CallbackLink('FIRST_NAME', 'CallBack')
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
      .ClassProvider(Self)
    .&End
  .Generated;
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  ClientDataSet8.SaveToFile('..\..\data\dados.xml');
  PageControl1.ActivePageIndex := 0;
  WebCharts1
//  .CDN(True)
  .Container(fluid)
  .BackgroundColor('#007bff')
  .NewProject
    .PivotTable
      .Attributes
        .DataSet
          .DataSet(ClientDataSet8)
        .&End
        .ConfigBackgroundColor('#b5f110')
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
//        .Rows
//          .Add('LAST_NAME')
//          .Add('FIRST_NAME')
//        .&End
//        .Cols
//          .Add('ACCT_NBR')
//          .Add('CITY')
//        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated;
end;

procedure TForm2.btn5Click(Sender: TObject);
begin
  FPivotConfig := WebCharts1.ContinuosProject
    .WebBrowser(WebBrowser1)
    .PivotTable.SaveConfig;
  ShowMessage(FPivotConfig);
end;

procedure TForm2.btn6Click(Sender: TObject);
begin
  WebCharts1.ContinuosProject
    .WebBrowser(WebBrowser1)
    .PivotTable.LoadConfig(FPivotConfig);
end;

procedure TForm2.btnBarCallClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
    WebCharts1
    .NewProject
      .Rows
        .Title
          .Configuracoes
            .H1('Bar chart')
          .&End
        .&End
      .&End
      .Jumpline
      .Jumpline
      .Charts
        ._ChartType(bar)
          .Attributes
            .CallBackLink('CallBack')
            .Name('My bar chart')
            .ColSpan(12)
            //.Title('Meu Gráfico de Barras')
            .DataSet
              .TextLabel('My DataSet 1')
              .DataSet(ClientDataSet1)
            .&End
            .DataSet
              .BackgroundColor('30,182,203')
              .TextLabel('My DataSet 2')
              .DataSet(ClientDataSet2)
            .&End
            .DataSet
              .BackgroundColor('30,182,100')
              .TextLabel('My DataSet 3')
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

procedure TForm2.btnBarLabelClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('BarChart')
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
          .Name('My bar chart')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .TextLabel('My DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('My DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.btnBarsStackedClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Bar chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('My bar chart')
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
            .TextLabel('My DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('My DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('My DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.btnSemiCirculeClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Name('My doughnut chart')
          .ColSpan(12)
          .Options
            .SemiCircule(True)
          .&End
          .DataSet
            .TextLabel('My DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ClientDataSet1.SaveToFile('..\..\Data\CDSChats.xml');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ClientDataSet2.SaveToFile('..\..\Data\CDSChats2.xml');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ClientDataSet3.SaveToFile('..\..\Data\CDSChats3.xml');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  ClientDataSet4.SaveToFile('..\..\Data\CDSChats4.xml');
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Bar chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('My bar chart')
          .ColSpan(12)
         //.Title('Meu Grafico de Barras')
          .DataSet
            .TextLabel('My DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .TextLabel('My DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.CallBack(const Value: string);
begin
  ShowMessage(Value);
end;

procedure TForm2.CarregarClick(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : DataSource1.DataSet := ClientDataSet1;
    1 : DataSource1.DataSet := ClientDataSet2;
    2 : DataSource1.DataSet := ClientDataSet3;
    3 : DataSource1.DataSet := ClientDataSet4;
    4 : DataSource1.DataSet := ClientDataSet5;
    5 : DataSource1.DataSet := ClientDataSet6;
    6 : DataSource1.DataSet := ClientDataSet7;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   TabSheet1.TabVisible := False;
   TabSheet2.TabVisible := False;
end;

procedure TForm2.RelAvatar(const Value: Currency);
begin
  PageControl1.ActivePageIndex := 0;
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
              .Configuracoes
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
              .Configuracoes
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

procedure TForm2.RelContato(const Value: string);
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
              .TextLabel('Sales for the month')
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.RelCust(const Value: Integer);
begin
  ShowMessage(IntToStr(Value));
end;

procedure TForm2.SampleWC(const Value: Currency);
begin
  ShowMessage(CurrToStr(Value));
end;

procedure TForm2.ShowButtons(const Value: string);
begin
  ShowMessage(Value);
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  if cbTypeChart.Text = 'table' then
  begin
    WebCharts1
      .NewProject
      .Table
        .TableClass
          .TableSm
          .TableHover
        .EndTableClass
        .TableOptions
          .Responsive(ValueListEditor18.Values['Responsive'].ToBoolean)
          .ScrollCollapse(ValueListEditor18.Values['ScrollCollapse'].ToBoolean)
          .DisplayStart(ValueListEditor18.Values['DisplayStart'].ToInteger)
          .LengthMenu(ValueListEditor18.Values['LengthMenu'])
          .Order(ValueListEditor18.Values['Order'])
          .OrderFixed(ValueListEditor18.Values['OrderFixed'])
          .OrderMulti(ValueListEditor18.Values['OrderMulti'].ToBoolean)
          .PageLength(ValueListEditor18.Values['PageLength'].ToInteger)
          .PagingType(ValueListEditor18.Values['PagingType'])
        .&End
        .TableFeatures
          .Info(ValueListEditor18.Values['Info'].ToBoolean)
          .LengthChange(ValueListEditor18.Values['LengthChange'].ToBoolean)
          .Ordering(ValueListEditor18.Values['Ordering'].ToBoolean)
          .Paging(ValueListEditor18.Values['Paging'].ToBoolean)
          .Processing(ValueListEditor18.Values['Processing'].ToBoolean)
          .ScrollX(ValueListEditor18.Values['ScrollX'].ToBoolean)
          .ScrollY(ValueListEditor18.Values['ScrollY'].ToInteger)
          .Searching(ValueListEditor18.Values['Searching'].ToBoolean)
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
  end
  else
  begin
    WebCharts1
    .BackgroundColor(ValueListEditor1.Values['BackgroundColor'])
    .FontColor(ValueListEditor1.Values['FontColor'])
    .NewProject
      .Charts
        ._ChartType(TTypeChart(GetEnumValue(TypeInfo(TTypeChart), cbTypeChart.Text)))
          .Attributes
            .Name(ValueListEditor2.Values['Name'])
            .ColSpan(ValueListEditor2.Values['ColSpan'].ToInteger)
            .Width(ValueListEditor2.Values['Width'].ToInteger)
            .Heigth(ValueListEditor2.Values['Heigth'].ToInteger)
            .BackgroundColor(ValueListEditor2.Values['BackgroundColor'])
            .Options
              .SemiCircule(ValueListEditor15.Values['SemiCircule'].ToBoolean)
              .Legend
                .Display(ValueListEditor12.Values['display'].ToBoolean)
                .Position(ValueListEditor12.Values['position'])
                .Labels
                  .FontSize(ValueListEditor13.Values['fontSize'].ToInteger)
                  .FontStyle(ValueListEditor13.Values['fontStyle'])
                  .FontColorHEX(ValueListEditor13.Values['fontColorHEX'])
                  .FontFamily(ValueListEditor13.Values['fontFamily'])
                  .Padding(ValueListEditor13.Values['padding'].ToInteger)
                .&End
              .&End
              .Title
                .Text(ValueListEditor14.Values['text'])
                .Display(ValueListEditor14.Values['display'].ToBoolean)
                .Position(ValueListEditor14.Values['position'])
                .FontSize(ValueListEditor14.Values['fontSize'].ToInteger)
                .FontFamily(ValueListEditor14.Values['fontFamily'])
                .FontColorHEX(ValueListEditor14.Values['fontColorHEX'])
                .FontStyle(ValueListEditor14.Values['fontStyle'])
                .Padding(ValueListEditor14.Values['padding'].ToInteger)
              .&End
              .Scales
                .Axes
                  .XAxe
                    .Position(ValueListEditor3.Values['Position']) //top', 'left', 'bottom','right'
                    .OffSet(ValueListEditor3.Values['OffSet'].ToBoolean)
                    ._Type(ValueListEditor3.Values['type'])
                    .Stacked(ValueListEditor3.Values['Stacked'].ToBoolean)
                    .Ticks
                      .FontColor(ValueListEditor4.Values['fontColor'])
                      .AutoSkip(ValueListEditor4.Values['autoSkip'].ToBoolean)
                      .AutoSkipPadding(ValueListEditor4.Values['autoSkipPadding'].ToInteger)
                      .LabelOffset(ValueListEditor4.Values['labelOffset'].ToInteger)
                      .MaxRotation(ValueListEditor4.Values['maxRotation'].ToInteger)
                      .MinRotation(ValueListEditor4.Values['minRotation'].ToInteger)
                      .Mirror(ValueListEditor4.Values['mirror'].ToBoolean)
                      .Padding(ValueListEditor4.Values['padding'].ToInteger)
                    .&End
                    .GridLines
                      .Display(ValueListEditor5.Values['display'].ToBoolean)
                      .Circular(ValueListEditor5.Values['circular'].ToBoolean)
                      .ColorRGBA(ValueListEditor5.Values['colorRGBA'])
                      .DrawBorder(ValueListEditor5.Values['drawBorder'].ToBoolean)
                      .DrawOnChartArea(ValueListEditor5.Values['drawOnChartArea'].ToBoolean)
                      .DrawTicks(ValueListEditor5.Values['drawTicks'].ToBoolean)
                      .TickMarkLength(ValueListEditor5.Values['tickMarkLength'].ToInteger)
                      .ZeroLineWidth(ValueListEditor5.Values['zeroLineWidth'].ToInteger)
                      .ZeroLineColorRGBA(ValueListEditor5.Values['zeroLineColorRGBA'])
                    .&End
                    .ScaleLabel
                      .Display(ValueListEditor6.Values['display'].ToBoolean)
                      .LabelString(ValueListEditor6.Values['labelString'])
                      .FontColorHEX(ValueListEditor6.Values['fontColorHEX'])
                      .FontFamily(ValueListEditor6.Values['fontFamily'])
                      .FontSize(ValueListEditor6.Values['fontSize'].ToInteger)
                      .FontStyle(ValueListEditor6.Values['fontStyle']) //i.e. normal, bold, italic, oblique, initial, inherit
                      .Padding(ValueListEditor6.Values['padding'].ToInteger)
                    .&End
                  .&End
                  .YAxe
                    .Position(ValueListEditor7.Values['Position']) //top', 'left', 'bottom','right'
                    .OffSet(ValueListEditor7.Values['OffSet'].ToBoolean)
                    ._Type(ValueListEditor7.Values['type'])
                    .Stacked(ValueListEditor7.Values['Stacked'].ToBoolean)
                    .Ticks
                      .FontColor(ValueListEditor8.Values['fontColor'])
                      .AutoSkip(ValueListEditor8.Values['autoSkip'].ToBoolean)
                      .AutoSkipPadding(ValueListEditor8.Values['autoSkipPadding'].ToInteger)
                      .LabelOffset(ValueListEditor8.Values['labelOffset'].ToInteger)
                      .MaxRotation(ValueListEditor8.Values['maxRotation'].ToInteger)
                      .MinRotation(ValueListEditor8.Values['minRotation'].ToInteger)
                      .Mirror(ValueListEditor8.Values['mirror'].ToBoolean)
                      .Padding(ValueListEditor8.Values['padding'].ToInteger)
                    .&End
                    .GridLines
                      .Display(ValueListEditor9.Values['display'].ToBoolean)
                      .Circular(ValueListEditor9.Values['circular'].ToBoolean)
                      .ColorRGBA(ValueListEditor9.Values['colorRGBA'])
                      .DrawBorder(ValueListEditor9.Values['drawBorder'].ToBoolean)
                      .DrawOnChartArea(ValueListEditor9.Values['drawOnChartArea'].ToBoolean)
                      .DrawTicks(ValueListEditor9.Values['drawTicks'].ToBoolean)
                      .TickMarkLength(ValueListEditor9.Values['tickMarkLength'].ToInteger)
                      .ZeroLineWidth(ValueListEditor9.Values['zeroLineWidth'].ToInteger)
                      .ZeroLineColorRGBA(ValueListEditor9.Values['zeroLineColorRGBA'])
                    .&End
                    .ScaleLabel
                      .Display(ValueListEditor10.Values['display'].ToBoolean)
                      .LabelString(ValueListEditor10.Values['labelString'])
                      .FontColorHEX(ValueListEditor10.Values['fontColorHEX'])
                      .FontFamily(ValueListEditor10.Values['fontFamily'])
                      .FontSize(ValueListEditor10.Values['fontSize'].ToInteger)
                      .FontStyle(ValueListEditor10.Values['fontStyle']) //i.e. normal, bold, italic, oblique, initial, inherit
                      .Padding(ValueListEditor10.Values['padding'].ToInteger)
                    .&End
                  .&End
                .&End
              .&End
              .Tooltip
                .Format(ValueListEditor17.Values['Format'])
              .&End
            .&End
            .Labelling
              .Format(ValueListEditor11.Values['Format']) //Consultar em http://numeraljs.com/#format
              .RGBColor(ValueListEditor11.Values['RGBColor']) //Cor RGB separado por Virgula
              .FontSize(ValueListEditor11.Values['FontSize'].ToInteger)
              .FontStyle(ValueListEditor11.Values['FontStyle']) //normal, bold, italic
              .FontFamily(ValueListEditor11.Values['FontFamily']) //Open Sans, Arial, Helvetica e etc..
              .Padding(ValueListEditor11.Values['Padding'].ToInteger) //Numeros negativos e positivos
            .&End
            .DataSet
              .DataSet(ClientDataSet1)
              .TextLabel(ValueListEditor16.Values['textLabel'])
              .BackgroundColor(ValueListEditor16.Values['BackgroundColor'])
              .BorderColor(ValueListEditor16.Values['BorderColor'])
              .BorderWidth(ValueListEditor16.Values['BorderWidth'].ToInteger)
              .Fill(ValueListEditor16.Values['Fill'].ToBoolean)
            .&End
            .DataSet
              .BackgroundColor('30,182,203')
              .TextLabel('My DataSet 2')
              .DataSet(ClientDataSet2)
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
  end;
end;

procedure TForm2.SpeedButton11Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
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

procedure TForm2.SpeedButton12Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
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

procedure TForm2.SpeedButton13Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
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

procedure TForm2.SpeedButton14Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
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

procedure TForm2.SpeedButton15Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Bar chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('My bar chart')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .TextLabel('My DataSet 1')
            .DataSet(ClientDataSet1)
            .Types('line')
            .Fill(false)
            .BorderWidth(2)
            .BorderColor('30,182,203')
          .&End
          .DataSet
            .TextLabel('My DataSet 2')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
          .DataSet
            .TextLabel('My DataSet 3')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton19Click(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .ChartEasyPie
      .DataPercent('73')
      .Animate('1000')
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
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
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm2.SpeedButton24Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
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
        .Columns(['cep','logradouro','complemento','bairro','localidade','uf','unidade','ibge','gia'])
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
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
          .Name('My doughnut chart')
          .ColSpan(12)
          .DataSet
            .TextLabel('My DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
          .DataSet
            .TextLabel('My DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Bar chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('My bar chart')
          .ColSpan(12)
          .DataSet
            .TextLabel('My DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('My DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('My DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Charts
        ._ChartType(line)
          .Attributes
            //.Labelling(True)
            .Name('My bar chart')
            .ColSpan(12)
            //.Title('Meu Grafico de Barras')
            .DataSet
              .TextLabel('My DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
              .Fill(False)
            .&End
            .DataSet
              .TextLabel('My DataSet 2')
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
            .Name('My bar chart')
            .ColSpan(12)
            //.Title('Meu Grafico de Barras')
            .DataSet
              .TextLabel('My DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
              .Fill(False)
            .&End
            .DataSet
              .TextLabel('My DataSet 2')
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

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(pie)
        .Attributes
          .Name('My pie chart')
          .ColSpan(12)
          //.Title('Meu Grafico Pie')
          .DataSet
            .TextLabel('My DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Rows
        .Title
          .Configuracoes
            .H2('Dashboard')
          .&End
        .&End
      .&End
      .Jumpline
      .Jumpline
      .Rows
        .Title
          .Configuracoes
            .H4('Financial movement')
          .&End
        .&End
      .&End
      .Jumpline
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('analyseMonthly')
            .Heigth(80)
            .DataSet
              .DataSet(ClientDataSet1)
            .&End
          .&End
        .&End
      .&End

      .Jumpline
      .Rows
        .Title
          .Configuracoes
            .H4('In/Out')
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
                    //.Legend(false)
                    .Name('movement1')
                    .ColSpan(4)
                    .DataSet
                      .TextLabel('Movement 1')
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
                    //.Legend(false)
                    .Name('movement2')
                    .ColSpan(4)
                    .DataSet
                      .TextLabel('Movement 2')
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
                    //.Legend(false)
                    .Name('movement3')
                    .ColSpan(4)
                    .DataSet
                      .TextLabel('Movement 3')
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
                      .Name('LineChart')
                      .ColSpan(12)
                      .Heigth(50)
                      .DataSet
                        .DataSet(ClientDataSet2)
                        .TextLabel('Analysing monthly purchases')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .TextLabel('Analysing monthly purchases')
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
            .H4('Activity records')
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
        .AutoWidth(false)
        .LengthChange(false)
        .Info(false)
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

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    //.AddResource('<link href="green.css" rel="stylesheet">')
    //.AddResource('<link href="style.css" rel="stylesheet">')
    .BackgroundColor('#23272b')
    .FontColor('#8f9894')
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
               '  <i class="fa fa-clock-o"></i> Average Time ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">123</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>3% </i> From last Week' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Males ' +
               '</span>' +
               '<div class="count" style="font-size: 40px; color: #1ABB9C;">2,500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Females ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">4,567</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="red"><i class="fa fa-angle-down"></i>12% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Collections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2,315</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Connections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">7,325</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>54% </i> From last Week ' +
               '</span> ')
        .&End
      .&End
      //Pulando Linha
      .Jumpline
      //Adicionando uma nova linha com um gráfico LineStack e Barras Horizontal
      .Rows
        //Adicionando Grafico LineStacked
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('linestacked1')
                      .ColSpan(8)
                      .Heigth(150)
                      //.Title('Network Activities Graph title sub-title')
                      .DataSet
                        .TextLabel('My DataSet 1')
                        .DataSet(ClientDataSet1)
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                      .&End
                      .DataSet
                        .TextLabel('My DataSet 2')
                        .DataSet(ClientDataSet2)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
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
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(bar)
                    .Attributes
                      .Name('horizontabar1')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('Top Campaign Performance')
                      .DataSet
                        .TextLabel('My DataSet 1')
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
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(bar)
                    .Attributes
                      .Name('horizontabar2')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('App Usage across versions')
                      .DataSet
                        .TextLabel('My DataSet 1')
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
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Doughnut')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('Device Usage')
                      .DataSet
                        .TextLabel('My DataSet 1')
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
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Pie1')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('Device Usage')
                      .DataSet
                        .TextLabel('My DataSet 1')
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
    .WebBrowser(WebBrowser1)
    .Generated;
end;

end.
