unit Charts.Config;

interface

uses
  Interfaces, DB, Generics.Collections;

Type
  TModelHTMLChartsConfig = class(TInterfacedObject, iModelHTMLChartsConfig)
    private
      FParent : iModelHTMLChartsGeneric;
      FColSpan : Integer;
      FWidth : Integer;
      FHeigth : Integer;
      FData : String;
      FBackgroundColor : String;
      FName : String;
      FLabels : String;
      FStacked : Boolean;
      FMethod : String;
      FLabelling : iModelLabellingConfig<iModelHTMLChartsConfig>;
      FNumeral : String;
      FDataSet : TList<iModelHTMLDataSet>;
      FOptions : iModelHTMLOptions;
      function Numeral: String;
    public
      constructor Create(Parent : iModelHTMLChartsGeneric);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLChartsGeneric) : iModelHTMLChartsConfig;
      function ColSpan(Value : Integer) : iModelHTMLChartsConfig; overload;
      function ColSpan : Integer; overload;
      function Width(Value : Integer) : iModelHTMLChartsConfig; overload;
      function Width : Integer; overload;
      function Heigth(Value : Integer) : iModelHTMLChartsConfig; overload;
      function Heigth : Integer; overload;
      function Data(Value : String) : iModelHTMLChartsConfig; overload;
      function Data : String; overload;
      function BackgroundColor(Value : String) : iModelHTMLChartsConfig; overload;
      function BackgroundColor : String; overload;
      function Name(Value : String) : iModelHTMLChartsConfig; overload;
      function Name : String; overload;
      function Labels(Value : String) : iModelHTMLChartsConfig; overload;
      function Labels : String; overload;
      function DataSet : iModelHTMLDataSet;
      function ResultDataSet : String;
      function ResultLabels : String;
      function Stacked(Value : Boolean) : iModelHTMLChartsConfig; overload;
      function Stacked : Boolean; overload;
      function CallBackLink(Value : String) : iModelHTMLChartsConfig; overload;
      function CallBackLink : String; overload;
      function Labelling : iModelLabellingConfig<iModelHTMLChartsConfig>; overload;
      function Options : iModelHTMLOptions;
      function &End : iModelHTMLChartsGeneric;
  end;

implementation

uses
  SysUtils, Charts.DataSet, Injection, Charts.Labelling, Charts.Axes,
  Charts.Legends, Charts.Title, Charts.Scales, Charts.Options;

{ TModelHTMLChartsConfig<T> }

function TModelHTMLChartsConfig.ColSpan(
  Value: Integer): iModelHTMLChartsConfig;
begin
  Result := Self;
  FColSpan := Value;
end;

function TModelHTMLChartsConfig.CallBackLink: String;
begin
  Result := FMethod;
end;

function TModelHTMLChartsConfig.CallBackLink(
  Value: String): iModelHTMLChartsConfig;
begin
  Result := Self;
  FMethod := Value;
end;

function TModelHTMLChartsConfig.ColSpan: Integer;
begin
  Result := FColSpan;
end;

constructor TModelHTMLChartsConfig.Create(Parent : iModelHTMLChartsGeneric);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TList<iModelHTMLDataSet>.Create;
  FLabelling := TChartsLabelling<iModelHTMLChartsConfig>.New(Self);
  FOptions := TModelHTMLChartsOptions.New(Self);
end;

function TModelHTMLChartsConfig.Data: String;
begin
  Result := FData;
end;

function TModelHTMLChartsConfig.DataSet: iModelHTMLDataSet;
begin
  FDataSet.Add(TModelHTMLChartsDataSet.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

function TModelHTMLChartsConfig.Data(
  Value: String): iModelHTMLChartsConfig;
begin
  Result := Self;
  FData := Value;
end;

destructor TModelHTMLChartsConfig.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

function TModelHTMLChartsConfig.Heigth(
  Value: Integer): iModelHTMLChartsConfig;
begin
  Result := Self;
  FHeigth := Value;
end;

function TModelHTMLChartsConfig.Heigth: Integer;
begin
  Result := FHeigth;
end;

function TModelHTMLChartsConfig.Labelling : iModelLabellingConfig<iModelHTMLChartsConfig>;
begin
  Result := FLabelling;
end;

function TModelHTMLChartsConfig.Labels: String;
begin
  Result := FLabels;
end;

function TModelHTMLChartsConfig.Labels(
  Value: String): iModelHTMLChartsConfig;
begin
  Result := Self;
  FLabels := Value;
end;

function TModelHTMLChartsConfig.Name: String;
begin
  Result := FName;
end;

function TModelHTMLChartsConfig.Name(
  Value: String): iModelHTMLChartsConfig;
begin
  Result := Self;
  FName := Value;
end;

class function TModelHTMLChartsConfig.New(Parent : iModelHTMLChartsGeneric): iModelHTMLChartsConfig;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsConfig.Numeral: String;
begin
  Result := FNumeral;
end;

function TModelHTMLChartsConfig.Options: iModelHTMLOptions;
begin
  Result := FOptions;
end;

function TModelHTMLChartsConfig.BackgroundColor(
  Value: String): iModelHTMLChartsConfig;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TModelHTMLChartsConfig.BackgroundColor: String;
begin
  Result := FBackgroundColor;
end;

function TModelHTMLChartsConfig.&End: iModelHTMLChartsGeneric;
begin
  Result := FParent;
end;

function TModelHTMLChartsConfig.ResultDataSet: String;
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

function TModelHTMLChartsConfig.ResultLabels: String;
begin
  if FDataSet.Count > 0 then
    FLabels := FDataSet[0].ResultLabels;

  Result := FLabels;
end;

function TModelHTMLChartsConfig.Stacked: Boolean;
begin
  Result := FStacked;
end;

function TModelHTMLChartsConfig.Stacked(
  Value: Boolean): iModelHTMLChartsConfig;
begin
  Result := Self;
  FStacked := Value;
end;

function TModelHTMLChartsConfig.Width(
  Value: Integer): iModelHTMLChartsConfig;
begin
  Result := Self;
  FWidth := Value;
end;

function TModelHTMLChartsConfig.Width: Integer;
begin
  Result := FWidth;
end;

end.
