unit Charts.Generic;

interface

uses
  Interfaces;

type
  TModelChartsGeneric = class(TInterfacedObject, iModelHTMLChartsGeneric)
    private
      FHTML : String;
      [weak]
      FParent : iModelHTMLCharts;
      FConfig : iModelHTMLChartsConfig<iModelHTMLChartsGeneric>;
    public
      constructor Create(Parent : iModelHTMLCharts);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLCharts) : iModelHTMLChartsGeneric;
      function HTML(Value : String) : iModelHTMLChartsGeneric; overload;
      function HTML : String; overload;
      function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsGeneric>;
      function &End : iModelHTMLCharts;
  end;

implementation

uses
  Charts.Config, System.SysUtils, Charts.Callback, Injection, Charts.Types;

{ TModelChartsGeneric }

function TModelChartsGeneric.Attributes: iModelHTMLChartsConfig<iModelHTMLChartsGeneric>;
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

  FParent.HTML('var myCallBack = document.getElementById('''+FConfig.Name+''');');
  FParent.HTML('var ctx = document.getElementById('''+FConfig.Name+''').getContext(''2d''); ');
  FParent.HTML('var myChart = new Chart(ctx, { ');
  FParent.HTML('type: '''+ TTypeChart(FParent._ChartType).ToString+''', ');
  FParent.HTML('data: { ');
  FParent.HTML('labels: '+FConfig.ResultLabels+',  ');
  FParent.HTML('datasets: [  ');
  FParent.HTML(FConfig.ResultDataSet);
  FParent.HTML(']  ');
  FParent.HTML('}, ');
  FParent.HTML(FConfig.Options.Result);
  FParent.HTML('}); ');
  if FConfig.CallBackLink <> '' then FParent.HTML(TChartsCallback.New.Result(FConfig.CallBackLink));
  FParent.HTML(FConfig.Labelling.Result);
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
  FConfig := TModelHTMLChartsConfig<iModelHTMLChartsGeneric>.New(Self);
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

end.
