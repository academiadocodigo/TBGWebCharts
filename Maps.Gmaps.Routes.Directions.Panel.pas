unit Maps.Gmaps.Routes.Directions.Panel;

interface

uses
  Interfaces;

type
  TModelMapsGMapsRoutesDirectionsPanel = class(TInterfacedObject, iModelMapsRoutesDirectionsPanel)
    private
      [weak]
      FParent: iModelMapsRoutesDirections;
      FWidth: string;
      FFloat: string;
    public
      constructor Create(Parent : iModelMapsRoutesDirections);
      destructor Destroy; override;
      class function New(Parent : iModelMapsRoutesDirections) : iModelMapsRoutesDirectionsPanel;
      function Width(Value : String) : iModelMapsRoutesDirectionsPanel; overload;
      function Width : String; overload;
      function FloatPos(Value : string) : iModelMapsRoutesDirectionsPanel; overload;
      function FloatPos : string; overload;

      function &End : iModelMapsRoutesDirections;
  end;

implementation

uses
  Injection;

{ TModelMapsGMapsRoutesDirectionsPanel }

constructor TModelMapsGMapsRoutesDirectionsPanel.Create(
  Parent: iModelMapsRoutesDirections);
begin
  TInjection.Weak(@FParent, Parent);
  FWidth := '390px';
  FFloat := 'right';
end;

destructor TModelMapsGMapsRoutesDirectionsPanel.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsRoutesDirectionsPanel.&End: iModelMapsRoutesDirections;
begin
  Result := FParent;
end;

function TModelMapsGMapsRoutesDirectionsPanel.FloatPos: string;
begin
  Result := FFloat;
end;

function TModelMapsGMapsRoutesDirectionsPanel.FloatPos(
  Value: string): iModelMapsRoutesDirectionsPanel;
begin
  Result := Self;
  FFloat := Value;
end;

class function TModelMapsGMapsRoutesDirectionsPanel.New(
  Parent: iModelMapsRoutesDirections): iModelMapsRoutesDirectionsPanel;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsRoutesDirectionsPanel.Width: String;
begin
  Result := FWidth;
end;

function TModelMapsGMapsRoutesDirectionsPanel.Width(
  Value: String): iModelMapsRoutesDirectionsPanel;
begin
  Result := Self;
  FWidth := Value;
end;

end.
