unit PivotTable.Config;

interface

uses
  Interfaces;

type
  TModelPivotTableConfig = class(TInterfacedObject, iModelPivotTableConfig)
    private
      [weak]
      FParent : iModelPivotTable;
      FDataSet : iModelGenericDataSet<iModelPivotTableConfig>;
      FRows : iModelGenericList<iModelPivotTableConfig>;
      FCols : iModelGenericList<iModelPivotTableConfig>;
      FConfigBackgroundColor : string;
      FHeadStyle : iModelGenericStyle<iModelPivotTableConfig>;
      FBodyStyle : iModelGenericStyle<iModelPivotTableConfig>;
      FPivotOptions : string;
      FShowPivotUI : string;
      FPivotType : iModelPivotTableClass;

      function GeneratedRows : string;
      function GeneratedCols : string;
      function GeneratedConfig : string;
      function GeneratedHead : string;
      function GeneratedBody : string;
      function GeneratedLoad : string;

    public
      constructor Create(Parent : iModelPivotTable);
      destructor Destroy; override;
      class function New(Parent : iModelPivotTable) : iModelPivotTableConfig;
      function ConfigBackgroundColor(Value : string) : iModelPivotTableConfig;
      function ConfigHeadStyle : iModelGenericStyle<iModelPivotTableConfig>;
      function ConfigBodyStyle : iModelGenericStyle<iModelPivotTableConfig>;
      function &End : iModelPivotTable;
      function Rows : iModelGenericList<iModelPivotTableConfig>;
      function Cols : iModelGenericList<iModelPivotTableConfig>;
      function ResultStyle : string;
      function PivotOptions(Value : string) : iModelPivotTableConfig; overload;
      function ShowPivotUI(Value : Boolean) : iModelPivotTableConfig; overload;
      function PivotOptions : string; overload;
      function ShowPivotUI : string; overload;
      function PivotType : iModelPivotTableClass;
      function DataSet : iModelGenericDataSet<iModelPivotTableConfig>;
      function ResultData : string;

  end;
implementation

uses
  Injection,
  System.SysUtils,
  Generic.List,
  Generic.DataSet,
  Generic.Style,
  PivotTable.Classes;

{ TModelPivotTableConfig }

function TModelPivotTableConfig.ConfigBodyStyle: iModelGenericStyle<iModelPivotTableConfig>;
begin
  Result := FBodyStyle;
end;

function TModelPivotTableConfig.Cols: iModelGenericList<iModelPivotTableConfig>;
begin
  FCols := TModelGenericList<iModelPivotTableConfig>.New(Self);
  Result := FCols;
end;

function TModelPivotTableConfig.ConfigBackgroundColor(
  Value: string): iModelPivotTableConfig;
begin
  Result := Self;
  FConfigBackgroundColor := Value;
end;

constructor TModelPivotTableConfig.Create(Parent: iModelPivotTable);
begin
  TInjection.Weak(@FParent, Parent);
  FDataSet := TModelGenericDataset<iModelPivotTableConfig>.New(Self);
  FHeadStyle := TModelGenericStyle<iModelPivotTableConfig>.New(Self);
  FBodyStyle := TModelGenericStyle<iModelPivotTableConfig>.New(Self);
  FPivotType := TModelPivotTableClass.New(Self);

  FConfigBackgroundColor := '#EEE';

  FHeadStyle
    .BackgroundColor('#f2f2f2')
    .Color('#333')
    .FontSize('1rem');

  FBodyStyle
    .BackgroundColor('#FFF')
    .Color('#3D3D3D')
    .FontSize('1rem');
end;

function TModelPivotTableConfig.DataSet: iModelGenericDataSet<iModelPivotTableConfig>;
begin
  Result := FDataSet;
end;

destructor TModelPivotTableConfig.Destroy;
begin

  inherited;
end;

function TModelPivotTableConfig.&End: iModelPivotTable;
begin
  Result := FParent;
end;

function TModelPivotTableConfig.generatedCols: string;
var
  I: Integer;
  Aux: string;
begin
  Result := '"rows":[';
  if Assigned(FCols) then
  begin
    Aux := ',';
    for I := 0 to Pred(FCols.List.Count) do
    begin
      if I = Pred(FCols.List.Count) then
        Aux := '';
      Result := Result + '"' + FCols.List[I] + '"' + Aux;
    end;
  end;
  Result := Result + ']';
end;

function TModelPivotTableConfig.generatedRows: string;
var
  I: Integer;
  Aux: string;
begin
  Result := '"cols":[';
  if Assigned(FRows) then
  begin
    Aux := ',';
    for I := 0 to Pred(FRows.List.Count) do
    begin
      if I = Pred(FRows.List.Count) then
        Aux := '';
      Result := Result + '"' + FRows.List[I] + '"' + Aux;
    end;
  end;
  Result := Result + ']';
end;

function TModelPivotTableConfig.ConfigHeadStyle: iModelGenericStyle<iModelPivotTableConfig>;
begin
  Result := FHeadStyle;
end;

class function TModelPivotTableConfig.New(
  Parent: iModelPivotTable): iModelPivotTableConfig;
begin
  Result := Self.Create(Parent);
end;

function TModelPivotTableConfig.PivotOptions: string;
var
  PlotlyConfig : string;
begin
  Result := FPivotOptions;
  if Result = '' then
  begin
    PlotlyConfig := PlotlyConfig + '"rendererOptions": {';
    PlotlyConfig := PlotlyConfig + '"plotlyConfig": {';
    PlotlyConfig := PlotlyConfig + '"toImageButtonOptions": {';
    PlotlyConfig := PlotlyConfig + '"format": "svg",';
    PlotlyConfig := PlotlyConfig + '"filename": "custom_image",';
//    PlotlyConfig := PlotlyConfig + '"height": 500,';
//    PlotlyConfig := PlotlyConfig + '"width": 700,';
    PlotlyConfig := PlotlyConfig + '"scale": 1';
    PlotlyConfig := PlotlyConfig + '}';
    PlotlyConfig := PlotlyConfig + '}';
    PlotlyConfig := PlotlyConfig + '}';

    Result := '{' + generatedRows + ',' + generatedCols + ',' + FPivotType.ResultClass + ',' + PlotlyConfig + '}';
  end;
end;

function TModelPivotTableConfig.PivotType: iModelPivotTableClass;
begin
  Result := FPivotType;
end;

function TModelPivotTableConfig.PivotOptions(
  Value: string): iModelPivotTableConfig;
begin
  Result := Self;
  FPivotOptions := Value;
end;

function TModelPivotTableConfig.GeneratedBody: string;
begin
  Result := 'table.pvtTable tbody tr td {';
  Result := Result + 'color: ' + FBodyStyle.Color + ';';
  Result := Result + 'font-size: ' + FBodyStyle.FontSize + ';';
  Result := Result + 'padding: 5px;';
  Result := Result + 'background-color: ' + FBodyStyle.BackgroundColor + ';';
  Result := Result + 'border: 1px solid #CDCDCD;';
  Result := Result + 'vertical-align: top;';
  Result := Result + 'text-align: right;';
  Result := Result + '}';
end;

function TModelPivotTableConfig.GeneratedConfig: string;
begin
  Result := '.pvtAxisContainer, .pvtVals {';
  Result := Result + 'border: 1px solid #dee2ed;';
  Result := Result + 'background: ' + FConfigBackgroundColor + ';';
  Result := Result + 'padding: 5px;';
  Result := Result + 'min-width: 10px;';
  Result := Result + 'min-height: 10px;';
  Result := Result + 'user-select: none;';
  Result := Result + '-webkit-user-select: none;';
  Result := Result + '-moz-user-select: none;';
  Result := Result + '-khtml-user-select: none;';
  Result := Result + '-ms-user-select: none;';
  Result := Result + '}';
end;

function TModelPivotTableConfig.ResultData: string;
begin
  Result := FDataSet.DataSetJstringify;
end;

function TModelPivotTableConfig.ResultStyle: string;
begin
  Result := GeneratedConfig + GeneratedHead + GeneratedBody + GeneratedLoad;
end;

function TModelPivotTableConfig.GeneratedHead: string;
begin
  Result := 'table.pvtTable thead tr th, table.pvtTable tbody tr th {';
  Result := Result + 'background-color: ' + FHeadStyle.BackgroundColor + ';';
  Result := Result + 'border: 1px solid #dee2ed;';
  Result := Result + 'color: ' + FHeadStyle.Color + ';';
  Result := Result + 'font-size: ' + FHeadStyle.FontSize + ';';
  Result := Result + 'padding: .45rem;';
  Result := Result + 'font-weight: 400;';
  Result := Result + 'line-height: 1.5;';
  Result := Result + 'font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";';
  Result := Result + '}';
end;

function TModelPivotTableConfig.GeneratedLoad: string;
begin
  Result := Result + '.aguarde {';
  Result := Result + 'color: LightGray;';
  Result := Result + 'font-size: 2.5em;';
  Result := Result + 'margin: 0;';
  Result := Result + 'position: absolute;';
  Result := Result + 'top: 50%;';
  Result := Result + 'left: 50%;';
  Result := Result + '-ms-transform: translate(-50%, -50%);';
  Result := Result + 'transform: translate(-50%, -50%);';
  Result := Result + '}';
end;

function TModelPivotTableConfig.Rows: iModelGenericList<iModelPivotTableConfig>;
begin
  FRows := TModelGenericList<iModelPivotTableConfig>.New(Self);
  Result := FRows;
end;

function TModelPivotTableConfig.ShowPivotUI: string;
begin
  Result := FShowPivotUI;
end;

function TModelPivotTableConfig.ShowPivotUI(
  Value: Boolean): iModelPivotTableConfig;
var
  stringValue : string;
begin
  Result := Self;
  stringValue := 'false';
  if Value then stringValue := 'true';
  FShowPivotUI := 'config.showUI = ' + stringValue + ';';
end;

end.
