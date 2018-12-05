unit Table;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelTable = class(TInterfacedObject, iModelTable, iModelTableClass)
    private
      [weak]
      FParent : iModelHTML;
      FClass : String;
      FDataSet : TList<iModelTableDataSet>;
    public
      constructor Create(Parent : iModelHTML);
      destructor Destroy; override;
      class function New(Parent : iModelHTML) : iModelTable;
      function &End : iModelHTML;
      function DataSet : iModelTableDataSet;
      function TableClass : iModelTableClass;

      //iModelTableClass
      function tableDark : iModelTableClass;
      function tableStriped : iModelTableClass;
      function tableBordered : iModelTableClass;
      function tableHover : iModelTableClass;
      function tableSm : iModelTableClass;
      function tableResponsive : iModelTableClass;
      function &EndTableClass : iModelTable;
  end;

implementation

uses
  Table.DataSet, SysUtils, Injection;

{ TModelTable }

function TModelTable.&End: iModelHTML;
var
  I: Integer;
begin
  Result := FParent;
  FParent.HTML('<table class="' + FClass + '">');
  for I := 0 to Pred(FDataSet.Count) do
    FParent.HTML(FDataSet[I].ResultScript);
  FParent.HTML('</table>');
end;

function TModelTable.EndTableClass: iModelTable;
begin
  Result := Self;
end;

constructor TModelTable.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TList<iModelTableDataSet>.Create;
  FClass := 'table';
end;

function TModelTable.DataSet: iModelTableDataSet;
begin
  FDataSet.Add(TModelTableDataSet.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

destructor TModelTable.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

class function TModelTable.New(Parent : iModelHTML) : iModelTable;
begin
  Result := Self.Create(Parent);
end;

function TModelTable.tableBordered: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-bordered';
end;

function TModelTable.TableClass: iModelTableClass;
begin
  Result := Self;
end;

function TModelTable.tableDark: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-dark';
end;

function TModelTable.tableHover: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-hover';
end;

function TModelTable.tableResponsive: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-responsive';
end;

function TModelTable.tableSm: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-sm';
end;

function TModelTable.tableStriped: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-striped';
end;

end.
