unit Charts.Axes;

interface

uses
  Interfaces;

type
  TModelHTMLChartsAxes = class(TInterfacedObject, iModelHTMLChartsAxes)
    private
      FParent : iModelHTMLScales;
      FResult : String;
      FxAxe : iModelHTMLChartsAxesParam;
      FyAxe : iModelHTMLChartsAxesParam;
    public
      constructor Create(Parent : iModelHTMLScales);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLScales) : iModelHTMLChartsAxes;
      function Result : String;
      function xAxe : iModelHTMLChartsAxesParam;
      function yAxe : iModelHTMLChartsAxesParam;
      function &End : iModelHTMLScales;
  end;

implementation

uses
  Charts.Axes.Ticks, Charts.Axes.Params, Injection;

{ TModelHTMLChartsAxes<T> }

function TModelHTMLChartsAxes.&End: iModelHTMLScales;
begin
  Result := FParent;
end;

constructor TModelHTMLChartsAxes.Create(Parent : iModelHTMLScales);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FxAxe := TModelHTMLAxesParams.New(Self);
  FyAxe := TModelHTMLAxesParams.New(Self);
end;

destructor TModelHTMLChartsAxes.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsAxes.New(Parent : iModelHTMLScales): iModelHTMLChartsAxes;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsAxes.Result: String;
begin
  FResult := FResult + 'yAxes: [{';
  FResult := FResult + FyAxe.Result;
  FResult := FResult + '}],';
  FResult := FResult + 'xAxes: [{';
  FResult := FResult + FxAxe.Result;
  FResult := FResult + '}]';
  Result := FResult;
end;

function TModelHTMLChartsAxes.xAxe: iModelHTMLChartsAxesParam;
begin
  Result := FxAxe;
end;

function TModelHTMLChartsAxes.yAxe: iModelHTMLChartsAxesParam;
begin
  Result := FyAxe;
end;

end.
