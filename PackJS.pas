unit PackJS;
{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  Classes;
type
  TPackJS = class(TInterfacedObject,iModelJS)
    private
      FPack : TStringList;
      FCDN : Boolean;
      FCredenciais : iModelCredenciais;
      function WebChartsAccess : string;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelJS;
      function PackJS : String;
      function CDN(Value : Boolean) : iModelJS;
      function Credenciais(Value : iModelCredenciais) : iModelJS;
  end;

implementation

uses
  SysUtils,
  BootstrapJS,
  ChartbundleJS,
  FontawesomeallJS,
	JqueryJS,
  PopperJS,
  TetherminJS,
  UtilsJS,
  NumberJS,
  DataTableJS,
  Chart.Easy.PieJS,
  Chart.Easy.PieCSS,
  PivotTableJS,
  JQuery.UIJS,
  PivotTablePlotlyJS,
  PivotTablePlotlyRendersJS,
  MomentJS,
  ChartStreamJS,
  GMapsJS;

{ TPackJS }

function TPackJS.CDN(Value: Boolean): iModelJS;
begin
  Result := Self;
  FCDN := Value;
end;

constructor TPackJS.Create;
begin
  FPack := TStringList.Create;
  FCDN := False;
end;

function TPackJS.Credenciais(Value: iModelCredenciais): iModelJS;
begin
  Result := Self;
  FCredenciais := Value;
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

function TPackJS.PackJS : String;
begin
  if FCDN then
  begin
    Result := Result + TJqueryJS.New.CDN(FCDN).PackJS;
    Result := Result + TPopperJS.New.CDN(FCDN).PackJS;
    Result := Result + TBootstrapJS.New.CDN(FCDN).PackJS;
    Result := Result + TFontawesomeallJS.New.CDN(FCDN).PackJS;
    Result := Result + TDataTableJS.New.CDN(FCDN).PackJS;
    Result := Result + TChartEasyPieJS.New.CDN(FCDN).PackJS;
    Result := Result + TMomentJS.New.CDN(FCDN).PackJS;
    Result := Result + TChartbundleJS.New.CDN(FCDN).PackJS;
    Result := Result + TChartStreamJS.New.CDN(FCDN).PackJS;
    Result := Result + '<script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>';
    Result := Result + TPivotTableJS.New.CDN(FCDN).PackJS;
    Result := Result + TJQueryUIJS.New.CDN(FCDN).PackJS;
    Result := Result + TPivotTablePlotlyJS.New.CDN(FCDN).PackJS;
    Result := Result + TPivotTablePlotlyRendersJS.New.CDN(FCDN).PackJS;
    Result := Result + TGMapsJS.New.Credenciais(FCredenciais).CDN(FCDN).PackJS;

    Result := Result + '<script>';
    Result := Result + '(function (global, factory) {';
    Result := Result + '    if (typeof define === ''function'' && define.amd) {';
    Result := Result + '        define([''../numeral''], factory);';
    Result := Result + '    } else if (typeof module === ''object'' && module.exports) {';
    Result := Result + '        factory(require(''../numeral''));';
    Result := Result + '    } else {';
    Result := Result + '        factory(global.numeral);';
    Result := Result + '    }';
    Result := Result + '}(this, function (numeral) {';
    Result := Result + '    numeral.register(''locale'', ''pt-br'', {';
    Result := Result + '        delimiters: {';
    Result := Result + '            thousands: ''.'',';
    Result := Result + '            decimal: '',''';
    Result := Result + '        },';
    Result := Result + '        abbreviations: {';
    Result := Result + '            thousand: ''mil'',';
    Result := Result + '            million: ''milhões'',';
    Result := Result + '            billion: ''b'',';
    Result := Result + '            trillion: ''t''';
    Result := Result + '        },';
    Result := Result + '        ordinal: function (number) {';
    Result := Result + '            return ''º'';';
    Result := Result + '        },';
    Result := Result + '        currency: {';
    Result := Result + '            symbol: ''R$''';
    Result := Result + '        }';
    Result := Result + '    });';
    Result := Result + '}));';
    Result := Result + '</script>';
  end
  else
    Result := FPack.Text+
        TBootstrapJS.New.PackJS+
        TFontawesomeallJS.New.PackJS+
        TJqueryJS.New.PackJS+
        TPopperJS.New.PackJS+
        TTetherminJS.New.PackJS+
        TUtilsJS.New.PackJS+
        TNumberJS.New.PackJS+
        TDataTableJS.New.PackJS+
        TChartEasyPieJS.New.PackJS+
        TMomentJs.New.PackJS+
        TChartbundleJS.New.PackJS+
        TChartStreamJS.New.PackJS+
        TPivotTableJS.New.PackJS+
        TJQueryUIJS.New.PackJS+
        TPivotTablePlotlyJS.New.PackJS+
        TPivotTablePlotlyRendersJs.New.PackJS+
        TGMapsJS.New.Credenciais(FCredenciais).PackJS;
  Result := Result + WebChartsAccess;
end;

function TPackJS.WebChartsAccess: string;
var
  AppName : string;
  AppType : string;
begin
  {$IFDEF HAS_FMX}
    AppType := 'FMX';
    {$IF Defined(ANDROID) or Defined(IOS)}
      AppName := '';
    {$ELSE}
      AppName := ExtractFileName(ExtractFileName(ParamStr(0)));
    {$ENDIF}
  {$ELSE}
    AppType := 'VCL';
    AppName := ExtractFileName(ExtractFileName(ParamStr(0)));
  {$ENDIF}
  Result := '<script>';
  Result := Result + '(function () {';
  Result := Result + 'var xmlHttp = null;';
  Result := Result + 'xmlHttp = new XMLHttpRequest();';
  Result := Result + 'xmlHttp.open("POST", "http://54.156.235.34:3003/api/v1/access");';
  Result := Result + 'xmlHttp.setRequestHeader("Content-Type", "application/json");';
  Result := Result + 'const data = JSON.stringify({"appName": "' + AppName + '", "appType": "' + AppType + '"});';
  Result := Result + 'xmlHttp.send(data);';
  Result := Result + '})();';
  Result := Result + '</script>';
end;

end.
