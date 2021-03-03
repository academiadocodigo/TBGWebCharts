unit Maps.GMaps.Draw.Marker;

interface

uses
  Interfaces;

type
  TModelMapsGMapsDrawMarker = class(TInterfacedObject, iModelMapsDrawMarker)
    private
      FParent : iModelMapsDraw;
      FDataSet : iModelMapsDataSet<iModelMapsDrawMarker>;
    public
      constructor Create(Parent : iModelMapsDraw);
      destructor Destroy; override;
      class function New(Parent : iModelMapsDraw) : iModelMapsDrawMarker;
      function DataSet : iModelMapsDataSet<iModelMapsDrawMarker>;
      function ResultScript(Value: string) : String;
      function &End : iModelMapsDraw;

  end;

implementation

uses
  Injection,
  Maps.DataSet,
  Utilities.Str;
{ TModelMapsGMapsDrawMarker }

constructor TModelMapsGMapsDrawMarker.Create(Parent: iModelMapsDraw);
begin
  TInjection.Weak(@FParent, Parent);
  FDataSet := TModelMapsDataSet<iModelMapsDrawMarker>.new(Self);
end;

function TModelMapsGMapsDrawMarker.DataSet: iModelMapsDataSet<iModelMapsDrawMarker>;
begin
  Result := FDataSet;
end;

destructor TModelMapsGMapsDrawMarker.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsDrawMarker.&End: iModelMapsDraw;
begin
  Result := FParent;
end;

class function TModelMapsGMapsDrawMarker.New(
  Parent: iModelMapsDraw): iModelMapsDrawMarker;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsDrawMarker.ResultScript(Value: string): String;
var
  I: Integer;
  Aux, LatValue, LngValue: string;
begin
  Result := '[ ';

  FDataSet.Dataset.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    Aux := ', ';
    if I = Pred(FDataSet.DataSet.RecordCount) then
      Aux := '';

    LatValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LatName));
    LngValue := TUtilitiesStr.FloatCurrFieldToStrValue(FDataSet.DataSet.FieldByName(FDataSet.LngName));

    Result := Result + 'new google.maps.Marker({' +
      'position: {' +
        'lat:' + LatValue + ',' +
        'lng:' + LngValue + '},' +
      'label:"' + FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString + '",' +
      'title:"' + FDataSet.Dataset.FieldByName(FDataSet.LabelName).AsString + '",' +
      'map: ' + Value + ',})' + Aux;
    FDataSet.Dataset.Next;
  end;

  Result := Result + ']';
end;

end.
