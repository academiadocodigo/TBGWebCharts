unit Maps.InfoWindow;

interface

uses
  Interfaces;

type
  TModelMapsInfoWindow<T : IInterface> = class(TInterfacedObject, iModelMapsInfoWindow<T>)
    private
      [weak]
      FParent : T;
      FStartOpened : boolean;
      FMaxWidth : String;
      FMinWidth : String;

    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelMapsInfoWindow<T>;
      function StartOpened(Value : boolean) : iModelMapsInfoWindow<T>; overload;
      function MaxWidth(Value : integer) : iModelMapsInfoWindow<T>; overload;
      function MinWidth(Value : integer) : iModelMapsInfoWindow<T>; overload;
      function StartOpened : string; overload;
      function MaxWidth : string; overload;
      function MinWidth : string; overload;
      function &End : T;
  end;

implementation

uses
  Injection, System.SysUtils;

{ TModelMapsInfoWindow<T> }

constructor TModelMapsInfoWindow<T>.Create(Parent: T);
begin
  TInjection.Weak(@FParent, Parent);

end;

destructor TModelMapsInfoWindow<T>.Destroy;
begin

  inherited;
end;

function TModelMapsInfoWindow<T>.&End: T;
begin
  Result := FParent;
end;

function TModelMapsInfoWindow<T>.MaxWidth(
  Value: integer): iModelMapsInfoWindow<T>;
begin
  Result := Self;
  if Value > 0 then
    FMaxWidth := 'maxWidth:' + IntToStr(Value) + ',';
end;

function TModelMapsInfoWindow<T>.MaxWidth: string;
begin
  Result := FMaxWidth;
end;

function TModelMapsInfoWindow<T>.MinWidth(
  Value: integer): iModelMapsInfoWindow<T>;
begin
  Result := Self;
  if Value > 0 then
    FMinWidth := 'minWidth:' + IntToStr(Value) + ',';
end;

function TModelMapsInfoWindow<T>.MinWidth: string;
begin
  Result := FMinWidth;
end;

class function TModelMapsInfoWindow<T>.New(Parent: T): iModelMapsInfoWindow<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelMapsInfoWindow<T>.StartOpened(
  Value: boolean): iModelMapsInfoWindow<T>;
begin
  Result := Self;
  FStartOpened := Value;
end;

function TModelMapsInfoWindow<T>.StartOpened: string;
begin
  if FStartOpened then
    Result := 'true'
  else
    Result := 'false';
end;

end.
