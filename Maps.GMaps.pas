unit Maps.GMaps;

interface

uses
  Interfaces,
  System.SysUtils;

type
  TModelMapsGMaps = Class(TInterfacedObject, iModelMapsGeneric)
    private
      [weak]
      FParent : iModelMaps;
      FName : String;
      FHeight : String;
      FWidth : String;
      FOptions : iModelMapsOptions;
      FDraw : iModelMapsDraw;
      FLayer : iModelMapsLayer;
      FRoutes : iModelMapsRoutes;
    public
      constructor Create(Parent : IModelMaps);
      destructor Destroy; override;
      class function New(Parent : IModelMaps) : iModelMapsGeneric;

      function Name(Value : String) : iModelMapsGeneric; overload;
      function Height(Value : String) : iModelMapsGeneric;
      function Width(Value : String) : iModelMapsGeneric;
      function Options : iModelMapsOptions;
      function Name : String; overload;
      function ResultClass : string;
      function &End : iModelMaps;
      function GetGeoCodeResult(Value: TProc<String>) : iModelMapsGeneric;
      function GetDirectionResult(Value: TProc<String>) : iModelMapsGeneric;
      function Draw : iModelMapsDraw;
      function Layer : iModelMapsLayer;
      function Routes : iModelMapsRoutes;
    End;
implementation

uses
  Injection,
  JSCommand,
  Maps.GMaps.Options,
  Maps.GMaps.Draw,
  Maps.GMaps.Layer,
  Maps.Gmaps.Routes;

{ TMapsGMaps }

constructor TModelMapsGMaps.Create(Parent : IModelMaps);
begin
  TInjection.Weak(@FParent, Parent);
  FName := 'map';
  FHeight := 'height: 400px;';
  FOptions := TModelMapsGMapsOptions.New(Self);
end;

destructor TModelMapsGMaps.Destroy;
begin

  inherited;
end;

function TModelMapsGMaps.Draw: iModelMapsDraw;
begin
  FDraw :=  TModelMapsGMapsDraw.New(Self);
  Result := FDraw;
end;

function TModelMapsGMaps.&End: iModelMaps;
begin
  Result := FParent;
end;

function TModelMapsGMaps.GetDirectionResult(
  Value: TProc<String>): iModelMapsGeneric;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('getDirectionResult' + FName)
    .TagName('input')
    .TagID('directionResult_' + FName)
    .TagAttribute('value')
    .CallBack(Value);
  FParent.&End.ExecuteScriptCallback(CommandJS);

end;

function TModelMapsGMaps.GetGeoCodeResult(
  Value: TProc<String>): iModelMapsGeneric;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('getGeoCodeResult' + FName)
    .TagName('input')
    .TagID('geoCodeResult_' + FName)
    .TagAttribute('value')
    .CallBack(Value);
  FParent.&End.ExecuteScriptCallback(CommandJS);
end;

function TModelMapsGMaps.Height(Value: String): iModelMapsGeneric;
begin
  Result := Self;
  FHeight := 'height: ' + Value + ';';
end;

function TModelMapsGMaps.Layer: iModelMapsLayer;
begin
  FLayer := TModelMapsGmapsLayer.New(Self);
  Result := FLayer;
end;

function TModelMapsGMaps.Name(Value: String): iModelMapsGeneric;
begin
  Result := Self;
  FName := Value;
end;

function TModelMapsGMaps.Name: String;
begin
  Result := FName;
end;

class function TModelMapsGMaps.New(Parent: IModelMaps): iModelMapsGeneric;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMaps.Options: iModelMapsOptions;
begin
  Result := FOptions;
end;

function TModelMapsGMaps.ResultClass: string;
var
  DrawScript, LayerScript, RouteScript: string;
begin
  DrawScript := '';
  LayerScript := '';
  if Assigned(FDraw) then
    DrawScript := FDraw.ResultScript;

  if Assigned(FLayer) then
    LayerScript := FLayer.ResultScript;

  if Assigned(FRoutes) then
    RouteScript := FRoutes.ResultScript;

  Result := Result + '<div id="right-panel' + FName + '" style="display:none"></div>';
  Result := Result + '<div id="' + FName + '" style="' + FHeight + FWidth + '"></div>';
  Result := Result + '<input type=''hidden'' id=''geoCodeResult_' + FName + ''' value='''' />';
  Result := Result + '<input type=''hidden'' id=''directionResult_' + FName + ''' value='''' />';

  Result := Result +'<script>' +
    'function getGeoCodeResult' + FName + '() {' +
      'let result = JSON.stringify(geoCodeResult' + FName + ');' +
      'document.getElementById("geoCodeResult_' + FName + '").value = result;' +
    '}' +

    'function getDirectionResult' + FName + '() {' +
      'delete directionResult' + FName + '.routes[0].overview_path;' +
      'delete directionResult' + FName + '.routes[0].overview_polyline;' +
      'directionResult' + FName + '.routes[0].legs.forEach(leg => {' +
        'leg.steps.forEach(step => {' +
          'delete step.path;' +
          'delete step.lat_lngs;' +
          'delete step.encoded_lat_lngs;' +
          'delete step.polyline;' +
        '})' +
      '});' +

      'let result = JSON.stringify(directionResult' + FName + ');' +
      'document.getElementById("directionResult_' + FName + '").value = result;' +
    '}' +
    'function addMarkerListener' + FName + '(marker, infoWindow, startOpened) {' +
      'google.maps.event.addListener(marker, "click", () => {' +
        'infoWindow.open(' + FName + ', marker);' +
      '});' +
      'if (startOpened) infoWindow.open(map1, marker);' +
    '}' +

    'function addCircleListener' + FName + '(circle, infoWindow, startOpened) {' +
      'google.maps.event.addListener(circle, "click", () => {' +
        'infoWindow.setPosition(circle.getCenter());' +
        'infoWindow.open(' + FName + ');' +
      '});' +
      'if (startOpened) {' +
        'infoWindow.setPosition(circle.getCenter());' +
        'infoWindow.open(' + FName + ');' +
      '}' +
    '}' +

    'const ' + FName + ' = new google.maps.Map(document.getElementById("' + FName + '"), ' + FOptions.ResultScript + ');' +
    'let bounds' + FName + ' = new google.maps.LatLngBounds();' +
    'let geocoder' + FName + ' = new google.maps.Geocoder();' +
    'let geoCodeResult' + FName + ' = [];' +
    'let directionResult' + FName + ' = {};';
    Result := Result + DrawScript;
    Result := Result + LayerScript;
    Result := Result + RouteScript;
    Result := Result + 'if (!bounds' + FName + '.isEmpty()) {' +
      FName +'.fitBounds(bounds' + FName + ');' +
    '}';
  Result := Result + '</script>';

end;

function TModelMapsGMaps.Routes: iModelMapsRoutes;
begin
  FRoutes := TModelMapsGMapsRoutes.New(Self);
  Result := FRoutes;
end;

function TModelMapsGMaps.Width(Value: String): iModelMapsGeneric;
begin
  Result := Self;
  FWidth := 'width: ' + Value + ';';
end;

end.
