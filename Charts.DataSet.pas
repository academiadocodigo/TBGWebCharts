unit Charts.DataSet;

interface

uses
  Interfaces, DB, SysUtils;

Type
  TModelHTMLChartsDataSet = class(TInterfacedObject, iModelHTMLDataSet)
    private
      FParent : iModelHTMLChartsConfig;
      FDataSet : TDataSet;
      FLabelName : String;
      FValueName : String;
      FRGBName : String;
      FtextLabel : String;
      FBackgroundColor : String;
      FBorderColor : String;
      FBorderWidth : Integer;
      FData : String;
      FFill : Boolean;
      FScript : String;
      FLabels : String;
      FTypes : String;
      procedure generatedLabel;
      procedure generatedBackgroundColor;
      procedure generatedBorderColor;
      procedure generatedBorderWidth;
      procedure generatedData;
      procedure generatedFill;
      function replaceValue(Value : String) : String;
    public
      constructor Create(Parent : iModelHTMLChartsConfig);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLChartsConfig) : iModelHTMLDataSet;
      function DataSet (Value : TDataSet) : iModelHTMLDataSet;
      function LabelName(Value : String) : iModelHTMLDataSet;
      function ValueName(Value : String) : iModelHTMLDataSet;
      function RGBName(Value : String)  : iModelHTMLDataSet;
      function textLabel(Value : String) : iModelHTMLDataSet;
      function BackgroundColor (Value : String) : iModelHTMLDataSet;
      function BorderColor (Value : String) : iModelHTMLDataSet;
      function BorderWidth (Value : Integer) : iModelHTMLDataSet;
      function Data (Value : String) : iModelHTMLDataSet;
      function Fill (Value : Boolean) : iModelHTMLDataSet;
      function ResultScript : String;
      function ResultLabels : String;
      function Types (Value : String) : iModelHTMLDataSet;
      function &End : iModelHTMLChartsConfig;
  end;

implementation

uses
  Injection;

{ TModelHTMLChartsDataSet<T> }

function TModelHTMLChartsDataSet.BackgroundColor(
  Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  if Value <> '' then
    FBackgroundColor := '"rgba(' + Value + ', 100)"';
end;

function TModelHTMLChartsDataSet.BorderColor(
  Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FBorderColor := Value;
end;

function TModelHTMLChartsDataSet.BorderWidth(
  Value: Integer): iModelHTMLDataSet;
begin
  Result := Self;
  FBorderWidth := Value;
end;

function TModelHTMLChartsDataSet.&End: iModelHTMLChartsConfig;
begin
  Result := FParent;
end;

constructor TModelHTMLChartsDataSet.Create(Parent : iModelHTMLChartsConfig);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FLabelName := 'Label';
  FValueName := 'Value';
  FRGBName := 'RGB';
end;

function TModelHTMLChartsDataSet.Data(Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FData := Value;
end;

function TModelHTMLChartsDataSet.DataSet(
  Value: TDataSet): iModelHTMLDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelHTMLChartsDataSet.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsDataSet.Fill(Value: Boolean): iModelHTMLDataSet;
begin
  Result := Self;
  FFill := Value;
end;

procedure TModelHTMLChartsDataSet.generatedBackgroundColor;
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
      FBackgroundColor := FBackgroundColor + 'rgba(' + FDataSet.FieldByName(FRGBName).AsString + Aux;
      FDataSet.Next;
    end;
    FBackgroundColor := FBackgroundColor + '"]';
  end;
end;

procedure TModelHTMLChartsDataSet.generatedBorderColor;
begin

end;

procedure TModelHTMLChartsDataSet.generatedBorderWidth;
begin

end;

procedure TModelHTMLChartsDataSet.generatedData;
var
  Aux: string;
  I, X : Integer;
  vField : TField;
begin
  FData := '[';
  Aux := ', ';
  FDataSet.First;
  for I := 0 to Pred(FDataSet.RecordCount) do
  begin
    if I = Pred(FDataSet.RecordCount) then
      Aux := '';
    FData := FData + replaceValue(FDataSet.FieldByName(FValueName).AsString) + Aux;
    FDataSet.Next;
  end;
  FData := FData + ']';
end;

procedure TModelHTMLChartsDataSet.generatedFill;
begin

end;

procedure TModelHTMLChartsDataSet.generatedLabel;
begin

end;

function TModelHTMLChartsDataSet.LabelName(Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FLabelName := Value;
end;

class function TModelHTMLChartsDataSet.New(Parent : iModelHTMLChartsConfig): iModelHTMLDataSet;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsDataSet.replaceValue(Value: String): String;
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
      if ((value[i] in ['0'..'9']) or (value[i]='-')) then
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

function TModelHTMLChartsDataSet.ResultLabels: String;
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
    FLabels := FLabels + FDataSet.FieldByName(FLabelName).AsString + Aux;
    FDataSet.Next;
  end;
  FLabels := FLabels + ']';
  Result := FLabels;
end;

function TModelHTMLChartsDataSet.ResultScript: String;
begin
  generatedLabel;
  generatedBackgroundColor;
  generatedBorderColor;
  generatedBorderWidth;
  generatedData;
  generatedFill;
  FScript := FScript + '{' + #13;
  if FTypes <> '' then FScript := FScript + 'type : '''+FTypes+''', ' + #13;
  FScript := FScript + 'label: '''+FtextLabel+''', ' + #13;
  if FBackgroundColor <> '' then
    FScript := FScript + 'backgroundColor: '+FBackgroundColor+', ' + #13;
  if FBorderColor <> '' then
    FScript := FScript + 'borderColor: "rgba('+FBorderColor+', 100)", ' + #13;
  FScript := FScript + 'borderWidth: 1, ' + #13;
  if FFill then FScript := FScript + 'fill: true,' else FScript := FScript + 'fill: false,';
  FScript := FScript + 'data: ' + FData + #13;
  FScript := FScript + '} ' + #13;
  Result := FScript;
end;

function TModelHTMLChartsDataSet.RGBName(Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FRGBName := Value;
end;

function TModelHTMLChartsDataSet.textLabel(
  Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FtextLabel := Value;
end;

function TModelHTMLChartsDataSet.Types(Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FTypes := Value;
end;

function TModelHTMLChartsDataSet.ValueName(Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FValueName := Value;
end;

end.
