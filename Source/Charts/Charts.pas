unit Charts;

interface

uses
  Interfaces, Generics.Collections, Charts.Types;

Type
  TModelHTMLCharts = class(TInterfacedObject, iModelHTMLCharts)
    private
      [weak]
      FParent : IModelHTML;
      FChartGeneric : iModelHTMLChartsGeneric;
      FChartType : TTypeChart;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelHTMLCharts;
      function _ChartType(Value : TTypeChart) : iModelHTMLChartsGeneric; overload;
      function _ChartType : TTypeChart; overload;
      function HTML(Value : String) : iModelHTMLCharts; overload;
      function HTML : String; overload;
      function &End : iModelHTML;
  end;

implementation

uses
  Factory,
  SysUtils,
  Injection,
  Charts.Generic;

{ TModelHTMLCharts }

function TModelHTMLCharts.&End: iModelHTML;
begin
  Result := FParent;
end;

function TModelHTMLCharts.HTML: String;
begin
  Result := FParent.HTML;
end;

function TModelHTMLCharts.HTML(Value: String): iModelHTMLCharts;
begin
  Result := Self;
  FParent.HTML(Value);
end;

constructor TModelHTMLCharts.Create(Parent : IModelHTML);
begin
  FParent := Parent;
end;

destructor TModelHTMLCharts.Destroy;
begin
  inherited;
end;

class function TModelHTMLCharts.New(Parent : IModelHTML) : iModelHTMLCharts;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLCharts._ChartType: TTypeChart;
begin
  Result := FChartType;
end;

function TModelHTMLCharts._ChartType(Value: TTypeChart): iModelHTMLChartsGeneric;
begin
  FChartType := Value;
  case FChartType of
    pie,
    doughnut,
    radar,
    polarArea:
    begin
      FChartGeneric := TModelChartsGeneric.New(Self);
      FChartGeneric
        .Attributes
          .Options
            .Scales
              .GeneratedAxes(False)
            .&End
            .Plugins
              .Streaming(False)
            .&End
            .Tooltip
              .ToolTipNoScales
            .&End
          .&End
        .&End
    end;
    line,
    bar,
    horizontalBar,
    bubble,
    scatter:
      FChartGeneric := TModelChartsGeneric.New(Self);
  end;
  Result := FChartGeneric;
end;

end.
