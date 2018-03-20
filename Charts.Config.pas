unit Charts.Config;

interface

uses
  Interfaces, Data.DB, System.Generics.Collections;

Type
  TModelHTMLChartsConfig<T> = class(TInterfacedObject, iModelHTMLChartsConfig<T>)
    private
      {$IFDEF VER320}
      [unsafe]
      {$ENDIF}
      FParent : T;
      FColSpan : Integer;
      FWidth : Integer;
      FHeigth : Integer;
      FData : String;
      FTitle : String;
      FBackgroundColor : String;
      FOptions : String;
      FName : String;
      FLabels : String;
      FDataSet : TList<iModelHTMLDataSet<iModelHTMLChartsConfig<T>>>;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLChartsConfig<T>;
      function ColSpan(Value : Integer) : iModelHTMLChartsConfig<T>; overload;
      function ColSpan : Integer; overload;
      function Width(Value : Integer) : iModelHTMLChartsConfig<T>; overload;
      function Width : Integer; overload;
      function Heigth(Value : Integer) : iModelHTMLChartsConfig<T>; overload;
      function Heigth : Integer; overload;
      function Data(Value : String) : iModelHTMLChartsConfig<T>; overload;
      function Data : String; overload;
      function Title(Value : String) : iModelHTMLChartsConfig<T>; overload;
      function Title : String; overload;
      function BackgroundColor(Value : String) : iModelHTMLChartsConfig<T>; overload;
      function BackgroundColor : String; overload;
      function Options(Value : String) : iModelHTMLChartsConfig<T>; overload;
      function Options : String; overload;
      function Name(Value : String) : iModelHTMLChartsConfig<T>; overload;
      function Name : String; overload;
      function Labels(Value : String) : iModelHTMLChartsConfig<T>; overload;
      function Labels : String; overload;
      function DataSet : iModelHTMLDataSet<iModelHTMLChartsConfig<T>>;
      function ResultDataSet : String;
      function ResultLabels : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Charts.DataSet;

{ TModelHTMLChartsConfig<T> }

function TModelHTMLChartsConfig<T>.ColSpan(
  Value: Integer): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FColSpan := Value;
end;

function TModelHTMLChartsConfig<T>.ColSpan: Integer;
begin
  Result := FColSpan;
end;

constructor TModelHTMLChartsConfig<T>.Create(Parent : T);
begin
  FParent := Parent;
  FDataSet := TList<iModelHTMLDataSet<iModelHTMLChartsConfig<T>>>.Create;
end;

function TModelHTMLChartsConfig<T>.Data: String;
begin
  Result := FData;
end;

function TModelHTMLChartsConfig<T>.DataSet: iModelHTMLDataSet<iModelHTMLChartsConfig<T>>;
begin
  FDataSet.Add(TModelHTMLChartsDataSet<iModelHTMLChartsConfig<T>>.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

function TModelHTMLChartsConfig<T>.Data(
  Value: String): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FData := Value;
end;

destructor TModelHTMLChartsConfig<T>.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

function TModelHTMLChartsConfig<T>.Heigth(
  Value: Integer): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FHeigth := Value;
end;

function TModelHTMLChartsConfig<T>.Heigth: Integer;
begin
  Result := FHeigth;
end;

function TModelHTMLChartsConfig<T>.Labels: String;
begin
  Result := FLabels;
end;

function TModelHTMLChartsConfig<T>.Labels(
  Value: String): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FLabels := Value;
end;

function TModelHTMLChartsConfig<T>.Name: String;
begin
  Result := FName;
end;

function TModelHTMLChartsConfig<T>.Name(
  Value: String): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FName := Value;
end;

class function TModelHTMLChartsConfig<T>.New(Parent : T): iModelHTMLChartsConfig<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsConfig<T>.BackgroundColor(
  Value: String): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TModelHTMLChartsConfig<T>.BackgroundColor: String;
begin
  Result := FBackgroundColor;
end;

function TModelHTMLChartsConfig<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLChartsConfig<T>.Options(
  Value: String): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FOptions := Value;
end;

function TModelHTMLChartsConfig<T>.Options: String;
begin
  Result := FOptions;
end;

function TModelHTMLChartsConfig<T>.ResultDataSet: String;
var
  I: Integer;
  aux: String;
begin
  Result := '';
  aux := ',';
  for I := 0 to Pred(FDataSet.Count) do
  begin
    if I = Pred(FDataSet.Count) then aux := '';
    Result := Result + FDataSet[I].ResultScript + aux;
  end;
end;

function TModelHTMLChartsConfig<T>.ResultLabels: String;
begin
  if FDataSet.Count > 0 then
    FLabels := FDataSet[0].ResultLabels;

  Result := FLabels;
end;

function TModelHTMLChartsConfig<T>.Title(
  Value: String): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FTitle := Value;
end;

function TModelHTMLChartsConfig<T>.Title: String;
begin
  Result := FTitle;
end;

function TModelHTMLChartsConfig<T>.Width(
  Value: Integer): iModelHTMLChartsConfig<T>;
begin
  Result := Self;
  FWidth := Value;
end;

function TModelHTMLChartsConfig<T>.Width: Integer;
begin
  Result := FWidth;
end;

end.
