unit Generic.Title;

interface

uses
  Interfaces;

type
  TModelGenericTitle<T : IInterface> = class(TInterfacedObject, iModelGenericTitle<T>)
    private
      [weak]
      FParent : T;
      FText : string;
      FFontSize : Integer;
      FTextAlignment : string;
      FFontColor : string;
      FFontFamily : string;

    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelGenericTitle<T>;

      function Text(Value : string) : iModelGenericTitle<T>; overload;
      function FontSize(Value : Integer) : iModelGenericTitle<T>; overload;
      function TextAlignment(Value : string) : iModelGenericTitle<T>; overload;
      function FontColorHEX(Value : string) : iModelGenericTitle<T>; overload;
      function FontFamily(Value : string) : iModelGenericTitle<T>; overload;
      function Text : string; overload;
      function FontSize : Integer; overload;
      function TextAlignment : string; overload;
      function FontColorHEX : string; overload;
      function FontFamily : string; overload;
      function Result : string;
      function &End : T;

  end;
implementation

uses
  Injection, System.SysUtils;

{ TModelGenericTitle<T> }

constructor TModelGenericTitle<T>.Create(Parent: T);
begin
  TInjection.Weak(@FParent, Parent);
  FFontSize := 2;
  FTextAlignment := 'left';
  FFontColor := '#000000';
end;

destructor TModelGenericTitle<T>.Destroy;
begin

  inherited;
end;

function TModelGenericTitle<T>.&End: T;
begin
  Result := FParent;
end;

function TModelGenericTitle<T>.FontColorHEX(
  Value: string): iModelGenericTitle<T>;
begin
  Result := Self;
  FFontColor := Value;
end;

function TModelGenericTitle<T>.FontColorHEX: string;
begin
  Result := FFontColor;
end;

function TModelGenericTitle<T>.FontFamily: string;
begin
  Result := FFontFamily;
end;

function TModelGenericTitle<T>.FontFamily(Value: string): iModelGenericTitle<T>;
begin
  Result := Self;
  FFontFamily := Value;
end;

function TModelGenericTitle<T>.FontSize(Value: Integer): iModelGenericTitle<T>;
begin
  Result := Self;
  FFontSize := Value;
end;

function TModelGenericTitle<T>.FontSize: Integer;
begin
  Result := FFontSize;
end;

class function TModelGenericTitle<T>.New(
  Parent: T): iModelGenericTitle<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelGenericTitle<T>.Result: string;
begin
  Result := '<h1 style="' +
    'color:' + FFontColor + ';' +
    'font-family:' + FFontFamily + ';' +
    'font-size:' + IntToStr(FFontSize) + 'vw;' +
    'text-align:' + FTextAlignment + ';' +
    '">' + FText + '</h1>';
end;

function TModelGenericTitle<T>.Text: string;
begin
  Result := FText;
end;

function TModelGenericTitle<T>.Text(Value: string): iModelGenericTitle<T>;
begin
  Result := Self;
  FText := Value;
end;

function TModelGenericTitle<T>.TextAlignment: string;
begin
  Result := FTextAlignment;
end;

function TModelGenericTitle<T>.TextAlignment(
  Value: string): iModelGenericTitle<T>;
begin
  Result := Self;
  FTextAlignment := Value;
end;

end.
