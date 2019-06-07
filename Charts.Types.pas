unit Charts.Types;

interface

uses
  TypInfo;

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

end.
