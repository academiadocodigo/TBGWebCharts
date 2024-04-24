unit Charts.Axes.Params.RealTime;

interface

uses
  Interfaces;
type
  TModelHTMLAxesParamsRealTime = class(TInterfacedObject, iModelHTMLChartsAxesParamRealTime)
    private
      FParent : iModelHTMLChartsAxesParam;
      FDuration : Integer;
      FTtl : Integer;
      FDelay : Integer;
      FRefresh : Integer;

    public
      constructor Create(Parent : iModelHTMLchartsAxesParam);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLChartsAxesParam) : TModelHTMLAxesParamsRealTime;
      function Duration (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
      function Ttl (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
      function Delay (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
      function Refresh (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
      function Result : String;
      function &End : iModelHTMLChartsAxesParam;

 end;
implementation

uses
  Injection, System.SysUtils;

{ TModelHTMLAxesParamsRealTime }

constructor TModelHTMLAxesParamsRealTime.Create(
  Parent: iModelHTMLChartsAxesParam);
begin
  TInjection.Weak(@FParent, Parent);
  FDuration := 20000;
  FRefresh := 2000;
  FDelay := 2000;
end;

function TModelHTMLAxesParamsRealTime.Delay(
  Value: Integer): iModelHTMLChartsAxesParamRealTime;
begin
  Result := Self;
  FDelay := Value;
end;

destructor TModelHTMLAxesParamsRealTime.Destroy;
begin

  inherited;
end;

function TModelHTMLAxesParamsRealTime.Duration(
  Value: Integer): iModelHTMLChartsAxesParamRealTime;
begin
  Result := Self;
  FDuration := Value;
end;

function TModelHTMLAxesParamsRealTime.&End: iModelHTMLChartsAxesParam;
begin
  Result := FParent;
end;

class function TModelHTMLAxesParamsRealTime.New(
  Parent: iModelHTMLChartsAxesParam): TModelHTMLAxesParamsRealTime;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLAxesParamsRealTime.Refresh(
  Value: Integer): iModelHTMLChartsAxesParamRealTime;
begin
  Result := Self;
  FRefresh := Value;
end;

function TModelHTMLAxesParamsRealTime.Result: String;
var
  configName : String;
begin
  configName := FParent.&End.&End.&End.&End.IDChart;
  Result := 'realtime: {';
  Result :=  Result + 'duration: ' + IntToStr(FDuration) + ',';
  if FTtl > 0 then Result := Result + 'ttl: ' + IntToStr(FTtl) + ',';
  Result := Result + 'refresh: ' + IntToStr(FRefresh) + ',';
  Result := Result + 'delay: ' + IntToStr(FDelay) + ',';
  Result := Result + 'onRefresh: (function (chart) {';
  Result := Result + 'chart.config.data.datasets.forEach(function (dataset) {';
  Result := Result + 'RealTime' + configName + '.forEach(function (rData) {';
  Result := Result + 'if (rData.label == dataset.label) {';
  Result := Result + 'dataset.data.push({';
  Result := Result + 'x: Date.now(), y: rData.value';
  Result := Result + '});';
  Result := Result + '}';
  Result := Result + '});';
  Result := Result + '});';
  Result := Result + '} )';

  Result :=  Result + '}';
end;

function TModelHTMLAxesParamsRealTime.Ttl(
  Value: Integer): iModelHTMLChartsAxesParamRealTime;
begin
  Result := Self;
  FTtl := Value;
end;

end.
