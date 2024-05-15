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
      function UpdateDomElement : string;
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
  GMapsJS,
  LiquidFillGaugeJS,
  D3JS,
  QuillEditorJS, QuillDeltaConverter, ChartJSScript;
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
    Result := Result + TD3JS.New.CDN(FCDN).PackJS;
    Result := Result + TLiquidFillGaugeJS.New.CDN(FCDN).PackJS;
    Result := Result + TQuillEditorJS.New.CDN(FCDN).PackJS;
    Result := Result + TQuillDeltaConverter.New.CDN(FCDN).PackJS;
    Result := Result + TChartJSScript.New.CDN(FCDN).PackJS;
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
        TJqueryJS.New.PackJS+
        TPopperJS.New.PackJS+
        TBootstrapJS.New.PackJS+
        TFontawesomeallJS.New.PackJS+
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
        TGMapsJS.New.Credenciais(FCredenciais).PackJS+
        TD3JS.New.PackJS+
        TLiquidFillGaugeJS.New.PackJS+
        TQuillEditorJS.New.CDN(FCDN).PackJS+
        TQuillDeltaConverter.New.CDN(FCDN).PackJS+
        TChartJSScript.new.CDN(FCDN).PackJS;
  Result := Result + UpdateDomElement;
end;
function TPackJS.UpdateDomElement: string;
begin
  Result := '<script>' +
              'function UpdateDOM(elementId, html) {' +
                'let DOMElement = document.getElementById(elementId);' +
                'if (DOMElement) {' +
                  'DOMElement.innerHTML = html;' +
                '}' +
              '}' +
            '</script>';
end;

end.
