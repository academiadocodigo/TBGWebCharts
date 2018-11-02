unit PackCss;

interface

uses Interfaces, Classes, BootstrapCss;

type
  TPackCss = class(TInterfacedObject,iModelCSS)
    private
      FPack : TStringList;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCSS;
      function PackCSS : String;
  end;

implementation

uses
  SysUtils;

{ TPackCss }

constructor TPackCss.Create;
begin
  FPack := TStringList.Create;
end;

destructor TPackCss.Destroy;
begin
  FreeAndNil(FPack);
  inherited;
end;

class function TPackCss.New: iModelCSS;
begin
  Result := Self.Create;
end;

function TPackCss.PackCSS: String;
begin
  Result := TBootstrapCss.New.PackCSS;
end;

end.
