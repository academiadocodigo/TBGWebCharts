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
      FSemiCircule : Boolean;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsDoughnut;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsDoughnut>;
      function HTML(Value : String) : iModelHTMLChartsDoughnut; overload;
      function HTML : String; overload;
      function SemiCircule ( aValue : Boolean ) : iModelHTMLChartsDoughnut; overload;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, SysUtils, Injection, Charts.Labelling, Charts.Callback;

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

  FParent.HTML('var myCallBack = document.getElementById('''+FConfig.Name+''');');
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
  if FSemiCircule then
  begin
    FParent.HTML('circumference : Math.PI, ');
    FParent.HTML('rotation : -Math.PI, ');
  end;
  FParent.HTML('responsive: true, ');
  FParent.HTML('legend: { ');
  FParent.HTML('position: ''top'', ');
  if not FConfig.Legend then
    FParent.HTML('display: false, ');
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

  if FConfig.CallBackLink <> '' then
    FParent.HTML(TChartsCallback.New.Result(FConfig.CallBackLink));

  if FConfig.Labelling then
    FParent.HTML(TChartsLabelling.New.Result);

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
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsDoughnut>.New(Self);
  FSemiCircule := False;
end;

destructor TModelHTMLChartsDoughnut.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsDoughnut.New(Parent : iModelHTMLCharts) : iModelHTMLChartsDoughnut;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsDoughnut.SemiCircule(
  aValue: Boolean): iModelHTMLChartsDoughnut;
begin
  Result := Self;
  FSemiCircule := aValue;
end;

end.
