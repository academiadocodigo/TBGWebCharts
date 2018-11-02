unit PackJS;

interface

uses Interfaces, Classes, BootstrapJS, ChartbundleJS, FontawesomeallJS,
	JqueryJS, PopperJS, TetherminJS, UtilsJS;

type
  TPackJS = class(TInterfacedObject,iModelJS)
    private
      FPack : TStringList;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelJS;
      function PackJS : String;
  end;

implementation

uses
  SysUtils;

{ TPackJS }

constructor TPackJS.Create;
begin
  FPack := TStringList.Create;
end;

destructor TPackJS.Destroy;
begin
  freeandnil(fpack);
  inherited;
end;

class function TPackJS.New: iModelJS;
begin
  Result := Self.Create;
end;

function TPackJS.PackJS: String;
begin
  Result := FPack.Text+
			TBootstrapJS.New.PackJS+
			TChartbundleJS.New.PackJS+
			TFontawesomeallJS.New.PackJS+
			TJqueryJS.New.PackJS+
			TPopperJS.New.PackJS+
			TTetherminJS.New.PackJS+
			TUtilsJS.New.PackJS;
end;

end.
