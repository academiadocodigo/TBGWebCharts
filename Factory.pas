unit Factory;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces;

Type
  TModelHTMLFactory = class(TInterfacedObject, iModelHTMLFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelHTMLFactory;
    function HTML: iModelHTML;
    function Charts(Parent: iModelHTML): iModelHTMLCharts;
    function ChartBar(Parent: iModelHTMLCharts): iModelHTMLChartsBar;
    function Rows(Parent : iModelHTML) : IModelHTMLRows;
    function RowsTitle(Parent : IModelHTMLRows) : iModelHTMLRowsTitle;
    {$IFDEF FULL}
    function Table(Parent : iModelHTML) : iModelTable;
    {$ENDIF}
  end;

implementation

{ TModelHTMLFactory }

uses
  Charts.Bar,
  Charts,
  HTML,
  Rows.Title,
  {$IFDEF FULL}
  Table,
  {$ENDIF}
  Rows;

function TModelHTMLFactory.ChartBar(Parent: iModelHTMLCharts): iModelHTMLChartsBar;
begin
  Result := TModelHTMLChartsBar.New(Parent);
end;

function TModelHTMLFactory.Charts(Parent: iModelHTML): iModelHTMLCharts;
begin
  Result := TModelHTMLCharts.New(Parent);
end;

constructor TModelHTMLFactory.Create;
begin

end;

destructor TModelHTMLFactory.Destroy;
begin

  inherited;
end;

function TModelHTMLFactory.HTML: iModelHTML;
begin
  Result := TModelHTML.New;
end;

class function TModelHTMLFactory.New: iModelHTMLFactory;
begin
  Result := Self.Create;
end;

function TModelHTMLFactory.Rows(Parent: iModelHTML): IModelHTMLRows;
begin
  Result := TModelHTMLRows.New(Parent);
end;

function TModelHTMLFactory.RowsTitle(
  Parent: IModelHTMLRows): iModelHTMLRowsTitle;
begin
  Result := TModelHTMLRowsTitle.New(Parent);
end;

{$IFDEF FULL}
function TModelHTMLFactory.Table(Parent: iModelHTML): iModelTable;
begin
  Result := TModelTable.New(Parent);
end;
{$ENDIF}

end.
