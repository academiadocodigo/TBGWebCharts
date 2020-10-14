unit PivotTable;

interface

uses
  Interfaces;

type
  TModelPivotTable = class(TInterfacedObject, iModelPivotTable)
    private
      [weak]
      FParent : iModelHTML;
      FData : string;
      FConfig : iModelPivotTableConfig;
      procedure GeneratedData;
      procedure ShowPivotUI(Value : string);
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelPivotTable;
      function Attributes : iModelPivotTableConfig;
      function SaveConfig : string;
      function LoadConfig(Value : string) : iModelPivotTable;
      function ShowUI : iModelPivotTable;
      function HideUI : iModelPivotTable;
      function &End : iModelHTML;

  end;
implementation

uses
  Generic.DataSet,
  Generic.List,
  Injection,
  PivotTable.Config,
  JSCommand,
  System.SysUtils;

{ TModelPivotTable }

function TModelPivotTable.Attributes: iModelPivotTableConfig;
begin
  Result := FConfig;
end;

constructor TModelPivotTable.Create(Parent: IModelHTML);
begin
  TInjection.Weak(@FParent, Parent);
  FConfig := TModelPivotTableConfig.Create(Self);
end;

destructor TModelPivotTable.Destroy;
begin

  inherited;
end;

function TModelPivotTable.&End: iModelHTML;
begin
  Result := FParent;
  generatedData;
  FParent.HTML(FData);
end;

class function TModelPivotTable.New(Parent: IModelHTML): iModelPivotTable;
begin
  Result := Self.Create(Parent);
end;

procedure TModelPivotTable.generatedData;
begin
  FData := '<style>';
  FData := FData + FConfig.ResultStyle;
  FData := FData + '</style>';
  FData := FData + '<script type="text/javascript">';

  FData := FData + '(function() {';
  FData := FData + 'var callWithJQuery;';
  FData := FData + '';
  FData := FData + 'callWithJQuery = function(pivotModule) {';
  FData := FData + 'if (typeof exports === "object" && typeof module === "object") {';
  FData := FData + 'return pivotModule(require("jquery"));';
  FData := FData + '} else if (typeof define === "function" && define.amd) {';
  FData := FData + 'return define(["jquery"], pivotModule);';
  FData := FData + '} else {';
  FData := FData + 'return pivotModule(jQuery);';
  FData := FData + '}';
  FData := FData + '};';

FData := FData + 'callWithJQuery(function($) {';
FData := FData + 'var plr, c3r, d3r, frFmt, frFmtInt, frFmtPct, gcr, nf, r, tpl;';
FData := FData + 'nf = $.pivotUtilities.numberFormat;';
FData := FData + 'tpl = $.pivotUtilities.aggregatorTemplates;';
FData := FData + 'r = $.pivotUtilities.renderers;';
FData := FData + 'gcr = $.pivotUtilities.gchart_renderers;';
FData := FData + 'd3r = $.pivotUtilities.d3_renderers;';
FData := FData + 'c3r = $.pivotUtilities.c3_renderers;';
FData := FData + 'plr = $.pivotUtilities.plotly_renderers;';
FData := FData + 'frFmt = nf({thousandsSep: ".",decimalSep: ","});';
FData := FData + 'frFmtInt = nf({digitsAfterDecimal: 0,thousandsSep: ".",decimalSep: ","});';
FData := FData + 'frFmtPct = nf({digitsAfterDecimal: 2,scaler: 100,suffix: "%",thousandsSep: ".",decimalSep: ","});';
FData := FData + '$.pivotUtilities.locales.pt = {';
FData := FData + 'localeStrings: {';
FData := FData + 'renderError: "Ocorreu um error ao renderizar os resultados da Tabela Dinâmica.",';
FData := FData + 'computeError: "Ocorreu um error ao computar os resultados da Tabela Dinâmica.",';
FData := FData + 'uiRenderError: "Ocorreu um error ao renderizar a interface da Tabela Dinâmica.",';
FData := FData + 'selectAll: "Selecionar Tudo",selectNone: "Selecionar Nenhum",';
FData := FData + 'tooMany: "(demais para listar)",';
FData := FData + 'filterResults: "Filtrar resultados",';
FData := FData + 'totals: "Totais",apply: "Aplicar",';
FData := FData + 'cancel: "Cancelar",';
FData := FData + 'vs: "vs",';
FData := FData + 'by: "por"';
FData := FData + '},';
FData := FData + 'aggregators: {';
FData := FData + '"Contagem": tpl.count(frFmtInt),';
FData := FData + '"Contagem de Valores únicos": tpl.countUnique(frFmtInt),';
FData := FData + '"Lista de Valores únicos": tpl.listUnique(", "),';
FData := FData + '"Soma": tpl.sum(frFmt),';
FData := FData + '"Soma de Inteiros": tpl.sum(frFmtInt),';
FData := FData + '"Média": tpl.average(frFmt),';
FData := FData + '"Mediana": tpl.median(frFmt),';
FData := FData + '"Variancia": tpl["var"](1, frFmt),';
FData := FData + '"Desvio Padrão da Amostra": tpl.stdev(1, frFmt),';
FData := FData + '"Mínimo": tpl.min(frFmt),';
FData := FData + '"Máximo": tpl.max(frFmt),';
FData := FData + '"Primeiro": tpl.first(frFmt),';
FData := FData + '"Último": tpl.last(frFmt),';
FData := FData + '"Soma sobre Soma": tpl.sumOverSum(frFmt),';
FData := FData + '"Limite Superior a 80%": tpl.sumOverSumBound80(true, frFmt),';
FData := FData + '"Limite Inferior a 80%": tpl.sumOverSumBound80(false, frFmt),';
FData := FData + '"Soma como Fração do Total": tpl.fractionOf(tpl.sum(), "total", frFmtPct),';
FData := FData + '"Soma como Fração da Linha": tpl.fractionOf(tpl.sum(), "row", frFmtPct),';
FData := FData + '"Soma como Fração da Coluna": tpl.fractionOf(tpl.sum(), "col", frFmtPct),';
FData := FData + '"Contagem como Fração do Total": tpl.fractionOf(tpl.count(), "total", frFmtPct),';
FData := FData + '"Contagem como Fração da Linha": tpl.fractionOf(tpl.count(), "row", frFmtPct),';
FData := FData + '"Contagem como Fração da Coluna": tpl.fractionOf(tpl.count(), "col", frFmtPct)';
FData := FData + '},';
FData := FData + 'renderers: {';
FData := FData + '"Tabela": r["Table"],';
FData := FData + '"Tabela com Barras": r["Table Barchart"],';
FData := FData + '"Mapa de Calor": r["Heatmap"],';
FData := FData + '"Mapa de Calor por Linhas": r["Row Heatmap"],';
FData := FData + '"Mapa de Calor por Colunas": r["Col Heatmap"]';
FData := FData + '}';
FData := FData + '};';
FData := FData + 'if (plr) {';
FData := FData + '$.pivotUtilities.locales.pt.plotly_renderers = {';
FData := FData + '"Barras Horizontais": plr["Horizontal Bar Chart"],';
FData := FData + '"Barras Horizontais Empilhadas": plr["Horizontal Stacked Bar Chart"],';
FData := FData + '"Gráfico de Barras": plr["Bar Chart"],';
FData := FData + '"Gráfico de Barras Empilhadas": plr["Stacked Bar Chart"],';
FData := FData + '"Gráfico de Linhas": plr["Line Chart"],';
FData := FData + '"Gráfico de Área": plr["Area Chart"],';
FData := FData + '"Gráfico de Pizza Múltiplo": plr["Multiple Pie Chart"]';
FData := FData + '};';
FData := FData + '}';
FData := FData + 'if (gcr) {';
FData := FData + '$.pivotUtilities.locales.pt.gchart_renderers = {';
FData := FData + '"Gráfico de Linhas": gcr["Line Chart"],';
FData := FData + '"Gráfico de Barras": gcr["Bar Chart"],';
FData := FData + '"Gráfico de Barras Empilhadas": gcr["Stacked Bar Chart"],';
FData := FData + '"Gráfico de Área": gcr["Area Chart"]';
FData := FData + '};';
FData := FData + '}';
FData := FData + 'if (d3r) {';
FData := FData + '$.pivotUtilities.locales.pt.d3_renderers = {';
FData := FData + '"Mapa de Árvore": d3r["Treemap"]';
FData := FData + '};';
FData := FData + '}';
FData := FData + 'if (c3r) {';
FData := FData + '$.pivotUtilities.locales.pt.c3_renderers = {';
FData := FData + '"Gráfico de Linhas": c3r["Line Chart"],';
FData := FData + '"Gráfico de Barras": c3r["Bar Chart"],';
FData := FData + '"Gráfico de Barras Empilhadas": c3r["Stacked Bar Chart"],';
FData := FData + '"Gráfico de Área": c3r["Area Chart"]';
FData := FData + '};';
FData := FData + '}';
FData := FData + 'return $.pivotUtilities.locales.pt;';
FData := FData + '});';
FData := FData + '}).call(this);';
FData := FData + '$.extend($.pivotUtilities.locales.pt.renderers, $.pivotUtilities.locales.pt.plotly_renderers);';


  FData := FData + 'var config = JSON.parse(' + #39 + FConfig.PivotOptions + #39 + ');';

  FData := FData + FConfig.ShowPivotUI;

  FData := FData + 'var dataset;';

  FData := FData + 'function Save() {';
  FData := FData + 'config = $("#output").data("pivotUIOptions");';
  FData := FData + 'var config_copy = JSON.parse(JSON.stringify(config));';
  FData := FData + 'delete config_copy["aggregators"];';
  FData := FData + 'delete config_copy["renderers"];';
  FData := FData + 'var result = JSON.stringify(config_copy);';
  FData := FData + 'document.getElementById(''configResult'').value = result;';
  FData := FData +  '}';

  FData := FData + 'function Load(stringConfig) {';
  FData := FData + 'config = JSON.parse(stringConfig);';
  FData := FData + '$("#output").pivotUI(dataset, config, true, "pt");';
  FData := FData + '}';

  FData := FData + 'function ShowUI(value) {';
  FData := FData + 'Save();';
  FData := FData + 'config = JSON.parse(document.getElementById("configResult").value);';
  FData := FData + 'config.showUI = value;';
  FData := FData + '$("#output").pivotUI(dataset, config, true, "pt");';
  FData := FData + '}';


  FData := FData + '$(function () {';
  FData := FData + 'dataset = ' + FConfig.ResultData + ';' + #13;
  FData := FData + '$("#output").pivotUI(dataset,config, false, "pt");';

  FData := FData + '});';
  FData := FData + '</script>';
  FData := FData + '<input type=''hidden'' id=''configResult'' value='''' />';
  FData := FData + '<div id="output">';
  FData := FData + '<div class="aguarde">Carregando...</div>';
  FData := FData + '</div>';

end;
//    {$IFNDEF CONSOLE}

function TModelPivotTable.HideUI: iModelPivotTable;
begin
  Result := Self;
  ShowPivotUI('false');
end;

function TModelPivotTable.LoadConfig(Value: string) : iModelPivotTable;
var
  CommandJS : iModelJSCommand;
begin
  CommandJS := TModelJSCommand.New
    .Command('Load')
    .Paramters
      .Add(QuotedStr(Value))
    .&End;
    FParent.ExecuteScript(CommandJS);
end;

function TModelPivotTable.SaveConfig: string;
var
  CommandJS : iModelJSCommand;
begin
  CommandJS := TModelJSCommand.New
    .Command('Save')
    .TagName('input')
    .TagID('configResult')
    .TagAttribute('value');
  Result := FParent.ExecuteScriptResult(CommandJS);
end;

procedure TModelPivotTable.ShowPivotUI(Value: string);
var
  CommandJS : iModelJSCommand;
begin
  CommandJS := TModelJSCommand.New
    .Command('ShowUI')
    .Paramters
      .Add(Value)
    .&End;
    FParent.ExecuteScript(CommandJS);
end;

function TModelPivotTable.ShowUI: iModelPivotTable;
begin
  Result := Self;
  ShowPivotUI('true');
end;
end.
