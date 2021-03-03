unit GMapsJS;

interface

uses Interfaces, Classes;

type
  TGMapsJS = class(TInterfacedObject, iModelJS)
  private
    FCDN : Boolean;
    FCredenciais : iModelCredenciais;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelJS;

    function PackJS: String;
    function CDN(Value: Boolean): iModelJS;
    function Credenciais(Value : iModelCredenciais) : iModelJS;
  end;
implementation

{ TGMapsJS }

function TGMapsJS.CDN(Value: Boolean): iModelJS;
begin
  Result := Self;
  FCDN := Value;
end;

constructor TGMapsJS.Create;
begin

end;

function TGMapsJS.Credenciais(Value: iModelCredenciais): iModelJS;
begin
  Result := Self;
  FCredenciais := Value;
end;

destructor TGMapsJS.Destroy;
begin

  inherited;
end;

class function TGMapsJS.New: iModelJS;
begin
  Result := Self.Create;
end;

function TGMapsJS.PackJS: String;
begin
  Result := '';
  if Assigned(FCredenciais) then
  begin
    Result := '<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>' +
      '<script src="https://maps.googleapis.com/maps/api/js?key=' + FCredenciais.APIGoogle + '&libraries=visualization" ></script>';
  end;
end;

end.
