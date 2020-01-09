unit Charts.Axes.Ticks;

interface

uses
  Interfaces;

type
  TModelHTMLAxesTicks<T : IInterface> = class(TInterfacedObject, iModelHTMLChartsAxesTicks<T>)
    private
      FParent : T;
      FFontColor : String;
      FFontSize : integer;
      FAutoSkip : Boolean;
      FlabelOffset : Integer;
      FResult : String;
      FautoSkipPadding : Integer;
      FmaxRotation : Integer;
      FminRotation : Integer;
      Fmirror : Boolean;
      Fpadding : Integer;
      Fformat : string;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLChartsAxesTicks<T>;
      function format ( Value : String) : iModelHTMLChartsAxesTicks<T>; overload;
      function format : String; overload;
      function fontColor (Value : String) : iModelHTMLChartsAxesTicks<T>; overload;
      function fontColor : String; overload;
      function fontSize (Value : integer) : iModelHTMLChartsAxesTicks<T>; overload;
      function fontSize : integer; overload;
      function autoSkip (Value : Boolean) : iModelHTMLChartsAxesTicks<T>; overload;
      function autoSkip : Boolean; overload;
      function autoSkipPadding (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
      function autoSkipPadding : Integer; overload;
      function labelOffset (Value : Integer) :  iModelHTMLChartsAxesTicks<T>; overload;
      function labelOffset : Integer; overload;
      function maxRotation (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
      function maxRotation : Integer; overload;
      function minRotation (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
      function minRotation : Integer; overload;
      function mirror ( Value : Boolean) : iModelHTMLChartsAxesTicks<T>; overload;
      function mirror : Boolean; overload;
      function padding ( Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
      function padding : Integer; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Injection;

{ TModelHTMLAxesTicks }

function TModelHTMLAxesTicks<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLAxesTicks<T>.autoSkip: Boolean;
begin
  Result := FAutoSkip;
end;

function TModelHTMLAxesTicks<T>.autoSkipPadding: Integer;
begin
  Result := FautoSkipPadding;
end;

function TModelHTMLAxesTicks<T>.autoSkipPadding(
  Value: Integer): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  FautoSkipPadding := Value;
end;

function TModelHTMLAxesTicks<T>.autoSkip(
  Value: Boolean): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  FAutoSkip := Value;
end;

constructor TModelHTMLAxesTicks<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FAutoSkip := False;
  FautoSkipPadding := 0;
  FlabelOffset := 0;
  FmaxRotation := 50;
  FminRotation := 0;
  Fmirror := False;
  Fpadding := 0;
  FFontSize := 0;
  Fformat := '';
end;

destructor TModelHTMLAxesTicks<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLAxesTicks<T>.FontColor(
  Value: String): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  FFontColor := Value;
end;

function TModelHTMLAxesTicks<T>.FontColor: String;
begin
  Result := FFontColor;
end;

function TModelHTMLAxesTicks<T>.fontSize: integer;
begin
  result := FFontSize;
end;

function TModelHTMLAxesTicks<T>.fontSize(Value: integer): iModelHTMLChartsAxesTicks<T>;
begin
  result := self;
  FFontSize := Value;
end;

function TModelHTMLAxesTicks<T>.format: String;
begin
  result := Fformat;
end;

function TModelHTMLAxesTicks<T>.format(Value: String): iModelHTMLChartsAxesTicks<T>;
begin
  result := self;
  Fformat := Value;
end;

function TModelHTMLAxesTicks<T>.labelOffset: Integer;
begin
  Result := FlabelOffset;
end;

function TModelHTMLAxesTicks<T>.maxRotation: Integer;
begin
  Result := FmaxRotation;
end;

function TModelHTMLAxesTicks<T>.minRotation: Integer;
begin
  Result := FminRotation;
end;

function TModelHTMLAxesTicks<T>.mirror: Boolean;
begin
  Result := Fmirror;
end;

function TModelHTMLAxesTicks<T>.mirror(
  Value: Boolean): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  Fmirror := Value;
end;

function TModelHTMLAxesTicks<T>.minRotation(
  Value: Integer): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  FminRotation := Value;
end;

function TModelHTMLAxesTicks<T>.maxRotation(
  Value: Integer): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  FmaxRotation := Value;
end;

function TModelHTMLAxesTicks<T>.labelOffset(
  Value: Integer):  iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  FlabelOffset := Value;
end;

class function TModelHTMLAxesTicks<T>.New(Parent : T): iModelHTMLChartsAxesTicks<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLAxesTicks<T>.padding: Integer;
begin
  Result := Fpadding;
end;

function TModelHTMLAxesTicks<T>.padding(
  Value: Integer): iModelHTMLChartsAxesTicks<T>;
begin
  Result := Self;
  Fpadding := Value;
end;

function TModelHTMLAxesTicks<T>.Result: String;
begin
  Result := '';
  FResult := FResult + 'ticks: { ';
  if Fformat <> '' then
    fResult := fResult + 'callback: function(value, index, values) {return numeral(value).format('+Fformat.QuotedString+');},';
  if FFontSize > 0 then
    FResult := FResult + 'fontSize : '+FontSize.ToString+', ';
  FResult := FResult + 'fontColor : "'+FontColor+'", ';
  if FAutoSkip then FResult := FResult + 'autoSkip : true, ' else FResult := FResult + 'autoSkip : false, ';
  FResult := FResult + 'autoSkipPadding : ' + IntToStr(FautoSkipPadding) + ',';
  FResult := FResult + 'labelOffset : ' + IntToStr(FlabelOffset) + ',';
  FResult := FResult + 'maxRotation : ' + IntToStr(FmaxRotation) + ',';
  FResult := FResult + 'minRotation : ' + IntToStr(FminRotation) + ',';
  if Fmirror then FResult := FResult + 'mirror : true, ' else FResult := FResult + 'mirror : false, ';
  FResult := FResult + 'padding : ' + IntToStr(Fpadding) + ',';
  FResult := FResult + 'beginAtZero: true ';
  FResult := FResult + '}';
  Result := FResult;
end;

end.
