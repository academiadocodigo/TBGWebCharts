unit Editor.Controller.Relatorio.Load;

interface

uses
  System.JSON,
  SysUtils,
  Editor.Controller.Relatorio.Interfaces,
  Editor.Controller.Relatorio.Helpers;

type
  TControllerRelatorioLoad = class(TInterfacedObject, iControllerLoadRel)
    private
      [weak]
      FParent : iControllerRelatorio;
      FTitle : TProc<String>;
      FDescription : TProc<String>;
      FSQL : TProc<String>;
      FParam : TProc<TJsonArray>;
    public
      constructor Create(Parent : iControllerRelatorio);
      destructor Destroy; override;
      class function New(Parent : iControllerRelatorio) : iControllerLoadRel;
      function Title ( aValue : TProc<String> ) : iControllerLoadRel; overload;
      function Description ( aValue : TProc<String> ) : iControllerLoadRel; overload;
      function SQL ( aValue : TProc<String> ) : iControllerLoadRel; overload;
      function Params ( aValue : TProc<TJsonArray> ) : iControllerLoadRel;
      function Execute : iControllerLoadRel;
      function &End : iControllerRelatorio;
  end;

implementation

uses
  Editor.Controller.Relatorio.Generated;

{ TControllerRelatorioLoad }

function TControllerRelatorioLoad.&End: iControllerRelatorio;
begin
  Result := FParent;
end;

function TControllerRelatorioLoad.Execute: iControllerLoadRel;
var
   FJsonConfig : TJsonValue;
begin
  Result := Self;
  FJsonConfig := FParent.DataSet.FieldByName('CONFIGURACOES').AsJsonValueBase64Decode;
  try
    if Assigned(FTitle) then
      FTitle(FParent.DataSet.FieldByName('TITULO').AsString);

    if Assigned(FDescription) then
      FDescription(FParent.DataSet.FieldByName('DESCRICAO').AsString);

    if Assigned(FSQL) then
      FSQL((FJsonConfig.P['SQL'] as TJSONString).Value);

    if Assigned(FParam) then
      FParam((FJsonConfig.P['PARAMS'] as TJsonArray));

    FParent.PivotConfig((FJsonConfig.P['CONFIG'] as TJSONObject));

    TControllerRelatorioGenerated
      .New(FParent)
        .SQL((FJsonConfig.P['SQL'] as TJSONString).Value)
        .Params((FJsonConfig.P['PARAMS'] as TJsonArray))
        .Config((FJsonConfig.P['CONFIG'] as TJSONObject))
      .Execute;

  finally
    FJsonConfig.Free;
  end;
end;

constructor TControllerRelatorioLoad.Create(Parent : iControllerRelatorio);
begin
  FParent := Parent;
end;

function TControllerRelatorioLoad.Description(
  aValue: TProc<String>): iControllerLoadRel;
begin
  Result := Self;
  FDescription := aValue;
end;

destructor TControllerRelatorioLoad.Destroy;
begin

  inherited;
end;

class function TControllerRelatorioLoad.New(Parent : iControllerRelatorio): iControllerLoadRel;
begin
    Result := Self.Create(Parent);
end;

function TControllerRelatorioLoad.SQL(
  aValue: TProc<String>): iControllerLoadRel;
begin
  Result := Self;
  FSQL := aValue;
end;

function TControllerRelatorioLoad.Title(
  aValue: TProc<String>): iControllerLoadRel;
begin
  Result := Self;
  FTitle := aValue;
end;

function TControllerRelatorioLoad.Params(
  aValue: TProc<TJsonArray>): iControllerLoadRel;
begin
  Result := Self;
  FParam := aValue;
end;

end.
