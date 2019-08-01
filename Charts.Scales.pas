unit Charts.Scales;

interface

uses
  Interfaces;

type
  TModelHTMLChartsScales = class(TInterfacedObject, iModelHTMLScales)
    private
      FParent : iModelHTMLOptions;
      FAxes : iModelHTMLChartsAxes;
      FGeneratedAxes : Boolean;
    public
      constructor Create(Parent : iModelHTMLOptions);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLOptions) : iModelHTMLScales;
      function Axes : iModelHTMLChartsAxes;
      function GeneratedAxes ( Value : Boolean ) : iModelHTMLScales;
      function Result : String;
      function &End : iModelHTMLOptions;
  end;

implementation

uses
  Charts.Axes, Injection;

{ TModelHTMLChartsScales<T> }

function TModelHTMLChartsScales.&End: iModelHTMLOptions;
begin
  Result := FParent;
end;

function TModelHTMLChartsScales.GeneratedAxes(
  Value: Boolean): iModelHTMLScales;
begin
  Result := Self;
  FGeneratedAxes := Value;
end;

function TModelHTMLChartsScales.Axes: iModelHTMLChartsAxes;
begin
  Result := FAxes;
end;

constructor TModelHTMLChartsScales.Create(Parent : iModelHTMLOptions);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FAxes := TModelHTMLChartsAxes.New(Self);
  FGeneratedAxes := True;
end;

destructor TModelHTMLChartsScales.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsScales.New(Parent : iModelHTMLOptions): iModelHTMLScales;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsScales.Result: String;
begin
  Result := '';
  Result := Result + 'scales: { ';
  if FGeneratedAxes then Result := Result + FAxes.Result;
  Result := Result +'},';
end;

end.
