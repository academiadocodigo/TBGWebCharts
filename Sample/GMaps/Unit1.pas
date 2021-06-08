unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCEFChromiumCore, uCEFChromium,
  uCEFWinControl, uCEFChromiumWindow, Vcl.StdCtrls, Vcl.ExtCtrls, View.WebCharts,
  uCEFWindowParent, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ValEdit;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Chromium1: TChromium;
    WebCharts1: TWebCharts;
    CEFWindowParent1: TCEFWindowParent;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2LAT: TStringField;
    ClientDataSet2LNG: TStringField;
    ClientDataSet2UF: TStringField;
    ClientDataSet2NUMVACINAS: TFloatField;
    ClientDataSet2PERCPOPVACINADAS: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource2: TDataSource;
    ClientDataSet2ADDRESS: TStringField;
    ClientDataSet2IDADDRESS: TIntegerField;
    Button2: TButton;
    Button3: TButton;
    ClientDataSet2INFO: TStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    Memo1: TMemo;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ValueListCircle: TValueListEditor;
    TabSheet5: TTabSheet;
    ValueListHeatMap: TValueListEditor;
    Directions: TTabSheet;
    ValueListDirections: TValueListEditor;
    ValueListConfig: TValueListEditor;
    DBNavigator1: TDBNavigator;
    Marker: TTabSheet;
    ValueListMarker: TValueListEditor;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    aAPIKey : String;
    procedure GraficoSimples;
    procedure MensagemInicial;
    procedure CreateValueListConfig;
    procedure CreateValueListMarker;
    procedure CreateValueListCircle;
    procedure CreateValueListHeatMap;
    Procedure CreateValueListDirections;
    procedure DirectionResult(Value : string);
    procedure AtualizaLatLng(Value : String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON,
  System.Generics.Collections,
  Charts.Types, 
  System.TypInfo;

{$R *.dfm}

procedure TForm1.AtualizaLatLng(Value: String);
var
  GeoCodeArray : TJSONArray;
  GeoCode : TJSONObject;
  IdEndereco, Endereco, LAT, LNG : String;
  I, Contador : Integer;
begin
  GeoCodeArray := TJSONObject.ParseJSONValue(Value) as TJSONArray;
  Contador := 0;
  try
    for I := 0 to pred(GeoCodeArray.Count) do
    begin
      GeoCode := GeoCodeArray.Items[I] as TJSONObject;
      IdEndereco := GeoCode.Pairs[0].JsonValue.Value;
      Endereco := GeoCode.Pairs[1].JsonValue.Value;
      LAT := GeoCode.Pairs[2].JsonValue.Value;
      LNG := GeoCode.Pairs[3].JsonValue.Value;

      if (ClientDataSet2.Locate('IDADDRESS', IdEndereco, [])) then
      begin
        Inc(Contador);
        ClientDataSet2.Edit;
        ClientDataSet2.FieldByName('LAT').Value := StringReplace(LAT, ',', '.', [rfReplaceAll]);
        ClientDataSet2.FieldByName('LNG').Value := StringReplace(LNG, ',', '.', [rfReplaceAll]);
        ClientDataSet2.Post;
      end;
    end;
  finally
    GeoCodeArray.Free;
  end;
  ShowMessage(IntToStr(Contador) + ' Registro(s) atualizado(s)');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GraficoSimples;
  PageControl1.TabIndex := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  PageControl1.TabIndex := 1;
  WebCharts1.ContinuosProject
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
    .Maps
      .MapType(GMaps)
        .Name('map1')
        .GetGeoCodeResult(AtualizaLatLng);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  PageControl1.TabIndex := 1;
  WebCharts1.ContinuosProject
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
    .Maps
      .MapType(GMaps)
        .Name('map2')
        .GetDirectionResult(DirectionResult);
end;

procedure TForm1.CreateValueListCircle;
var
  ItemProp : TItemProp;
begin
  ValueListCircle.InsertRow('StrokeColor', '#FF0000', true);
  ValueListCircle.InsertRow('StrokeOpacity', '0.8', true);
  ValueListCircle.InsertRow('StrokeWeight', '2', true);
  ValueListCircle.InsertRow('FillColor', '#FF0000', true);
  ValueListCircle.InsertRow('FillOpacity', '0.35', true);
  ValueListCircle.InsertRow('Fator', '100', true);
  ValueListCircle.InsertRow('InfoWindowMaxWidth', '0', true);
  ValueListCircle.InsertRow('InfoWindowMinWidth', '0', true);
  ValueListCircle.InsertRow('InfoWindowStartOpened', 'True', true);
  ItemProp := TItemProp.Create(ValueListCircle);
  ItemProp.PickList.Add('True');
  ItemProp.PickList.Add('False');
  ValueListCircle.ItemProps[ValueListCircle.Strings.Count -1] := ItemProp;
  ItemProp.Free;
end;

procedure TForm1.CreateValueListConfig;
var
  ItemProp : TItemProp;
begin
  ValueListConfig.InsertRow('MapStyle', 'Hybrid', true);
  ItemProp := TItemProp.Create(ValueListConfig);
  ItemProp.PickList.Add('Hybrid');
  ItemProp.PickList.Add('RoadMap');
  ItemProp.PickList.Add('Satellite');
  ItemProp.PickList.Add('Terrain');
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ItemProp.PickList.Clear;
  ItemProp.PickList.Add('True');
  ItemProp.PickList.Add('False');
  ValueListConfig.InsertRow('FullScreenControl', 'True', true);
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ValueListConfig.InsertRow('MapTypeControl', 'False', true);
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ValueListConfig.InsertRow('StreetViewControl', 'False', true);
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ValueListConfig.InsertRow('ZoomControl', 'False', true);
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ValueListConfig.InsertRow('RotateControl', 'False', true);
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ValueListConfig.InsertRow('Tilt', 'False', true);
  ValueListConfig.ItemProps[ValueListConfig.Strings.Count -1] := ItemProp;
  ItemProp.Free;
end;

procedure TForm1.CreateValueListDirections;
var
  ItemProp : TItemProp;
begin
  ValueListDirections.InsertRow('TravelMode', 'Driving', true);
  ItemProp := TItemProp.Create(ValueListDirections);
  ItemProp.PickList.Add('Bicycling');
  ItemProp.PickList.Add('Driving');
  ItemProp.PickList.Add('Transit');
  ItemProp.PickList.Add('Walking');
  ValueListDirections.ItemProps[ValueListDirections.Strings.Count -1] := ItemProp;
  ValueListDirections.InsertRow('Origin', 'Cabo Frio', true);
  ValueListDirections.InsertRow('Destination', 'Cabo Frio', true);
  ValueListDirections.InsertRow('OptimizeWaypoints', 'True', true);
  ItemProp.PickList.Clear;
  ItemProp.PickList.Add('True');
  ItemProp.PickList.Add('False');
  ValueListDirections.ItemProps[ValueListDirections.Strings.Count -1] := ItemProp;
  ValueListDirections.InsertRow('PanelFloatPos', 'right', true);
  ItemProp.PickList.Clear;
  ItemProp.PickList.Add('right');
  ItemProp.PickList.Add('left');
  ValueListDirections.ItemProps[ValueListDirections.Strings.Count -1] := ItemProp;
  ValueListDirections.InsertRow('PanelWidth', '390px', true);
  ItemProp.PickList.Clear;
  ItemProp.Free;
end;

procedure TForm1.CreateValueListHeatMap;
begin
  ValueListHeatMap.InsertRow('Radius', '50', true);
  ValueListHeatMap.InsertRow('Opacity', '0.6', true);
end;

procedure TForm1.CreateValueListMarker;
var
  ItemProp : TItemProp;
begin
  ValueListMarker.InsertRow('InfoWindowMaxWidth', '0', true);
  ValueListMarker.InsertRow('InfoWindowMinWidth', '0', true);
  ValueListMarker.InsertRow('InfoWindowStartOpened', 'True', true);
  ItemProp := TItemProp.Create(ValueListMarker);
  ItemProp.PickList.Add('True');
  ItemProp.PickList.Add('False');
  ValueListMarker.ItemProps[ValueListMarker.Strings.Count -1] := ItemProp;
  ItemProp.Free;
end;

procedure TForm1.DirectionResult(Value: string);
var
  JSONResult : TJSONObject;
begin
  JSONResult := TJSONObject.ParseJSONValue(Value) as TJSONObject;
  try
    Memo1.Text := JSONResult.Format(4);
  finally
    JSONResult.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
  PageControl1.TabIndex := 0;
  MensagemInicial;
  CreateValueListConfig;
  CreateValueListMarker;
  CreateValueListCircle;
  CreateValueListHeatMap;
  CreateValueListDirections;
end;

procedure TForm1.GraficoSimples;
begin
  if Trim(aAPIKey) = '' then
    if not InputQuery('Google Maps Javascript APIKey', 'Insira a sua APIKey do Google', aAPIKey) then exit;

  Webcharts1
    .cdn(True)
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
            .FontSize(20)
            .Text('% da população vacinada')
          .&End
          .MapType(GMaps)
            .Name('map')
            .Options
              .MapStyle(TTypeMapStyle(GetEnumValue(TypeInfo(TTypeMapStyle), ValueListConfig.Values['MapStyle'])))
              .FullScreenControl(ValueListConfig.Values['FullScreenControl'].ToBoolean)
              .MapTypeControl(ValueListConfig.Values['MapTypeControl'].ToBoolean)
              .StreetViewControl(ValueListConfig.Values['StreetViewControl'].ToBoolean)
              .ZoomControl(ValueListConfig.Values['ZoomControl'].ToBoolean)
              .RotateControl(ValueListConfig.Values['RotateControl'].ToBoolean)
              .Tilt(ValueListConfig.Values['Tilt'].ToBoolean)
            .&End
            .Layer
              .HeatMap
                .DataSet
                  .DataSet(ClientDataSet2)
                  .LabelName('UF')
                  .ValueName('PERCPOPVACINADAS')
                .&End
                .Radius(ValueListHeatMap.Values['Radius'])
                .Opacity(ValueListHeatMap.Values['Opacity'])
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
            .FontSize(20)
            .Text('Nº de vacinas aplicadas')
          .&End
          .MapType(GMaps)
            .Name('map1')
            .Options
              .MapStyle(TTypeMapStyle(GetEnumValue(TypeInfo(TTypeMapStyle), ValueListConfig.Values['MapStyle'])))
              .FullScreenControl(ValueListConfig.Values['FullScreenControl'].ToBoolean)
              .MapTypeControl(ValueListConfig.Values['MapTypeControl'].ToBoolean)
              .StreetViewControl(ValueListConfig.Values['StreetViewControl'].ToBoolean)
              .ZoomControl(ValueListConfig.Values['ZoomControl'].ToBoolean)
              .RotateControl(ValueListConfig.Values['RotateControl'].ToBoolean)
              .Tilt(ValueListConfig.Values['Tilt'].ToBoolean)
            .&End
            .Draw
              .Marker
                .DataSet
                  .DataSet(ClientDataSet2)
                  .LabelName('UF')
                  .ValueName('NUMVACINAS')
                .&End
                .InfoWindow
                  .MaxWidth(ValueListMarker.Values['InfoWindowMaxWidth'].ToInteger)
                  .MinWidth(ValueListMarker.Values['InfoWindowMinWidth'].ToInteger)
                  .StartOpened(ValueListMarker.Values['InfoWindowStartOpened'].ToBoolean)
                .&End
              .&End
              .Circle
                .DataSet
                  .DataSet(ClientDataSet2)
                  .LabelName('UF')
                  .ValueName('NUMVACINAS')
                .&End
                .StrokeColor(ValueListCircle.Values['StrokeColor'])
                .StrokeOpacity(ValueListCircle.Values['StrokeOpacity'])
                .StrokeWeight(ValueListCircle.Values['StrokeWeight'].ToInteger)
                .Fillcolor(ValueListCircle.Values['Fillcolor'])
                .FillOpacity(ValueListCircle.Values['FillOpacity'])
                .Fator(ValueListCircle.Values['Fator'].ToInteger)
//                .InfoWindow
//                  .MaxWidth(ValueListCircle.Values['InfoWindowMaxWidth'].ToInteger)
//                  .MinWidth(ValueListCircle.Values['InfoWindowMinWidth'].ToInteger)
//                  .StartOpened(ValueListCircle.Values['InfoWindowStartOpened'].ToBoolean)
//                .&End
              .&End
            .&End
          .&End
        .&End
        .HTML
        )
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Rows
      .HTML(
        Webcharts1
        .ContinuosProject
        .Maps
          .MapTitle
            .FontSize(20)
            .Text('Rota no Webcharts')
          .&End
          .MapType(GMaps)
            .Name('map2')
            .Options
              .MapStyle(TTypeMapStyle(GetEnumValue(TypeInfo(TTypeMapStyle), ValueListConfig.Values['MapStyle'])))
              .FullScreenControl(ValueListConfig.Values['FullScreenControl'].ToBoolean)
              .MapTypeControl(ValueListConfig.Values['MapTypeControl'].ToBoolean)
              .StreetViewControl(ValueListConfig.Values['StreetViewControl'].ToBoolean)
              .ZoomControl(ValueListConfig.Values['ZoomControl'].ToBoolean)
              .RotateControl(ValueListConfig.Values['RotateControl'].ToBoolean)
              .Tilt(ValueListConfig.Values['Tilt'].ToBoolean)
            .&End
            .Routes
              .Directions
                .TravelMode(TTypeMapTravelMode(GetEnumValue(TypeInfo(TTypeMapTravelMode), ValueListDirections.Values['TravelMode'])))
                .Origin(ValueListDirections.Values['Origin'])
                .Destination(ValueListDirections.Values['Destination'])
                .OptimizeWaypoints(ValueListDirections.Values['OptimizeWaypoints'].ToBoolean)
                .DataSet
                  .DataSet(ClientDataSet2)
                .&End
                .Panel
                  .FloatPos(ValueListDirections.Values['PanelFloatPos'])
                  .Width(ValueListDirections.Values['PanelWidth'])
                .&End
              .&End
            .&End
          .&End
        .&End
        .HTML
      )
    .&End
    .Jumpline
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
    .CallbackJS
      .ClassProvider(Self)
    .&End
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
