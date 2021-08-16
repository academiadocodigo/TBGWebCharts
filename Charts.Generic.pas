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
  FParent.HTML(FConfig.Labelling.Result);
  FParent.HTML('}); ');
  if FConfig.CallBackLink <> '' then FParent.HTML(TChartsCallback.New.IDChart('_'+FConfig.IDChart).Result(FConfig.CallBackLink));
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
