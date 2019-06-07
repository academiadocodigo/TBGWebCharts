unit Charts.Axes.Params;

interface

uses
  Interfaces;

type
  TModelHTMLAxesParams<T> = class(TInterfacedObject, iModelHTMLChartsAxesParam<T>)
    private
      FParent : T;
      FPosition : String;
      FOffSet : Boolean;
      FType : String;
      FResult : String;
      FStacked : Boolean;
      FTicks : iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam<T>>;
      FGridLines : iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam<T>>;
      FScaleLabel : iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam<T>>;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLChartsAxesParam<T>;
      function Ticks : iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam<T>>;
      function GridLines : iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam<T>>;
      function ScaleLabel : iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam<T>>;
      function Position (Value : String) : iModelHTMLChartsAxesParam<T>; overload;
      function Position : String; overload;
      function OffSet (Value : Boolean) : iModelHTMLChartsAxesParam<T>; overload;
      function OffSet : Boolean; overload;
      function _Type (Value : String) : iModelHTMLChartsAxesParam<T>; overload;
      function _Type : String; overload;
      function Stacked ( Value : Boolean ) : iModelHTMLChartsAxesParam<T>; overload;
      function Stacked : Boolean; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Charts.Axes.Ticks, Charts.Axes.GridLines,
  Charts.Axes.ScaleLabel;

{ TModelHTMLAxesParams<T> }

function TModelHTMLAxesParams<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLAxesParams<T>.GridLines: iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam<T>>;
begin
  Result := FGridLines;
end;

constructor TModelHTMLAxesParams<T>.Create(Parent : T);
begin
  FParent := Parent;
  FOffSet := True;
  FType := '';
  FStacked := False;
  FTicks := TModelHTMLAxesTicks<iModelHTMLChartsAxesParam<T>>.New(Self);
  FGridLines := TModelHTMLAxesGridLines<iModelHTMLChartsAxesParam<T>>.New(Self);
  FScaleLabel := TModelHTMLAxesScaleLabel<iModelHTMLChartsAxesParam<T>>.New(Self);
end;

destructor TModelHTMLAxesParams<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLAxesParams<T>.New(Parent : T): iModelHTMLChartsAxesParam<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLAxesParams<T>.OffSet: Boolean;
begin
  Result := FOffSet;
end;

function TModelHTMLAxesParams<T>.OffSet(
  Value: Boolean): iModelHTMLChartsAxesParam<T>;
begin
  Result := Self;
  FOffSet := Value;
end;

function TModelHTMLAxesParams<T>.Position: String;
begin
  Result := FPosition;
end;

function TModelHTMLAxesParams<T>.Position(
  Value: String): iModelHTMLChartsAxesParam<T>;
begin
  Result := Self;
  FPosition := Value;
end;

function TModelHTMLAxesParams<T>.Result: String;
begin
  FResult := '';
  if FPosition <> '' then FResult := FResult + 'position : ' + QuotedStr(FPosition) + ',';
  if FStacked then FResult := FResult + 'stacked : true,' else FResult := FResult + 'stacked : false,';
  if FOffSet then FResult := FResult + 'offset : true,' else FResult := FResult + 'offset : false,';
  FResult := FResult + FGridLines.Result;
  FResult := FResult + FScaleLabel.Result;
  FResult := FResult + FTicks.Result;
  Result := FResult;
end;

function TModelHTMLAxesParams<T>.ScaleLabel: iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam<T>>;
begin
  Result := FScaleLabel;
end;

function TModelHTMLAxesParams<T>.Stacked: Boolean;
begin
  Result := FStacked;
end;

function TModelHTMLAxesParams<T>.Stacked(
  Value: Boolean): iModelHTMLChartsAxesParam<T>;
begin
  Result := Self;
  FStacked := Value;
end;

function TModelHTMLAxesParams<T>.Ticks: iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam<T>>;
begin
  Result := FTicks;
end;

function TModelHTMLAxesParams<T>._Type: String;
begin
  Result := FType;
end;

function TModelHTMLAxesParams<T>._Type(
  Value: String): iModelHTMLChartsAxesParam<T>;
begin
  Result := Self;
  FType := Value;
end;

end.
