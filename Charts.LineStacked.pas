unit Charts.LineStacked;

interface

uses
  Interfaces;

Type
  TModelHTMLChartsLineStacked = class(TInterfacedObject, iModelHTMLChartsLineStacked)
    private
      FHTML : String;
      FParent : iModelHTMLCharts;
      FConfig : iModelHTMLChartsConfig<iModelHTMLChartsLineStacked>;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsLineStacked;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsLineStacked>;
      function HTML(Value : String) : iModelHTMLChartsLineStacked; overload;
      function HTML : String; overload;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, SysUtils, Injection;

{ TModelHTMLChartsLineStacked }

function TModelHTMLChartsLineStacked.&End: iModelHTMLCharts;
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

  FParent.HTML('var ctx = document.getElementById('''+FConfig.Name+''').getContext(''2d''); ');
  FParent.HTML('var myChart = new Chart(ctx, { ');
  FParent.HTML('type: ''line'', ');
  FParent.HTML('data: { ');
  FParent.HTML('labels: '+FConfig.ResultLabels+',  ');
  FParent.HTML('datasets: [  ');
  FParent.HTML(FConfig.ResultDataSet);
  FParent.HTML(']  ');
  FParent.HTML('}, ');
  FParent.HTML('options: {');
  FParent.HTML('scales: { ');
  FParent.HTML('xAxes: [{ ');
  FParent.HTML('scaleLabel: { ');
  FParent.HTML('display: true, ');
  FParent.HTML('} ');
  FParent.HTML('}], ');
  FParent.HTML('yAxes: [{ ');
  FParent.HTML('stacked: true, ');
  FParent.HTML('scaleLabel: { ');
  FParent.HTML('display: true, ');
  FParent.HTML('} ');
  FParent.HTML('}] ');
  FParent.HTML('}, ');
  FParent.HTML('responsive: true, legend: { position: ''top'', }, title: { display: true, text: '''+FConfig.Title+''' } }, ');
  FParent.HTML('}); ');
  FParent.HTML('</script>  ');
  FParent.HTML('</div>  ');
end;

function TModelHTMLChartsLineStacked.HTML: String;
begin
  Result := FHTML;
end;

function TModelHTMLChartsLineStacked.HTML(Value: String): iModelHTMLChartsLineStacked;
begin
  Result := Self;
  FHTML := Value;
end;

function TModelHTMLChartsLineStacked.Attributes: iModelHTMLChartsConfig<iModelHTMLChartsLineStacked>;
begin
  Result := FConfig
end;

constructor TModelHTMLChartsLineStacked.Create(Parent : iModelHTMLCharts);
begin
  TInjection.Weak(@FParent, Parent);
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsLineStacked>.New(Self);
end;

destructor TModelHTMLChartsLineStacked.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsLineStacked.New(Parent : iModelHTMLCharts) : iModelHTMLChartsLineStacked;
begin
  Result := Self.Create(Parent);
end;

end.
