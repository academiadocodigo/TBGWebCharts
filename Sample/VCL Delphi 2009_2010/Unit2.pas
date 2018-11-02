unit Unit2;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Buttons,
  ExtCtrls, View.WebCharts, OleCtrls, SHDocVw,
  DBCtrls, StdCtrls,
  DB, DBClient,  Grids, DBGrids,
  ComCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton5: TSpeedButton;
    WebCharts1: TWebCharts;
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
    SpeedButton1: TSpeedButton;
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
    SpeedButton12: TSpeedButton;
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
    DBNavigator1: TDBNavigator;
    Panel8: TPanel;
    ComboBox1: TComboBox;
    Carregar: TButton;
    SpeedButton15: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CarregarClick(Sender: TObject);
    procedure testeClick(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RelCust(Value : Integer);
    procedure ShowButtons(Value : String);
    procedure RelAvatar(Value : Currency);
    procedure RelContato(Value : String);
    procedure SampleWC(Value : Currency);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ClientDataSet1.SaveToFile('Data\CDSChats.xml');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ClientDataSet2.SaveToFile('Data\CDSChats2.xml');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ClientDataSet3.SaveToFile('Data\CDSChats3.xml');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  ClientDataSet4.SaveToFile('Data\CDSChats4.xml');
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Grafico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      .Bar
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
         .Title('Meu Grafico de Barras')
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

procedure TForm2.RelAvatar(Value : Currency);
begin
  PageControl1.ActivePageIndex := 0;

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
            .Lines
              .Attributes
                .ColSpan(12)
                .Name('l1')
                .Heigth(100)
                .Legend(False)
                .DataSet
                  .textLabel('l1')
                  .DataSet(ClientDataSet3)
                  .Fill('false')
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
            .Doughnut
              .Attributes
                .ColSpan(4)
                .Name('d1')
                .Legend(True)
                .DataSet
                  .textLabel('d1')
                  .DataSet(ClientDataSet4)
                  .Fill('false')
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
            .Doughnut
              .Attributes
                .ColSpan(4)
                .Name('d2')
                .Legend(True)
                .DataSet
                  .textLabel('d2')
                  .DataSet(ClientDataSet4)
                  .Fill('false')
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
            .Doughnut
              .Attributes
                .ColSpan(4)
                .Name('d3')
                .Legend(True)
                .DataSet
                  .textLabel('d3')
                  .DataSet(ClientDataSet4)
                  .Fill('false')
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

procedure TForm2.RelContato(Value: String);
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
        .Lines
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

procedure TForm2.FormCreate(Sender: TObject);
begin
   TabSheet1.TabVisible := False;
   TabSheet2.TabVisible := False;

  ClientDataSet1.LoadFromFile('Data\CDSChats.xml');
  ClientDataSet1.Open;

  ClientDataSet2.LoadFromFile('Data\CDSChats2.xml');
  ClientDataSet2.Open;

  ClientDataSet3.LoadFromFile('Data\CDSChats3.xml');
  ClientDataSet3.Open;

  ClientDataSet4.LoadFromFile('Data\CDSChats4.xml');
  ClientDataSet4.Open;

  ClientDataSet5.LoadFromFile('Data\customer.xml');
  ClientDataSet5.Open;

  ClientDataSet6.LoadFromFile('Data\clients.xml');
  ClientDataSet6.Open;

  ClientDataSet7.LoadFromFile('Data\clients.xml');
  ClientDataSet7.Open;
end;

procedure TForm2.RelCust(Value: Integer);
begin
  ShowMessage(IntToStr(Value));
end;

procedure TForm2.SampleWC(Value: Currency);
begin
  ShowMessage(CurrToStr(Value));
end;

procedure TForm2.ShowButtons(Value: String);
begin
  ShowMessage(Value);
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Grafico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      .BarHorizontal
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .Title('Meu Grafico de Barras')
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
  PageControl1.ActivePageIndex := 0;

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

procedure TForm2.SpeedButton15Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
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
      .Bar
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .Title('Meu Gráfico de Barras')
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .Types('line')
            .Fill('false')
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

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

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

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      .Doughnut
        .Attributes
          .Name('Meu Grafico Doughnut')
          .ColSpan(12)
          .Title('Meu Grafico Doughnut')
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

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
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
      .Bar
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .Title('Meu Gráfico de Barras')
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

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Charts
        .Lines
          .Attributes
            .Name('Meu Grafico de Barras')
            .ColSpan(12)
            .Title('Meu Grafico de Barras')
            .DataSet
              .textLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
              .Fill('false')
            .&End
            .DataSet
              .textLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
              .BackgroundColor('30,182,203')
              .BorderColor('30,182,203')
              .Fill('false')
            .&End

          .&End
        .&End
      .&End
      .Charts
        .Lines
          .Attributes
            .Name('Meu Grafico de Barras')
            .ColSpan(12)
            .Title('Meu Grafico de Barras')
            .DataSet
              .textLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
              .Fill('false')
            .&End
            .DataSet
              .textLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
              .BackgroundColor('30,182,203')
              .BorderColor('30,182,203')
              .Fill('false')
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

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Charts
        .LineStacked
          .Attributes
            .Name('Meu Grafico de Barras')
            .ColSpan(12)
            .Title('Meu Grafico de Barras')
            .DataSet
              .textLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
            .&End
            .DataSet
              .textLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
              .BackgroundColor('30,182,203')
              .BorderColor('30,182,203')
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      .Pie
        .Attributes
          .Name('Meu Grafico Pie')
          .ColSpan(12)
          .Title('Meu Grafico Pie')
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
            .H4('Movimento Financeiro')
          .&End
        .&End
      .&End

      .Jumpline

      .Charts
        .Bar
          .Attributes
            .Name('analiseMensal')
            .Title('Analise Mensal')
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
                .Doughnut
                  .Attributes
                    .Legend(false)
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
                .Doughnut
                  .Attributes
                    .Legend(false)
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
                .Doughnut
                  .Attributes
                    .Legend(false)
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
                  .Lines
                    .Attributes
                      .Name('graficolinhas')
                      .ColSpan(12)
                      .Heigth(50)
                      .DataSet
                        .DataSet(ClientDataSet2)
                        .textLabel('Analise de Compras Mensal')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill('false')
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .textLabel('Analise de Compras Mensal')
                        .BackgroundColor('30,182,203')
                        .BorderColor('30,182,203')
                        .Fill('false')
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
  PageControl1.ActivePageIndex := 0;
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

        //Adicionando Grafico LineStacked
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  .LineStacked
                    .Attributes
                      .Name('linestacked1')
                      .ColSpan(8)
                      .Heigth(150)
                      .Title('Network Activities Graph title sub-title')
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
                  .BarHorizontal
                    .Attributes
                      .Name('horizontabar1')
                      .ColSpan(4)
                      .Heigth(295)
                      .Title('Top Campaign Performance')
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
                  .BarHorizontal
                    .Attributes
                      .Name('horizontabar2')
                      .ColSpan(4)
                      .Heigth(295)
                      .Title('App Usage across versions')
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
                  .Doughnut
                    .Attributes
                      .Name('Doughnut')
                      .ColSpan(4)
                      .Heigth(295)
                      .Title('Device Usage')
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
                  .Doughnut
                    .Attributes
                      .Name('Pie1')
                      .ColSpan(4)
                      .Heigth(295)
                      .Title('Device Usage')
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

procedure TForm2.testeClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
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

end.
