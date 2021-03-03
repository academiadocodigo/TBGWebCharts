unit Maps.GMaps.Draw.Circle;

interface

uses
  Interfaces;

type
  TModelMapsGMapsDrawCircle = class(TInterfacedObject, iModelMapsDrawCircle)
    private
      FParent : iModelMapsDraw;
      FDataSet : iModelMapsDataSet<iModelMapsDrawCircle>;
      FStrokeColor : string;
      FStrokeOpacity : string;
      FStrokeWeight : string;
      FFillColor : string;
      FFillOpacity : string;
      FFator : string;
    public
      constructor Create(Parent : iModelMapsDraw);
      destructor Destroy; override;
      class function New(Parent : iModelMapsDraw) : iModelMapsDrawCircle;
      function DataSet : iModelMapsDataSet<iModelMapsDrawCircle>;
      function StrokeColor(Value: string): iModelMapsDrawCircle;
      function StrokeOpacity(Value : string) : iModelMapsDrawCircle;
      function StrokeWeight(Value : Integer) : iModelMapsDrawCircle;
      function FillColor(Value : string) : iModelMapsDrawCircle;
      function FillOpacity(Value : string) : iModelMapsDrawCircle;
      function Fator(Value : integer) : iModelMapsDrawCircle;
      function ResultScript(Value: string) : String;
      function &End : iModelMapsDraw;

  end;

implementation

uses
  Injection,
  Maps.DataSet,
  System.SysUtils,
  Utilities.Str;
{ TModelMapsGMapsDrawCircle }

constructor TModelMapsGMapsDrawCircle.Create(Parent: iModelMapsDraw);
begin
  TInjection.Weak(@FParent, Parent);
  FDataSet := TModelMapsDataSet<iModelMapsDrawCircle>.new(Self);
  FStrokeColor := '#FF0000';
  FStrokeOpacity := '0.8';
  FStrokeWeight:= '2';
  FFillcolor := '#FF0000';
  FFillOpacity := '0.35';
  FFator := '100';
end;

function TModelMapsGMapsDrawCircle.DataSet: iModelMapsDataSet<iModelMapsDrawCircle>;
begin
  Result := FDataSet;
end;

destructor TModelMapsGMapsDrawCircle.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsDrawCircle.&End: iModelMapsDraw;
begin
  Result := FParent;
end;

function TModelMapsGMapsDrawCircle.Fator(Value: integer): iModelMapsDrawCircle;
begin
  Result := Self;
  FFator := IntToStr(Value);
end;

function TModelMapsGMapsDrawCircle.FillColor(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FFillColor := Value;
end;

function TModelMapsGMapsDrawCircle.FillOpacity(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FFillopacity := Value;
end;

class function TModelMapsGMapsDrawCircle.New(
  Parent: iModelMapsDraw): iModelMapsDrawCircle;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsDrawCircle.ResultScript(Value: string): String;
 var
  I: Integer;
  Aux, LatValue, LngValue, RadiusValue: string;
begin
  Result := '[ ';

  FDataSet.DataSet.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    Aux := ', ';
    if I = Pred(FDataSet.DataSet.RecordCount) then
      Aux := '';

    LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
    LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));
    RadiusValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.ValueName));

    Result := Result + 'new google.maps.Circle({' +
      'strokeColor:"' + FStrokeColor + '",' +
      'strokeOpacity:' + FStrokeOpacity + ',' +
      'strokeWeight:' + FStrokeWeight + ',' +
      'fillColor:"' + FFillColor + '",' +
      'fillOpacity:' + FFillOpacity + ',' +
      'map:' + Value + ',' +
      'center:{' +
        'lat:' + LatValue + ',' +
        'lng:' + LngValue + '},' +
      'radius: Math.sqrt(' + RadiusValue + ') * ' + FFator + ',' +
      '})' + Aux;
    FDataSet.Dataset.Next;
  end;

  Result := Result + ']';

end;

function TModelMapsGMapsDrawCircle.StrokeColor(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FStrokeColor := Value;
end;

function TModelMapsGMapsDrawCircle.StrokeOpacity(
  Value: string): iModelMapsDrawCircle;
begin
  Result := Self;
  FStrokeOpacity := Value;
end;

function TModelMapsGMapsDrawCircle.StrokeWeight(
  Value: Integer): iModelMapsDrawCircle;
begin
  Result := Self;
  FStrokeWeight := IntToStr(Value);
end;

end.
