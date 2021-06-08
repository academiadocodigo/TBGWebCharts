unit Maps.GMaps.Draw.Marker;

interface

uses
  Interfaces;

type
  TModelMapsGMapsDrawMarker = class(TInterfacedObject, iModelMapsDrawMarker)
    private
      [weak]
      FParent : iModelMapsDraw;
      FDataSet : iModelMapsDataSet<iModelMapsDrawMarker>;
      FInfoWindow : iModelMapsInfoWindow<iModelMapsDrawMarker>;
    public
      constructor Create(Parent : iModelMapsDraw);
      destructor Destroy; override;
      class function New(Parent : iModelMapsDraw) : iModelMapsDrawMarker;
      function DataSet : iModelMapsDataSet<iModelMapsDrawMarker>;
      function InfoWindow : iModelMapsInfoWindow<iModelMapsDrawMarker>;
      function ResultScript(MapName: string) : String;
      function &End : iModelMapsDraw;

  end;

implementation

uses
  Injection,
  Maps.DataSet,
  Maps.InfoWindow,
  Utilities.Str;
{ TModelMapsGMapsDrawMarker }

constructor TModelMapsGMapsDrawMarker.Create(Parent: iModelMapsDraw);
begin
  TInjection.Weak(@FParent, Parent);
  FDataSet := TModelMapsDataSet<iModelMapsDrawMarker>.new(Self);
end;

function TModelMapsGMapsDrawMarker.DataSet: iModelMapsDataSet<iModelMapsDrawMarker>;
begin
  Result := FDataSet;
end;

destructor TModelMapsGMapsDrawMarker.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsDrawMarker.&End: iModelMapsDraw;
begin
  Result := FParent;
end;

function TModelMapsGMapsDrawMarker.InfoWindow: iModelMapsInfoWindow<iModelMapsDrawMarker>;
begin
  FInfoWindow := TModelMapsInfoWindow<iModelMapsDrawMarker>.New(Self);
  Result := FInfoWindow;
end;

class function TModelMapsGMapsDrawMarker.New(
  Parent: iModelMapsDraw): iModelMapsDrawMarker;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsDrawMarker.ResultScript(MapName: string): String;
var
  I: Integer;
  Markers, GeoCode, LatValue, LngValue, InfoWindow, InfoContent: string;
begin
  Markers := 'let markers' + MapName + ' = [];';
  FDataSet.Dataset.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
    LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));
    InfoWindow := '';
    if Assigned(FInfoWindow) then
    begin
      InfoContent := FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString;
      if FDataSet.DataSet.Fields.FindField(FDataSet.InfoName) <> nil then
        InfoContent := FDataSet.Dataset.FieldByName(FDataSet.InfoName).AsString;

      InfoWindow := 'addMarkerListener' + MapName + '(' +
        'markers' + MapName + '[markers' + MapName + '.length -1],' +
        'new google.maps.InfoWindow({' +
          'content: "' + InfoContent + '",' +
          FInfoWindow.MaxWidth +
          FInfoWindow.MinWidth +
        '}),' +
        FInfoWindow.StartOpened +
      ');';
    end;

    if (LatValue <> '') and (LngValue <> '') then
    begin
      Markers := Markers + 'markers' + MapName + '.push(' +
        'new google.maps.Marker({' +
          'position: {' +
            'lat:' + LatValue + ',' +
            'lng:' + LngValue + '},' +
          'label: {' +
            'text: "' + FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString + '",' +
            'color: "#FFFFFF",},' +
          'title:"' + FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString + '",' +
          'map: ' + MapName + ',' +
        '})' +
      ');' +
      InfoWindow;
    end
    else
    begin
      if FDataSet.DataSet.Fields.FindField(FDataSet.AddressName) <> nil then
      begin
        GeoCode := GeoCode + 'geocoder' + MapName + '.geocode(' +
          '{ address: "' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '" },' +
          'function (results, status) {' +
            'if (status == "OK") {' +
              'markers' + MapName + '.push(' +
                'new google.maps.Marker({' +
                  'position: results[0].geometry.location,' +
                  'label: {' +
                    'text: "' + FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString + '",' +
                    'color: "#FFFFFF",'+
                  '},' +
                  'title: "' + FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString + '",' +
                  'map: ' + MapName + ',' +
                '})' +
              ');' +
              InfoWindow +
              'bounds' + MapName + '.extend(results[0].geometry.location);' + MapName + '.fitBounds(bounds' + MapName + ');' +
              'let pos = geoCodeResult' + MapName + '.findIndex(i => i.address === "' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '");' +
              'if (pos === -1) {' +
                'geoCodeResult' + MapName + '.push({' +
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


  Result := Markers + GeoCode;
  Result := Result + 'for (var i = 0; i < markers' + MapName + '.length; i++) {' +
      'bounds' + MapName + '.extend(markers' + MapName + '[i].position);' +
    '}';

end;

end.
