unit Charts.Options;
interface
uses
  Interfaces;
type
  TModelHTMLChartsOptions = class(TInterfacedObject, iModelHTMLOptions)
    private
      FParent : iModelHTMLChartsConfig;
      FScales : iModelHTMLScales;
      FLegend : iModelHTMLLegend;
      FTitle  : iModelHTMLTitle<iModelHTMLOptions>;
      FTooltip : iModelHTMLTooltip<iModelHTMLOptions>;
      FSemiCircule : Boolean;
      FPlugins : iModelHTMLPlugins;
      FSkipEmptyData : Boolean;
      FHideLabelEmptyData : Boolean;
    public
      constructor Create(Parent : iModelHTMLChartsConfig);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLChartsConfig) : iModelHTMLOptions;
      function HideLabelEmptyData(Value : Boolean) : iModelHTMLOptions;
      function Legend : iModelHTMLLegend;
      function Plugins : iModelHTMLPlugins;
      function Result : String;
      function Scales : iModelHTMLScales;
      function SemiCircule ( Value : Boolean ) : iModelHTMLOptions;
      function SkipEmptyData(Value : Boolean) : iModelHTMLOptions;
      function Title : iModelHTMLTitle<iModelHTMLOptions>;
      function Tooltip : iModelHTMLTooltip<iModelHTMLOptions>;
      function &End : iModelHTMLChartsConfig;
  end;
implementation
uses
  Charts.Scales,
  Charts.Legends,
  Charts.Title,
  Charts.Tooltip,
  Injection,
  Charts.Plugins, System.SysUtils;
{ TModelHTMLChartsOptions<T> }
function TModelHTMLChartsOptions.&End: iModelHTMLChartsConfig;
begin
  Result := FParent;
end;
function TModelHTMLChartsOptions.HideLabelEmptyData(
  Value: Boolean): iModelHTMLOptions;
begin
  Result := Self;
  FHideLabelEmptyData := Value;
end;

function TModelHTMLChartsOptions.Legend: iModelHTMLLegend;
begin
  Result := FLegend;
end;
constructor TModelHTMLChartsOptions.Create(Parent : iModelHTMLChartsConfig);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FScales := TModelHTMLChartsScales.New(Self);
  FLegend := TModelHTMLChartsLegends.New(Self);
  FTitle := TModelHTMLChartsTitle<iModelHTMLOptions>.New(Self);
  FTooltip := TModelHTMLChartsTooltip<iModelHTMLOptions>.New(Self);
  FPlugins := TModelHtmlChartsPlugins.New(Self);
end;
destructor TModelHTMLChartsOptions.Destroy;
begin
  inherited;
end;
class function TModelHTMLChartsOptions.New(Parent : iModelHTMLChartsConfig): iModelHTMLOptions;
begin
    Result := Self.Create(Parent);
end;
function TModelHTMLChartsOptions.Plugins: iModelHTMLPlugins;
begin
  Result := FPlugins;
end;

function TModelHTMLChartsOptions.Result: String;
begin
  Result := '';
  Result := Result + 'options: { ';
  if FSemiCircule then
  begin
    Result := Result + 'circumference : Math.PI, ';
    Result := Result + 'rotation : -Math.PI, ';
  end;
  Result := Result + FScales.Result;
  Result := Result + FLegend.Result;
  Result := Result + FTitle.Result;
  Result := Result + FTooltip.Result;
  Result := Result + ' responsive: true, ';
  Result := Result + FPlugins.Result;
  Result := Format('%s skipEmptyData: %s,', [Result, LowerCase(BoolToStr(FSkipEmptyData, true))]);
  Result := Format('%s hideLabelEmptyData: %s,', [Result, LowerCase(BoolToStr(FHideLabelEmptyData, true))]);
  Result := Result + '}';
end;
function TModelHTMLChartsOptions.Scales: iModelHTMLScales;
begin
  Result := FScales;
end;
function TModelHTMLChartsOptions.SemiCircule(
  Value: Boolean): iModelHTMLOptions;
begin
  Result := Self;
  FSemiCircule := Value;
end;
function TModelHTMLChartsOptions.SkipEmptyData(
  Value: Boolean): iModelHTMLOptions;
begin
  Result := Self;
  FSkipEmptyData := Value;
end;

function TModelHTMLChartsOptions.Title: iModelHTMLTitle<iModelHTMLOptions>;
begin
  Result := FTitle;
end;
function TModelHTMLChartsOptions.Tooltip: iModelHTMLTooltip<iModelHTMLOptions>;
begin
  Result := FTooltip;
end;
end.
