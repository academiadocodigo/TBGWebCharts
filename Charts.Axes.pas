unit Charts.Axes;

interface

uses
  Interfaces;

type
  TModelHTMLChartsAxes<T : IInterface> = class(TInterfacedObject, iModelHTMLChartsAxes<T>)
    private
      FParent : T;
      FFontColor : String;
      FResult : String;
      FxAxe : iModelHTMLChartsAxesParam<iModelHTMLChartsAxes<T>>;
      FyAxe : iModelHTMLChartsAxesParam<iModelHTMLChartsAxes<T>>;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLChartsAxes<T>;
      function Result : String;
      function xAxe : iModelHTMLChartsAxesParam<iModelHTMLChartsAxes<T>>;
      function yAxe : iModelHTMLChartsAxesParam<iModelHTMLChartsAxes<T>>;
      function &End : T;
  end;

implementation

uses
  Charts.Axes.Ticks, Charts.Axes.Params, Injection;

{ TModelHTMLChartsAxes<T> }

function TModelHTMLChartsAxes<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelHTMLChartsAxes<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FxAxe := TModelHTMLAxesParams<iModelHTMLChartsAxes<T>>.New(Self);
  FyAxe := TModelHTMLAxesParams<iModelHTMLChartsAxes<T>>.New(Self);
end;

destructor TModelHTMLChartsAxes<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsAxes<T>.New(Parent : T): iModelHTMLChartsAxes<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsAxes<T>.Result: String;
begin
  FResult := FResult + 'yAxes: [{';
  FResult := FResult + FyAxe.Result;
  FResult := FResult + '}],';
  FResult := FResult + 'xAxes: [{';
  FResult := FResult + FxAxe.Result;
  FResult := FResult + '}]';
  Result := FResult;
end;

function TModelHTMLChartsAxes<T>.xAxe: iModelHTMLChartsAxesParam<iModelHTMLChartsAxes<T>>;
begin
  Result := FxAxe;
end;

function TModelHTMLChartsAxes<T>.yAxe: iModelHTMLChartsAxesParam<iModelHTMLChartsAxes<T>>;
begin
  Result := FyAxe;
end;

end.
