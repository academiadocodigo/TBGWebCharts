unit Maps.GMaps.Layer.HeatMap;

interface
uses
  Interfaces;

type
  TModelMapsGMapsLayerHeatMap = class(TInterfacedObject, iModelMapsLayerHeatMap)
    private
      [weak]
      FParent : iModelMapsLayer;
      FDataSet : iModelMapsDataSet<iModelMapsLayerHeatMap>;
      FOpacity : string;
      FRadius : string;
    public
      constructor Create(Parent : iModelMapsLayer);
      destructor Destroy; override;
      class function New(Parent : iModelMapsLayer) : iModelMapsLayerHeatMap;
      function DataSet : iModelMapsDataSet<iModelMapsLayerHeatMap>;
      function Radius(Value : string) : iModelMapsLayerHeatMap;
      function Opacity(Value : string) :iModelMapsLayerHeatMap;
      function &End : iModelMapsLayer;
      function ResultScript(Value: string) : String;

  end;

implementation

uses
  Injection,
  Maps.DataSet, Utilities.Str;

{ TModelMapsGMapsLayerHeatMap }

constructor TModelMapsGMapsLayerHeatMap.Create(Parent: iModelMapsLayer);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
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

function TModelMapsGMapsLayerHeatMap.ResultScript(Value: string): String;
var
  I: Integer;
  HeatMap, GeoCode, LatValue, LngValue, WeightValue: string;
begin
  HeatMap := 'let heatMapData' + value + ' = [];';
  FDataSet.Dataset.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
    LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));
    WeightValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.ValueName));

    if (LatValue <> '') and (LngValue <> '') then
    begin
      HeatMap := HeatMap + 'heatMapData' + value + '.push(' +
        '{' +
          'location: new google.maps.LatLng(' + LatValue + ',' + LngValue + '),' +
          'weight:' + WeightValue +
        '});';
    end
    else
    begin
      if FDataSet.DataSet.Fields.FindField(FDataSet.AddressName)<> nil then
      begin
        GeoCode := GeoCode + 'geocoder' + Value + '.geocode(' +
          '{ address: "' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '" },' +
          'function (results, status) {' +
            'if (status == "OK") {' +
              'heatMapData' + value + '.push(' +
                '{' +
                  'location: results[0].geometry.location,' +
                  'weight:' + WeightValue +
                '}' +
              ');' +
              'heatMap' + Value + '.setData(heatMapData' + Value + ');' +
              'bounds' + value + '.extend(heatMapData' + Value + '[heatMapData' + Value + '.length -1].location);' + value + '.fitBounds(bounds' + value + ');' +
              'let pos = geoCodeResult' + value + '.findIndex(i => i.address === "' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '");' +
              'if (pos === -1) {' +
                'geoCodeResult' + value + '.push({' +
                  'id_address: "' + FDataSet.DataSet.FieldByName(FDataSet.IdAddressName).AsString + '",' +
                  'address:"' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '",' +
                  'lat: results[0].geometry.location.lat(),' +
                  'lng: results[0].geometry.location.lng(),' +
                '});' +
              '}' +
            '}' +
          '}' +
        ');';
      end;
    end;
    FDataSet.Dataset.Next;
  end;
  Result := HeatMap + GeoCode;

  Result := Result + 'var heatMap' + Value + ' = new google.maps.visualization.HeatmapLayer({' +
      'data: heatMapData' + Value + ',' +
      FOpacity +
      FRadius +
    '});' +
    'heatMap' + Value + '.setMap(' + Value + ');' +
    'for (var i = 0; i < heatMapData' + Value + '.length; i++) {' +
      'bounds' + Value + '.extend(heatMapData' + Value + '[i].location);' +
    '}';

end;

end.
