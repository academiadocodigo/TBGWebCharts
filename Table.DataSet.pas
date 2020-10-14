unit Table.DataSet;

interface

uses
  Interfaces, DB, Classes, Generics.Collections;

Type
  TCallBackContent = Record
    FField : string;
    FValue : String;
    FMethod : string;
  end;

  TModelTableDataSet = class(TInterfacedObject, iModelTableDataSet)
    private
      [weak]
      FParent : iModelTable;
      FDataSet : TDataSet;
      FAction : TList<iModelTableAction>;
      FCallbackLink  : TDictionary<string, TCallBackContent>;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableDataSet;
      function DataSet (Value : TDataSet) : iModelTableDataSet;
      function CallbackLink(Field : String; MethodName : String) : iModelTableDataSet; overload;
      function CallbackLink(Field : String; MethodName : String; AValue : String) : iModelTableDataSet; overload;
      function Action : iModelTableAction;
      function ActionEdit : iModelTableAction;
      function ActionDelete : iModelTableAction;
      function ResultScript : String;
      function ResultStyle : String;
      function &End : iModelTable;
  end;

implementation

uses
  SysUtils,
  Injection,
  StrUtils,
  IdCoderMIME, Table.Action;

{ TModelTableDataSet }

function TModelTableDataSet.&End: iModelTable;
begin
  Result := FParent;
end;

function TModelTableDataSet.CallbackLink(Field : String; MethodName : String) : iModelTableDataSet;
var
  content : TCallBackContent;
begin
  Result := Self;
  content.FField := Field;
  content.FValue := Field;
  content.FMethod := MethodName;
  FCallbackLink.Add(Field, content);
end;

function TModelTableDataSet.Action: iModelTableAction;
begin
  FAction.Add(TModelTableAction.New(Self));
  Result := FAction[Pred(FAction.Count)];
end;

function TModelTableDataSet.ActionDelete: iModelTableAction;
begin
  FAction.Add(TModelTableAction.New(Self));
  FAction[Pred(FAction.Count)].ActionHeader('Excluir');
  FAction[Pred(FAction.Count)]
    .Image
      .Image('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAAhQAAAIUB4uz/wQAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAHUSURBVEiJtda9ahRRFAfw3xHFJCabFE'+
        'kawcYiYKMWVmohBHwFOwsfQLCxthOENHZqKxZG8DHSxcJC0Qcw7AqSNSoGci3mznp3nP0K8cBlZs7X/5z//RopJeMGlrGL1Bi7WJ4Uf9pk2cQVPMDPrJvHVra9GRc8BBARS7iKU4X6cn5+wvf8vljbIuJr4XuEdyml/YGmoGIdX/xLxayji/U2iu5iJXfwa1zbY2QOOz'+
        'nXE4YpuoE93D5m8lr2cLMN4BWu4TF+4HDGxIEOeng90DaW5BkVj/fyd6dhP4u5hq6Tnxdz7GZpL1eLlNIhvmEtq7Yj4mHhsoWng5Ir23b+rGO6Zc62fdAtnFewUdjOqyaylo3sMxJgqIMsvcJ5X8XrKFlCvwHQmwRQdjArwH5K6fc0AKvHAFjVoGcUwCwUdbKPHNNrOp'+
        'w0RVN10MVCRCz8T4A6oI/FiIiTBKh5XFN1EDnRkETEnGrnH2sOSoC60rbqoR8R8zg3bQe102oB0DYPAwB/l/VkgJTSgeo+KDtoA6h1fSN2Me1nUV3JOj7iOT5k/csi5jNe4D2uj+og8lE7rIx4hjt4hIMRRZRyX7UYLqWUjoYsI35VLuCt6tKZ5h7ewa22XH8AgjMTis'+
        'pa6ucAAAAASUVORK5CYII=')
      .Tooltip('Excluir')
    .&End;
  Result := FAction[Pred(FAction.Count)];
end;

function TModelTableDataSet.ActionEdit: iModelTableAction;
begin
  FAction.Add(TModelTableAction.New(Self));
  FAction[Pred(FAction.Count)].ActionHeader('Editar');
  FAction[Pred(FAction.Count)]
    .Image
      .Image('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAAqgAAAKoBBgpwTwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAHASURBVEiJtdW9a9RBEMbxzyQRJI1Vop'+
        'WCYBDBN6J4hSIovoAG7MTaxkrwT9BKbNVgI1hIsLBSsDIK2kRULoiazi6Ib40GE1Aci9uDI9zLz9w5sM0M+31mZmd3ZaZBLGzAJbzCNWzJTCMGYBExhidYwS2cQj0iDkRmiohRnMP+NvufZeZMBfgOTGbmfPHP4PtQRExiERexvs3qWGVEjBf4Z9zDo4iYKOG7mII7uL'+
        'GGno/jLWYxiuECXcQ23Md1WEatH3iLvymyjC/YOlTasNKpDR3a8hSfMJWZP1vCf/ADSziSmR8gsadi5hvxbnXmJRaYLpnvbPFXEyjw9xXgu1bFegtUhH9dDa8kgE0V4bs77O8sUAZgQWPW/xleReBkib/BWBv4t17tHeoxlSfwsBzebESMRUTgJs7iaPNp6GbdKljAeY'+
        '2bOlsquV0y31txtNsLYHOJTeBYyTqrwHEQlzO7P9fHC3Aev0oFF/AgMz/26Mo+HKbLS4nXuILHmMvM3z2gba2jQGbWUV8LtNV6TVHf9j8FsinwArUBw2uYo3EG07gaEevwsk/wME7jDLY3nSMaH/5zjY+nn7Wk8Tcfat6Jv9goYl6dGLdgAAAAAElFTkSuQmCC')
      .Tooltip('Editar')
    .&End;
  Result := FAction[Pred(FAction.Count)];
end;

function TModelTableDataSet.CallbackLink(Field, MethodName,
  AValue: String): iModelTableDataSet;
var
  content : TCallBackContent;
begin
  Result := Self;
  content.FField := Field;
  content.FValue := AValue;
  content.FMethod := MethodName;
  FCallbackLink.Add(Field, content);

end;

constructor TModelTableDataSet.Create(Parent : iModelTable);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FCallbackLink := TDictionary<string, TCallBackContent>.Create;
  FAction := TList<iModelTableAction>.Create;
end;

function TModelTableDataSet.DataSet(Value: TDataSet): iModelTableDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelTableDataSet.Destroy;
begin
  FreeAndNil(FCallbackLink);
  FreeAndNil(FAction);
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
  J: Integer;
  _MethodName : TCallBackContent;
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

  for I := 0 to Pred(FAction.Count) do
    Result := Result + '<th scope="col">'+FAction[I].ActionHeader+'</th>';

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
            ftFloat,ftCurrency, ftBCD, ftFMTBcd, ftExtended:
            Begin
               _tdClass := 'text-right';
               _value := FormatFloat(TFloatField(FDataSet.Fields[X]).DisplayFormat, FDataSet.FieldByName(FDataSet.Fields[x].FieldName).AsFloat) ;
            end else
               _value := FDataSet.FieldByName(FDataSet.Fields[X].FieldName).AsString;
          end;

          if FCallbackLink.TryGetValue(FDataSet.Fields[X].FieldName,_MethodName) then
              Result := Result + '<td class="' + _tdClass + '"><a href="ActionCallBackJS:' + _MethodName.FMethod + '(' + TIdEncoderMIME.EncodeString(FDataSet.FieldByName(_MethodName.FValue).AsString) + ')">' + FDataSet.FieldByName(_MethodName.FField).AsString + '</a></td>'
          else
              Result := Result + '<td class="'+_tdClass+'">'+ _value + '</td>'
        end;
    end;
    for J := 0 to Pred(FAction.Count) do
    begin
        Result := Result + '<td><a href="ActionCallBackJS:' + FAction[J].MethodName + '(' + TIdEncoderMIME.EncodeString(FDataSet.FieldByName(FAction[J].FieldName).AsString) + ')">' + FAction[J].ImageTag + '</a></td>'
    end;

    Result := Result + '</tr>';
    FDataSet.Next;
  end;
  Result := Result + '</tbody>';

end;

function TModelTableDataSet.ResultStyle: String;
var
  I : Integer;
begin
  for I := 0 to Pred(FAction.Count) do
  begin
    Result := Result + FAction[I].ResultStyle;
  end;
  if Result <> '' then
    Result := '<style>' + Result + '</style>';
end;

end.


