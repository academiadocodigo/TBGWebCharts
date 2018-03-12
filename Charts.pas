unit Charts;

interface

uses
  Interfaces, System.Generics.Collections;

Type
  TModelHTMLCharts = class(TInterfacedObject, iModelHTMLCharts)
    private
      [weak]
      FParent : IModelHTML;
      FChartBar : iModelHTMLChartsBar;
      FDoughnut : iModelHTMLChartsDoughnut;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelHTMLCharts;
      function Bar : iModelHTMLChartsBar;
      function BarHorizontal : iModelHTMLChartsBar;
      function Doughnut : iModelHTMLChartsDoughnut;
      function Lines : iModelHTMLChartsLines;
      function LineStacked : iModelHTMLChartsLineStacked;
      function Pie : iModelHTMLChartsPie;
      function HTML(Value : String) : iModelHTMLCharts; overload;
      function HTML : String; overload;
      function &End : iModelHTML;
  end;

implementation

uses
  Factory, System.SysUtils,Charts.Doughnut,
  Charts.Lines, Charts.LineStacked,
  Charts.Pie, Charts.Bar.Horizontal;

{ TModelHTMLCharts }

function TModelHTMLCharts.&End: iModelHTML;
begin
  Result := FParent;
end;

function TModelHTMLCharts.HTML: String;
begin
  Result := FParent.HTML;
end;

function TModelHTMLCharts.Lines: iModelHTMLChartsLines;
begin
  Result := TModelHTMLChartsLines.New(Self);
end;

function TModelHTMLCharts.LineStacked: iModelHTMLChartsLineStacked;
begin
  Result := TModelHTMLChartsLineStacked.New(Self);
end;

function TModelHTMLCharts.HTML(Value: String): iModelHTMLCharts;
begin
  Result := Self;
  FParent.HTML(Value);
end;

function TModelHTMLCharts.Bar: iModelHTMLChartsBar;
begin
  FChartBar := TModelHTMLFactory.New.ChartBar(Self);
  Result := FChartBar;
end;

function TModelHTMLCharts.BarHorizontal: iModelHTMLChartsBar;
begin
  Result := TModelHTMLChartsBarHorizontal.New(Self);
end;

constructor TModelHTMLCharts.Create(Parent : IModelHTML);
begin
  FParent := Parent;
end;

destructor TModelHTMLCharts.Destroy;
begin
  inherited;
end;

function TModelHTMLCharts.Doughnut: iModelHTMLChartsDoughnut;
begin
  FDoughnut := TModelHTMLChartsDoughnut.New(Self);
  Result := FDoughnut;
end;

class function TModelHTMLCharts.New(Parent : IModelHTML) : iModelHTMLCharts;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLCharts.Pie: iModelHTMLChartsPie;
begin
  Result := TModelHTMLChartsPie.New(Self);
end;

end.
