unit Maps.GMaps.Layer;

interface
uses
  Interfaces;

type
  TModelMapsGMapsLayer = class(TInterfacedObject, iModelMapsLayer)
    private
      [weak]
      FParent: iModelMapsGeneric;
      FHeatMap: iModelMapsLayerHeatMap;
    public
      constructor Create(Parent : iModelMapsGeneric);
      destructor Destroy; override;
      class function New(Parent : iModelMapsGeneric) : iModelMapsLayer;
      function HeatMap : iModelMapsLayerHeatMap;
      function &End : iModelMapsGeneric;
      function ResultScript : String;

  end;

implementation

uses
  Injection,
  Maps.GMaps.Layer.HeatMap;
{ TModelMapsGMapsLayer }

constructor TModelMapsGMapsLayer.Create(Parent: iModelMapsGeneric);
begin
  TInjection.Weak(@FParent, Parent);
end;

destructor TModelMapsGMapsLayer.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsLayer.&End: iModelMapsGeneric;
begin
  Result := FParent;
end;

function TModelMapsGMapsLayer.HeatMap: iModelMapsLayerHeatMap;
begin
  FHeatMap := TModelMapsGMapsLayerHeatMap.New(Self);
  Result := FHeatMap;
end;

class function TModelMapsGMapsLayer.New(
  Parent: iModelMapsGeneric): iModelMapsLayer;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsLayer.ResultScript: String;
begin
  Result := '';
  if Assigned(FHeatMap) then
    Result := Result + FHeatMap.ResultScript(FParent.Name);
end;

end.
