unit Charts.Legends;

interface

uses
  Interfaces;

type
  TModelHTMLChartsLegends = class(TInterfacedObject, iModelHTMLLegend)
    private
      FParent : iModelHTMLOptions;
      Fdisplay : Boolean;
      Fposition : String;
      FLabels : iModelHTMLLegendLabels<iModelHTMLLegend>;
    public
      constructor Create(Parent : iModelHTMLOptions);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLOptions) : iModelHTMLLegend;
      function Labels : iModelHTMLLegendLabels<iModelHTMLLegend>;
      function display ( Value : Boolean ) : iModelHTMLLegend; overload;
      function display : Boolean; overload;
      function position ( Value : String ) : iModelHTMLLegend; overload;
      function position : String; overload;
      function Result : String;
      function &End : iModelHTMLOptions;
  end;

implementation

uses
  Charts.Legends.Labels, Injection;

{ TModelHTMLChartsLegends<T> }

function TModelHTMLChartsLegends.&End: iModelHTMLOptions;
begin
  Result := FParent;
end;

function TModelHTMLChartsLegends.Labels: iModelHTMLLegendLabels<iModelHTMLLegend>;
begin
  Result := FLabels;
end;

constructor TModelHTMLChartsLegends.Create(Parent : iModelHTMLOptions);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}

  FLabels := TModelHTMLLegendsLabels<iModelHTMLLegend>.New(Self);
  Fdisplay := True;
  Fposition := 'top';
end;

destructor TModelHTMLChartsLegends.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsLegends.display: Boolean;
begin
  Result := Fdisplay;
end;

function TModelHTMLChartsLegends.display(
  Value: Boolean): iModelHTMLLegend;
begin
  Result := Self;
  FDisplay := Value;
end;

class function TModelHTMLChartsLegends.New(Parent : iModelHTMLOptions): iModelHTMLLegend;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsLegends.position: String;
begin
  Result := Fposition;
end;

function TModelHTMLChartsLegends.position(
  Value: String): iModelHTMLLegend;
begin
  Result := Self;
  Fposition := Value;
end;

function TModelHTMLChartsLegends.Result: String;
begin
  Result := '';
  Result := Result + 'legend : { ';
  Result := Result + 'position : "' + Fposition + '", ';
  Result := Result + FLabels.Result;
  if Fdisplay then Result := Result + ' display : true ' else Result := Result + 'display : false ';
  Result := Result + '},';
end;

end.
