unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCEFChromiumCore, uCEFChromium,
  uCEFWinControl, uCEFChromiumWindow, Vcl.StdCtrls, Vcl.ExtCtrls, View.WebCharts,
  uCEFWindowParent, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

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
    DataSource1: TDataSource;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2LAT: TStringField;
    ClientDataSet2LNG: TStringField;
    ClientDataSet2UF: TStringField;
    ClientDataSet2NUMVACINAS: TFloatField;
    ClientDataSet2PERCPOPVACINADAS: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  Webcharts1
  .Credenciais
    .APIGoogle('YOUR_API_KEY')
  .&End
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Vacinação no Sudeste')
        .&End
      .&End
    .&End
    .Rows
      ._Div
      .ColSpan(6)
      .Add(
        Webcharts1
        .ContinuosProject
        .Maps
          .MapTitle
            .Text('% da população vacinada')
          .&End
          .MapType(GMaps)
            .Name('map')
            .Height('400px')
            .Options
              .Center
                .Latitude('-23.5504')
                .Longitude('-46.6339')
              .&End
              .Zoom(8)
    //          .MapStyle(Hybrid)
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
            .Text('Nº de vacinas aplicadas')
          .&End
          .MapType(GMaps)
            .Name('map1')
            .Height('400px')
            .Options
              .Center
                .Latitude('-23.5504')
                .Longitude('-46.6339')
              .&End
              .Zoom(8)
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
end;

end.
