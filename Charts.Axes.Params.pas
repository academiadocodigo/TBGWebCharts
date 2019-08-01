unit Charts.Axes.Params;

interface

uses
  Interfaces;

type
  TModelHTMLAxesParams = class(TInterfacedObject, iModelHTMLChartsAxesParam)
    private
      FParent : iModelHTMLChartsAxes;
      FPosition : String;
      FOffSet : Boolean;
      FType : String;
      FResult : String;
      FStacked : Boolean;
      FTicks : iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam>;
      FGridLines : iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam>;
      FScaleLabel : iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam>;
    public
      constructor Create(Parent : iModelHTMLChartsAxes);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLChartsAxes) : iModelHTMLChartsAxesParam;
      function Ticks : iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam>;
      function GridLines : iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam>;
      function ScaleLabel : iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam>;
      function Position (Value : String) : iModelHTMLChartsAxesParam; overload;
      function Position : String; overload;
      function OffSet (Value : Boolean) : iModelHTMLChartsAxesParam; overload;
      function OffSet : Boolean; overload;
      function _Type (Value : String) : iModelHTMLChartsAxesParam; overload;
      function _Type : String; overload;
      function Stacked ( Value : Boolean ) : iModelHTMLChartsAxesParam; overload;
      function Stacked : Boolean; overload;
      function Result : String;
      function &End : iModelHTMLChartsAxes;
  end;

implementation

uses
  System.SysUtils, Charts.Axes.Ticks, Charts.Axes.GridLines,
  Charts.Axes.ScaleLabel, Injection;

{ TModelHTMLAxesParams<T> }

function TModelHTMLAxesParams.&End: iModelHTMLChartsAxes;
begin
  Result := FParent;
end;

function TModelHTMLAxesParams.GridLines: iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam>;
begin
  Result := FGridLines;
end;

constructor TModelHTMLAxesParams.Create(Parent : iModelHTMLChartsAxes);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FOffSet := True;
  FType := '';
  FStacked := False;
  FTicks := TModelHTMLAxesTicks<iModelHTMLChartsAxesParam>.New(Self);
  FGridLines := TModelHTMLAxesGridLines<iModelHTMLChartsAxesParam>.New(Self);
  FScaleLabel := TModelHTMLAxesScaleLabel<iModelHTMLChartsAxesParam>.New(Self);
end;

destructor TModelHTMLAxesParams.Destroy;
begin

  inherited;
end;

class function TModelHTMLAxesParams.New(Parent : iModelHTMLChartsAxes): iModelHTMLChartsAxesParam;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLAxesParams.OffSet: Boolean;
begin
  Result := FOffSet;
end;

function TModelHTMLAxesParams.OffSet(
  Value: Boolean): iModelHTMLChartsAxesParam;
begin
  Result := Self;
  FOffSet := Value;
end;

function TModelHTMLAxesParams.Position: String;
begin
  Result := FPosition;
end;

function TModelHTMLAxesParams.Position(
  Value: String): iModelHTMLChartsAxesParam;
begin
  Result := Self;
  FPosition := Value;
end;

function TModelHTMLAxesParams.Result: String;
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

function TModelHTMLAxesParams.ScaleLabel: iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam>;
begin
  Result := FScaleLabel;
end;

function TModelHTMLAxesParams.Stacked: Boolean;
begin
  Result := FStacked;
end;

function TModelHTMLAxesParams.Stacked(
  Value: Boolean): iModelHTMLChartsAxesParam;
begin
  Result := Self;
  FStacked := Value;
end;

function TModelHTMLAxesParams.Ticks: iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam>;
begin
  Result := FTicks;
end;

function TModelHTMLAxesParams._Type: String;
begin
  Result := FType;
end;

function TModelHTMLAxesParams._Type(
  Value: String): iModelHTMLChartsAxesParam;
begin
  Result := Self;
  FType := Value;
end;

end.
