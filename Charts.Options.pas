unit Charts.Options;

interface

uses
  Interfaces;

type
  TModelHTMLChartsOptions<T> = class(TInterfacedObject, iModelHTMLOptions<T>)
    private
      FParent : T;
      FScales : iModelHTMLScales<iModelHTMLOptions<T>>;
      FLegend : iModelHTMLLegend<iModelHTMLOptions<T>>;
      FTitle  : iModelHTMLTitle<iModelHTMLOptions<T>>;
      FSemiCircule : Boolean;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLOptions<T>;
      function Scales : iModelHTMLScales<iModelHTMLOptions<T>>;
      function Legend : iModelHTMLLegend<iModelHTMLOptions<T>>;
      function Title : iModelHTMLTitle<iModelHTMLOptions<T>>;
      function SemiCircule ( Value : Boolean ) : iModelHTMLOptions<T>;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  Charts.Scales, Charts.Legends, Charts.Title;

{ TModelHTMLChartsOptions<T> }

function TModelHTMLChartsOptions<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLChartsOptions<T>.Legend: iModelHTMLLegend<iModelHTMLOptions<T>>;
begin
  Result := FLegend;
end;

constructor TModelHTMLChartsOptions<T>.Create(Parent : T);
begin
  FParent := Parent;
  FScales := TModelHTMLChartsScales<iModelHTMLOptions<T>>.New(Self);
  FLegend := TModelHTMLChartsLegends<iModelHTMLOptions<T>>.New(Self);
  FTitle := TModelHTMLChartsTitle<iModelHTMLOptions<T>>.New(Self);
end;

destructor TModelHTMLChartsOptions<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsOptions<T>.New(Parent : T): iModelHTMLOptions<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsOptions<T>.Result: String;
begin
  Result := '';
  Result := Result + 'options: { ';
  if FSemiCircule then
  begin
    Result := Result + 'circumference : Math.PI, ';
    Result := Result + 'rotation : -Math.PI, ';
  end;
  Result := Result + FScales.Result;
  Result := Result + FLegend.Result;
  Result := Result + FTitle.Result;
  Result := Result + ' responsive: true ';
  Result := Result + '}';
end;

function TModelHTMLChartsOptions<T>.Scales: iModelHTMLScales<iModelHTMLOptions<T>>;
begin
  Result := FScales;
end;

function TModelHTMLChartsOptions<T>.SemiCircule(
  Value: Boolean): iModelHTMLOptions<T>;
begin
  Result := Self;
  FSemiCircule := Value;
end;

function TModelHTMLChartsOptions<T>.Title: iModelHTMLTitle<iModelHTMLOptions<T>>;
begin
  Result := FTitle;
end;

end.
