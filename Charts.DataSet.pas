unit Charts.DataSet;

interface

uses
  Interfaces, DB;

Type
  TModelHTMLChartsDataSet<T> = class(TInterfacedObject, iModelHTMLDataSet<T>)
    private
      {$IFDEF VER320}
      [unsafe]
      {$ENDIF}
      FParent : T;
      FDataSet : TDataSet;
      FtextLabel : String;
      FBackgroundColor : String;
      FBorderColor : String;
      FBorderWidth : Integer;
      FData : String;
      FFill : String;
      FScript : String;
      FLabels : String;
      procedure generatedLabel;
      procedure generatedBackgroundColor;
      procedure generatedBorderColor;
      procedure generatedBorderWidth;
      procedure generatedData;
      procedure generatedFill;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLDataSet<T>;
      function DataSet (Value : TDataSet) : iModelHTMLDataSet<T>;
      function textLabel(Value : String) : iModelHTMLDataSet<T>;
      function BackgroundColor (Value : String) : iModelHTMLDataSet<T>;
      function BorderColor (Value : String) : iModelHTMLDataSet<T>;
      function BorderWidth (Value : Integer) : iModelHTMLDataSet<T>;
      function Data (Value : String) : iModelHTMLDataSet<T>;
      function Fill (Value : String) : iModelHTMLDataSet<T>;
      function ResultScript : String;
      function ResultLabels : String;
      function &End : T;
  end;

implementation

{ TModelHTMLChartsDataSet<T> }

function TModelHTMLChartsDataSet<T>.BackgroundColor(
  Value: String): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FBackgroundColor := '"rgba(' + Value + ', 100)"';
end;

function TModelHTMLChartsDataSet<T>.BorderColor(
  Value: String): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FBorderColor := Value;
end;

function TModelHTMLChartsDataSet<T>.BorderWidth(
  Value: Integer): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FBorderWidth := Value;
end;

function TModelHTMLChartsDataSet<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelHTMLChartsDataSet<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

function TModelHTMLChartsDataSet<T>.Data(Value: String): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FData := Value;
end;

function TModelHTMLChartsDataSet<T>.DataSet(
  Value: TDataSet): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelHTMLChartsDataSet<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsDataSet<T>.Fill(Value: String): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FFill := Value;
end;

procedure TModelHTMLChartsDataSet<T>.generatedBackgroundColor;
var
  Local_I: Integer;
  Aux : String;
  I, X: Integer;
begin
  if FBackgroundColor = '' then
  begin
    FBackgroundColor := '["';
    Aux := ', 100)", "';
    FDataSet.First;
    for Local_I := 0 to Pred(FDataSet.RecordCount) do
    begin
      if Local_I = Pred(FDataSet.RecordCount) then Aux := ', 100)';
      FBackgroundColor := FBackgroundColor + 'rgba(' + FDataSet.FieldByName('RGB').AsString + Aux;
      FDataSet.Next;
    end;
    FBackgroundColor := FBackgroundColor + '"]';
  end;
end;

procedure TModelHTMLChartsDataSet<T>.generatedBorderColor;
begin

end;

procedure TModelHTMLChartsDataSet<T>.generatedBorderWidth;
begin

end;

procedure TModelHTMLChartsDataSet<T>.generatedData;
var
  Aux: string;
  I, X : Integer;
begin
  FData := '[';
  Aux := ', ';
  FDataSet.First;
  for I := 0 to Pred(FDataSet.RecordCount) do
  begin
    if I = Pred(FDataSet.RecordCount) then
      Aux := '';
    FData := FData + FDataSet.FieldByName('Value').AsString + Aux;
    FDataSet.Next;
  end;
  FData := FData + ']';
end;

procedure TModelHTMLChartsDataSet<T>.generatedFill;
begin

end;

procedure TModelHTMLChartsDataSet<T>.generatedLabel;
begin

end;

class function TModelHTMLChartsDataSet<T>.New(Parent : T): iModelHTMLDataSet<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsDataSet<T>.ResultLabels: String;
var
  Local_I: Integer;
  Aux : String;
  I: Integer;
  X: Integer;
begin
  FLabels := '["';
  Aux := '", "';
  FDataSet.First;
  for Local_I := 0 to Pred(FDataSet.RecordCount) do
  begin
    if Local_I = Pred(FDataSet.RecordCount) then
      Aux := '"';
    FLabels := FLabels + FDataSet.FieldByName('Label').AsString + Aux;
    FDataSet.Next;
  end;
  FLabels := FLabels + ']';
  Result := FLabels;
end;

function TModelHTMLChartsDataSet<T>.ResultScript: String;
begin
  generatedLabel;
  generatedBackgroundColor;
  generatedBorderColor;
  generatedBorderWidth;
  generatedData;
  generatedFill;
  FScript := FScript + '{' + #13;
  FScript := FScript + 'label: '''+FtextLabel+''', ' + #13;
  if FBackgroundColor <> '' then
    FScript := FScript + 'backgroundColor: '+FBackgroundColor+', ' + #13;
  if FBorderColor <> '' then
    FScript := FScript + 'borderColor: "rgba('+FBorderColor+', 100)", ' + #13;
  FScript := FScript + 'borderWidth: 1, ' + #13;
  if FFill <> '' then
    FScript := FScript + 'fill: '+FFill+',';
  FScript := FScript + 'data: ' + FData + #13;
  FScript := FScript + '} ' + #13;
  Result := FScript;
end;

function TModelHTMLChartsDataSet<T>.textLabel(
  Value: String): iModelHTMLDataSet<T>;
begin
  Result := Self;
  FtextLabel := Value;
end;

end.
