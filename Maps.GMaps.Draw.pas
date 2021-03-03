unit Maps.GMaps.Draw;

interface

uses
  Interfaces;

type
  TModelMapsGMapsDraw = class(TInterfacedObject, iModelMapsDraw)
    private
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
  TInjection.Weak(@FParent, Parent);
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
  begin
    Result := Result + 'let markers' + FParent.Name + ' = ' + FMarker.ResultScript(FParent.Name) + ';' +
      'for (var i = 0; i < markers' + FParent.Name + '.length; i++) {' +
        'bounds' + FParent.Name + '.extend(markers' + FParent.Name + '[i].position);' +
      '}';
  end;
  if Assigned(FCircle) then
  begin
    Result := Result + 'let circles' + FParent.Name + ' = ' + FCircle.ResultScript(FParent.Name) + ';' +
      'for (var i = 0; i < circles' + FParent.Name + '.length; i++) {' +
        'bounds' + FParent.Name + '.extend(circles' + FParent.Name + '[i].getCenter());' +
      '}';
  end;
end;

end.
