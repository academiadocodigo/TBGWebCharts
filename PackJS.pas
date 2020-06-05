unit PackJS;

interface

uses
  Interfaces,
  Classes;
type
  TPackJS = class(TInterfacedObject,iModelJS)
    private
      FPack : TStringList;
      FCDN : Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelJS;
      function PackJS : String;
      function CDN(Value : Boolean) : iModelJS;
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
  PivotTablePlotlyJS, PivotTablePlotlyRendersJS;

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
    Result := Result + '<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>';
    Result := Result + '<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>';
    Result := Result + '<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>';
    Result := Result + '<script src="https://kit.fontawesome.com/b9e0a0bfd1.js" crossorigin="anonymous"></script>';
    Result := Result + '<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/r-2.2.3/sl-1.3.1/datatables.min.js"></script>';
    Result := Result + '<script src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"></script>';
    Result := Result + '<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>';
    Result := Result + '<script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>';
    Result := Result + '<script type="text/javascript" src="https://pivottable.js.org/dist/pivot.js"></script>';
    Result := Result + '<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>';
    Result := Result + '<script src="https://cdn.plot.ly/plotly-basic-latest.min.js"></script>';
    Result := Result + '<script type="text/javascript" src="https://pivottable.js.org/dist/plotly_renderers.js"></script>';
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
        TChartbundleJS.New.PackJS+
        TFontawesomeallJS.New.PackJS+
        TJqueryJS.New.PackJS+
        TPopperJS.New.PackJS+
        TTetherminJS.New.PackJS+
        TUtilsJS.New.PackJS+
        TNumberJS.New.PackJS+
        TDataTableJS.New.PackJS+
        TChartEasyPieJS.New.PackJS+
        TPivotTableJS.New.PackJS+
        TJQueryUIJS.New.PackJS+
        TPivotTablePlotlyJS.New.PackJS+
        TPivotTablePlotlyRendersJs.New.PackJS;
end;

end.
