unit Generic.Style;

interface

uses
  Interfaces,
  Generics.Collections;
type
  TModelGenericStyle<T : IInterface> = class(TInterfacedObject, iModelGenericStyle<T>)
    private
      [weak]
      FParent : T;
      FBackgroundColor : string;
      FFontColor : string;
      FFontSize : string;

    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelGenericStyle<T>;
      function BackgroundColor(Value : string) : iModelGenericStyle<T>; overload;
      function FontColor(Value : string) : iModelGenericStyle<T>; overload;
      function FontSize(Value : Integer) : iModelGenericStyle<T>; overload;
      function FontSize(Value : string) : iModelGenericStyle<T>; overload;
      function BackgroundColor : string; overload;
      function FontColor : string; overload;
      function FontSize : string; overload;
      function &End : T;

  end;
implementation

uses
  Injection, System.SysUtils;

{ TGenericStyle<T> }

function TModelGenericStyle<T>.BackgroundColor(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TModelGenericStyle<T>.BackgroundColor: string;
begin
  Result := FBackgroundColor;
end;

constructor TModelGenericStyle<T>.Create(Parent: T);
begin
  TInjection.Weak(@FParent, Parent);
end;

destructor TModelGenericStyle<T>.Destroy;
begin

  inherited;
end;

function TModelGenericStyle<T>.&End: T;
begin
  result := FParent;
end;

function TModelGenericStyle<T>.FontColor(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FFontColor := Value;
end;

function TModelGenericStyle<T>.FontColor: string;
begin
  Result := FFontColor;
end;

function TModelGenericStyle<T>.FontSize: string;
begin
  Result := FFontSize;
end;

function TModelGenericStyle<T>.FontSize(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FFontSize := Value;
end;

function TModelGenericStyle<T>.FontSize(Value: Integer): iModelGenericStyle<T>;
begin
  Result := FontSize(IntToStr(Value) + 'px');
end;

class function TModelGenericStyle<T>.New(Parent: T): iModelGenericStyle<T>;
begin
  Result := Self.Create(Parent);
end;

end.
