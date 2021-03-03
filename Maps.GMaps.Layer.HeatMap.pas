unit Maps.GMaps.Layer.HeatMap;

interface
uses
  Interfaces;

type
  TModelMapsGMapsLayerHeatMap = class(TInterfacedObject, iModelMapsLayerHeatMap)
    private
      FParent : iModelMapsLayer;
      FDataSet : iModelMapsDataSet<iModelMapsLayerHeatMap>;
      FOpacity : string;
      FRadius : string;
    public
      constructor Create(Parent : iModelMapsLayer);
      destructor Destroy; override;
      class function New(Parent : iModelMapsLayer) : iModelMapsLayerHeatMap;
      function DataSet : iModelMapsDataSet<iModelMapsLayerHeatMap>;
      function Radius(Value : string) : iModelMapsLayerHeatMap; overload;
      function Opacity(Value : string) :iModelMapsLayerHeatMap; overload;
      function Radius : string; overload;
      function Opacity : string; overload;
      function &End : iModelMapsLayer;
      function ResultScript : String;

  end;

implementation

uses
  Injection,
  Maps.DataSet, Utilities.Str;

{ TModelMapsGMapsLayerHeatMap }

constructor TModelMapsGMapsLayerHeatMap.Create(Parent: iModelMapsLayer);
begin
  TInjection.Weak(@FParent, Parent);
  FDataSet := TModelMapsDataSet<iModelMapsLayerHeatMap>.new(Self);
end;

function TModelMapsGMapsLayerHeatMap.DataSet: iModelMapsDataSet<iModelMapsLayerHeatMap>;
begin
  Result := FDataSet;
end;

destructor TModelMapsGMapsLayerHeatMap.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsLayerHeatMap.&End: iModelMapsLayer;
begin
  Result := FParent;
end;

class function TModelMapsGMapsLayerHeatMap.New(
  Parent: iModelMapsLayer): iModelMapsLayerHeatMap;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsLayerHeatMap.Opacity: string;
begin
  Result := FOpacity;
end;

function TModelMapsGMapsLayerHeatMap.Opacity(
  Value: string): iModelMapsLayerHeatMap;
begin
  Result := Self;
  FOpacity := 'opacity:' + Value +',';
end;

function TModelMapsGMapsLayerHeatMap.Radius(
  Value: string): iModelMapsLayerHeatMap;
begin
  Result := Self;
  FRadius := 'radius: ' + Value + ',';
end;

function TModelMapsGMapsLayerHeatMap.Radius: string;
begin
  Result := FRadius;
end;

function TModelMapsGMapsLayerHeatMap.ResultScript: String;
var
  I: Integer;
  Aux, LatValue, LngValue, WeightValue: string;
begin
  Result := '[ ';

  FDataSet.Dataset.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    Aux := ', ';
    if I = Pred(FDataSet.DataSet.RecordCount) then
      Aux := '';

    LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
    LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));
    WeightValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.ValueName));

    Result := Result + '{' +
      'location: new google.maps.LatLng(' + LatValue + ',' + LngValue + '),' +
      'weight:' + WeightValue +
      '}' + Aux;
    FDataSet.Dataset.Next;
  end;

  Result := Result + ']';
end;

end.
