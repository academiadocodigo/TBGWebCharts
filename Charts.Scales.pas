unit Charts.Scales;

interface

uses
  Interfaces;

type
  TModelHTMLChartsScales<T : IInterface> = class(TInterfacedObject, iModelHTMLScales<T>)
    private
      FParent : T;
      FAxes : iModelHTMLChartsAxes<iModelHTMLScales<T>>;
      FGeneratedAxes : Boolean;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLScales<T>;
      function Axes : iModelHTMLChartsAxes<iModelHTMLScales<T>>;
      function GeneratedAxes ( Value : Boolean ) : iModelHTMLScales<T>;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  Charts.Axes, Injection;

{ TModelHTMLChartsScales<T> }

function TModelHTMLChartsScales<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLChartsScales<T>.GeneratedAxes(
  Value: Boolean): iModelHTMLScales<T>;
begin
  Result := Self;
  FGeneratedAxes := Value;
end;

function TModelHTMLChartsScales<T>.Axes: iModelHTMLChartsAxes<iModelHTMLScales<T>>;
begin
  Result := FAxes;
end;

constructor TModelHTMLChartsScales<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FAxes := TModelHTMLChartsAxes<iModelHTMLScales<T>>.New(Self);
  FGeneratedAxes := True;
end;

destructor TModelHTMLChartsScales<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsScales<T>.New(Parent : T): iModelHTMLScales<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsScales<T>.Result: String;
begin
  Result := '';
  Result := Result + 'scales: { ';
  if FGeneratedAxes then Result := Result + FAxes.Result;
  Result := Result +'},';
end;

end.
