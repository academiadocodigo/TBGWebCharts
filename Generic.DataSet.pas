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
  System.SysUtils,
  Utilities.Str;

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

        _Value := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.Fields[J]);

        Result := Result + QuotedStr(_Field) + ':"' + _Value + '"' + Aux;
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
