unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.CategoryButtons, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.OleCtrls, SHDocVw,
  View.WebCharts, Data.DB, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    SplitMain: TSplitView;
    CategoryMain: TCategoryButtons;
    ActionMain: TActionList;
    ImageList1: TImageList;
    btn_main_bootstrap: TAction;
    btn_main_chartjs: TAction;
    btn_main_tables: TAction;
    btn_main_dashboards: TAction;
    Panel2: TPanel;
    btnMain: TSpeedButton;
    SplitBootStrap: TSplitView;
    CategoryBootstrap: TCategoryButtons;
    ActionsBootstrap: TActionList;
    btn_bootstrap_cards: TAction;
    btn_bootstrap_images: TAction;
    btn_bootstrap_buttons: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    ClientDataSet7: TClientDataSet;
    ClientDataSet7LAST_NAME: TStringField;
    ClientDataSet7FIRST_NAME: TStringField;
    ClientDataSet7ACCT_NBR: TFloatField;
    ClientDataSet7CITY: TStringField;
    ClientDataSet7STATE: TStringField;
    ClientDataSet7ZIP: TStringField;
    ClientDataSet7TELEPHONE: TStringField;
    ClientDataSet7DATE_OPEN: TDateField;
    ClientDataSet7SS_NUMBER: TFloatField;
    ClientDataSet7BIRTH_DATE: TDateField;
    ClientDataSet7RISK_LEVEL: TStringField;
    ClientDataSet7OCCUPATION: TStringField;
    ClientDataSet7OBJECTIVES: TStringField;
    ClientDataSet6: TClientDataSet;
    ClientDataSet6LAST_NAME: TStringField;
    ClientDataSet6FIRST_NAME: TStringField;
    ClientDataSet6ACCT_NBR: TFloatField;
    ClientDataSet6ADDRESS_1: TStringField;
    ClientDataSet6CITY: TStringField;
    ClientDataSet6STATE: TStringField;
    ClientDataSet6ZIP: TStringField;
    ClientDataSet6TELEPHONE: TStringField;
    ClientDataSet6DATE_OPEN: TDateField;
    ClientDataSet6SS_NUMBER: TFloatField;
    ClientDataSet6PICTURE: TStringField;
    ClientDataSet6BIRTH_DATE: TDateField;
    ClientDataSet6RISK_LEVEL: TStringField;
    ClientDataSet6OCCUPATION: TStringField;
    ClientDataSet6OBJECTIVES: TStringField;
    ClientDataSet6INTERESTS: TStringField;
    ClientDataSet6IMAGE: TBlobField;
    ClientDataSet5: TClientDataSet;
    ClientDataSet5CustNo: TFloatField;
    ClientDataSet5Company: TStringField;
    ClientDataSet5City: TStringField;
    ClientDataSet5State: TStringField;
    ClientDataSet5Zip: TStringField;
    ClientDataSet5Country: TStringField;
    ClientDataSet5Phone: TStringField;
    ClientDataSet5TaxRate: TFloatField;
    ClientDataSet5Contact: TStringField;
    ClientDataSet4: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    WebCharts1: TWebCharts;
    WebBrowser1: TWebBrowser;
    btn_bootstrap_alerts: TAction;
    btn_bootstrap_jumbotron: TAction;
    btn_bootstrap_listgroup: TAction;
    SplitCharts: TSplitView;
    ActionCharts: TActionList;
    Panel5: TPanel;
    Label2: TLabel;
    btn_chartjs_bars: TAction;
    CategoryCharts: TCategoryButtons;
    btn_chartjs_bars_lines: TAction;
    btn_chartjs_bars_stacked: TAction;
    btn_chartjs_bars_callback: TAction;
    btn_chartjs_bars_label: TAction;
    btn_chartjs_bars_horizontal: TAction;
    btn_chartjs_lines: TAction;
    btn_chartjs_pie: TAction;
    btn_chartjs_pie_easy: TAction;
    btn_chartjs_doughnut: TAction;
    btn_chartjs_semi_circle: TAction;
    SplitTable: TSplitView;
    CategoryTable: TCategoryButtons;
    Panel4: TPanel;
    Label3: TLabel;
    SplitDashBoard: TSplitView;
    CategoryDashBoard: TCategoryButtons;
    Panel6: TPanel;
    Label4: TLabel;
    ActionTable: TActionList;
    ActionDashBoard: TActionList;
    btn_tables_callback: TAction;
    btn_tables_rest: TAction;
    btn_tables_callback_images: TAction;
    btn_dashboards_1: TAction;
    btn_dashboards_2: TAction;
    btn_tables_pivot: TAction;
    ClientDataSet8: TClientDataSet;
    SpeedButton1: TSpeedButton;
    btn_dashboards_4: TAction;
    btn_main_custom: TAction;
    btn_dashboards_3: TAction;
    ClientDataSet9: TClientDataSet;
    ClientDataSet10: TClientDataSet;
    ClientDataSet11: TClientDataSet;
    btn_chartjs_polar_area: TAction;
    btn_chartjs_radar: TAction;
    ClientDataSet12: TClientDataSet;
    procedure btnMainClick(Sender: TObject);
    procedure btn_main_bootstrapExecute(Sender: TObject);
    procedure btn_bootstrap_cardsExecute(Sender: TObject);
    procedure btn_bootstrap_imagesExecute(Sender: TObject);
    procedure btn_bootstrap_buttonsExecute(Sender: TObject);
    procedure btn_bootstrap_alertsExecute(Sender: TObject);
    procedure btn_bootstrap_jumbotronExecute(Sender: TObject);
    procedure btn_bootstrap_listgroupExecute(Sender: TObject);
    procedure btn_main_chartjsExecute(Sender: TObject);
    procedure btn_chartjs_barsExecute(Sender: TObject);
    procedure btn_chartjs_bars_linesExecute(Sender: TObject);
    procedure btn_chartjs_bars_stackedExecute(Sender: TObject);
    procedure btn_chartjs_bars_callbackExecute(Sender: TObject);
    procedure btn_chartjs_bars_labelExecute(Sender: TObject);
    procedure btn_chartjs_linesExecute(Sender: TObject);
    procedure btn_chartjs_pieExecute(Sender: TObject);
    procedure btn_chartjs_pie_easyExecute(Sender: TObject);
    procedure btn_chartjs_doughnutExecute(Sender: TObject);
    procedure btn_chartjs_semi_circleExecute(Sender: TObject);
    procedure btn_chartjs_bars_horizontalExecute(Sender: TObject);
    procedure btn_main_tablesExecute(Sender: TObject);
    procedure btn_main_dashboardsExecute(Sender: TObject);
    procedure btn_tables_callbackExecute(Sender: TObject);
    procedure btn_tables_restExecute(Sender: TObject);
    procedure btn_tables_callback_imagesExecute(Sender: TObject);
    procedure ViewSplit(Sender: TSplitView);
    procedure SplitClosed(Sender: TObject);
    procedure btn_dashboards_1Execute(Sender: TObject);
    procedure btn_dashboards_2Execute(Sender: TObject);
    procedure btn_tables_pivotExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_dashboards_4Execute(Sender: TObject);
    procedure btn_main_customExecute(Sender: TObject);
    procedure btn_dashboards_3Execute(Sender: TObject);
    procedure btn_chartjs_radarExecute(Sender: TObject);
    procedure btn_chartjs_polar_areaExecute(Sender: TObject);
  private
    { Private declarations }
    FSplitExibir : TSplitView;
    FSplitAtual : TSplitView;
    FPivotConfig : string;
  public
    { Public declarations }
    procedure ShowButtons(Value : String);
    procedure CallBack(Value: string);
    procedure RelAvatar(Value : Currency);
    procedure RelCust(Value : Integer);
    procedure RelContato(Value : String);
    procedure PivotConfigSave;
    procedure PivotConfigLoad;
  end;

var
  Form1: TForm1;

implementation

uses
  Charts.Types, Unit2;

{$R *.dfm}

procedure TForm1.btn_bootstrap_alertsExecute(Sender: TObject);
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
        .primary
      .&End
    .&End
    .Alerts
      .Title('secondary')
      .AlertsClass
        .secondary
      .&End
    .&End
    .Alerts
      .Title('succes')
      .AlertsClass
        .success
      .&End
    .&End
    .Alerts
      .Title('danger')
      .AlertsClass
        .danger
      .&End
    .&End
    .Alerts
      .Title('warning')
      .AlertsClass
        .warning
      .&End
    .&End
    .Alerts
      .Title('info')
      .AlertsClass
        .info
      .&End
    .&End
    .Alerts
      .Title('light')
      .AlertsClass
        .light
      .&End
    .&End
    .Alerts
      .Title('dark')
      .AlertsClass
        .dark
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_main_bootstrapExecute(Sender: TObject);
begin
  ViewSplit(SplitBootStrap);
end;

procedure TForm1.btn_bootstrap_buttonsExecute(Sender: TObject);
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
        .primary
      .&End
      .CallbackLink('Primary', 'ShowButtons')
    .&End

    .Buttons
      .Title('secondary')
      .ButtonClass
        .secondary
      .&End
      .CallbackLink('secondary', 'ShowButtons')
    .&End

    .Buttons
      .Title('success')
      .ButtonClass
        .success
      .&End
      .CallbackLink('success', 'ShowButtons')
    .&End

    .Buttons
      .Title('danger')
      .ButtonClass
        .danger
      .&End
      .CallbackLink('danger', 'ShowButtons')
    .&End

    .Buttons
      .Title('warning')
      .ButtonClass
        .warning
      .&End
      .CallbackLink('warning', 'ShowButtons')
    .&End

    .Buttons
      .Title('info')
      .ButtonClass
        .info
      .&End
      .CallbackLink('info', 'ShowButtons')
    .&End

    .Buttons
      .Title('light')
      .ButtonClass
        .light
      .&End
      .CallbackLink('light', 'ShowButtons')
    .&End

    .Buttons
      .Title('dark')
      .ButtonClass
        .dark
      .&End
      .CallbackLink('dark', 'ShowButtons')
    .&End

    .Jumpline
    .Jumpline

    .Buttons
      .Title('outline')
      .ButtonClass
        .outline
        .primary
      .&End
      .CallbackLink('outline', 'ShowButtons')
    .&End

    .Buttons
      .Title('small')
      .ButtonClass
        .secondary
        .small
      .&End
      .CallbackLink('small', 'ShowButtons')
    .&End

    .Buttons
      .Title('large')
      .ButtonClass
        .success
        .large
      .&End
      .CallbackLink('large', 'ShowButtons')
    .&End

    .Jumpline
    .Jumpline

    .Buttons
      .Title('block')
      .ButtonClass
        .danger
        .block
      .&End
      .CallbackLink('block', 'ShowButtons')
    .&End

    .Jumpline
    .Jumpline

    .Buttons
      .Title('active')
      .ButtonClass
        .warning
        .active
      .&End
      .CallbackLink('active', 'ShowButtons')
    .&End

    .Buttons
      .Title('disabled')
      .ButtonClass
        .info
        .disabled
      .&End
      .CallbackLink('disabled', 'ShowButtons')
    .&End


    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm1.btn_bootstrap_cardsExecute(Sender: TObject);
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

procedure TForm1.btn_main_chartjsExecute(Sender: TObject);
begin
  ViewSplit(SplitCharts);
end;

procedure TForm1.btn_dashboards_1Execute(Sender: TObject);
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
      .Jumpline

      .Rows
        .Title
          .Configuracoes
            .H4('Movimento Financeiro')
          .&End
        .&End
      .&End

      .Jumpline

      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('analiseMensal')
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
                    //.Legend(false)
                    .Name('movimento1')
                    .ColSpan(4)
                    .DataSet
                      .textLabel('Movimento 1')
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
                    .Name('movimento2')
                    .ColSpan(4)
                    .DataSet
                      .textLabel('Movimento 2')
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
                    .Name('movimento3')
                    .ColSpan(4)
                    .DataSet
                      .textLabel('Movimento 3')
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
                        .textLabel('Analise de Compras Mensal')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .textLabel('Analise de Compras Mensal')
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
        .tableSm
        .tableHover
      .EndTableClass
      .TableOptions
        .Responsive(true)
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

procedure TForm1.btn_dashboards_2Execute(Sender: TObject);
begin
  TWebCharts.New
    //.AddResource('<link href="green.css" rel="stylesheet">')
    //.AddResource('<link href="style.css" rel="stylesheet">')
    .BackgroundColor('#23272b')
    .FontColor('#8f9894')
    .AddResource('<style> body { margin : 50px; } </style>')
    .Container(Fluid)
    .NewProject
      .Jumpline
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
                      .Heigth(140)
                      //.Title('Network Activities Graph title sub-title')
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet1)
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 2')
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
                      .Heigth(285)
                      //.Title('Top Campaign Performance')
                      .DataSet
                        .textLabel('Meu DataSet 1')
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
                      //.Heigth(295)
                      //.Title('App Usage across versions')
                      .DataSet
                        .textLabel('Meu DataSet 1')
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
                      //.Heigth(295)
                      //.Title('Device Usage')
                      .DataSet
                        .textLabel('Meu DataSet 1')
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
                      //.Heigth(250)
                      //.Title('Device Usage')
                      .DataSet
                        .textLabel('Meu DataSet 1')
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

procedure TForm1.btn_dashboards_3Execute(Sender: TObject);
begin
  WebCharts1.New
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
                      .text('Total Points')
                      .display(True)
                      .position('top')
                      .fontColorHEX('#a6a7aa')
                      .fontSize(25)
                      .padding(10)
                    .&End
                  .&End
                  .DataSet
                    .textLabel('Total Points')
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
                          .display(False)
                        .&End
                        .Title
                          .text('Entrada x Saída')
                          .display(True)
                          .position('top')
                          .fontColorHEX('#a6a7aa')
                          .fontSize(16)
                          .padding(10)
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Entrada x Saída')
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
                            .display(False)
                          .&End
                          .Title
                            .text('Mídias Sociais')
                            .display(True)
                            .position('top')
                            .fontColorHEX('#a6a7aa')
                            .fontSize(16)
                            .padding(10)
                          .&End
                        .&End
                        .DataSet
                          .textLabel('Midias Sociais')
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
                        .text('Mídias Sociais')
                        .display(True)
                        .position('top')
                        .fontColorHEX('#a6a7aa')
                        .fontSize(16)
                        .padding(10)
                      .&End
                    .&End
                    .DataSet
                      .textLabel('Midias Sociais')
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

procedure TForm1.btn_dashboards_4Execute(Sender: TObject);
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
                        .textLabel('Analise de Vendas Mensal')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .textLabel('Analise de Compras Mensal')
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
                        .display(False)
                      .&End
                    .&End
                    .Heigth(200)
                    .Name('Meu Grafico Radar')
                    .ColSpan(4)
                    .DataSet
                      .BackgroundColor('26,187,156')
                      .BorderColor('26,187,156')
                      .textLabel('Meu DataSet 1')
                      .DataSet(ClientDataSet1)
                    .&End
                    .DataSet
                      .BackgroundColor('242,112,91')
                      .BorderColor('242,112,91')
                      .textLabel('Meu DataSet 2')
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
        ._div
          .ColSpan(6)
          .Add(
            WebCharts1
              .ContinuosProject
                .Alerts
                  .Title('Vendas do Mês em Andamento')
                  .AlertsClass
                    .primary
                  .&End
                .&End
                .Alerts
                  .Title('Verificar as Vendas de Junho')
                  .AlertsClass
                    .secondary
                  .&End
                .&End
                .Alerts
                  .Title('Volume de Vendas Acima da Média')
                  .AlertsClass
                    .success
                  .&End
                .&End
                .Alerts
                  .Title('Volume de Vendas Abaixo da Média')
                  .AlertsClass
                    .danger
                  .&End
                .&End
                .Alerts
                  .Title('Volume de Vendas na Média')
                  .AlertsClass
                    .warning
                  .&End
                .&End
                .Alerts
                  .Title('Existem Vendas a Processar')
                  .AlertsClass
                    .info
                  .&End
                .&End
                .Alerts
                  .Title('Existem Compras a Processar')
                  .AlertsClass
                    .light
                  .&End
                .&End
                .Alerts
                  .Title('Existem Vendas não Transmitidas')
                  .AlertsClass
                    .dark
                  .&End
                .&End
              .HTML
          )
        .&End
        ._div
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

procedure TForm1.btn_main_dashboardsExecute(Sender: TObject);
begin
  ViewSplit(SplitDashBoard);
end;

procedure TForm1.btn_chartjs_doughnutExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
          .DataSet
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_bootstrap_imagesExecute(Sender: TObject);
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
        .rounded
        .imgThumbnail
      .&End
      .DataSet
        .Field('PICTURE')
        .DataSet(ClientDataSet6)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.btn_bootstrap_jumbotronExecute(Sender: TObject);
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

procedure TForm1.btn_chartjs_linesExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .BackgroundColor('227,233,235')
            .BorderColor('227,233,235')
            .Fill(False)
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .BackgroundColor('227,233,235')
            .BorderColor('227,233,235')
            .Fill(False)
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
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

procedure TForm1.btn_bootstrap_listgroupExecute(Sender: TObject);
begin
  WebCharts1//.CDN(true)
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

procedure TForm1.btn_chartjs_pieExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_chartjs_pie_easyExecute(Sender: TObject);
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

procedure TForm1.btn_chartjs_polar_areaExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
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

procedure TForm1.btn_chartjs_radarExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('242,112,91')
            .BorderColor('242,112,91')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_tables_pivotExecute(Sender: TObject);
begin
  TWebCharts.New
  .Container(fluid)
  .NewProject
    .Jumpline
    .Rows
      ._Div
        .Add('<h1>Pivot Table</h1>')
        .ColSpan(9)
      .&End
      ._Div
        .ColSpan(3)
        .Add(
          WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Save Config')
                .CallbackLink('','PivotConfigSave')
                .ButtonClass
                  .success
                  .small
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
                  .primary
                  .small
                .&End
              .&End
            .HTML

        )
      .&End
//      ._Div
//        .ColSpan(2)
//        .Add(
//        )
//      .&End
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
          .Add('ShipVIA')
        .&End
        .Cols
          .Add('PaymentMethod')
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated;
end;

procedure TForm1.btn_chartjs_semi_circleExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_main_customExecute(Sender: TObject);
begin
  Form2.ShowModal
end;

procedure TForm1.btn_main_tablesExecute(Sender: TObject);
begin
  ViewSplit(SplitTable);
end;

procedure TForm1.btn_tables_callbackExecute(Sender: TObject);
begin
 TWebCharts.New
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
        .tableSm
        .tableHover
        .tableResponsive
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

procedure TForm1.btn_tables_callback_imagesExecute(Sender: TObject);
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
        .tableSm
        .tableHover
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

procedure TForm1.btn_tables_restExecute(Sender: TObject);
begin
  TWebCharts.New
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
        .tableSm
        .tableHover
      .EndTableClass
      .Datatable(true)
      .TableOptions
        .Responsive(true)
      .&End
      .TableData
        .Server('http://viacep.com.br/ws/RS/Porto Alegre/Domingos/json/')
        .Columns(['cep','logradouro','complemento','bairro','localidade','uf','unidade','ibge','gia'])
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.CallBack(Value: string);
begin
  ShowMessage(value);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btn_Dashboards_2Execute(self);
  FSplitAtual := SplitBootStrap;
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

procedure TForm1.RelAvatar(Value: Currency);
begin
  ClientDataSet6.Filtered := false;
  ClientDataSet6.Filter := 'ACCT_NBR = ' + CurrToStr(Value);
  ClientDataSet6.Filtered := true;

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
              .rounded
              .imgThumbnail
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
                  .textLabel('l1')
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
                  .textLabel('d1')
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
                  .textLabel('d2')
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
                  .textLabel('d3')
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

procedure TForm1.RelContato(Value: String);
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
              .textLabel('Vendas do Mes')
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.RelCust(Value: Integer);
begin
  ShowMessage(IntToStr(Value));
end;

procedure TForm1.ShowButtons(Value: String);
begin
  ShowMessage(Value);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SplitClosed(Sender: TObject);
begin
  if not TSplitView(Sender).Equals(FSplitExibir) then
    FSplitExibir.Open;
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

procedure TForm1.btn_chartjs_barsExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_chartjs_bars_callbackExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .textLabel('Meu DataSet 3')
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

procedure TForm1.btn_chartjs_bars_horizontalExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .Options
            .Scales
              .Axes
                .xAxe
                  .ScaleLabel
                    .display(True)
                    .labelString('Faturamento por Mês')
                  .&End
                .&End
                .yAxe
                  .ScaleLabel
                    .display(True)
                    .labelString('Total de Vendas')
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

procedure TForm1.btn_chartjs_bars_labelExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_chartjs_bars_linesExecute(Sender: TObject);
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .Types('line')
            .Fill(false)
            .BorderWidth(2)
            .BorderColor('30,182,203')
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
          .DataSet
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.btn_chartjs_bars_stackedExecute(Sender: TObject);
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
                .xAxe
                  .Stacked(True)
                .&End
                .yAxe
                  .Stacked(True)
                .&End
              .&End
            .&End
          .&End
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
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

end.
