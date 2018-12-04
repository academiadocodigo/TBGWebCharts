unit Charts.Labelling;

interface

uses
  Interfaces, Classes;

Type
  TChartsLabelling = class(TInterfacedObject, iLabelLing)
    private
      FParent : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iLabelLing;
      function Result : String;
  end;

implementation

{ TChartsLabelling }

constructor TChartsLabelling.Create;
begin

end;

destructor TChartsLabelling.Destroy;
begin

  inherited;
end;

class function TChartsLabelling.New: iLabelLing;
begin
  Result := Self.Create;
end;

function TChartsLabelling.Result: String;
begin
  FParent := FParent + 'Chart.plugins.register({' ;
  FParent := FParent + 'afterDatasetsDraw: function(chart) { ';
  FParent := FParent + 'var ctx = chart.ctx;';
  FParent := FParent + '';
  FParent := FParent + 'chart.data.datasets.forEach(function(dataset, i) { ';
  FParent := FParent + 'var meta = chart.getDatasetMeta(i); ';
  FParent := FParent + 'if (!meta.hidden) { ';
  FParent := FParent + 'meta.data.forEach(function(element, index) { ';
  FParent := FParent + 'ctx.fillStyle = ''rgb(133, 133, 133)''; ';
  FParent := FParent + '';
  FParent := FParent + 'var fontSize = 12; ';
  FParent := FParent + 'var fontStyle = ''normal''; ';
  FParent := FParent + 'var fontFamily = ''Open Sans''; ';
  FParent := FParent + 'ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily); ';
  FParent := FParent + '';
  FParent := FParent + 'var dataString = dataset.data[index].toString();';
  FParent := FParent + '';
  FParent := FParent + 'ctx.textAlign = ''center''; ';
  FParent := FParent + 'ctx.textBaseline = ''middle''; ';
  FParent := FParent + '';
  FParent := FParent + 'var padding = 5; ';
  FParent := FParent + 'var position = element.tooltipPosition(); ';
  FParent := FParent + 'ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding); ';
  FParent := FParent + '});';
  FParent := FParent + '}';
  FParent := FParent + '});';
  FParent := FParent + '}';
  FParent := FParent + '});';
  Result := FParent;
end;

end.
