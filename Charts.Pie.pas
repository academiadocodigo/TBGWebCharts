unit Charts.Pie;

interface

uses
  Interfaces;

Type
  TModelHTMLChartsPie = class(TInterfacedObject, iModelHTMLChartsPie)
    private
      FHTML : String;
      [weak]
      FParent : iModelHTMLCharts;
      FConfig : iModelHTMLChartsConfig<iModelHTMLChartsPie>;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsPie;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsPie>;
      function HTML(Value : String) : iModelHTMLChartsPie; overload;
      function HTML : String; overload;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, SysUtils;

{ TModelHTMLChartsPie }

function TModelHTMLChartsPie.&End: iModelHTMLCharts;
begin
  Result := FParent;
  FParent.HTML('<div class="col-'+IntToStr(FConfig.ColSpan)+'">  ');
  FParent.HTML('<canvas id="'+FConfig.Name+'" ');
  if FConfig.Width > 0 then
    FParent.HTML('width="'+IntToStr(FConfig.Width)+'" ');
  if FConfig.Heigth > 0 then
    FParent.HTML('height="'+IntToStr(FConfig.Heigth)+'" ');
  FParent.HTML('></canvas>  ');
  FParent.HTML('<script>  ');
  FParent.HTML('var config = { ');
  FParent.HTML('type: ''pie'', ');
  FParent.HTML('data: { ');
  FParent.HTML('datasets: [  ');
  FParent.HTML(FConfig.ResultDataSet);
  FParent.HTML('],  ');
  FParent.HTML('labels: '+FConfig.ResultLabels+',  ');
  FParent.HTML('}, ');
  FParent.HTML('options: { ');
  FParent.HTML('responsive: true ');
  FParent.HTML('} ');
  FParent.HTML('}; ');
  FParent.HTML(' ');
  FParent.HTML('window.onload = function() { ');
  FParent.HTML('var ctx = document.getElementById('''+FConfig.Name+''').getContext(''2d''); ');
  FParent.HTML('window.myPie = new Chart(ctx, config); ');
  FParent.HTML('}; ');
  FParent.HTML('</script>  ');
  FParent.HTML('</div>  ');
end;

function TModelHTMLChartsPie.HTML: String;
begin
  Result := FHTML;
end;

function TModelHTMLChartsPie.HTML(Value: String): iModelHTMLChartsPie;
begin
  Result := Self;
  FHTML := Value;
end;

function TModelHTMLChartsPie.Attributes: iModelHTMLChartsConfig<iModelHTMLChartsPie>;
begin
  Result := FConfig
end;

constructor TModelHTMLChartsPie.Create(Parent : iModelHTMLCharts);
begin
  FParent := Parent;
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsPie>.New(Self);
end;

destructor TModelHTMLChartsPie.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsPie.New(Parent : iModelHTMLCharts) : iModelHTMLChartsPie;
begin
  Result := Self.Create(Parent);
end;

end.
