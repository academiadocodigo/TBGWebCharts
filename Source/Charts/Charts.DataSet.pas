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
      FBackgroundOpacity : String;
      FBorderColor : String;
      FBorderOpacity : String;
      FBorderWidth : Integer;
      FBorderDash : String;
      FData : String;
      FFill : Boolean;
      FHidden: Boolean;
      FHideZeroValues : Boolean;
      FLineTension : String;
      FScript : String;
      FLabels : String;
      FTypes : String;
      FRealTime : Boolean;
      procedure generatedLabel;
      procedure generatedBackgroundColor;
      procedure generatedBorderColor;
      procedure generatedBorderWidth;
      procedure generatedData;
      procedure generatedFill;
      function replaceValue(Value : String) : String;
      function RandomColor : string;
      function ConvertInt(aValue : Integer) : string;
    public
      constructor Create(Parent : iModelHTMLChartsConfig);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLChartsConfig) : iModelHTMLDataSet;
      function DataSet (Value : TDataSet) : iModelHTMLDataSet;
      function RealTimeDataSet (Value : TDataSet) : iModelHTMLDataSet;
      function LabelName(Value : String) : iModelHTMLDataSet;
      function ValueName(Value : String) : iModelHTMLDataSet;
      function RGBName(Value : String)  : iModelHTMLDataSet;
      function textLabel(Value : String) : iModelHTMLDataSet;
      function BackgroundColor (Value : String) : iModelHTMLDataSet;
      function BackgroundOpacity(Value : Integer) : iModelHTMLDataSet;
      function BorderColor (Value : String) : iModelHTMLDataSet;
      function BorderOpacity(Value : Integer) : iModelHTMLDataSet;
      function BorderWidth (Value : Integer) : iModelHTMLDataSet;
      function BorderDash (Lenght : Integer; Space : Integer) : iModelHTMLDataSet;
      function Data (Value : String) : iModelHTMLDataSet;
      function Fill (Value : Boolean) : iModelHTMLDataSet;
      function Hidden(Value : Boolean) : iModelHTMLDataSet;
      function HideZeroValuesControl(Value : Boolean) : iModelHTMLDataSet;
      function LineTension (Value : Integer) : iModelHTMLDataSet;
      function ResultScript : String;
      function ResultLabels : String;
      function RealTimeInitialValue : String;
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
//    FBackgroundColor := '"rgba(' + Value + ', ' + FBackgroundOpacity + ')"';
    FBackgroundColor := Value;
end;
function TModelHTMLChartsDataSet.BackgroundOpacity(
  Value: Integer): iModelHTMLDataSet;
begin
  Result := Self;
  FBackgroundOpacity := ConvertInt(Value);
end;

function TModelHTMLChartsDataSet.BorderColor(
  Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FBorderColor := Value;
end;
function TModelHTMLChartsDataSet.BorderDash(Lenght,
  Space: Integer): iModelHTMLDataSet;
begin
  Result := Self;
  FBorderDash := '[' + IntToStr(Lenght) + ',' + IntToStr(Space) + ']';
end;

function TModelHTMLChartsDataSet.BorderOpacity(
  Value: Integer): iModelHTMLDataSet;
begin
  Result := Self;
  FBorderOpacity := ConvertInt(Value);
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
function TModelHTMLChartsDataSet.ConvertInt(aValue: Integer): string;
begin
  Result :=  FormatFloat('0.00', aValue / 10.0);
  Result := StringReplace(Result, ',', '.',[rfReplaceAll]);
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
  FBorderWidth := 1;
  FBackgroundOpacity := '1';
  FBorderOpacity := '1';
  FHidden := false;
  FHideZeroValues := false;
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
  HasRGBField : Boolean;
begin
  if FBackgroundColor = '' then
  begin
    HasRGBField := FDataSet.Fields.FindField(FRGBName) <> nil;
    FBackgroundColor := '["';
    Aux := ', ' + FBackgroundOpacity + ')", "';
    FDataSet.First;
    for Local_I := 0 to Pred(FDataSet.RecordCount) do
    begin
      if Local_I = Pred(FDataSet.RecordCount) then Aux := ', ' + FBackgroundOpacity + ')';
      if HasRGBField then
        FBackgroundColor := FBackgroundColor + 'rgba(' + FDataSet.FieldByName(FRGBName).AsString + Aux
      else
        FBackgroundColor := FBackgroundColor + 'rgba(' + RandomColor + Aux;
      FDataSet.Next;
    end;
    FBackgroundColor := FBackgroundColor + '"]';
  end
  else
    FBackgroundColor := '"rgba(' + FBackgroundColor + ', ' + FBackgroundOpacity + ')"';
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
  I : Integer;
begin
  FData := '[';
  Aux := ', ';
  if Not FRealTime then
  begin
    FDataSet.First;
    for I := 0 to Pred(FDataSet.RecordCount) do
    begin
      if I = Pred(FDataSet.RecordCount) then
        Aux := '';
      FData := FData + replaceValue(FDataSet.FieldByName(FValueName).AsString) + Aux;
      FDataSet.Next;
    end;
  end;
  FData := FData + ']';
end;
procedure TModelHTMLChartsDataSet.generatedFill;
begin
end;
procedure TModelHTMLChartsDataSet.generatedLabel;
begin
end;
function TModelHTMLChartsDataSet.Hidden(Value: Boolean): iModelHTMLDataSet;
begin
  Result := Self;
  FHidden := Value;
end;

function TModelHTMLChartsDataSet.HideZeroValuesControl(
  Value: Boolean): iModelHTMLDataSet;
begin
  Result := Self;
  FHideZeroValues := Value;
end;

function TModelHTMLChartsDataSet.LabelName(Value: String): iModelHTMLDataSet;
begin
  Result := Self;
  FLabelName := Value;
end;
function TModelHTMLChartsDataSet.LineTension(Value: Integer): iModelHTMLDataSet;
begin
  Result := Self;
  FLineTension := IntToStr(Value);
end;

class function TModelHTMLChartsDataSet.New(Parent : iModelHTMLChartsConfig): iModelHTMLDataSet;
begin
  Result := Self.Create(Parent);
end;
function TModelHTMLChartsDataSet.RandomColor: string;
var
  _r,_g,_b, cont: Integer;
  rgb : string;

begin
  cont := 0;
  while cont < 3 do
  begin
    cont := cont + 1;
    _r := Random(255);

    _g := Random(255);

    _b := Random(255);

    rgb := format('%d,%d,%d', [_r,_g,_b]);
    if Pos( rgb, FBackgroundColor) = 0 then
      cont := 3;
  end;

  Result := rgb;
end;

function TModelHTMLChartsDataSet.RealTimeDataSet(
  Value: TDataSet): iModelHTMLDataSet;
begin
  Result := Self;
  FDataSet := Value;
  FRealTime := True;
end;

function TModelHTMLChartsDataSet.replaceValue(Value: String): String;
var
  I,cont : Integer;
  caracter : string;
begin
  caracter := '';
  cont := 0;
  {$IF Defined(ANSI)}
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
function TModelHTMLChartsDataSet.ResultLabels: String;
var
  Local_I: Integer;
  Aux : String;
begin
  FLabels := '[';
  Aux := '", "';
  if Not FRealTime then
  begin
    FLabels := FLabels + '"';
    FDataSet.First;
    for Local_I := 0 to Pred(FDataSet.RecordCount) do
    begin
      if Local_I = Pred(FDataSet.RecordCount) then
        Aux := '"';
      FLabels := FLabels + FDataSet.FieldByName(FLabelName).AsString + Aux;
      FDataSet.Next;
    end;
  end;
  FLabels := FLabels + ']';
  Result := FLabels;
end;
function TModelHTMLChartsDataSet.RealTimeInitialValue: String;
begin
  FDataSet.Last;
  Result := '{label: ' + QuotedStr(FtextLabel);
  Result := Result + ', value: ' + replaceValue(FDataSet.FieldByName(FValueName).AsString);
  Result := Result + '}';
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
  FScript := Format('%s hidden:%s,', [FScript, LowerCase(BoolToStr(FHidden, True))]);
  FScript := Format('%s hideZeroValues:%s,', [FScript, LowerCase(BoolToStr(FHideZeroValues, True))]);
  if FTypes <> '' then FScript := FScript + 'type : '''+FTypes+''', ' + #13;
  FScript := FScript + 'label: '''+FtextLabel+''', ' + #13;
  if FBackgroundColor <> '' then
    FScript := FScript + 'backgroundColor: '+FBackgroundColor+', ' + #13;
  if FBorderColor <> '' then
    FScript := FScript + 'borderColor: "rgba('+FBorderColor+',' + FBorderOpacity + ')", ' + #13;
  FScript := FScript + 'borderWidth: '+ IntToStr(FBorderWidth) + ', ' + #13;
  if FFill then FScript := FScript + 'fill: true,' else FScript := FScript + 'fill: false,';
  if FLineTension <> ''  then FScript := FScript + 'lineTension: ' + FLineTension + ',';
  if FBorderDash <> '' then FScript := FScript + 'borderDash: ' + FBorderDash + ',';
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
