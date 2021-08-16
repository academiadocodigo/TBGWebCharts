unit LiquidFillGauge.Config;

interface

uses
  Interfaces;

Type
  TModelLiquidFillGaugeConfig = class(TInterfacedObject, iModelLiquidFillGaugeConfig)
  private
    [weak]
    FParent : iModelLiquidFillGauge;
    FMinValue : string;
    FMaxValue : string;
    FCircleThickness : string;
    FCircleFillGap : string;
    FCircleColor : string;
    FWaveHeight : string;
    FWaveCount : string;
    FWaveRiseTime : string;
    FWaveAnimateTime : string;
    FWaveRise : string;
    FWaveHeightScaling : string;
    FWaveAnimate : string;
    FWaveColor : string;
    FWaveOffset : string;
    FTextVertPosition : string;
    FTextSize : string;
    FValueCountUp : string;
    FDisplayPercent : string;
    FTextColor : string;
    FWaveTextColor : string;
    function ConvertInt(aValue : Integer) : string;
  public
    constructor Create(Parent : iModelLiquidFillGauge);
    destructor Destroy; override;
    class function New(Parent : iModelLiquidFillGauge) : iModelLiquidFillGaugeConfig;
    function MinValue(Value : integer) : iModelLiquidFillGaugeConfig;
    function MaxValue(Value : integer) : iModelLiquidFillGaugeConfig;
    function CircleThickness(Value : Integer) : iModelLiquidFillGaugeConfig;
    function CircleFillGap(Value : Integer) : iModelLiquidFillGaugeConfig;
    function CircleColorHex(Value : string) : iModelLiquidFillGaugeConfig;
    function CircleColor(Value : string) : iModelLiquidFillGaugeConfig;
    function WaveHeight(Value : Integer) : iModelLiquidFillGaugeConfig;
    function WaveCount(Value : Integer) : iModelLiquidFillGaugeConfig;
    function WaveRiseTime(Value : Integer) : iModelLiquidFillGaugeConfig;
    function WaveAnimateTime(Value : Integer) : iModelLiquidFillGaugeConfig;
    function WaveRise(Value : Boolean) : iModelLiquidFillGaugeConfig;
    function WaveHeightScaling(Value : Boolean) : iModelLiquidFillGaugeConfig;
    function WaveAnimate(Value : Boolean) : iModelLiquidFillGaugeConfig;
    function WaveColor(Value : string) : iModelLiquidFillGaugeConfig;
    function WaveColorHex(Value : string) : iModelLiquidFillGaugeConfig;
    function WaveOffset(Value : Integer) : iModelLiquidFillGaugeConfig;
    function TextVertPosition(Value : Integer) : iModelLiquidFillGaugeConfig;
    function TextSize(Value : Integer) : iModelLiquidFillGaugeConfig;
    function ValueCountUp(Value : Boolean) : iModelLiquidFillGaugeConfig;
    function DisplayPercent(Value : Boolean) : iModelLiquidFillGaugeConfig;
    function TextColor(Value : string) : iModelLiquidFillGaugeConfig;
    function TextColorHex(Value : string) : iModelLiquidFillGaugeConfig;
    function WaveTextColor(Value : string) : iModelLiquidFillGaugeConfig;
    function WaveTextColorHex(Value : string) : iModelLiquidFillGaugeConfig;
    function ResultScript : String;
    function &End : iModelLiquidFillGauge;
  end;

implementation

uses
  System.SysUtils,
  Injection;

{ TModelLiquidFillGaugeConfig }

function TModelLiquidFillGaugeConfig.CircleColor(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FCircleColor := Format('config%s.circleColor = "rgb(%s)";', [FParent.Name, Value]);;
end;

function TModelLiquidFillGaugeConfig.CircleColorHex(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FCircleColor := Format('config%s.circleColor = "%s";', [FParent.Name, Value]);;
end;

function TModelLiquidFillGaugeConfig.CircleFillGap(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FCircleFillGap := Format('config%s.circleFillGap = %s;', [FParent.Name, ConvertInt(Value)]);
end;

function TModelLiquidFillGaugeConfig.CircleThickness(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FCircleThickness := Format('config%s.circleThickness = %s;', [FParent.Name, ConvertInt(Value)]);
end;

function TModelLiquidFillGaugeConfig.ConvertInt(aValue: Integer): string;
begin
  Result :=  FormatFloat('0.00', aValue / 100.0);
  Result := StringReplace(Result, ',', '.',[rfReplaceAll]);
end;

function TModelLiquidFillGaugeConfig.&End: iModelLiquidFillGauge;
begin
  Result := FParent;
end;

constructor TModelLiquidFillGaugeConfig.Create(Parent : iModelLiquidFillGauge);
begin
  TInjection.Weak(@FParent, Parent);
  FParent := Parent;
end;

destructor TModelLiquidFillGaugeConfig.Destroy;
begin

  inherited;
end;

function TModelLiquidFillGaugeConfig.DisplayPercent(
  Value: Boolean): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FDisplayPercent := Format('config%s.displayPercent = %s;', [FParent.Name, LowerCase(BoolToStr(Value, true))]);
end;

function TModelLiquidFillGaugeConfig.MaxValue(Value : integer) : iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  if Value > 0 then
    FMaxValue := Format('config%s.maxValue = %s;', [FParent.Name, IntToStr(Value)]);
end;

function TModelLiquidFillGaugeConfig.MinValue(Value : integer) : iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  if Value > 0 then
    FMinValue := Format('config%s.minValue = %s;', [FParent.Name, IntToStr(Value)]);
end;

class function TModelLiquidFillGaugeConfig.New (Parent : iModelLiquidFillGauge) : iModelLiquidFillGaugeConfig;
begin
  Result := Self.Create(Parent);
end;

function TModelLiquidFillGaugeConfig.ResultScript: String;
begin
  Result := FMinValue +
    FMaxValue +
    FCircleThickness +
    FCircleFillGap +
    FCircleColor +
    FWaveHeight +
    FWaveCount +
    FWaveRiseTime +
    FWaveAnimateTime +
    FWaveRise +
    FWaveHeightScaling +
    FWaveAnimate +
    FWaveColor +
    FWaveOffset +
    FTextVertPosition +
    FTextSize +
    FValueCountUp +
    FDisplayPercent +
    FTextColor +
    FWaveTextColor;
end;

function TModelLiquidFillGaugeConfig.TextColor(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FTextColor := Format('config%s.textColor = "rgb(%s)";', [FParent.Name, Value]);
end;

function TModelLiquidFillGaugeConfig.TextColorHex(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FTextColor := Format('config%s.textColor = "%s";', [FParent.Name, Value]);
end;

function TModelLiquidFillGaugeConfig.TextSize(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FTextSize := Format('config%s.textSize = %s;', [FParent.Name, ConvertInt(Value)]);
end;

function TModelLiquidFillGaugeConfig.TextVertPosition(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FTextVertPosition := Format('config%s.textVertPosition = %s;', [FParent.Name, ConvertInt(Value)]);

end;

function TModelLiquidFillGaugeConfig.ValueCountUp(
  Value: Boolean): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FValueCountUp := Format('config%s.valueCountUp = %s;', [FParent.Name, LowerCase(BoolToStr(Value, true))]);
end;

function TModelLiquidFillGaugeConfig.WaveAnimate(
  Value: Boolean): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveAnimateTime := Format('config%s.waveAnimate = %s;', [FParent.Name, LowerCase(BoolToStr(Value, true))]);
end;

function TModelLiquidFillGaugeConfig.WaveAnimateTime(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveAnimateTime := Format('config%s.waveAnimateTime = %s;', [FParent.Name, IntToStr(Value)]);
end;

function TModelLiquidFillGaugeConfig.WaveColor(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveColor := Format('config%s.waveColor = "rgb(%s)";', [FParent.Name, Value]);
end;

function TModelLiquidFillGaugeConfig.WaveColorHex(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveColor := Format('config%s.waveColor = "%s";', [FParent.Name, Value]);
end;

function TModelLiquidFillGaugeConfig.WaveCount(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveCount := Format('config%s.waveCount = %s;', [FParent.Name, IntToStr(Value)]);
end;

function TModelLiquidFillGaugeConfig.WaveHeight(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveHeight := Format('config%s.waveHeight = %s;', [FParent.Name, ConvertInt(Value)]);
end;

function TModelLiquidFillGaugeConfig.WaveHeightScaling(
  Value: Boolean): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveHeightScaling := Format('config%s.waveHeightScaling = %s;', [FParent.Name, LowerCase(BoolToStr(Value, true))]);
end;

function TModelLiquidFillGaugeConfig.WaveOffset(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveOffset := Format('config%s.waveOffset = %s;', [FParent.Name, ConvertInt(Value)]);
end;

function TModelLiquidFillGaugeConfig.WaveRise(
  Value: Boolean): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveRise := Format('config%s.waveRise = %s;', [FParent.Name, LowerCase(BoolToStr(Value, true))]);
end;

function TModelLiquidFillGaugeConfig.WaveRiseTime(
  Value: Integer): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveRiseTime := Format('config%s.waveRiseTime = %s;', [FParent.Name, IntToStr(Value)]);
end;

function TModelLiquidFillGaugeConfig.WaveTextColor(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveTextColor := Format('config%s.waveTextColor = "rgb(%s)";', [FParent.Name, Value]);
end;

function TModelLiquidFillGaugeConfig.WaveTextColorHex(
  Value: string): iModelLiquidFillGaugeConfig;
begin
  Result := Self;
  FWaveTextColor := Format('config%s.waveTextColor = "%s";', [FParent.Name, Value]);
end;

end.
