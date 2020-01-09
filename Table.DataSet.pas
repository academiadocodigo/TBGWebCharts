unit Table.DataSet;

interface

uses
  Interfaces, DB, Classes, Generics.Collections;

Type
  TModelTableDataSet = class(TInterfacedObject, iModelTableDataSet)
    private
      [weak]
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
  SysUtils, Injection,StrUtils;

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
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
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

  _value : String;
begin
  Result := '';
  Result := Result + '<thead>';
  Result := Result + '<tr>';
  for I := 0 to Pred(FDataSet.Fields.Count) do
  begin
        if FDataSet.Fields[I].Visible <> false then
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
        if FDataSet.Fields[X].Visible then
        Begin
         _tdClass := '';
          case FDataSet.Fields[X].DataType of
            ftFloat,ftCurrency :
            Begin
               _tdClass := 'text-right';
               _value := FormatFloat((FDataSet.Fields[X] as TFloatField).DisplayFormat,
                                                        FDataSet.FieldByName(FDataSet.Fields[x].FieldName).AsFloat) ;

            end else
               _value := FDataSet.FieldByName(FDataSet.Fields[X].FieldName).AsString;
          end;

          if FCallbackLink.TryGetValue(FDataSet.Fields[X].FieldName,_MethodName) then
              Result := Result + '<td class="'+_tdClass+'"><a href="ActionCallBackJS:'+_MethodName+'('+FDataSet.FieldByName(FDataSet.Fields[X].FieldName).AsString+')">' + FDataSet.FieldByName(FDataSet.Fields[X].FieldName).AsString + '</a></td>'
          else
              Result := Result + '<td class="'+_tdClass+'">'+ _value + '</td>'
        end;
    end;
    Result := Result + '</tr>';
    FDataSet.Next;
  end;
  Result := Result + '</tbody>';

end;

end.


