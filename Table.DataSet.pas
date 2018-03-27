unit Table.DataSet;

interface

uses
  Interfaces, DB;

Type
  TModelTableDataSet = class(TInterfacedObject, iModelTableDataSet)
    private
      [weak]
      FParent : iModelTable;
      FDataSet : TDataSet;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableDataSet;
      function DataSet (Value : TDataSet) : iModelTableDataSet;
      function ResultScript : String;
      function &End : iModelTable;
  end;

implementation

{ TModelTableDataSet }

function TModelTableDataSet.&End: iModelTable;
begin
  Result := FParent;
end;

constructor TModelTableDataSet.Create(Parent : iModelTable);
begin
  FParent := Parent;
end;

function TModelTableDataSet.DataSet(Value: TDataSet): iModelTableDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelTableDataSet.Destroy;
begin

  inherited;
end;

class function TModelTableDataSet.New(Parent : iModelTable) : iModelTableDataSet;
begin
  Result := Self.Create(Parent);
end;

function TModelTableDataSet.ResultScript: String;
var
  I: Integer;
  X: Integer;
begin
  Result := '';
  Result := Result + '<thead>';
  Result := Result + '<tr>';
  for I := 0 to Pred(FDataSet.Fields.Count) do
  begin
    Result := Result + '<th scope="col">'+FDataSet.Fields[I].DisplayName+'</th>';
  end;
  Result := Result + '</tr>';
  Result := Result + '</thead>';

  Result := Result + '<tbody>';
  FDataSet.First;
  for I := 0 to Pred(FDataSet.RecordCount) do
  begin
    Result := Result + '<tr>';
    for X := 0 to Pred(FDataSet.Fields.Count) do
    begin
      Result := Result + '<td>' + FDataSet.FieldByName(FDataSet.Fields[X].DisplayName).AsString + '</td>';
    end;
    Result := Result + '</tr>';
    FDataSet.Next;
  end;
  Result := Result + '</tbody>';
end;

end.

