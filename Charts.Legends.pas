unit Charts.Legends;

interface

uses
  Interfaces;

type
  TModelHTMLChartsLegends<T : IInterface> = class(TInterfacedObject, iModelHTMLLegend<T>)
    private
      FParent : T;
      Fdisplay : Boolean;
      Fposition : String;
      FLabels : iModelHTMLLegendLabels<iModelHTMLLegend<T>>;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLLegend<T>;
      function Labels : iModelHTMLLegendLabels<iModelHTMLLegend<T>>;
      function display ( Value : Boolean ) : iModelHTMLLegend<T>; overload;
      function display : Boolean; overload;
      function position ( Value : String ) : iModelHTMLLegend<T>; overload;
      function position : String; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  Charts.Legends.Labels, Injection;

{ TModelHTMLChartsLegends<T> }

function TModelHTMLChartsLegends<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLChartsLegends<T>.Labels: iModelHTMLLegendLabels<iModelHTMLLegend<T>>;
begin
  Result := FLabels;
end;

constructor TModelHTMLChartsLegends<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}

  FLabels := TModelHTMLLegendsLabels<iModelHTMLLegend<T>>.New(Self);
  Fdisplay := True;
  Fposition := 'top';
end;

destructor TModelHTMLChartsLegends<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsLegends<T>.display: Boolean;
begin
  Result := Fdisplay;
end;

function TModelHTMLChartsLegends<T>.display(
  Value: Boolean): iModelHTMLLegend<T>;
begin
  Result := Self;
  FDisplay := Value;
end;

class function TModelHTMLChartsLegends<T>.New(Parent : T): iModelHTMLLegend<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsLegends<T>.position: String;
begin
  Result := Fposition;
end;

function TModelHTMLChartsLegends<T>.position(
  Value: String): iModelHTMLLegend<T>;
begin
  Result := Self;
  Fposition := Value;
end;

function TModelHTMLChartsLegends<T>.Result: String;
begin
  Result := '';
  Result := Result + 'legend : { ';
  Result := Result + 'position : "' + Fposition + '", ';
  Result := Result + FLabels.Result;
  if Fdisplay then Result := Result + ' display : true ' else Result := Result + 'display : false ';
  Result := Result + '},';
end;

end.
