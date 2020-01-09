unit Unit2;

interface

{$DEFINE HAS_FMX}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Controls, FMX.StdCtrls,
  FMX.ListBox, Fmx.Bind.Navigator, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Data.DB, Datasnap.DBClient, FMX.WebBrowser, FMX.TabControl, FMX.Objects,
  FMX.Layouts, View.WebCharts;

type
  TForm2 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    WebBrowser1: TWebBrowser;
    ClientDataSet1: TClientDataSet;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    Layout5: TLayout;
    Layout6: TLayout;
    ComboBox1: TComboBox;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton13: TSpeedButton;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    ClientDataSet5: TClientDataSet;
    ClientDataSet6: TClientDataSet;
    ClientDataSet7: TClientDataSet;
    WebCharts1: TWebCharts;
    SpeedButton14: TSpeedButton;
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
    btnSemiCircule: TSpeedButton;
    btnBarsLabel: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure btnSemiCirculeClick(Sender: TObject);
    procedure btnBarsLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Charts.Types;

{$R *.fmx}


procedure TForm2.btnBarsLabelClick(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
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
            .Title
              .text('Meu Gráfico de Barras')
            .&End
          .&End
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.btnSemiCirculeClick(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Name('Meu Grafico Doughnut')
          .ColSpan(12)
          .Options
            .SemiCircule(True)
            .Title
              .text('Meu Gráfico de Barras')
            .&End
          .&End
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

procedure TForm2.Button1Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : BindSourceDB1.DataSet := ClientDataSet1;
    1 : BindSourceDB1.DataSet := ClientDataSet2;
    2 : BindSourceDB1.DataSet := ClientDataSet3;
    3 : BindSourceDB1.DataSet := ClientDataSet4;
    4 : BindSourceDB1.DataSet := ClientDataSet5;
    5 : BindSourceDB1.DataSet := ClientDataSet6;
    6 : BindSourceDB1.DataSet := ClientDataSet7;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ClientDataSet1.LoadFromFile('..\VCL\Data\CDSChats.xml');
  ClientDataSet1.Open;

  ClientDataSet2.LoadFromFile('..\VCL\Data\CDSChats2.xml');
  ClientDataSet2.Open;

  ClientDataSet3.LoadFromFile('..\VCL\Data\CDSChats3.xml');
  ClientDataSet3.Open;

  ClientDataSet4.LoadFromFile('..\VCL\Data\CDSChats4.xml');
  ClientDataSet4.Open;

  ClientDataSet5.LoadFromFile('..\VCL\Data\customer.xml');
  ClientDataSet5.Open;

  ClientDataSet6.LoadFromFile('..\VCL\Data\clients.xml');
  ClientDataSet6.Open;

  ClientDataSet7.LoadFromFile('..\VCL\Data\clients.xml');
  ClientDataSet7.Open;
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
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

procedure TForm2.SpeedButton11Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
    WebCharts1
    .NewProject
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

procedure TForm2.SpeedButton13Click(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure TForm2.SpeedButton14Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
    WebCharts1
    .NewProject
    .Table
      .TableClass
        .tableSm
        .tableHover
      .EndTableClass
      .DataSet
        .DataSet(ClientDataSet5)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton15Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
    WebCharts1
    .NewProject
    .Table
      .TableClass
        .tableSm
        .tableHover
      .EndTableClass
      .DataSet
        .DataSet(ClientDataSet7)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  WebCharts1
  .CDN(true)
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
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
            .Title
              .text('Meu Gráfico de Barras')
            .&End
          .&End
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Gráfico de Barras')
          .ColSpan(12)
          .Options
            .Title
              .text('Meu Gráfico de Barras')
            .&End
          .&End
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .Types('line')
            .Fill(False)
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

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(horizontalBar)
        .Attributes
          .Name('Meu GrÁfico de Barras')
          .ColSpan(12)
          .Options
            .SemiCircule(True)
            .Title
              .text('Meu Gráfico de Barras')
            .&End
          .&End
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
  WebCharts1
    .NewProject
      .Charts
        ._ChartType(line)
          .Attributes
            .Name('Meu Gráfico de Barras')
            .ColSpan(12)
            .Options
              .Title
                .text('Meu Gráfico de Linhas')
              .&End
            .&End
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
            .Name('Meu Gráfico de Barras')
            .ColSpan(12)
            .Options
              .Title
                .text('Meu Gráfico de Linhas')
              .&End
            .&End
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



procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(pie)
        .Attributes
          .Name('Meu Grafico Pie')
          .ColSpan(12)
          .Options
            .Title
              .text('Meu Gráfico de Pie')
            .&End
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

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Name('D1')
          .ColSpan(12)
          .Options
            .Title
              .text('Meu Gráfico de Doughnut')
            .&End
          .&End
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

procedure TForm2.SpeedButton8Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
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
            .H4('Movimento Financeiro')
          .&End
        .&End
      .&End

      .Jumpline

      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('analiseMensal')
            .Options
              .Title
                .text('Analise Mensal')
              .&End
            .&End
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
            .H4('Entradas/Saídas')
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
                    .Name('movimento1')
                    .ColSpan(4)
                    .Options
                      .Legend
                        .display(False)
                      .&End
                    .&End
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
                    .Name('movimento2')
                    .ColSpan(4)
                    .Options
                      .Legend
                        .display(False)
                      .&End
                    .&End
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
                    .Options
                      .Legend
                        .display(False)
                      .&End
                    .&End
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
        .DataSet
          .DataSet(ClientDataSet5)
        .&End
      .&End


    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
  WebCharts1
    .AddResource('<link href="css/green.css" rel="stylesheet">')
    .AddResource('<link href="css/custom.min.css" rel="stylesheet">')
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

        //Adicionando Grafico Line
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
                        .Title
                          .text('Network Activities Graph title sub-title')
                        .&End
                      .&End
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
                  ._ChartType(horizontalBar)
                    .Attributes
                      .Name('horizontabar1')
                      .ColSpan(4)
                      .Heigth(295)
                      .Options
                        .Title
                          .text('Top Campaign Performance')
                        .&End
                      .&End
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
                  ._ChartType(horizontalBar)
                    .Attributes
                      .Name('horizontabar2')
                      .ColSpan(4)
                      .Heigth(295)
                      .Options
                        .Title
                          .text('App Usage across versions')
                        .&End
                      .&End
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
                      .Heigth(295)
                      .Options
                        .Title
                          .text('Device Usage')
                        .&End
                      .&End
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
                      .Heigth(295)
                      .Options
                        .Title
                          .text('Device Usage')
                        .&End
                      .&End
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

end.
