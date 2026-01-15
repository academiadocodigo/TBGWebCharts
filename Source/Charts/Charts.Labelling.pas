unit Charts.Labelling;

interface

uses
  Classes, Interfaces;

Type
  TChartsLabelling<T : IInterface> = class(TInterfacedObject, iModelLabellingConfig<T>)
    private
      FParent : T;
      FFormat : String;
      FAction : String;
      FResult : String;
      FRGBColor : String;
      FFontSize : Integer;
      FFontStyle : String;
      FFontFamily : String;
      FHideZeroValues : Boolean;
      FPadding : Integer;
      FPaddingX : Integer;
      FUseNegativeColor: Boolean;
      FNegativeRGBColor: String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelLabellingConfig<T>;
      function Result : String;
      function Format ( Value : String) : iModelLabellingConfig<T>; overload;
      function Format : String; overload;
      function RGBColor ( Value : String ) : iModelLabellingConfig<T>; overload;
      function RGBColor : String; overload;
      function FontSize ( Value : Integer) : iModelLabellingConfig<T>; overload;
      function FontSize : Integer; overload;
      function FontStyle (Value : String) : iModelLabellingConfig<T>; overload;
      function FontStyle : String; overload;
      function FontFamily (Value : String) : iModelLabellingConfig<T>; overload;
      function FontFamily : String; overload;
      function HideZeroValues(Value : boolean) : iModelLabellingConfig<T>; overload;
      function Padding (Value : Integer) : iModelLabellingConfig<T>; overload;
      function Padding : Integer; overload;
      function PaddingX (Value : Integer) : iModelLabellingConfig<T>; overload;
      function PaddingX : Integer; overload;
      function NegativeRGBColor(Value: String): iModelLabellingConfig<T>; overload;
      function UseNegativeColor(Value: Boolean): iModelLabellingConfig<T>; overload;
      function &End : T;

  end;

implementation

uses
  Charts.Config, System.SysUtils, Injection;


{ TChartsLabelling }

function TChartsLabelling<T>.&End: T;
begin
  Result := FParent;
end;

constructor TChartsLabelling<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FFormat :='';
  FRGBColor := '133, 133, 133';
  FFontSize := 12;
  FFontStyle := 'normal';
  FFontFamily := 'Open Sans';
  FPadding := 5;
  FPaddingX := 0;
  FHideZeroValues := False;
end;

destructor TChartsLabelling<T>.Destroy;
begin

  inherited;
end;

function TChartsLabelling<T>.FontFamily(
  Value: String): iModelLabellingConfig<T>;
begin
  Result := Self;
  FFontFamily := Value;
end;

function TChartsLabelling<T>.FontFamily: String;
begin
  Result := FFontFamily;
end;

function TChartsLabelling<T>.FontSize(Value: Integer): iModelLabellingConfig<T>;
begin
  Result := Self;
  FFontSize := Value;
end;

function TChartsLabelling<T>.FontSize: Integer;
begin
  Result := FFontSize;
end;

function TChartsLabelling<T>.FontStyle(Value: String): iModelLabellingConfig<T>;
begin
  Result := Self;
  FFontStyle := Value;
end;

function TChartsLabelling<T>.FontStyle: String;
begin
  Result := FFontStyle;
end;

function TChartsLabelling<T>.Format: String;
begin
  Result := FFormat;
end;

function TChartsLabelling<T>.HideZeroValues(
  Value: boolean): iModelLabellingConfig<T>;
begin
  Result := Self;
  FHideZeroValues := Value;
end;

function TChartsLabelling<T>.Format(Value: String): iModelLabellingConfig<T>;
begin
  Result := Self;
  FFormat := Value;
  FAction := 'numeral.locale(''pt-br''); var dataString = numeral(dataset.data[index]).format('+QuotedStr(FFormat)+');';
end;

class function TChartsLabelling<T>.New(Parent : T): iModelLabellingConfig<T>;
begin
  Result := Self.Create(Parent);
end;

function TChartsLabelling<T>.Padding(Value: Integer): iModelLabellingConfig<T>;
begin
  Result := Self;
  FPadding := Value;
end;

function TChartsLabelling<T>.Padding: Integer;
begin
  Result := FPadding;
end;

function TChartsLabelling<T>.PaddingX: Integer;
begin
  Result := FPaddingX;
end;

function TChartsLabelling<T>.PaddingX(Value: Integer): iModelLabellingConfig<T>;
begin
  Result := Self;
  FPaddingX := Value;
end;

function TChartsLabelling<T>.UseNegativeColor(Value: Boolean): iModelLabellingConfig<T>;
begin
  Result := Self;
  FUseNegativeColor := Value;
end;

function TChartsLabelling<T>.NegativeRGBColor(Value: String): iModelLabellingConfig<T>;
begin
  Result := Self;
  FNegativeRGBColor := Value;
end;

function TChartsLabelling<T>.Result: String;
begin
  FResult := '';

  if FFormat <> '' then
  begin
    FResult := FResult + 'afterDatasetsDraw: function(chart) { ';
    FResult := FResult + '  var ctx = chart.ctx;';
    FResult := FResult + '  chart.data.datasets.forEach(function(dataset, i) { ';
    FResult := FResult + '    var meta = chart.getDatasetMeta(i); ';
    FResult := FResult + '    if (dataset.hidden) {';
    FResult := FResult + '      dataset.hidden = false;';
    FResult := FResult + '      meta.hidden = true;';
    FResult := FResult + '    }';
    FResult := FResult + '    if (!meta.hidden) { ';
    FResult := FResult + '      meta.data.forEach(function(element, index) { ';
    FResult := FResult + '        if (!element.hidden) {';

    // Font
    FResult := FResult + '          var fontSize = ' + IntToStr(FFontSize) + '; ';
    FResult := FResult + '          var fontStyle = ''' + FFontStyle + '''; ';
    FResult := FResult + '          var fontFamily = ''' + FFontFamily + '''; ';
    FResult := FResult + '          ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily); ';

    // Formatted number
    FResult := FResult + '          numeral.locale(''pt-br'');';
    FResult := FResult + '          var dataValue = Number(dataset.data[index]);';
    FResult := FResult + '          let dataNumber = numeral(dataValue);';
    FResult := FResult + '          let dataString = dataNumber.format(' + QuotedStr(FFormat) + ');';

    if FHideZeroValues then
      FResult := FResult + '          if (dataNumber.value() == 0 && dataset.hideZeroValues) { dataString = ""; }';

    // Color (optional negative color)
    FResult := FResult + '          var isNeg = (dataValue < 0);';

    if FUseNegativeColor then
      FResult := FResult + '          ctx.fillStyle = isNeg ? ''rgb(' + FNegativeRGBColor + ')'' : ''rgb(' + FRGBColor + ')''; '
    else
      FResult := FResult + '          ctx.fillStyle = ''rgb(' + FRGBColor + ')''; ';

    // Position
    FResult := FResult + '          ctx.textAlign = ''center''; ';
    FResult := FResult + '          ctx.textBaseline = ''middle''; ';
    FResult := FResult + '          var padding = ' + IntToStr(FPadding) + '; ';
    FResult := FResult + '          var paddingX = ' + IntToStr(FPaddingX) + '; ';

    // Bar model position (Chart.js 2.8)
    FResult := FResult + '          var model = element._model || {}; ';
    FResult := FResult + '          var posX = (model.x !== undefined) ? model.x : element.tooltipPosition().x; ';
    FResult := FResult + '          var posY = (model.y !== undefined) ? model.y : element.tooltipPosition().y; ';

    // Detect bar chart (avoid changing line/point behavior)
    FResult := FResult + '          var isBar = (meta.type === ''bar'') || (chart.config && chart.config.type === ''bar'');';

    // Offset: positive goes up, negative goes down (prevents label inside negative bars)
    FResult := FResult + '          var offsetY = -(fontSize / 2) - padding;';
    FResult := FResult + '          if (isBar && isNeg) { offsetY = (fontSize / 2) + padding; }';

    FResult := FResult + '          ctx.fillText(dataString, posX + paddingX, posY + offsetY); ';

    FResult := FResult + '        }';
    FResult := FResult + '      });';
    FResult := FResult + '    }';
    FResult := FResult + '  });';
    FResult := FResult + '},';

    Result := FResult;
  end;

end;

function TChartsLabelling<T>.RGBColor(Value: String): iModelLabellingConfig<T>;
begin
  Result := Self;
  FRGBColor := Value;
end;

function TChartsLabelling<T>.RGBColor: String;
begin
  Result := FRGBColor;
end;

end.
