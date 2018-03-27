unit Charts.Doughnut;

interface

uses
  Interfaces;

Type
  TModelHTMLChartsDoughnut = class(TInterfacedObject, iModelHTMLChartsDoughnut)
    private
      FHTML : String;
      [weak]
      FParent : iModelHTMLCharts;
      FConfig : iModelHTMLChartsConfig<iModelHTMLChartsDoughnut>;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsDoughnut;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsDoughnut>;
      function HTML(Value : String) : iModelHTMLChartsDoughnut; overload;
      function HTML : String; overload;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, SysUtils;

{ TModelHTMLChartsDoughnut }

function TModelHTMLChartsDoughnut.&End: iModelHTMLCharts;
begin
  Result := FParent;
  FParent.HTML('<div class="col-'+IntToStr(FConfig.ColSpan)+'">');
  FParent.HTML('<canvas id="'+FConfig.Name+'" ');
  if FConfig.Width > 0 then
    FParent.HTML('width="'+IntToStr(FConfig.Width)+'px" ');
  if FConfig.Heigth > 0 then
    FParent.HTML('height="'+IntToStr(FConfig.Heigth)+'px" ');
  FParent.HTML('></canvas>  ');
  FParent.HTML('<script>  ');
  FParent.HTML('var ctx = document.getElementById('''+FConfig.Name+''').getContext(''2d''); ');
  FParent.HTML('var myChart = new Chart(ctx, { ');
  FParent.HTML('type: ''doughnut'', ');
  FParent.HTML('data: { ');
  FParent.HTML('datasets: [  ');
  FParent.HTML(FConfig.ResultDataSet);
  FParent.HTML('],  ');
  FParent.HTML('labels: '+FConfig.ResultLabels+',  ');
  FParent.HTML('}, ');
  FParent.HTML('options: { ');
  FParent.HTML('responsive: true, ');
  FParent.HTML('legend: { ');
  FParent.HTML('position: ''top'', ');
  FParent.HTML('}, ');
  FParent.HTML('title: { ');
  FParent.HTML('display: true, ');
  FParent.HTML('text: '''+FConfig.Title+''' ');
  FParent.HTML('}, ');
  FParent.HTML('animation: { ');
  FParent.HTML('animateScale: true, ');
  FParent.HTML('animateRotate: true ');
  FParent.HTML('} ');
  FParent.HTML('} ');
  FParent.HTML('}); ');
  //FParent.HTML(' ');
 // FParent.HTML('window.onload = function() { ');
  //FParent.HTML('var ctx = document.getElementById('''+FConfig.Name+''').getContext(''2d''); ');
  //FParent.HTML('window.myDoughnut = new Chart(ctx, config); ');
  //FParent.HTML('}; ');










//  FParent.HTML('new Chart(document.getElementById("'+FConfig.Name+'"),  ');
//  FParent.HTML('{  ');
//  FParent.HTML('"type":"doughnut",  ');
//  FParent.HTML('"data":{  ');
//  FParent.HTML('"labels": '+FConfig.Labels+',  ');
//  FParent.HTML('"datasets":[{  ');
//  FParent.HTML('"label":"'+FConfig.Title+'",  ');
//  FParent.HTML('"data":'+FConfig.Data+',  ');
//  FParent.HTML('"backgroundColor": '+FConfig.BackgroundColor+'  ');
//  FParent.HTML('}]  ');
//  FParent.HTML('}  ');
//  FParent.HTML('}  ');
//  FParent.HTML(');  ');
  FParent.HTML('</script>  ');
  FParent.HTML('</div>');
end;

function TModelHTMLChartsDoughnut.HTML: String;
begin
  Result := FHTML;
end;

function TModelHTMLChartsDoughnut.HTML(Value: String): iModelHTMLChartsDoughnut;
begin
  Result := Self;
  FHTML := Value;
end;

function TModelHTMLChartsDoughnut.Attributes: iModelHTMLChartsConfig<iModelHTMLChartsDoughnut>;
begin
  Result := FConfig
end;

constructor TModelHTMLChartsDoughnut.Create(Parent : iModelHTMLCharts);
begin
  FParent := Parent;
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsDoughnut>.New(Self);
end;

destructor TModelHTMLChartsDoughnut.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsDoughnut.New(Parent : iModelHTMLCharts) : iModelHTMLChartsDoughnut;
begin
  Result := Self.Create(Parent);
end;

end.
