unit Chart.Easy.PieCSS;

interface

uses
  Interfaces;

type
  TChartEasyPieCSS = class (TInterfacedObject, iModelCss)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCss;
      function PackCSS : String;
      function CDN(Value : Boolean) : iModelCSS;
      function BackgroundColor ( Value : String ) :  iModelCSS;
      function FontColor ( Value : String ) : iModelCSS;
      function BorderColor ( Value : String ) : iModelCSS;
  end;

implementation

{ TChartEasyPieCSS }

function TChartEasyPieCSS.BackgroundColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

function TChartEasyPieCSS.BorderColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

function TChartEasyPieCSS.CDN(Value: Boolean): iModelCSS;
begin
  Result := SElf;
end;

constructor TChartEasyPieCSS.Create;
begin

end;

destructor TChartEasyPieCSS.Destroy;
begin

  inherited;
end;

function TChartEasyPieCSS.FontColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

class function TChartEasyPieCSS.New: iModelCss;
begin
  Result := Self.Create;
end;

function TChartEasyPieCSS.PackCSS: String;
begin
  Result := Result + '<style>'+#13;
  Result := Result + '.easyPieChart {';
  Result := Result + 'position: relative;';
  Result := Result + 'text-align: center;';
  Result := Result + '}';
  Result := Result + '';
  Result := Result + '.easyPieChart canvas {';
  Result := Result + 'position: absolute;';
  Result := Result + 'top: 0;';
  Result := Result + 'left: 0;';
  Result := Result + '}';
  Result := Result + '</style>'+#13;
end;

end.
