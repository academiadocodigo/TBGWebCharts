unit Maps.GMaps.Draw;

interface

uses
  Interfaces;

type
  TModelMapsGMapsDraw = class(TInterfacedObject, iModelMapsDraw)
    private
      [weak]
      FParent: iModelMapsGeneric;
      FMarker: iModelMapsDrawMarker;
      FCircle: iModelMapsDrawCircle;
    public
      constructor Create(Parent : iModelMapsGeneric);
      destructor Destroy; override;
      class function New(Parent : iModelMapsGeneric) : iModelMapsDraw;
      function Marker : iModelMapsDrawMarker;
      function Circle : iModelMapsDrawCircle;
      function ResultScript: String;
      function &End : iModelMapsGeneric;

  end;

implementation

uses
  Injection,
  Maps.GMaps.Draw.Marker,
  Maps.GMaps.Draw.Circle;

{ TModelMapsGMapsDraw }

function TModelMapsGMapsDraw.Circle: iModelMapsDrawCircle;
begin
  FCircle := TModelMapsGMapsDrawCircle.New(Self);
  Result := FCircle;
end;

constructor TModelMapsGMapsDraw.Create(Parent: iModelMapsGeneric);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelMapsGMapsDraw.Destroy;
begin

  inherited;
end;

function TModelMapsGMapsDraw.&End: iModelMapsGeneric;
begin
  Result := FParent;
end;

function TModelMapsGMapsDraw.Marker: iModelMapsDrawMarker;
begin
  FMarker := TModelMapsGmapsDrawMarker.New(Self);
  Result := FMarker;
end;

class function TModelMapsGMapsDraw.New(
  Parent: iModelMapsGeneric): iModelMapsDraw;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsGMapsDraw.ResultScript: String;
begin
  Result := '';
  if Assigned(FMarker) then
    Result := Result + FMarker.ResultScript(FParent.Name);

  if Assigned(FCircle) then
    Result := Result + FCircle.ResultScript(FParent.Name);
end;

end.
