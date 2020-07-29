unit Charts.Tooltip;

interface

uses
  Interfaces;

type
  TModelHTMLChartsTooltip<T : IInterface> = class(TInterfacedObject, iModelHTMLTooltip<T>)
    private
      FParent : T;
      FFormat : String;
      FToolTipValue : String;
      FInteractionMode : String;
      FIntersect : String;
      FTitle : string;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLTooltip<T>;
      function Format (Value : String) : iModelHTMLTooltip<T>;
      function ToolTipNoScales : iModelHTMLTooltip<T>;
      function InteractionModeNearest : iModelHTMLTooltip<T>;
      function InteractionModePoint : iModelHTMLTooltip<T>;
      function InteractionModeIndex : iModelHTMLTooltip<T>;
      function InteractionModeDataset : iModelHTMLTooltip<T>;
      function InteractionModeX : iModelHTMLTooltip<T>;
      function InteractionModeY : iModelHTMLTooltip<T>;
      function Intersect(Value : Boolean) : iModelHTMLTooltip<T>;
      function DisplayTitle(Value : Boolean) : iModelHTMLTooltip<T>;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  Injection,
  System.SysUtils;
{ TModelHTMLChartsTooltip<T> }

function TModelHTMLChartsTooltip<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLChartsTooltip<T>.Format(Value: String): iModelHTMLTooltip<T>;
begin
  Result := Self;
  FFormat := Value;
end;

function TModelHTMLChartsTooltip<T>.InteractionModeDataset: iModelHTMLTooltip<T>;
begin
  Result := Self;
  FInteractionMode := 'mode: ''dataset'',';
end;

function TModelHTMLChartsTooltip<T>.InteractionModeIndex: iModelHTMLTooltip<T>;
begin
  Result := Self;
  FInteractionMode := 'mode: ''index'',';
end;

function TModelHTMLChartsTooltip<T>.InteractionModeNearest: iModelHTMLTooltip<T>;
begin
  Result := Self;
  FInteractionMode := 'mode: ''nearest'',';
end;

function TModelHTMLChartsTooltip<T>.InteractionModePoint: iModelHTMLTooltip<T>;
begin
  Result := Self;
  FInteractionMode := 'mode: ''point'',';
end;

function TModelHTMLChartsTooltip<T>.InteractionModeX: iModelHTMLTooltip<T>;
begin
  Result := Self;
  FInteractionMode := 'mode: ''x'',';
end;

function TModelHTMLChartsTooltip<T>.InteractionModeY: iModelHTMLTooltip<T>;
begin
  Result := Self;
  FInteractionMode := 'mode: ''y'',';
end;

function TModelHTMLChartsTooltip<T>.Intersect ( Value : Boolean ) : iModelHTMLTooltip<T>;
begin
  Result := Self;
  if Value then FIntersect := 'intersect: true,' else FIntersect := 'intersect: false,';
end;

constructor TModelHTMLChartsTooltip<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FToolTipValue := 'tooltipItem.value';
end;

destructor TModelHTMLChartsTooltip<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsTooltip<T>.DisplayTitle(
  Value: Boolean): iModelHTMLTooltip<T>;
begin
  Result := Self;
  if Value then
  begin
    FTitle := 'title: function (tooltipItem, data) {';
    FTitle := FTitle + 'return data["labels"][tooltipItem[0]["index"]];';
    FTitle := FTitle + '},';
  end
  else
    FTitle := '';
end;

class function TModelHTMLChartsTooltip<T>.New(Parent : T): iModelHTMLTooltip<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsTooltip<T>.Result: String;
begin
  Result := '';
  Result := Result + 'tooltips: {';
  Result := Result + FInteractionMode;
  Result := Result + FIntersect;
  Result := Result + 'callbacks: {';
  Result := Result + FTitle;
  Result := Result + 'label: function(tooltipItem, data) {';
  Result := Result + 'numeral.locale(''pt-br'');';
  //Result := Result + '  	return numeral(data['+QuotedStr('datasets')+'][0]['+QuotedStr('data')+'][tooltipItem['+QuotedStr('index')+']]).format('+QuotedStr(FFormat)+');';
//  Result := Result + '    return numeral(data['+QuotedStr('datasets')+'][tooltipItem.datasetIndex]['+QuotedStr('data')+'][tooltipItem['+QuotedStr('index')+']]).format('+QuotedStr(FFormat)+');';
  Result := Result + 'var valueNumber = numeral();';
  Result := Result + 'valueNumber.set(' + FToolTipValue + ');';
  Result := Result + 'return valueNumber.format('+QuotedStr(FFormat)+');';
  Result := Result + '}';
  Result := Result + '}';
  Result := Result + '},';
end;

function TModelHTMLChartsTooltip<T>.ToolTipNoScales : iModelHTMLTooltip<T>;
begin
  Result := Self;
  FToolTipValue := 'data['+QuotedStr('datasets')+'][tooltipItem.datasetIndex]['+QuotedStr('data')+'][tooltipItem['+QuotedStr('index')+']]';
end;

end.
