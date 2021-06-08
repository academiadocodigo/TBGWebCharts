unit Maps;

interface

uses
  Interfaces, Charts.Types;

type
  TModelMaps = Class(TInterfacedObject, iModelMaps)
    private
      [weak]
      FParent : iModelHTML;
      FTitle : iModelGenericTitle<iModelMaps>;
      FMapGeneric : iModelMapsGeneric;

    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelMaps;
      function MapTitle : iModelGenericTitle<iModelMaps>;
      function MapType(Value : TTypeMaps) : iModelMapsGeneric;
      function &End : iModelHTML;

  End;
implementation

uses
  Injection,
  Maps.GMaps, Generic.Title;

{ TMaps }

constructor TModelMaps.Create(Parent: IModelHTML);
begin
  TInjection.Weak(@FParent, Parent);
end;

destructor TModelMaps.Destroy;
begin

  inherited;
end;

function TModelMaps.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML('<div class="col">');
  if Assigned(FTitle) then
    FParent.HTML(FTitle.Result);
  Fparent.HTML(FMapGeneric.ResultClass);
  FParent.HTML('</div>');
end;

function TModelMaps.MapTitle: iModelGenericTitle<iModelMaps>;
begin
  FTitle := TModelGenericTitle<iModelMaps>.New(Self);
  Result := FTitle;
end;

function TModelMaps.MapType(Value: TTypeMaps): iModelMapsGeneric;
begin
  case Value of
    GMaps :
      FMapGeneric := TModelMapsGMaps.New(Self);
  end;
  Result := FMapGeneric;
end;

class function TModelMaps.New(Parent: IModelHTML): iModelMaps;
begin
  Result := Self.Create(Parent);
end;

end.
