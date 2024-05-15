unit PivotTable.Classes;

interface
uses
  Interfaces;
type
  TModelPivotTableClass = class(TInterfacedObject, iModelPivotTableClass)
    private
      FParent : iModelPivotTableConfig;
      FRendererName : string;

    public
      Constructor Create(Parent : iModelPivotTableConfig);
      Destructor Destroy; override;
      class function New(Parent : iModelPivotTableConfig) : iModelPivotTableClass;
      function Tabela : iModelPivotTableClass;
      function TabelaComBarras : iModelPivotTableClass;
      function MapaDeCalor : iModelPivotTableClass;
      function MapaDeCalorPorLinhas : iModelPivotTableClass;
      function MapaDeCalorPorColunas : iModelPivotTableClass;
      function BarrasHorizontais : iModelPivotTableClass;
      function BarrasHorizontaisEmpilhadas : iModelPivotTableClass;
      function GraficoDeBarras : iModelPivotTableClass;
      function GraficoDeBarrasEmpilhadas : iModelPivotTableClass;
      function GraficoDeLinhas : iModelPivotTableClass;
      function GraficoDeArea : iModelPivotTableClass;
      function GraficoDePizzaMultiplo : iModelPivotTableClass;
      function ResultClass : string;
      function &End : iModelPivotTableConfig;

  end;
implementation

uses
  Injection;

{ TModelPivotTableClass }

function TModelPivotTableClass.BarrasHorizontais: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Barras Horizontais';
end;

function TModelPivotTableClass.BarrasHorizontaisEmpilhadas: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Barras Horizontais Empilhadas';
end;

constructor TModelPivotTableClass.Create(Parent: iModelPivotTableConfig);
begin
  TInjection.Weak(@FParent, Parent);
  FRendererName := 'Tabela';
end;

destructor TModelPivotTableClass.Destroy;
begin

  inherited;
end;

function TModelPivotTableClass.&End: iModelPivotTableConfig;
begin
  Result := FParent;
end;

function TModelPivotTableClass.GraficoDeArea: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Gráfico de Área';
end;

function TModelPivotTableClass.GraficoDeBarras: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Gráfico de Barras';
end;

function TModelPivotTableClass.GraficoDeBarrasEmpilhadas: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Gráfico de Barras Empilhadas';
end;

function TModelPivotTableClass.GraficoDeLinhas: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Gráfico de Linhas';
end;

function TModelPivotTableClass.GraficoDePizzaMultiplo: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Gráfico de Pizza Múltiplo';
end;

function TModelPivotTableClass.MapaDeCalor: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Mapa de Calor';
end;

function TModelPivotTableClass.MapaDeCalorPorColunas: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Mapa de Calor por Colunas';
end;

function TModelPivotTableClass.MapaDeCalorPorLinhas: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Mapa de Calor por Linhas';
end;

class function TModelPivotTableClass.New(
  Parent: iModelPivotTableConfig): iModelPivotTableClass;
begin
  Result := Self.Create(Parent);
end;

function TModelPivotTableClass.ResultClass: string;
begin
  Result := '"rendererName": "' + FRendererName + '"';
end;

function TModelPivotTableClass.Tabela: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Tabela';
end;

function TModelPivotTableClass.TabelaComBarras: iModelPivotTableClass;
begin
  Result := Self;
  FRendererName := 'Tabela com Barras';
end;

end.
