unit Maps.GMaps.Draw.Circle;

interface

uses
  Interfaces;

type
  TModelMapsGMapsDrawCircle = class(TInterfacedObject, iModelMapsDrawCircle)
    private
      [weak]
      FParent : iModelMapsDraw;
      FDataSet : iModelMapsDataSet<iModelMapsDrawCircle>;
      FStrokeColor : string;
      FStrokeOpacity : string;
      FStrokeWeight : string;
      FFillColor : string;
      FFillOpacity : string;
      FFator : string;
      FInfoWindow : iModelMapsInfoWindow<iModelMapsDrawCircle>;
    public
      constructor Create(Parent : iModelMapsDraw);
      destructor Destroy; override;
      class function New(Parent : iModelMapsDraw) : iModelMapsDrawCircle;
      function DataSet : iModelMapsDataSet<iModelMapsDrawCircle>;
      function StrokeColor(Value: string): iModelMapsDrawCircle;
      function StrokeOpacity(Value : string) : iModelMapsDrawCircle;
      function StrokeWeight(Value : Integer) : iModelMapsDrawCircle;
      function FillColor(Value : string) : iModelMapsDrawCircle;
      function FillOpacity(Value : string) : iModelMapsDrawCircle;
      function Fator(Value : integer) : iModelMapsDrawCircle;
      function InfoWindow : iModelMapsInfoWindow<iModelMapsDrawCircle>;
      function ResultScript(MapName: string) : String;
      function &End : iModelMapsDraw;

  end;

implementation

uses
  Injection,
  Maps.DataSet,
  Maps.InfoWindow,
  System.SysUtils,
  Utilities.Str;
{ TModelMapsGMapsDrawCircle }

constructor TModelMapsGMapsDrawCircle.Create(Parent: iModelMapsDraw);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TModelMapsDataSet<iModelMapsDrawCircle>.new(Self);
  FStrokeColor := '#FF0000';
  FStrokeOpacity := '0.8';
  FStrokeWeight:= '2';
  FFillcolor := '#FF0000';
  FFillOpacity := '0.35';
  FFator := '100';
end;

function TModelMapsGMapsDrawCircle.DataSet: iModelMapsDataSet<iModelMapsDrawCircle>;
begin
  Result := FDataSet;
end;

destructor TModelMapsGMapsDrawCircle.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsDrawCircle.&End: iModelMapsDraw;
begin
  Result := FParent;
end;

function TModelMapsGMapsDrawCircle.Fator(Value: integer): iModelMapsDrawCircle;
begin
  Result := Self;
  FFator := IntToStr(Value);
end;

function TModelMapsGMapsDrawCircle.FillColor(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FFillColor := Value;
end;

function TModelMapsGMapsDrawCircle.FillOpacity(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FFillopacity := Value;
end;

function TModelMapsGMapsDrawCircle.InfoWindow: iModelMapsInfoWindow<iModelMapsDrawCircle>;
begin
  FInfoWindow := TModelMapsInfoWindow<iModelMapsDrawCircle>.New(Self);
  Result := FInfoWindow;
end;

class function TModelMapsGMapsDrawCircle.New(
  Parent: iModelMapsDraw): iModelMapsDrawCircle;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsDrawCircle.ResultScript(MapName: string): String;
 var
  I: Integer;
  Circles, GeoCode, LatValue, LngValue, RadiusValue, InfoWindow, InfoContent: string;
begin
  Circles := 'let circles' + MapName + ' = [];';
  FDataSet.DataSet.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
    LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));
    RadiusValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.ValueName));
    InfoWindow := '';
    if Assigned(FInfoWindow) then
    begin
      InfoContent := FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString;
      if FDataSet.DataSet.Fields.FindField(FDataSet.InfoName) <> nil then
        InfoContent := FDataSet.Dataset.FieldByName(FDataSet.InfoName).AsString;
      InfoWindow := 'addCircleListener' + MapName + '(' +
        'circles' + MapName + '[circles' + MapName + '.length -1],' +
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
      Circles := Circles + 'circles' + MapName + '.push(' +
        'new google.maps.Circle({' +
          'strokeColor:"' + FStrokeColor + '",' +
          'strokeOpacity:' + FStrokeOpacity + ',' +
          'strokeWeight:' + FStrokeWeight + ',' +
          'fillColor:"' + FFillColor + '",' +
          'fillOpacity:' + FFillOpacity + ',' +
          'map:' + MapName + ',' +
          'center:{' +
            'lat:' + LatValue + ',' +
            'lng:' + LngValue + '},' +
          'radius: Math.sqrt(' + RadiusValue + ') * ' + FFator + ',' +
        '})' +
      ');' +
      InfoWindow;
    end
    else
    begin
      if FDataSet.DataSet.Fields.FindField(FDataSet.AddressName)<> nil then
      begin
        GeoCode := GeoCode + 'geocoder' + MapName + '.geocode(' +
          '{ address: "' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '" },' +
          'function (results, status) {' +
            'if (status == "OK") {' +
              'circles' + MapName + '.push(' +
                'new google.maps.Circle({' +
                  'strokeColor:"' + FStrokeColor + '",' +
                  'strokeOpacity:' + FStrokeOpacity + ',' +
                  'strokeWeight:' + FStrokeWeight + ',' +
                  'fillColor:"' + FFillColor + '",' +
                  'fillOpacity:' + FFillOpacity + ',' +
                  'map:' + MapName + ',' +
                  'center: results[0].geometry.location,' +
                  'radius: Math.sqrt(' + RadiusValue + ') * ' + FFator + ',' +
                '})' +
              ');' +
              InfoWindow +
              'bounds' + MapName + '.union(circles' + MapName +'[circles' + MapName + '.length -1].getBounds());' + MapName + '.fitBounds(bounds' + MapName + ');' +
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

  Result := Circles + GeoCode;
  Result := Result + 'for (var i = 0; i < circles' + MapName + '.length; i++) {' +
      'bounds' + MapName + '.union(circles' + MapName + '[i].getBounds());' +
    '}';

end;

function TModelMapsGMapsDrawCircle.StrokeColor(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FStrokeColor := Value;
end;

function TModelMapsGMapsDrawCircle.StrokeOpacity(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FStrokeOpacity := Value;
end;

function TModelMapsGMapsDrawCircle.StrokeWeight(
  Value: Integer): iModelMapsDrawCircle;
begin
  Result := Self;
  FStrokeWeight := IntToStr(Value);
end;

end.
