unit Charts.Bar.Horizontal;

interface

uses
  Interfaces;

Type
  TModelHTMLChartsBarHorizontal = class(TInterfacedObject, iModelHTMLChartsBar)
    private
      FHTML : String;
      [weak]
      FParent : iModelHTMLCharts;
      FConfig : iModelHTMLChartsConfig<iModelHTMLChartsBar>;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsBar;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsBar>;
      function HTML(Value : String) : iModelHTMLChartsBar; overload;
      function HTML : String; overload;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, SysUtils;

{ TModelHTMLChartsBarHorizontal }

function TModelHTMLChartsBarHorizontal.&End: iModelHTMLCharts;
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
  FParent.HTML('type: ''horizontalBar'', ');
  FParent.HTML('data: { ');
  FParent.HTML('labels: '+FConfig.ResultLabels+',  ');
  FParent.HTML('datasets: [  ');
  FParent.HTML(FConfig.ResultDataSet);
  FParent.HTML(']  ');
  FParent.HTML('}, ');
  FParent.HTML('options: { responsive: true, legend: { position: ''top'', }, title: { display: true, text: '''+FConfig.Title+''' } }, ');
  FParent.HTML('}); ');
  FParent.HTML('</script>  ');
  FParent.HTML('</div>  ');
end;

function TModelHTMLChartsBarHorizontal.HTML: String;
begin
  Result := FHTML;
end;

function TModelHTMLChartsBarHorizontal.HTML(Value: String): iModelHTMLChartsBar;
begin
  Result := Self;
  FHTML := Value;
end;

function TModelHTMLChartsBarHorizontal.Attributes: iModelHTMLChartsConfig<iModelHTMLChartsBar>;
begin
  Result := FConfig
end;

constructor TModelHTMLChartsBarHorizontal.Create(Parent : iModelHTMLCharts);
begin
  FParent := Parent;
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsBar>.New(Self);
end;

destructor TModelHTMLChartsBarHorizontal.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsBarHorizontal.New(Parent : iModelHTMLCharts) : iModelHTMLChartsBar;
begin
  Result := Self.Create(Parent);
end;

end.
