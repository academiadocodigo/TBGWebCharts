unit Maps.Dataset;

interface

uses
  Interfaces,
  Data.DB,
  Generics.Collections;

type
  TModelMapsDataset<T : IInterface> = class(TInterfacedObject, iModelMapsDataSet<T>)
    private
      [weak]
      FParent : T;
      FDataSet : TDataSet;
      FLatName : String;
      FLngName : String;
      FLabelName : String;
      FValueName : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelMapsDataSet<T>;
      function DataSet (Value : TDataSet) : iModelMapsDataSet<T>; overload;
      function LatName(Value : String) : iModelMapsDataSet<T>; overload;
      function LngName(Value : String) : iModelMapsDataSet<T>; overload;
      function LabelName(Value : String) : iModelMapsDataSet<T>; overload;
      function ValueName(Value : String) : iModelMapsDataSet<T>; overload;
      function DataSet : TDataSet; overload;
      function LatName : String; overload;
      function LngName : String; overload;
      function LabelName : String; overload;
      function ValueName : String; overload;
      function &End : T;
  end;
implementation

uses
  Injection;
{ TModelGenericDataset<T> }

constructor TModelMapsDataset<T>.Create(Parent: T);
begin
  TInjection.Weak(@FParent, Parent);
  FLatName := 'Lat';
  FLngName := 'Lng';
  FLabelName := 'Label';
  FValueName := 'Value';
end;

function TModelMapsDataset<T>.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TModelMapsDataset<T>.DataSet(Value: TDataSet): iModelMapsDataSet<T>;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelMapsDataset<T>.Destroy;
begin

  inherited;
end;

function TModelMapsDataset<T>.&End: T;
begin
  Result :=FParent;
end;

function TModelMapsDataset<T>.LabelName(Value: String): iModelMapsDataSet<T>;
begin
  Result := Self;
  FLabelName := Value;
end;

function TModelMapsDataset<T>.LabelName: String;
begin
  Result := FLabelName;
end;

function TModelMapsDataset<T>.LatName(Value: String): iModelMapsDataSet<T>;
begin
  Result := Self;
  FLatName := Value;
end;

function TModelMapsDataset<T>.LatName: String;
begin
  Result := FLatName;
end;

function TModelMapsDataset<T>.LngName(Value: String): iModelMapsDataSet<T>;
begin
  Result := Self;
  FLngName := Value;
end;

function TModelMapsDataset<T>.LngName: String;
begin
  Result := FLngName
end;

class function TModelMapsDataset<T>.New(Parent: T): iModelMapsDataSet<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsDataset<T>.ValueName: String;
begin
  Result := FValueName;
end;

function TModelMapsDataset<T>.ValueName(Value: String): iModelMapsDataSet<T>;
begin
  Result := Self;
  FValueName := Value;
end;

end.
