unit Charts.Types;

interface

uses
  TypInfo;

type
  TTypeContainer = (_container, fluid, lg, md, sm, xl);

  TTyperContainerHelper = record helper for TTYpeContainer
    function ToString : String;
  end;

type
  TTypeChart = (line, bar, radar, pie, doughnut, polarArea, bubble, scatter, horizontalBar);

  TTypeChartHelper = record helper for TTypeChart
    function ToString : String;
  end;

type
  TTypeMaps = (GMaps);

type
  TTypeMapStyle = (Hybrid, RoadMap, Satellite, Terrain);

  TTypeMapsStyleHelper = record helper for TTypeMapStyle
    function ToString : string;
  end;

type
  TTypeMapTravelMode = (Bicycling, Driving, Transit, Walking);

  TTypeMapTravelModeHelper = record helper for TTypeMapTravelMode
    function ToString : string;
  end;

type
  TTypeCardStyled = (CardStyledIconRight);

implementation

uses
  System.SysUtils;
{ TTypeChartHelper }

function TTypeChartHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTypeChart), Integer(Self));
end;

{ TTyperContainerHelper }

function TTyperContainerHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTypeContainer), Integer(Self));
end;

{ TTypeMapsStyleHelper }

function TTypeMapsStyleHelper.ToString: string;
begin
  Result := lowerCase(GetEnumName(TypeInfo(TTypeMapStyle), Integer(Self)));
end;

{ TTypeMapTravelModeHelper }

function TTypeMapTravelModeHelper.ToString: string;
begin
  Result := upperCase(GetEnumName(TypeInfo(TTypeMapTravelMode), Integer(Self)));
end;

end.
