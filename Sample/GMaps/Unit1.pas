unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCEFChromiumCore, uCEFChromium,
  uCEFWinControl, uCEFChromiumWindow, Vcl.StdCtrls, Vcl.ExtCtrls, View.WebCharts,
  uCEFWindowParent, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.ComCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Chromium1: TChromium;
    WebCharts1: TWebCharts;
    CEFWindowParent1: TCEFWindowParent;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1LAT: TStringField;
    ClientDataSet1LNG: TStringField;
    ClientDataSet1LABEL: TStringField;
    ClientDataSet1VALUE: TStringField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2LAT: TStringField;
    ClientDataSet2LNG: TStringField;
    ClientDataSet2UF: TStringField;
    ClientDataSet2NUMVACINAS: TFloatField;
    ClientDataSet2PERCPOPVACINADAS: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    aAPIKey : String;
    procedure GraficoSimples;
    procedure MensagemInicial;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Charts.Types;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  GraficoSimples;
  PageControl1.TabIndex := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
  PageControl1.TabIndex := 0;
  MensagemInicial;
end;

procedure TForm1.GraficoSimples;
begin
  if Trim(aAPIKey) = '' then
    if not InputQuery('Google Maps Javascript APIKey', 'Insira a sua APIKey do Google', aAPIKey) then exit;

  Webcharts1
   .AddResource('<style> body { margin : 50px; } </style>')
   .Container(TTypeContainer.fluid)
  .Credenciais
    .APIGoogle(Trim(aAPIKey))
  .&End
  .NewProject
    .Jumpline
    .Rows
      .Title
        .Config
          .H1('Vacinação no Sudeste')
        .&End
      .&End
    .&End
    .Jumpline
    .Rows
      ._Div
      .ColSpan(6)
      .Add(
        Webcharts1
        .ContinuosProject
        .Maps
          .MapTitle
            .FontSize(1)
            .Text('% da população vacinada')
          .&End
          .MapType(GMaps)
            .Name('map')
            .Options
              .MapStyle(TTypeMapStyle(RadioGroup1.ItemIndex))
            .&End
            .Layer
              .HeatMap
                .DataSet
                  .DataSet(ClientDataSet2)
                  .LabelName('UF')
                  .ValueName('PERCPOPVACINADAS')
                .&End
                .Radius('50')
                .Opacity('0.6')
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
        Webcharts1
        .ContinuosProject
        .Maps
          .MapTitle
            .FontSize(1)
            .Text('Nº de vacinas aplicadas')
          .&End
          .MapType(GMaps)
            .Name('map1')
            .Options
              .MapStyle(TTypeMapStyle(RadioGroup1.ItemIndex))
            .&End
            .Draw
              .Marker
                .DataSet
                  .DataSet(ClientDataSet2)
                  .LabelName('UF')
                  .ValueName('NUMVACINAS')
                .&End
              .&End
              .Circle
                .DataSet
                  .DataSet(ClientDataSet2)
                  .LabelName('UF')
                  .ValueName('NUMVACINAS')
                .&End

                .StrokeColor('#FF0000')

                .StrokeOpacity('0.8')
                .StrokeWeight(2)
                .Fillcolor('#FF0000')
                .FillOpacity('0.35')
                .Fator(100)
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
      .HTML(
        webcharts1
        .ContinuosProject
        .Table
          .TableClass
            .tableSm
            .tableHover
            .tableStriped
          .EndTableClass
          .DataSet
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .HTML
      )
    .&End
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
    .Generated;
end;

procedure TForm1.MensagemInicial;
begin

  WebCharts1
    .NewProject
      .Jumpline
      .Jumpline
      .Rows
        .Title
          .Config
            .H3('<span style="color: red;  text-align: center;" >' +
                'Para gerar esse gráfico, é necessário ter uma chave de API Google. ' +
                'Para obter informamação de como  gerar a chave, assista a aula específica no Portal do o Aluno ' +
                '</br></br> <a href="https://app.nutror.com/v3/curso/fb73ff2988ffe08e1fec8f2e801c6a88399afe39/tbgwebcharts-treinamento/aula/2420303"> ' +
                'Clique aqui para assistir a aula</a></span>')
          .&End
        .&End
      .&End
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
  .Generated;
end;

end.
