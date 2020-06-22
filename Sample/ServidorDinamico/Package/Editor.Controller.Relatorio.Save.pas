unit Editor.Controller.Relatorio.Save;

interface

uses
  System.JSON,
  RESTRequest4D.Request,
  Editor.Controller.Relatorio.Interfaces,
  Editor.Controller.Relatorio.Helpers,
  Editor.Controller.Relatorios.Consts;

type
  TControllerRelatorioSave = class(TInterfacedObject, iControllerSaveNewRel)
    private
      [weak]
      FParent : iControllerRelatorio;
      FTitle : String;
      FDescription : String;
      FSQL : String;
      FParams : TJsonArray;
      function PivotConfig : String;
    public
      constructor Create(Parent : iControllerRelatorio);
      destructor Destroy; override;
      class function New(Parent : iControllerRelatorio) : iControllerSaveNewRel;
      function Title ( aTitle : String ) : iControllerSaveNewRel; overload;
      function Description ( aDescription : String) : iControllerSaveNewRel; overload;
      function SQL ( aSQL : String ) : iControllerSaveNewRel; overload;
      function Params ( aValue : TJsonArray ) : iControllerSaveNewRel; overload;
      function Execute : iControllerSaveNewRel;
      function &End : iControllerRelatorio;
  end;

implementation

{ TControllerRelatorioSave<T> }

constructor TControllerRelatorioSave.Create(Parent: iControllerRelatorio);
begin
  FParent := Parent;
end;

function TControllerRelatorioSave.Description(
  aDescription: String): iControllerSaveNewRel;
begin
  Result := Self;
  FDescription := aDescription;
end;

destructor TControllerRelatorioSave.Destroy;
begin

  inherited;
end;

function TControllerRelatorioSave.&End: iControllerRelatorio;
begin
  Result := FParent;
end;

function TControllerRelatorioSave.Execute: iControllerSaveNewRel;
var
  JsonRel : TJsonObject;
  JsonConfig : TJsonObject;
begin
 Result := Self;

 JsonConfig := TJSONObject.Create
                  .AddPair('SQL', FSQL)
                  .AddPair('PARAMS', FParams)
                  .AddPair('CONFIG', PivotConfig.AsJsonObject);

 JsonRel := TJSONObject.Create
              .AddPair('TITULO', FTitle)
              .AddPair('DESCRICAO', FDescription)
              .AddPair('CONFIGURACOES',
                  JsonConfig.ToStringValueBase64Encode
              );
 try
  TRequest
    .New
      .BaseURL(BASE_URL + '/rel')
      .Accept('application/json')
      .AddBody(JsonRel.ToString)
    .Post;
 finally
  JsonRel.Free;
  JsonConfig.Free;
 end;
end;


class function TControllerRelatorioSave.New(
  Parent: iControllerRelatorio): iControllerSaveNewRel;
begin
  Result := Self.Create(Parent);
end;

function TControllerRelatorioSave.Params( aValue : TJsonArray ) : iControllerSaveNewRel;
begin
  Result := Self;
  FParams := aValue;
end;

function TControllerRelatorioSave.PivotConfig : String;
begin
  Result :=
    FParent
    .WebCharts
      .ContinuosProject
        .WebBrowser(FParent.WebBrowser)
      .PivotTable
    .SaveConfig;
end;

function TControllerRelatorioSave.SQL(
  aSQL: String): iControllerSaveNewRel;
begin
  Result := Self;
  FSQL := aSQL;
end;

function TControllerRelatorioSave.Title(
  aTitle: String): iControllerSaveNewRel;
begin
  Result := Self;
  FTitle := aTitle;
end;

end.
