unit Generic.Coordinates;

interface

uses
  Interfaces;

type
  TModelGenericCoordinates<T : IInterface> = class(TInterfacedObject, iModelGenericCoordinates<T>)
    private
      [weak]
      FParent : T;
      FLatitude : String;
      FLongitude : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelGenericCoordinates<T>;
      function Latitude(Value : string) : iModelGenericCoordinates<T>; overload;
      function Longitude(Value : string) : iModelGenericCoordinates<T>; overload;
      function Latitude : string; overload;
      function Longitude : string; overload;
      function &End : T;

  end;
implementation
uses
  Injection;

{ TModelGenericCoordinates<T> }

constructor TModelGenericCoordinates<T>.Create(Parent: T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelGenericCoordinates<T>.Destroy;
begin

  inherited;
end;

function TModelGenericCoordinates<T>.&End: T;
begin
  Result := FParent;
end;

function TModelGenericCoordinates<T>.Latitude(
  Value: string): iModelGenericCoordinates<T>;
begin
  Result := Self;
  Flatitude := Value;
end;

function TModelGenericCoordinates<T>.Longitude(
  Value: string): iModelGenericCoordinates<T>;
begin
  Result := Self;
  FLongitude := Value;
end;

class function TModelGenericCoordinates<T>.New(
  Parent: T): iModelGenericCoordinates<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelGenericCoordinates<T>.Latitude: string;
begin
  Result := FLatitude;
end;

function TModelGenericCoordinates<T>.Longitude: string;
begin
  Result := FLongitude;
end;

end.
