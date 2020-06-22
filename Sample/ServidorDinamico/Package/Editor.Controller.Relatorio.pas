unit Editor.Controller.Relatorio;

interface

uses
  Data.DB,
  Vcl.OleCtrls,
  SHDocVw,
  FireDAC.Comp.Client,
  FireDAC.Phys.Intf,
  View.WebCharts,
  System.Classes,
  System.JSON,
  Editor.Controller.Relatorio.Generated,
  Editor.Controller.Relatorio.Interfaces,
  Editor.Controller.Relatorio.Save,
  Editor.Controller.Relatorio.Load,
  Editor.Controller.Relatorios.Consts;

type
  TControllerRelatorio = class(TInterfacedObject, iControllerRelatorio)
    private
      FDataSet : TDataSource;
      FWebBrowser : TWebBrowser;
      FConnection : TFDConnection;
      FDQuery : TFDQuery;
      FWebCharts : TWebCharts;
      FConfig : String;
      procedure ChartsInitialization;
      procedure DocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerRelatorio;
      function Connection ( aConnection : TFDConnection ) : iControllerRelatorio;
      function Query ( aQuery : TFDQuery ) : iControllerRelatorio; overload;
      function Query : TFDQuery; overload;
      function DataSet ( aDataSet : TDataSet ) : iControllerRelatorio; overload;
      function DataSet ( aDataSource : TDataSource ) : iControllerRelatorio; overload;
      function DataSet  : TDataSet; overload;
      function GetRel : iControllerRelatorio;
      function GetTableList( aList : TStrings ) : iControllerRelatorio;
      function WebBrowser ( aWebBrowser : TWebBrowser ) : iControllerRelatorio; overload;
      function WebBrowser : TWebBrowser; overload;
      function WebCharts : TWebCharts;
      function PivotConfig ( aValue : TJsonObject ) : iControllerRelatorio;
      function SaveNewRel : iControllerSaveNewRel;
      function GeneratedRel : iControllerGeneratedRel;
      function LoadRel : iControllerLoadRel;
  end;

implementation

uses
  RESTRequest4D.Request;

{ TControllerRelatorio }

procedure TControllerRelatorio.ChartsInitialization;
begin
   FWebCharts
   .NewProject
      .WebBrowser(FWebBrowser)
    .Generated;
end;

function TControllerRelatorio.Connection(
  aConnection: TFDConnection): iControllerRelatorio;
begin
  Result := Self;
  FConnection := aConnection;
end;

constructor TControllerRelatorio.Create;
begin
  FWebCharts := TWebCharts.Create;
end;

function TControllerRelatorio.DataSet(aDataSet: TDataSet): iControllerRelatorio;
begin
  Result := Self;
end;

function TControllerRelatorio.DataSet(
  aDataSource: TDataSource): iControllerRelatorio;
begin
  Result := Self;
  FDataSet := aDataSource;
end;

destructor TControllerRelatorio.Destroy;
begin
  FWebCharts.Free;
  inherited;
end;

procedure TControllerRelatorio.DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  if FConfig <> '' then
    FWebCharts
      .ContinuosProject
        .WebBrowser(FWebBrowser)
      .PivotTable
    .LoadConfig(FConfig);
  FConfig := '';
end;

function TControllerRelatorio.GeneratedRel: iControllerGeneratedRel;
begin
  Result := TControllerRelatorioGenerated.New(Self);
end;

function TControllerRelatorio.GetRel: iControllerRelatorio;
begin
  Result := Self;
  FDataSet.DataSet.FieldDefs.Clear;
  TRequest.New.BaseURL(BASE_URL + '/rel')
    .Accept('application/json')
    .DataSetAdapter(FDataSet.DataSet)
  .Get;
end;

function TControllerRelatorio.GetTableList(
  aList: TStrings): iControllerRelatorio;
begin
  Result := Self;
  FConnection
  .GetTableNames(
    '',
    '',
    '',
    aList,
    [osMy],
    [tkTable],
  False);
end;

function TControllerRelatorio.LoadRel: iControllerLoadRel;
begin
  Result := TControllerRelatorioLoad.New(Self);
end;


class function TControllerRelatorio.New: iControllerRelatorio;
begin
    Result := Self.Create;
end;

function TControllerRelatorio.PivotConfig(
  aValue: TJsonObject): iControllerRelatorio;
begin
  Result := Self;
  FConfig := aValue.ToString;
end;

function TControllerRelatorio.Query: TFDQuery;
begin
  Result := FDQuery;
end;

function TControllerRelatorio.Query(aQuery: TFDQuery): iControllerRelatorio;
begin
  Result := Self;
  FDQuery := aQuery;
end;

function TControllerRelatorio.SaveNewRel : iControllerSaveNewRel;
begin
  Result := TControllerRelatorioSave.New(Self);
end;

function TControllerRelatorio.WebBrowser(
  aWebBrowser: TWebBrowser): iControllerRelatorio;
begin
  Result := Self;
  FWebBrowser := aWebBrowser;
  FWebBrowser.OnDocumentComplete := DocumentComplete;
  ChartsInitialization;
end;

function TControllerRelatorio.WebBrowser: TWebBrowser;
begin
  Result := FWebBrowser;
end;

function TControllerRelatorio.WebCharts: TWebCharts;
begin
  Result := FWebCharts;
end;

function TControllerRelatorio.DataSet: TDataSet;
begin
 Result := FDataSet.DataSet;
end;

end.
