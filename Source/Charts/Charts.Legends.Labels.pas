unit Charts.Legends.Labels;

interface

uses
  Interfaces;

type
  TModelHTMLLegendsLabels<T : IInterface> = class(TInterfacedObject, iModelHTMLLegendLabels<T>)
    private
      FParent : T;
      FfontSize : Integer;
      FfontStyle : String;
      FfontColorHEX : String;
      FfontFamily : String;
      Fpadding : Integer;
      FBoxWidth : Integer;
      FShowPercentage : Boolean;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLLegendLabels<T>;
      function BoxWidth (Value : Integer) : iModelHTMLLegendLabels<T>; overload;
      function BoxWidth : Integer; overload;
      function fontSize (Value : Integer) : iModelHTMLLegendLabels<T>; overload;
      function fontSize : Integer; overload;
      function fontStyle ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
      function fontStyle : String; overload;
      function fontColorHEX ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
      function fontColorHEX : String; overload;
      function fontFamily ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
      function fontFamily : String; overload;
      function padding ( Value : Integer ) : iModelHTMLLegendLabels<T>; overload;
      function padding : Integer; overload;
      function ShowPercentage(Value : Boolean) : iModelHTMLLegendLabels<T>;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Injection;

{ TModelHTMLLegendsLabels }
function TModelHTMLLegendsLabels<T>.BoxWidth: Integer;
begin
  Result := FBoxWidth;
end;

function TModelHTMLLegendsLabels<T>.BoxWidth(
  Value: Integer): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  if Value < 1 then
    Value := 1;
  FBoxWidth := Value;
end;

function TModelHTMLLegendsLabels<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLLegendsLabels<T>.fontColorHEX: String;
begin
  Result := FfontColorHEX;
end;

function TModelHTMLLegendsLabels<T>.fontFamily: String;
begin
  Result := FfontFamily;
end;

function TModelHTMLLegendsLabels<T>.fontFamily(
  Value: String): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontFamily := Value;
end;

function TModelHTMLLegendsLabels<T>.fontColorHEX(
  Value: String): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontColorHEX := Value;
end;

function TModelHTMLLegendsLabels<T>.fontSize: Integer;
begin
  Result := FfontSize;
end;

function TModelHTMLLegendsLabels<T>.fontStyle: String;
begin
  Result := FfontStyle;
end;

function TModelHTMLLegendsLabels<T>.fontStyle(
  Value: String): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontStyle := Value;
end;

function TModelHTMLLegendsLabels<T>.fontSize(
  Value: Integer): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontSize := Value;
end;

constructor TModelHTMLLegendsLabels<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FfontSize := 12;
  FfontStyle := 'normal';
  FfontColorHEX := '#666';
  FfontFamily := 'Arial';
  Fpadding := 10;
  FBoxWidth := 40;
  FShowPercentage := False;
end;

destructor TModelHTMLLegendsLabels<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLLegendsLabels<T>.New(Parent : T): iModelHTMLLegendLabels<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLLegendsLabels<T>.padding: Integer;
begin
  Result := Fpadding;
end;

function TModelHTMLLegendsLabels<T>.padding(
  Value: Integer): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  Fpadding := Value;
end;

function TModelHTMLLegendsLabels<T>.ShowPercentage(
  Value: Boolean): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FShowPercentage := Value;
end;

function TModelHTMLLegendsLabels<T>.Result: String;
begin
  Result := '';
  Result := Result + 'labels : { ';
  Result := Result + 'fontSize : ' + IntToStr(FfontSize) + ', ';
  Result := Result + 'fontColor : "'+FfontColorHEX+'",';
  Result := Result + 'fontFamily : "'+FfontFamily+'",';
  Result := Result + 'boxWidth : ' + IntToStr(FBoxWidth) + ', ';
  Result := Result + 'padding : ' + IntToStr(Fpadding) + ', ';
  Result := Result + 'fontStyle : "'+FfontStyle+'"';
  if FShowPercentage then
  begin
    Result := Result + ', generateLabels : function(chart) {';
    Result := Result + 'var labels = Chart.defaults.doughnut.legend.labels.generateLabels(chart);';
    Result := Result + 'var dataset = chart.data.datasets && chart.data.datasets[0];';
    Result := Result + 'var total = 0, i, index, value;';
    Result := Result + 'if (dataset && dataset.data) { for (i = 0; i < dataset.data.length; i++) {';
    Result := Result + 'value = Number(dataset.data[i]); if (!isNaN(value) && (!labels[i] || !labels[i].hidden)) total += Math.abs(value); } }';
    Result := Result + 'for (i = 0; i < labels.length; i++) {';
    Result := Result + 'index = labels[i].index; value = Number(dataset && dataset.data ? dataset.data[index] : 0);';
    Result := Result + 'labels[i].text = labels[i].text + '' '' + (total > 0 ? Math.round(Math.abs(value) * 100 / total) : 0) + ''%''; }';
    Result := Result + 'return labels; }';
  end;
  Result := Result + '},';
end;

end.
