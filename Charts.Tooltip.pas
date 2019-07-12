unit Charts.Tooltip;

interface

uses
  Interfaces;

type
  TModelHTMLChartsTooltip<T : IInterface> = class(TInterfacedObject, iModelHTMLTooltip<T>)
    private
      FParent : T;
      FFormat : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLTooltip<T>;
      function Format (Value : String) : iModelHTMLTooltip<T>;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  Injection, System.SysUtils;
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

constructor TModelHTMLChartsTooltip<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelHTMLChartsTooltip<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLChartsTooltip<T>.New(Parent : T): iModelHTMLTooltip<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsTooltip<T>.Result: String;
begin
  Result := '';
  Result := Result + 'tooltips: {';
  Result := Result + 'callbacks: {';
  Result := Result + '	label: function(tooltipItem, data) {';
  //Result := Result + '  	return numeral(data['+QuotedStr('datasets')+'][0]['+QuotedStr('data')+'][tooltipItem['+QuotedStr('index')+']]).format('+QuotedStr(FFormat)+');';
  Result := Result + '    return numeral(data['+QuotedStr('datasets')+'][tooltipItem.datasetIndex]['+QuotedStr('data')+'][tooltipItem['+QuotedStr('index')+']]).format('+QuotedStr(FFormat)+');';
  Result := Result + '	}';
  Result := Result + '}';
  Result := Result + '},';
end;

end.
