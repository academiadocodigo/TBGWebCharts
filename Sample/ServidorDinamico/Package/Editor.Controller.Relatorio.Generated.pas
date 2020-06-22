unit Editor.Controller.Relatorio.Generated;

interface

uses
  Editor.Controller.Relatorio.Interfaces,
  System.JSON,
  Charts.Types,
  SysUtils;

type
  TControllerRelatorioGenerated = class(TInterfacedObject, iControllerGeneratedRel)
    private
      FParent : iControllerRelatorio;
      FSQL : String;
      FParams : TJsonArray;
      FConfig : TJsonObject;
      function LoadSQL : TControllerRelatorioGenerated;
    public
      constructor Create(Parent : iControllerRelatorio);
      destructor Destroy; override;
      class function New(Parent : iControllerRelatorio) : iControllerGeneratedRel;
      function SQL (aSQL : String) : iControllerGeneratedRel;
      function Params ( aValue : TJsonArray ) : iControllerGeneratedRel;
      function Config ( aValue : TJsonObject ) : iControllerGeneratedRel;
      function Execute : iControllerGeneratedRel;
      function &End : iControllerRelatorio;
  end;

implementation

{ TControllerRelatorioGenerated }

function TControllerRelatorioGenerated.Config(
  aValue: TJsonObject): iControllerGeneratedRel;
var
  a: string;
begin
  Result := Self;
  FConfig := aValue;
  FParent.PivotConfig(aValue);
end;

function TControllerRelatorioGenerated.&End: iControllerRelatorio;
begin
  Result := FParent;
end;

constructor TControllerRelatorioGenerated.Create(Parent : iControllerRelatorio);
begin
  FParent := Parent;
end;

destructor TControllerRelatorioGenerated.Destroy;
begin
  try
    if Assigned(FParams) then FParams.Free;
    if Assigned(FConfig) then FConfig.Free;
  except
    //nao faz nada
  end;
  inherited;
end;

function TControllerRelatorioGenerated.Execute: iControllerGeneratedRel;
begin
  Result := Self;

  Self
    .LoadSQL()
    .FParent
      .WebCharts
        .Container(fluid)
        .NewProject
        .PivotTable
          .Attributes
            .ConfigBodyStyle
              .FontSize(12)
            .&End
            .ConfigHeadStyle
              .FontSize(12)
            .&End
            .DataSet
              .DataSet(FParent.Query)
            .&End
          .&End
        .&End
        .WebBrowser(FParent.WebBrowser)
      .Generated;
end;

function TControllerRelatorioGenerated.LoadSQL: TControllerRelatorioGenerated;
var
  I: Integer;
  JsonParam : TJsonObject;
begin
  Result := Self;
  FParent.Query.Close;
  FParent.Query.SQL.Clear;

  FParent.Query.SQL.add(FSQL);

  if Assigned(FParams) then
    for I := 0 to Pred(FParams.Count) do
    begin
      JsonParam := (FParams.Items[I] as TJSONObject);
      FParent.Query.ParamByName(StringReplace(JsonParam.P['Param'].ToString, '"', '', [rfReplaceAll])).Value := StringReplace(JsonParam.P['Default'].ToString, '"', '', [rfReplaceAll]);
    end;

  FParent.Query.Open;
end;

class function TControllerRelatorioGenerated.New(Parent : iControllerRelatorio) : iControllerGeneratedRel;
begin
    Result := Self.Create(Parent);
end;

function TControllerRelatorioGenerated.Params(
  aValue: TJsonArray): iControllerGeneratedRel;
begin
  Result := Self;
  FParams := aValue;
end;

function TControllerRelatorioGenerated.SQL(
  aSQL: String): iControllerGeneratedRel;
begin
  Result := Self;
  FSQL := aSQL;
end;

end.
