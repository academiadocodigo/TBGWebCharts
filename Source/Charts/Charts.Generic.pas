unit Charts.Generic;
interface
uses
  Interfaces;
type
  TModelChartsGeneric = class(TInterfacedObject, iModelHTMLChartsGeneric)
    private
      [weak]
      FParent : iModelHTMLCharts;
      FHTML : String;
      FConfig : iModelHTMLChartsConfig;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsGeneric;
      function HTML(Value : String) : iModelHTMLChartsGeneric; overload;
      function HTML : String; overload;
      function Attributes : iModelHTMLChartsConfig;
      function UpdateRealTime : iModelHTMLChartsGeneric;
      function UpdateChart : iModelHTMLChartsGeneric;
      function &End : iModelHTMLCharts;
  end;
implementation
uses
  Charts.Config, System.SysUtils, Charts.Callback, Injection, Charts.Types,
  JSCommand;
{ TModelChartsGeneric }
function TModelChartsGeneric.Attributes: iModelHTMLChartsConfig;
begin
  Result := FConfig;
end;
function TModelChartsGeneric.&End: iModelHTMLCharts;
begin
  Result := FParent;
  FParent.HTML('<div class="col-'+IntToStr(FConfig.ColSpan)+'">  ');
  FParent.HTML('<canvas id="'+FConfig.Name+'" ');
  if FConfig.Width > 0 then
    FParent.HTML('width="'+IntToStr(FConfig.Width)+'px" ');
  if FConfig.Heigth > 0 then
    FParent.HTML('height="'+IntToStr(FConfig.Heigth)+'px" ');
  FParent.HTML('></canvas>  ');
  FParent.HTML('<script>  ');
  FParent.HTML('function updateRealTime' + FConfig.IDChart + '(data) {');
  FParent.HTML('RealTime' + FConfig.IDChart + ' = data;');
  Fparent.HTML('window.myChart_'+FConfig.IDChart+'.update();');
  FParent.HTML('}');
  FParent.HTML('var RealTime' + FConfig.IDChart + ' = [' + FConfig.ResultRealTimeInitialValue + '];');
  FParent.HTML('function updateChart' + FConfig.IDChart + '(data) {');
  FParent.HTML('myChart_' + FConfig.IDChart + '.data.labels = data.labels;');
  FParent.HTML('var x;');
  FParent.HTML('for (x in data.datasets) {');
  FParent.HTML('myChart_' + FConfig.IDChart + '.data.datasets[x].data =');
  FParent.HTML('data.datasets[x].data;');
  FParent.HTML('myChart_' + FConfig.IDChart + '.data.datasets[x].backgroundColor =');
  FParent.HTML('data.datasets[x].backgroundColor;');
  FParent.HTML('}');
  FParent.HTML('window.myChart_'+FConfig.IDChart+'.update();');
  FParent.HTML('}');
  FParent.HTML('var myCallBack = document.getElementById('''+FConfig.Name+''');');
  FParent.HTML('var ctx = document.getElementById('''+FConfig.Name+''').getContext(''2d''); ');
  FParent.HTML('var myChart_'+FConfig.IDChart+' = new Chart(ctx, { ');
  FParent.HTML('type: '''+ TTypeChart(FParent._ChartType).ToString+''', ');
  FParent.HTML('data: { ');
  FParent.HTML('labels: '+FConfig.ResultLabels+',  ');
  FParent.HTML('datasets: [  ');
  FParent.HTML(FConfig.ResultDataSet);
  FParent.HTML(']  ');
  FParent.HTML('}, ');
  FParent.HTML(FConfig.Options.Result);
  FParent.HTML(',plugins : [{');
  FParent.HTML('beforeInit: beforeInitChart,');
  FParent.HTML('beforeUpdate: beforeInitChart,');
  FParent.HTML(FConfig.Labelling.Result);
  if FParent._ChartType = doughnut then
  begin
    FParent.HTML('afterDraw: function(chart) {');
    FParent.HTML('var o = chart.options || {};');
    FParent.HTML('if (!o.doughnutCenterPrefix && !o.doughnutCenterText && !o.doughnutMinLabel && !o.doughnutMaxLabel) return;');
    FParent.HTML('var ds = chart.data && chart.data.datasets ? chart.data.datasets[0] : null;');
    FParent.HTML('var meta = chart.getDatasetMeta(0);');
    FParent.HTML('if (!ds || !ds.data || !ds.data.length) return;');
    FParent.HTML('var area = chart.chartArea, x = area.left + (area.right - area.left) / 2, y = area.top + (area.bottom - area.top) / 2;');
    FParent.HTML('var arc = meta.data && meta.data[0] ? meta.data[0]._view : null, ro = 0, ri = 0;');
    FParent.HTML('var semi = o.circumference && o.circumference < 2 * Math.PI - 0.01;');
    FParent.HTML('if (arc) { x = arc.x; y = arc.y; ro = arc.outerRadius || 0; ri = arc.innerRadius || 0; }');
    FParent.HTML('var main = "", sub = "";');
    FParent.HTML('if (o.doughnutCenterText) { main = o.doughnutCenterText; sub = o.doughnutCenterSubtitle || ""; }');
    FParent.HTML('else if (o.doughnutCenterPrefix) {');
    FParent.HTML('var total = 0, i, value;');
    FParent.HTML('for (i = 0; i < ds.data.length; i++) { value = Number(ds.data[i]); if (!isNaN(value) && (!meta.data[i] || !meta.data[i].hidden)) total += Math.abs(value); }');
    FParent.HTML('var absTotal = Math.abs(total), divisor = 1, suffix = "";');
    FParent.HTML('if (absTotal >= 1000000) { divisor = 1000000; suffix = "M"; } else if (absTotal >= 1000) { divisor = 1000; suffix = "k"; }');
    FParent.HTML('var compact = Math.round(total / divisor * 100) / 100;');
    FParent.HTML('main = o.doughnutCenterPrefix + String(compact).replace(".", ",") + suffix; sub = o.doughnutCenterSubtitle || "Total"; }');
    FParent.HTML('var ctx = chart.ctx; ctx.save(); ctx.textAlign = "center";');
    FParent.HTML('if (main && semi) {');
    FParent.HTML('var fs = Math.round(Math.max(13, Math.min(28, (ri || ro * 0.6) * 0.42)));');
    FParent.HTML('ctx.textBaseline = "alphabetic"; ctx.fillStyle = "#1d2b36"; ctx.font = "700 " + fs + "px Arial";');
    FParent.HTML('ctx.fillText(main, x, y - (sub ? 14 : 2));');
    FParent.HTML('if (sub) { ctx.fillStyle = "#667681"; ctx.font = "10px Arial"; ctx.fillText(sub, x, y - 1); }');
    FParent.HTML('} else if (main) {');
    FParent.HTML('ctx.textBaseline = "middle"; ctx.fillStyle = "#1d2b36"; ctx.font = "700 14px Arial"; ctx.fillText(main, x, y - (sub ? 7 : 0));');
    FParent.HTML('if (sub) { ctx.fillStyle = "#667681"; ctx.font = "10px Arial"; ctx.fillText(sub, x, y + 10); } }');
    FParent.HTML('if (semi && (o.doughnutMinLabel || o.doughnutMaxLabel)) {');
    FParent.HTML('ctx.textBaseline = "top"; ctx.fillStyle = "#667681"; ctx.font = "10px Arial";');
    FParent.HTML('if (o.doughnutMinLabel) { ctx.textAlign = "left"; ctx.fillText(o.doughnutMinLabel, x - ro, y + 3); }');
    FParent.HTML('if (o.doughnutMaxLabel) { ctx.textAlign = "right"; ctx.fillText(o.doughnutMaxLabel, x + ro, y + 3); } }');
    FParent.HTML('ctx.restore();');
    FParent.HTML('},');
  end;
  FParent.HTML('}]');
  FParent.HTML('}); ');
  if FConfig.CallBackLink <> '' then FParent.HTML(TChartsCallback.New.IDChart('_'+FConfig.IDChart).Result(FConfig.CallBackLink, FConfig.ResultKeys));
  FParent.HTML('</script>  ');
  FParent.HTML('</div>  ');
end;

constructor TModelChartsGeneric.Create(Parent : iModelHTMLCharts);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FConfig := TModelHTMLChartsConfig.New(Self);
end;
destructor TModelChartsGeneric.Destroy;
begin
  inherited;
end;
function TModelChartsGeneric.HTML(Value: String): iModelHTMLChartsGeneric;
begin
  Result := Self;
  FHTML := Value;
end;
function TModelChartsGeneric.HTML: String;
begin
  Result := FHTML;
end;
class function TModelChartsGeneric.New(Parent : iModelHTMLCharts): iModelHTMLChartsGeneric;
begin
    Result := Self.Create(Parent);
end;
function TModelChartsGeneric.UpdateChart: iModelHTMLChartsGeneric;
var
  CommandJS : iModelJSCommand;
  param : String;
begin
  Result := Self;
  param := '{labels: '+FConfig.ResultLabels+', datasets: [' + FConfig.ResultDataSet + ']}';
  param := StringReplace(param, #13, '', [rfReplaceAll, rfIgnoreCase]);
  CommandJS := TModelJSCommand.New
    .Command('updateChart' + FConfig.IDChart)
    .Paramters
      .Add(param)
    .&End
    .TestBeforeExecute(true);

    FParent.&End.ExecuteScript(CommandJS);
end;

function TModelChartsGeneric.UpdateRealTime: iModelHTMLChartsGeneric;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('updateRealTime' + FConfig.IDChart)
    .Paramters
      .Add('[' + FConfig.ResultRealTimeInitialValue +']')
    .&End
    .TestBeforeExecute(true);

    FParent.&End.ExecuteScript(CommandJS);
end;

end.
