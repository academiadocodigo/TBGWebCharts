unit Editor.Controller.Relatorio.Helpers;

interface

uses
  System.JSON,
  VCL.Grids,
  System.SysUtils,
  System.NetEncoding,
  Data.DB;

type

  TStringGridHelper = class helper for TStringGrid
    function ToParamJsonArray : TJsonArray;
    procedure LoadParamJsonArray ( aValue : TJsonArray );
  end;

  TFieldHelper = class helper for TField
    function AsJsonValueBase64Decode : TJsonValue;
  end;

  TJsonHelper = class helper for TJsonObject
    function ToStringValueBase64Encode : String;
  end;

  TStringHelper = record helper for String
    function AsJsonObject : TJsonObject;
  end;

implementation

{ TStringGridHelper }

procedure TStringGridHelper.LoadParamJsonArray(aValue: TJsonArray);
var
  I, X : Integer;
  JsonParam : TJsonObject;
begin
  for I := 1 to Self.RowCount - 1 do
   for X := 0 to Self.ColCount - 1 do
     Self.Cells[X, I] := '';

  for I := 0 to Pred(aValue.Count) do
  begin
    JsonParam := (aValue.Items[I] as TJSONObject);
    Self.Cells[0, I+1] := StringReplace(JsonParam.P['Param'].ToString, '"', '', [rfReplaceAll]);
    Self.Cells[1, I+1] := StringReplace(JsonParam.P['Default'].ToString, '"', '', [rfReplaceAll]);
    Self.Cells[2, I+1] := StringReplace(JsonParam.P['Display'].ToString, '"', '', [rfReplaceAll]);
    Self.Cells[3, I+1] := StringReplace(JsonParam.P['Type'].ToString, '"', '', [rfReplaceAll]);
  end;
end;

function TStringGridHelper.ToParamJsonArray: TJsonArray;
var
  I: Integer;
begin
  Result := TJsonArray.Create;
    for I := 1 to Pred(Self.RowCount) do
      if Self.Cells[0, I] <> '' then
        Result.Add(
          TJSONObject.Create
            .AddPair('Param', Self.Cells[0, I])
            .AddPair('Default', Self.Cells[1, I])
            .AddPair('Display', Self.Cells[2, I])
            .AddPair('Type', Self.Cells[3, I])
        );

end;

{ TFieldHelper }

function TFieldHelper.AsJsonValueBase64Decode: TJsonValue;
begin
  Result := TJSonObject.ParseJSONValue(TNetEncoding.Base64.Decode(Self.AsString));
end;

{ TJsonHelper }

function TJsonHelper.ToStringValueBase64Encode: String;
begin
  Result := TNetEncoding.Base64.Encode(Self.ToString);
end;

{ TStringHelper }

function TStringHelper.AsJsonObject: TJsonObject;
begin
  Result := TJsonObject.ParseJSONValue(Self) as TJsonObject;
end;

end.
