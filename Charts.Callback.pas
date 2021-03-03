unit Charts.Callback;

interface

uses
  Interfaces;

Type
  TChartsCallback = class(TInterfacedObject, iChartsCallback)
    private
      FParent : String;
      FIDChart : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iChartsCallback;
      function Result (Value : String) : String;
      function IDChart ( Value : String) : iChartsCallback;
  end;

implementation

{ TChartsCallback }

constructor TChartsCallback.Create;
begin

end;

destructor TChartsCallback.Destroy;
begin

  inherited;
end;

function TChartsCallback.IDChart(Value: String): iChartsCallback;
begin
  Result := Self;
  FIDChart := Value;
end;

class function TChartsCallback.New: iChartsCallback;
begin
  Result := Self.Create;
end;

function TChartsCallback.Result(Value : String): String;
begin
  FParent := FParent + 'myCallBack.onclick = function(evt) { ';
  FParent := FParent + 'var activePoints = myChart'+FIDChart+'.getElementsAtEvent(evt); ';
  FParent := FParent + 'if (activePoints[0]) { ';
  FParent := FParent + 'var chartData = activePoints[0][''_chart''].config.data; ';
  FParent := FParent + 'var idx = activePoints[0][''_index'']; ';
  FParent := FParent + ' ';
  FParent := FParent + 'var label = chartData.labels[idx]; ';
  FParent := FParent + 'var value = chartData.datasets[0].data[idx]; ';
  FParent := FParent + ' ';
  FParent := FParent + 'var url = "ActionCallBackJS:'+Value+'("+window.btoa(label)+")"; ';
  FParent := FParent + 'location.assign(url); ';
  FParent := FParent + '}';
  FParent := FParent + '}';
  Result := FParent;
end;

end.
