unit Charts.Axes.GridLines;

interface

uses
  Interfaces;

type
  TModelHTMLAxesGridLines<T : IInterface> = class(TInterfacedObject, iModelHTMLChartsAxesGridLines<T>)
    private
      FParent : T;
      FResult : String;
      Fdisplay : Boolean;
      Fcircular : Boolean;
      FcolorRGBA : String;
      FdrawBorder : Boolean;
      FdrawOnChartArea : Boolean;
      FdrawTicks : Boolean;
      FtickMarkLength : Integer;
      FzeroLineWidth : Integer;
      FzeroLineColorRGBA : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLChartsAxesGridLines<T>;
      function display (Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
      function display : Boolean; overload;
      function circular (Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
      function circular : Boolean; overload;
      function colorRGBA ( Value : String ) : iModelHTMLChartsAxesGridLines<T>; overload;
      function colorRGBA : String; overload;
      function drawBorder ( Value : Boolean ) : iModelHTMLChartsAxesGridLines<T>; overload;
      function drawBorder : Boolean; overload;
      function drawOnChartArea ( Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
      function drawOnChartArea : Boolean; overload;
      function drawTicks ( Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
      function drawTicks : Boolean; overload;
      function tickMarkLength ( Value : Integer ) : iModelHTMLChartsAxesGridLines<T>; overload;
      function tickMarkLength : Integer; overload;
      function zeroLineWidth ( Value : Integer ) : iModelHTMLChartsAxesGridLines<T>; overload;
      function zeroLineWidth : Integer; overload;
      function zeroLineColorRGBA ( Value : String ) : iModelHTMLChartsAxesGridLines<T>; overload;
      function zeroLineColorRGBA : String; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Injection;

{ TModelHTMLAxesGridLines<T> }

function TModelHTMLAxesGridLines<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLAxesGridLines<T>.circular: Boolean;
begin
  Result := Fcircular;
end;

function TModelHTMLAxesGridLines<T>.colorRGBA: String;
begin
  Result := FcolorRGBA;
end;

function TModelHTMLAxesGridLines<T>.colorRGBA(
  Value: String): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FcolorRGBA := Value;
end;

function TModelHTMLAxesGridLines<T>.circular(
  Value: Boolean): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  Fcircular := Value;
end;

constructor TModelHTMLAxesGridLines<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  Fdisplay := True;
  Fcircular := False;
  FcolorRGBA := '0,0,0,0.1';
  FdrawBorder := True;
  FdrawOnChartArea := True;
  FdrawTicks := True;
  FtickMarkLength := 10;
  FzeroLineWidth := 1;
  FzeroLineColorRGBA := '0,0,0,0.25';
end;

destructor TModelHTMLAxesGridLines<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLAxesGridLines<T>.display: Boolean;
begin
  Result := Fdisplay;
end;

function TModelHTMLAxesGridLines<T>.drawBorder: Boolean;
begin
  Result := FdrawBorder;
end;

function TModelHTMLAxesGridLines<T>.drawOnChartArea: Boolean;
begin
  Result := FdrawOnChartArea;
end;

function TModelHTMLAxesGridLines<T>.drawTicks: Boolean;
begin
  Result := FdrawTicks;
end;

function TModelHTMLAxesGridLines<T>.drawTicks(
  Value: Boolean): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FdrawTicks := Value;
end;

function TModelHTMLAxesGridLines<T>.drawOnChartArea(
  Value: Boolean): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FdrawOnChartArea := Value;
end;

function TModelHTMLAxesGridLines<T>.drawBorder(
  Value: Boolean): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FdrawBorder := Value;
end;

function TModelHTMLAxesGridLines<T>.display(
  Value: Boolean): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  Fdisplay := Value;
end;

class function TModelHTMLAxesGridLines<T>.New(Parent : T): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLAxesGridLines<T>.Result: String;
begin
  FResult := '';
  FResult := FResult + 'gridLines : { ';
  if Fdisplay         then FResult := FResult + 'display : true, '          else FResult := FResult + 'display : false, ';
  if Fcircular        then FResult := FResult + 'circular : true, '         else FResult := FResult + 'circular : false, ';
  if FdrawBorder      then FResult := FResult + 'drawBorder : true, '       else FResult := FResult + 'drawBorder : false, ';
  if FdrawOnChartArea then FResult := FResult + 'drawOnChartArea : true, '  else FResult := FResult + 'drawOnChartArea : false, ';
  if FdrawTicks       then FResult := FResult + 'drawTicks : true, '        else FResult := FResult + 'drawTicks : false, ';
  FResult := FResult + 'color : "rgba('+FcolorRGBA+')", ';
  FResult := FResult + 'zeroLineColor : "rgba('+FzeroLineColorRGBA+')", ';
  FResult := FResult + 'tickMarkLength : ' + IntToStr(FtickMarkLength) + ', ';
  FResult := FResult + 'zeroLineWidth	 : ' + IntToStr(FzeroLineWidth) + ', ';
  FResult := FResult + '},';
  Result := FResult;
end;

function TModelHTMLAxesGridLines<T>.tickMarkLength: Integer;
begin
  Result := FtickMarkLength;
end;

function TModelHTMLAxesGridLines<T>.zeroLineColorRGBA: String;
begin
  Result := FzeroLineColorRGBA;
end;

function TModelHTMLAxesGridLines<T>.zeroLineColorRGBA(
  Value: String): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FzeroLineColorRGBA := Value;
end;

function TModelHTMLAxesGridLines<T>.zeroLineWidth: Integer;
begin
  Result := FzeroLineWidth;
end;

function TModelHTMLAxesGridLines<T>.zeroLineWidth(
  Value: Integer): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FzeroLineWidth := Value;
end;

function TModelHTMLAxesGridLines<T>.tickMarkLength(
  Value: Integer): iModelHTMLChartsAxesGridLines<T>;
begin
  Result := Self;
  FtickMarkLength := Value;
end;

end.
