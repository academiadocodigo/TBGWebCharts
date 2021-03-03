unit Maps.GMaps;

interface

uses
  Interfaces;

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

      function Draw : iModelMapsDraw;
      function Layer : iModelMapsLayer;
    End;
implementation

uses
  Injection,
  Maps.GMaps.Options,
  Maps.GMaps.Draw,
  Maps.GMaps.Layer;

{ TMapsGMaps }

constructor TModelMapsGMaps.Create(Parent : IModelMaps);
begin
  TInjection.Weak(@FParent, Parent);
  FName := 'map';
  FHeight := 'height: 400px;';
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
  FOptions := TModelMapsGMapsOptions.New(Self);
  Result := FOptions;
end;

function TModelMapsGMaps.ResultClass: string;
var
  DrawScript, LayerScript: string;
begin
  DrawScript := '';
  LayerScript := '';
  if Assigned(FDraw) then
    DrawScript := FDraw.ResultScript;

  if Assigned(FLayer) then
    LayerScript := FLayer.ResultScript;
  Result := Result + '<div id="' + FName + '" style="' + FHeight + FWidth + '"></div>';
  Result := Result +'<script>' +
    'const ' + FName + ' = new google.maps.Map(document.getElementById("' + FName + '"), ' + FOptions.ResultScript + ');' +
    'let bounds' + FName + ' = new google.maps.LatLngBounds();';
  Result := Result + DrawScript + LayerScript;
  Result := Result + 'if (!bounds' + FName + '.isEmpty()) {' +
    FName +'.fitBounds(bounds' + FName + ');' +
    '}';
  Result := Result + '</script>';

end;

function TModelMapsGMaps.Width(Value: String): iModelMapsGeneric;
begin
  Result := Self;
  FWidth := 'width: ' + Value + ';';
end;

end.
