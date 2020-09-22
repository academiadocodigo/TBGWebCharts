unit Generic.DataSet;

interface

uses
  Interfaces,
  Data.DB,
  Generics.Collections;

type
  TModelGenericDataset<T : IInterface> = class(TInterfacedObject, iModelGenericDataSet<T>)
    private
      [weak]
      FParent : T;
      FDataSet : TDataSet;
      FValueName : String;
      FLabelName : String;
      FRGBName : String;
      FCallbackLink  : TDictionary<string, string>;
      function replaceValue(Value : String) : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelGenericDataset<T>;
      function DataSet (Value : TDataSet) : iModelGenericDataset<T>; overload;
      function ValueName(Value : String) : iModelGenericDataSet<T>; overload;
      function LabelName(Value : String) : iModelGenericDataSet<T>; overload;
      function RGBName(Value : String)  : iModelGenericDataSet<T>; overload;
      function &End : T;
      function DataSet : TDataSet; overload;
      function ValueName : String; overload;
      function LabelName : String; overload;
      function RGBName : String; overload;
      function CallbackLink(Field : String; MethodName : String) : iModelGenericDataSet<T>; overload;
      function CallbackLink : TDictionary<String, String>; overload;
      function DataSetJstringify : string;
  end;

implementation

uses
  Injection,
  System.SysUtils;

{ TModelGenericDataset<T> }

function TModelGenericDataset<T>.CallbackLink(Field,
  MethodName: String): iModelGenericDataSet<T>;
begin
  Result := Self;
  FCallbackLink.Add(Field, MethodName);
end;

function TModelGenericDataset<T>.CallbackLink: TDictionary<String, String>;
begin
  Result := FCallbackLink;
end;

constructor TModelGenericDataset<T>.Create(Parent: T);
begin
  TInjection.Weak(@FParent, Parent);
  FCallbackLink := TDictionary<string, string>.Create;
  FLabelName := 'Label';
end;

function TModelGenericDataset<T>.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TModelGenericDataset<T>.DataSetJstringify: string;
var
  I: Integer;
  J: Integer;
  Aux : string;
  Aux_ : string;
  _Field : String;
  _Value : String;
begin
  Result := '[';
  FDataSet.First;
  for I := 0 to Pred(FDataSet.RecordCount) do
  begin
    Result := Result + '{';
    Aux := ', ';
    Aux_ := ', ';
    if I = Pred(FDataSet.RecordCount) then
      Aux_ := '';
    for J := 0 to Pred(FDataSet.Fields.Count) do
    begin
      if J = Pred(FDataSet.Fields.Count) then
        Aux := '';
      if FDataSet.Fields[J].Visible then
      begin
        if FDataSet.Fields[J].DisplayName <> '' then
          _Field := FDataSet.Fields[J].DisplayName
        else
          _Field := FDataSet.Fields[J].FieldName;

        case FDataSet.Fields[J].DataType of
          ftFloat,ftCurrency :
            Begin
              _value := replaceValue(FDataSet.FieldByName(FDataSet.Fields[J].FieldName).AsString);
            End else
            _Value := FDataSet.FieldByName(FDataSet.Fields[J].FieldName).AsString;
        end;

        Result := Result + QuotedStr(_Field) + ':"' + _Value + '"' + Aux;

//        if FDataSet.Fields[J].DisplayName <> '' then
//          Result := Result + QuotedStr(FDataSet.Fields[J].DisplayName) + ':'
//          + '"' + FDataSet.FieldByName(FDataSet.Fields[J].FieldName).AsString + '"' +  Aux
//        else
//          Result := Result + QuotedStr(FDataSet.Fields[J].FieldName) + ':'
//          + '"' + FDataSet.FieldByName(FDataSet.Fields[J].FieldName).AsString + '"' +  Aux;
      end;
    end;
    Result := Result + '}' + aux_ ;
    FDataSet.Next;
  end;
  Result := Result + ']';
end;

function TModelGenericDataset<T>.DataSet(Value: TDataSet): iModelGenericDataset<T>;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelGenericDataset<T>.Destroy;
begin
  FreeAndNil(FCallbackLink);
  inherited;
end;

function TModelGenericDataset<T>.&End: T;
begin
  Result := FParent;
end;

function TModelGenericDataset<T>.LabelName: String;
begin
  Result := FLabelName;
end;

function TModelGenericDataset<T>.LabelName(
  Value: String): iModelGenericDataSet<T>;
begin
  Result := Self;
  FLabelName := Value;
end;

class function TModelGenericDataset<T>.New(Parent: T): iModelGenericDataset<T>;
begin
  Result := Self.Create(Parent)
end;

function TModelGenericDataset<T>.replaceValue(Value: String): String;
var
  I,cont : Integer;
  caracter : string;
begin
  caracter := '';
  cont := 0;
   {$IF Defined(ANDROID) or Defined(IOS)}
  for I := Length(Value) downto 0 do
  {$ELSE}
  for I := Length(Value) downto 1 do
  {$ENDIF}
  begin
      if (CharInSet(value[i], ['0'..'9']) or (value[i]='-')) then
        caracter := value[i] + caracter
      else
      begin
        if cont=0 then
        begin
          if ((value[i]='.') or (value[i]=',')) then
          begin
            value[i]:='.';
            caracter := value[i] + caracter;
            inc(cont);
          end;
        end;
      end;
  end;
  result:=caracter;
end;

function TModelGenericDataset<T>.RGBName: String;
begin
  Result := FRGBName;
end;

function TModelGenericDataset<T>.RGBName(
  Value: String): iModelGenericDataSet<T>;
begin
  Result := Self;
  FRGBName := Value;
end;

function TModelGenericDataset<T>.ValueName: String;
begin
  Result := FValueName;
end;

function TModelGenericDataset<T>.ValueName(Value: String): iModelGenericDataset<T>;
begin
  Result := Self;
  FValueName := Value;
end;

end.
