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
      FStyles : TDictionary<string, string>;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelGenericStyle<T>;
      function AlignItems(Value : String) : iModelGenericStyle<T>; overload;
      function AlignItems : string; overload;
      function Background(Value : string) : iModelGenericStyle<T>; overload;
      function Background : string; overload;
      function BackgroundColor(Value : string) : iModelGenericStyle<T>; overload;
      function BackgroundColor : string; overload;
      function Color(Value : string) : iModelGenericStyle<T>; overload;
      function Color : string; overload;
      function Display(Value : String) : iModelGenericStyle<T>; overload;
      function Display : string; overload;
      function FontFamily(Value : String) : iModelGenericStyle<T>; overload;
      function FontFamily : string; overload;
      function FontSize(Value : Integer) : iModelGenericStyle<T>; overload;
      function FontSize(Value : string) : iModelGenericStyle<T>; overload;
      function FontSize : string; overload;
      function FontWeight(Value : String) : iModelGenericStyle<T>; overload;
      function FontWeight : string; overload;
      function Height(Value : Integer) : iModelGenericStyle<T>; overload;
      function Height(Value : String) : iModelGenericStyle<T>; overload;
      function Height : string; overload;
      function JustifyContent(Value : String) : iModelGenericStyle<T>; overload;
      function JustifyContent : string; overload;
      function Padding(Value : Integer) : iModelGenericStyle<T>; overload;
      function Padding(Value : String) : iModelGenericStyle<T>; overload;
      function Padding : string; overload;
      function TextAlign(Value : String) : iModelGenericStyle<T>; overload;
      function TextAlign : string; overload;
      function Width(Value : Integer) : iModelGenericStyle<T>; overload;
      function Width(Value : String) : iModelGenericStyle<T>; overload;
      function Width : string; overload;
      function ResultStyle : String;
      function &End : T;

  end;
implementation

uses
  Injection,
  System.SysUtils,
  Utilities.Str;

{ TGenericStyle<T> }

function TModelGenericStyle<T>.AlignItems(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('align-items', Value);
end;

function TModelGenericStyle<T>.AlignItems: string;
begin
  FStyles.TryGetValue('align-items', Result);
end;

function TModelGenericStyle<T>.Background(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('background', Value);
  if FStyles.ContainsKey('background-color') then
    FStyles.Remove('background-color');
end;

function TModelGenericStyle<T>.Background: string;
begin
  FStyles.TryGetValue('background', Result);
end;

function TModelGenericStyle<T>.BackgroundColor(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('background-color', TUtilitiesStr.TestRgbColor(Value));
  if FStyles.ContainsKey('background') then
    FStyles.Remove('background');
end;

function TModelGenericStyle<T>.BackgroundColor: string;
begin
  FStyles.TryGetValue('background-color', Result);
end;

constructor TModelGenericStyle<T>.Create(Parent: T);
begin
  TInjection.Weak(@FParent, Parent);
  FStyles := TDictionary<string, string>.Create;
end;

destructor TModelGenericStyle<T>.Destroy;
begin
  FStyles.Free;
  inherited;
end;

function TModelGenericStyle<T>.Display: string;
begin
  FStyles.TryGetValue('display', Result);
end;

function TModelGenericStyle<T>.Display(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('display', Value);
end;

function TModelGenericStyle<T>.&End: T;
begin
  result := FParent;
end;

function TModelGenericStyle<T>.Color(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('color', TUtilitiesStr.TestRgbColor(Value));
end;

function TModelGenericStyle<T>.Color: string;
begin
  FStyles.TryGetValue('color', Result);
end;

function TModelGenericStyle<T>.FontFamily(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('font-family', Value);
end;

function TModelGenericStyle<T>.FontFamily: string;
begin
  FStyles.TryGetValue('font-family', Result);
end;

function TModelGenericStyle<T>.FontSize: string;
begin
  FStyles.TryGetValue('font-size', Result);
end;

function TModelGenericStyle<T>.FontWeight(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('font-weight', Value);
end;

function TModelGenericStyle<T>.FontWeight: string;
begin
  FStyles.TryGetValue('font-weight', Result);
end;

function TModelGenericStyle<T>.Height(Value: Integer): iModelGenericStyle<T>;
begin
  Result := Height(IntToStr(Value) + 'px');
end;

function TModelGenericStyle<T>.Height(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('height', Value);
end;

function TModelGenericStyle<T>.Height: string;
begin
  FStyles.TryGetValue('height', Result);
end;

function TModelGenericStyle<T>.JustifyContent(
  Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('justify-content', Value);
end;

function TModelGenericStyle<T>.JustifyContent: string;
begin
  FStyles.TryGetValue('justify-content', Result);
end;

function TModelGenericStyle<T>.FontSize(Value: string): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('font-size', Value);
end;

function TModelGenericStyle<T>.FontSize(Value: Integer): iModelGenericStyle<T>;
begin
  Result := FontSize(IntToStr(Value) + 'px');
end;

class function TModelGenericStyle<T>.New(Parent: T): iModelGenericStyle<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelGenericStyle<T>.Padding: string;
begin
  FStyles.TryGetValue('padding', Result);
end;

function TModelGenericStyle<T>.Padding(Value: Integer): iModelGenericStyle<T>;
begin
  Result := Padding(IntToStr(Value) + 'px');
end;

function TModelGenericStyle<T>.Padding(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('padding', Value);
end;

function TModelGenericStyle<T>.ResultStyle: String;
var
  Key : string;
begin
  Result := '';
  if FStyles.Count > 0 then
  begin
    for Key in FStyles.Keys do
      Result := Result + format('%s: %s; ', [Key, FStyles.Items[Key]]);
    Result := format('style="%s"', [Trim(Result)]);
  end;
end;

function TModelGenericStyle<T>.TextAlign(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('text-align', Value);
end;

function TModelGenericStyle<T>.TextAlign: string;
begin
  FStyles.TryGetValue('text-align', Result);
end;

function TModelGenericStyle<T>.Width: string;
begin
  FStyles.TryGetValue('width', Result);
end;

function TModelGenericStyle<T>.Width(Value: String): iModelGenericStyle<T>;
begin
  Result := Self;
  FStyles.AddOrSetValue('width', Value);
end;

function TModelGenericStyle<T>.Width(Value: Integer): iModelGenericStyle<T>;
begin
  Result := Width(IntToStr(Value) + 'px');
end;

end.
