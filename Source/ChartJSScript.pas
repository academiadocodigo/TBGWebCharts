unit ChartJSScript;

interface
uses
  Interfaces;

Type
  TChartJSScript = class(TInterfacedObject, iModelJS)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelJS;
    function PackJS: String;
    function CDN(Value: Boolean): iModelJS;
    function Credenciais(Value : iModelCredenciais) : iModelJS;
  end;

implementation

{ TChartJSScript }

function TChartJSScript.CDN(Value: Boolean): iModelJS;
begin
  Result := Self;
end;

constructor TChartJSScript.Create;
begin

end;

function TChartJSScript.Credenciais(Value: iModelCredenciais): iModelJS;
begin
  Result := Self;
end;

destructor TChartJSScript.Destroy;
begin

  inherited;
end;

class function TChartJSScript.New : iModelJS;
begin
  Result := Self.Create;
end;

function TChartJSScript.PackJS: String;
begin
     Result := Result + '<script>' +
     'var beforeInitChart = function (chart) {'
    +   'if (chart.options.hideLabelEmptyData || chart.options.skipEmptyData) {'
    +     'let datasetContent = new Array(chart.data.labels.length);'
    +     'chart.data.datasets.forEach(function (dataset, i) {'
    +       'dataset.data.forEach(function (item, indice) {'
    +         'let dataNumber = numeral(item);'
    +         'datasetContent[indice] = datasetContent[indice] || dataNumber.value() > 0;'
    +       '});'
    +     '});'
    +     'for (x = datasetContent.length - 1; x > -1; x--) {'
    +       'if (!datasetContent[x]) {'
    +         'if (chart.options.hideLabelEmptyData) {'
    +           'chart.data.labels[x] = "";'
    +         '}'
    +         'if (chart.options.skipEmptyData) {'
    +           'chart.data.labels.splice(x, 1);'
    +           'chart.data.datasets.forEach(function (dataset) {'
    +             'dataset.data.splice(x, 1);'
    +           '});'
    +         '}'
    +       '}'
    +     '}'
    +   '}'
    + '};</script>';

end;

end.
