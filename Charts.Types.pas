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

implementation

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

end.
