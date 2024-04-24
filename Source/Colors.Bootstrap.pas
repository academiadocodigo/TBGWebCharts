unit Colors.Bootstrap;

interface

type
  TTypeBackgroundColor = (bg_primary, bg_secondary, bg_success, bg_danger,
    bg_warning, bg_info, bg_light, bg_dark, bg_white, bg_transparent);
  TTypeBackgroundColorHelper = record helper for TTypeBackgroundColor
    function ToString : String;
  end;

implementation

uses
  System.TypInfo, System.SysUtils;

{ TTypeBackgroundColorHelper }

function TTypeBackgroundColorHelper.ToString: String;
begin
  Result := StringReplace(GetEnumName(TypeInfo(TTypeBackgroundColor), Integer(Self)),'_', '-', [rfReplaceAll]);
end;

end.
