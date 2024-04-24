unit LiquidFillGaugeCSS;

interface

uses
  Interfaces;


Type
  TLiquidFillGaugeCSS = class(TInterfacedObject, iModelCSS)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelCSS;
    function PackCSS : String;
    function CDN(Value : Boolean) : iModelCSS;
    function BackgroundColor ( Value : String ) :  iModelCSS;
    function FontColor ( Value : String ) : iModelCSS;
    function BorderColor ( Value : String ) : iModelCSS;
  end;

implementation

{ TLiquidFillGaugeCSS }

function TLiquidFillGaugeCSS.BackgroundColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

function TLiquidFillGaugeCSS.BorderColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

function TLiquidFillGaugeCSS.CDN(Value: Boolean): iModelCSS;
begin
  Result := Self;
end;

constructor TLiquidFillGaugeCSS.Create;
begin

end;

destructor TLiquidFillGaugeCSS.Destroy;
begin

  inherited;
end;

function TLiquidFillGaugeCSS.FontColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

class function TLiquidFillGaugeCSS.New : iModelCSS;
begin
  Result := Self.Create;
end;

function TLiquidFillGaugeCSS.PackCSS: String;
begin
  Result := Result + '<style>';
  Result := Result + '.liquidFillGaugeText { font-family: Helvetica; font-weight: bold; }';
  Result := Result + '</style>';
end;

end.
