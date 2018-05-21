unit Charts.Lines;

interface

uses
  Interfaces;

Type
  TModelHTMLChartsLines = class(TInterfacedObject, iModelHTMLChartsLines)
    private
      FHTML : String;
      FParent : iModelHTMLCharts;
      FConfig : iModelHTMLChartsConfig<iModelHTMLChartsLines>;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsLines;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsLines>;
      function HTML(Value : String) : iModelHTMLChartsLines; overload;
      function HTML : String; overload;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, SysUtils, Injection;

{ TModelHTMLChartsLines }

function TModelHTMLChartsLines.&End: iModelHTMLCharts;
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
  FParent.HTML('options: { responsive: true, legend: { position: ''top'', }, title: { display: true, text: '''+FConfig.Title+''' } }, ');
  FParent.HTML('}); ');
  FParent.HTML('</script>  ');
  FParent.HTML('</div>  ');
end;

function TModelHTMLChartsLines.HTML: String;
begin
  Result := FHTML;
end;

function TModelHTMLChartsLines.HTML(Value: String): iModelHTMLChartsLines;
begin
  Result := Self;
  FHTML := Value;
end;

function TModelHTMLChartsLines.Attributes: iModelHTMLChartsConfig<iModelHTMLChartsLines>;
begin
  Result := FConfig
end;

constructor TModelHTMLChartsLines.Create(Parent : iModelHTMLCharts);
begin
  TInjection.Weak(@FParent, Parent);
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsLines>.New(Self);
end;

destructor TModelHTMLChartsLines.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsLines.New(Parent : iModelHTMLCharts) : iModelHTMLChartsLines;
begin
  Result := Self.Create(Parent);
end;

end.
