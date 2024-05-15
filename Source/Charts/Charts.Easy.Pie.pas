unit Charts.Easy.Pie;

interface

uses
  Interfaces,
  Injection,
  System.Classes;

type
  TModelChartsEasyPie = class (TInterfacedObject, iModelChartEasyPie)
    private
      [weak]
      FParent : iModelHtml;
      FBarColor : String;
      FTrackColor : String;
      FScaleColor : String;
      FLineCap : String;
      FLinheWidth : String;
      FSize : String;
      FAnimate : String;
      FOnStart : String;
      FOnStop : String;
      FOnStep : String;
      FDataPercent : String;
      FName : string;
      function ResultHTML : String;
      function ResultScript : String;
    public
      constructor Create(Parent : iModelHtml);
      destructor Destroy; override;
      class function New(Parent : iModelHtml) : iModelChartEasyPie;
      function BarColor(Value : String) : iModelChartEasyPie;
      function TrackColor(Value : String) : iModelChartEasyPie;
      function ScaleColor(Value : String) : iModelChartEasyPie;
      function LineCap(Value : String) : iModelChartEasyPie;
      function LinheWidth(Value : String) : iModelChartEasyPie;
      function Size(Value : String) : iModelChartEasyPie;
      function Animate(Value : String) : iModelChartEasyPie;
      function OnStart(Value : String) : iModelChartEasyPie;
      function OnStop(Value : String) : iModelChartEasyPie;
      function OnStep(Value : String) : iModelChartEasyPie;
      function DataPercent(Value : String) : iModelChartEasyPie;
      function &End : iModelHTML;
  end;

implementation

uses
  System.SysUtils;

{ TModelChartsEasyPie }

function TModelChartsEasyPie.Animate(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FAnimate := Value;
end;

function TModelChartsEasyPie.BarColor(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FBarColor := Value;
end;

function TModelChartsEasyPie.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML(ResultScript);
  FParent.HTML(ResultHTML);
end;

constructor TModelChartsEasyPie.Create(Parent : iModelHtml);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
    FName := 'chart' + IntToStr(Random(100));
    FBarColor := '#ef1e25';
    FTrackColor := '#f2f2f2';
    FScaleColor := '#dfe0e0';
    FLineCap := 'round';
    FLinheWidth := '3';
    FSize := '110';
    FAnimate := 'false';
    FOnStart := '$.noop';
    FOnStop := '$.noop';
    FOnStep := '$.noop';
end;

function TModelChartsEasyPie.DataPercent(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FDataPercent := Value;
end;

destructor TModelChartsEasyPie.Destroy;
begin

  inherited;
end;

function TModelChartsEasyPie.LineCap(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FLineCap := Value;
end;

function TModelChartsEasyPie.LinheWidth(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FLinheWidth := Value;
end;

class function TModelChartsEasyPie.New(Parent : iModelHtml) : iModelChartEasyPie;
begin
  Result := Self.Create(Parent);
end;

function TModelChartsEasyPie.OnStart(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FOnStart := Value;
end;

function TModelChartsEasyPie.OnStep(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FOnStart := Value;
end;

function TModelChartsEasyPie.OnStop(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FOnStop := Value;
end;

function TModelChartsEasyPie.ResultHTML: String;
begin
  Result := Result + '<div class="' + FName + '" data-percent="'+FDataPercent+'">';
  Result := Result + '<span>'+FDAtaPercent+'</span>%</div>';
end;

function TModelChartsEasyPie.ResultScript: String;
begin
  Result := Result + '<script>'+#13;
  Result := Result + '$(function() { ';
  Result := Result + '  $('+QuotedStr('.' + FName)+').easyPieChart({ ';
  Result := Result + ' barColor: '+QuotedStr(FBarColor)+',';
  Result := Result + ' trackColor: '+QuotedStr(FTrackColor)+',';
  Result := Result + ' scaleColor: '+QuotedStr(FScaleColor)+',';
  Result := Result + ' lineCap: '+QuotedStr(FLineCap)+',';
  Result := Result + ' lineWidth: '+FLinheWidth+',';
  Result := Result + ' size: '+FSize+',';
  Result := Result + ' animate: '+FAnimate+',';
  Result := Result + ' onStart: '+FOnStart+',';
  Result := Result + ' onStop: '+FOnStop+',';
  Result := Result + ' onStep: '+FOnStep+' });});';
  Result := Result + '</script>'+#13;
end;

function TModelChartsEasyPie.ScaleColor(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FScaleColor := Value;
end;

function TModelChartsEasyPie.Size(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FSize := Value;
end;

function TModelChartsEasyPie.TrackColor(Value: String): iModelChartEasyPie;
begin
  Result := Self;
  FTrackColor := Value;
end;

end.
