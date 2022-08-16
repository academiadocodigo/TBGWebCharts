unit Maps.Gmaps.Routes;

interface

uses
  Interfaces;

type
  TModelMapsGMapsRoutes = class(TInterfacedObject, iModelMapsRoutes)
    private
      [weak]
      FParent: iModelMapsGeneric;
      FDirections: iModelMapsRoutesDirections;
    public
      constructor Create(Parent : iModelMapsGeneric);
      destructor Destroy; override;
      class function New(Parent : iModelMapsGeneric) : iModelMapsRoutes;
      function Directions : iModelMapsRoutesDirections;
      function &End : iModelMapsGeneric;
      function ResultScript : String;

  end;

implementation

uses
  Injection,
  Maps.Dataset,
  Maps.Gmaps.Routes.Directions;

{ TModelMapsGMapsRoute }

constructor TModelMapsGMapsRoutes.Create(Parent: iModelMapsGeneric);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelMapsGMapsRoutes.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsRoutes.Directions: iModelMapsRoutesDirections;
begin
  FDirections := TModelMapsGMapsRoutesDirections.New(Self);
  Result := FDirections;
end;

function TModelMapsGMapsRoutes.&End: iModelMapsGeneric;
begin
  Result := FParent;
end;

class function TModelMapsGMapsRoutes.New(
  Parent: iModelMapsGeneric): iModelMapsRoutes;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsRoutes.ResultScript: String;
begin
  Result := '';
  if Assigned(FDirections) then
    Result := Result + FDirections.ResultScript(FParent.Name);
end;

end.
