unit Table.DataSet;

interface

uses
  Interfaces, DB, Classes, Generics.Collections;

Type
  TModelTableDataSet = class(TInterfacedObject, iModelTableDataSet)
    private
      FParent : iModelTable;
      FDataSet : TDataSet;
      FCallbackLink  : TDictionary<string, string>;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableDataSet;
      function DataSet (Value : TDataSet) : iModelTableDataSet;
      function CallbackLink(Field : String; MethodName : String) : iModelTableDataSet;
      function ResultScript : String;
      function &End : iModelTable;
  end;

implementation

uses
  SysUtils, Injection;

{ TModelTableDataSet }

function TModelTableDataSet.&End: iModelTable;
begin
  Result := FParent;
end;

function TModelTableDataSet.CallbackLink(Field : String; MethodName : String) : iModelTableDataSet;
begin
  Result := Self;
  FCallbackLink.Add(Field, MethodName);
end;

constructor TModelTableDataSet.Create(Parent : iModelTable);
begin
  TInjection.Weak(@FParent, Parent);
  FCallbackLink := TDictionary<string, string>.Create;
end;

function TModelTableDataSet.DataSet(Value: TDataSet): iModelTableDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelTableDataSet.Destroy;
begin
  FreeAndNil(FCallbackLink);
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
  _MethodName : string;
  _tdClass : String;
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
      _tdClass := '';
      case FDataSet.Fields[X].DataType of
        ftInteger,
        ftFloat,
        ftSmallint,
        ftCurrency : _tdClass := 'text-right';
      end;

      if FCallbackLink.TryGetValue(FDataSet.Fields[X].DisplayName,_MethodName) then
        Result := Result + '<td class="'+_tdClass+'"><a href="ActionCallBackJS:'+_MethodName+'('+FDataSet.FieldByName(FDataSet.Fields[X].DisplayName).AsString+')">' + FDataSet.FieldByName(FDataSet.Fields[X].DisplayName).AsString + '</a></td>'
      else
        Result := Result + '<td>' + FDataSet.FieldByName(FDataSet.Fields[X].DisplayName).AsString + '</td>';
    end;
    Result := Result + '</tr>';
    FDataSet.Next;
  end;
  Result := Result + '</tbody>';
end;

end.

