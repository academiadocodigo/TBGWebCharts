unit Maps.GMaps.Options;

interface

uses
  Interfaces,
  Charts.Types;

type
  TModelMapsGMapsOptions = class(TInterfacedObject, iModelMapsOptions)
    private
      FParent : iModelMapsGeneric;
      FCenter : iModelGenericCoordinates<iModelMapsOptions>;
      FFullScreenControl : string;
      FMapTypeControl : string;
      FStreetViewControl : string;
      FZoomControl : string;
      FMapStyle : string;
      FZoom : String;

    public
      constructor Create(Parent : iModelMapsGeneric);
      destructor Destroy; override;
      class function New(Parent : iModelMapsGeneric) : iModelMapsOptions;
      function Center : iModelGenericCoordinates<iModelMapsOptions>;
      function Zoom(Value : Integer) : iModelMapsOptions;

      function FullScreenControl : iModelMapsOptions;
      function MapTypeControl : iModelMapsOptions;
      function StreetViewControl : iModelMapsOptions;
      function ZoomControl : iModelMapsOptions;

      function MapStyle(Value : TTypeMapStyle) : iModelMapsOptions;
      function ResultScript : String;
      function &End : iModelMapsGeneric;

  end;
implementation

uses
  Injection,
  Generic.Coordinates, System.SysUtils;

{ TModelMapsGMapsOptions }

function TModelMapsGMapsOptions.Center: iModelGenericCoordinates<iModelMapsOptions>;
begin
  Result := FCenter;

end;

constructor TModelMapsGMapsOptions.Create(Parent: iModelMapsGeneric);
begin
  TInjection.Weak(@FParent, Parent);
  FCenter := TModelGenericCoordinates<iModelMapsOptions>.New(Self);
  FCenter
    .Latitude('-22.87545556')
    .Longitude('-42.00746667')
  .&End;
  FZoom := 'zoom: 0,';
  FFullScreenControl := 'fullscreenControl: false,';
  FMapTypeControl := 'mapTypeControl: false,';
  FStreetViewControl := 'streetViewControl: false,';
  FZoomControl := 'zoomControl: false,';
end;

destructor TModelMapsGMapsOptions.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsOptions.&End: iModelMapsGeneric;
begin
  Result := FParent;
end;

function TModelMapsGMapsOptions.FullScreenControl: iModelMapsOptions;
begin
  Result := Self;
  FFullScreenControl := 'fullscreenControl: true,';
end;

function TModelMapsGMapsOptions.MapStyle(Value : TTypeMapStyle): iModelMapsOptions;
begin
  Result := Self;
  FMapStyle := 'mapTypeId: "' + TTypeMapStyle(Value).ToString + '",';
end;

function TModelMapsGMapsOptions.MapTypeControl: iModelMapsOptions;
begin
  Result := Self;
  FMapTypeControl := 'mapTypeControl: true,';
end;

class function TModelMapsGMapsOptions.New(
  Parent: iModelMapsGeneric): iModelMapsOptions;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsOptions.ResultScript: String;
var
  center : String;
begin
  if Assigned(FCenter) then
    center := 'center: { lat: ' + FCenter.Latitude + ', lng: ' + FCenter.Longitude + '},';
  Result := '{' +
        center +
        FZoom +
        FFullScreenControl +
        FMapTypeControl +
        FStreetViewControl +
        FZoomControl +
        FMapStyle +
      '}';
end;

function TModelMapsGMapsOptions.StreetViewControl: iModelMapsOptions;
begin
  Result := Self;
  FStreetViewControl := 'streetViewControl: true,';
end;

function TModelMapsGMapsOptions.Zoom(Value: Integer): iModelMapsOptions;
begin
  Result := Self;
  if (Value > 0) and (Value < 19) then
    FZoom := 'zoom: ' + IntToStr(Value) + ',';
end;

function TModelMapsGMapsOptions.ZoomControl: iModelMapsOptions;
begin
  Result := Self;
  FZoomControl := 'zoomControl: true,';
end;

end.
