unit Maps.Gmaps.Routes.Directions;

interface

uses
  Interfaces,
  Charts.Types;

type
  TModelMapsGMapsRoutesDirections = class(TInterfacedObject, iModelMapsRoutesDirections)
    private
      [weak]
      FParent: iModelMapsRoutes;
      FDataSet : iModelMapsDataSet<iModelMapsRoutesDirections>;
      FOrigin : string;
      FDestination : string;
      FWayPoints : string;
      FTravelMode : string;
      FOptimizeWaypoints : string;
      FPanel : iModelMapsRoutesDirectionsPanel;
    public
      constructor Create(Parent : iModelMapsRoutes);
      destructor Destroy; override;
      class function New(Parent : iModelMapsRoutes) : iModelMapsRoutesDirections;
      function DataSet : iModelMapsDataSet<iModelMapsRoutesDirections>;
      function ResultScript(MapName: string) : String;
      function Origin(Value : string) : iModelMapsRoutesDirections;
      function Destination(Value : string) : iModelMapsRoutesDirections;
      function TravelMode(Value : TTypeMapTravelMode) : iModelMapsRoutesDirections;
      function OptimizeWaypoints(Value : boolean) : iModelMapsRoutesDirections;
      function Panel : iModelMapsRoutesDirectionsPanel;
      procedure GeneratedWaypoints;
      function GeneratedPanel(MapName : string) : string;
      function &End : iModelMapsRoutes;

  end;
implementation

uses
  Injection,
  Maps.Dataset, Utilities.Str, Maps.Gmaps.Routes.Directions.Panel;

{ TModelMapsGMapsRoutesDirections }

constructor TModelMapsGMapsRoutesDirections.Create(Parent: iModelMapsRoutes);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TModelMapsDataSet<iModelMapsRoutesDirections>.new(Self);
  FTravelMode := 'google.maps.TravelMode.DRIVING';
  FOptimizeWaypoints := 'true';
end;

function TModelMapsGMapsRoutesDirections.DataSet: iModelMapsDataSet<iModelMapsRoutesDirections>;
begin
  Result := FDataSet;
end;

function TModelMapsGMapsRoutesDirections.Destination(
  Value: string): iModelMapsRoutesDirections;
begin
  Result := Self;
  if Value <> '' then
    FDestination := '"' + Value + '"';
end;

destructor TModelMapsGMapsRoutesDirections.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsRoutesDirections.&End: iModelMapsRoutes;
begin
  Result := FParent;
end;

function TModelMapsGMapsRoutesDirections.GeneratedPanel(
  MapName: string): string;
var
  PanelMap : string;
begin
  Result := '';
  if Assigned(FPanel) then
  begin
    PanelMap := 'panel' + MapName;
    Result := 'const ' + PanelMap + ' = document.getElementById("right-panel' + MapName + '");' +
      PanelMap + '.style.display = "block";' +
      PanelMap + '.style.height = document.getElementById("' + MapName + '").style.height;' +
      PanelMap + '.style.width = "' + FPanel.Width + '";' +
      PanelMap + '.style.float = "' + FPanel.FloatPos + '";' +
      PanelMap + '.style.overflow = "auto";' +
      PanelMap + '.style.lineHeight = "30px";' +
      PanelMap + '.style.paddingLeft = "10px";' +

      'directionsRenderer' + MapName + '.setPanel(document.getElementById("right-panel' + MapName + '"));';
  end;

end;

procedure TModelMapsGMapsRoutesDirections.GeneratedWaypoints;
var
  I : Integer;
  addWaypoint : boolean;
  Aux, LatValue, LngValue, Waypoint : string;
begin
  FWayPoints := '[';
  if Assigned(FDataSet.DataSet) then
  begin
    Aux := ',';
    FDataSet.DataSet.First;
    for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
    begin
      addWaypoint := true;
      LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
      LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));

      if (LatValue <> '') and (LngValue <> '') then
        Waypoint := '{lat: ' + LatValue + ', lng: ' + LngValue + '}'
      else
        Waypoint := '"' + FDataSet.DataSet.FieldByName(FDataSet.AddressName).AsString + '"';

      if FOrigin = '' then
      begin
        FOrigin := Waypoint;
        addWaypoint := false;
      end;
      if I = Pred(FDataSet.DataSet.RecordCount) then
      begin
        Aux := '';
        if FDestination = '' then
        begin
          FDestination := Waypoint;
          addWaypoint := false;
        end;
      end;

      if addWaypoint then
        FWayPoints := FWayPoints + '{location:' + Waypoint + ', stopover: true,}' + Aux;

      FDataSet.DataSet.Next;
    end;
  end;
  FWayPoints := FWayPoints + ']';
end;

class function TModelMapsGMapsRoutesDirections.New(
  Parent: iModelMapsRoutes): iModelMapsRoutesDirections;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsRoutesDirections.OptimizeWaypoints(
  Value: boolean): iModelMapsRoutesDirections;
begin
  Result := Self;
  if Value then
    FOptimizeWaypoints := 'true'
  else
    FOptimizeWaypoints := 'false';
end;

function TModelMapsGMapsRoutesDirections.Origin(
  Value: string): iModelMapsRoutesDirections;
begin
  Result := Self;
  if Value <> '' then
    FOrigin :=  '"' + Value + '"';
end;

function TModelMapsGMapsRoutesDirections.Panel: iModelMapsRoutesDirectionsPanel;
begin
  FPanel := TModelMapsGMapsRoutesDirectionsPanel.New(Self);
  Result := FPanel;
end;

function TModelMapsGMapsRoutesDirections.ResultScript(MapName: string): String;
var
  directionsService, directionsRenderer, waypts, MapsPanel: string;
begin
  GeneratedWaypoints;
  directionsService := 'directionsService' + MapName;
  directionsRenderer := 'directionsRenderer' + MapName;
  waypts := 'waypts' + MapName;
  MapsPanel := GeneratedPanel(MapName);

  Result := 'const ' + directionsService + ' = new google.maps.DirectionsService();' +
    'const ' + directionsRenderer + ' = new google.maps.DirectionsRenderer();' +
    directionsRenderer + '.setMap(' + MapName + ');' +
    MapsPanel +
    'const ' + waypts + ' = ' + FWayPoints + ';' +
    directionsService + '.route(' +
      '{' +
        'origin: ' + FOrigin + ',' +
        'destination: ' + FDestination + ',' +
        'waypoints: ' + waypts + ',' +
        'optimizeWaypoints: ' + FOptimizeWaypoints + ',' +
        'travelMode: ' + FTravelMode + ',' +
      '},' +
      '(response, status) => {' +
        'if (status === "OK" && response) {' +
          directionsRenderer + '.setDirections(response);' +
          'directionResult' + MapName + ' = response;' +
        '} else {' +
          'window.alert("Directions request failed due to " + status);' +
        '}' +
      '}' +
    ');';
end;

function TModelMapsGMapsRoutesDirections.TravelMode(
  Value: TTypeMapTravelMode): iModelMapsRoutesDirections;
begin
   Result := Self;
   FTravelMode:= 'google.maps.TravelMode.' + TTypeMapTravelMode(Value).ToString;
end;

end.
