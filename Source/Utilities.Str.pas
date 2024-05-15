unit Utilities.Str;

interface

uses
  Classes,
  System.SysUtils,
  Data.DB,
  Generics.Collections;

type
    TUtilitiesStr = class
      public
        class function StrToStrValue(Value: string) : string;
        class function FloatCurrFieldToStrValue(Value: TField) : string;
        class function TestRgbColor(Value : string) : string;
    end;

implementation

{ TUtilitiesStr }

class function TUtilitiesStr.FloatCurrFieldToStrValue(Value: TField): string;
begin
  case Value.DataType of
    ftFloat,ftCurrency :
      Begin
        Result := StrToStrValue(Value.AsString);
      End
      else
        Result := Value.AsString;
  end;
end;

class function TUtilitiesStr.StrToStrValue(Value: string): string;
var
  I,cont : Integer;
  caracter : string;
begin
  caracter := '';
  cont := 0;
   {$IF Defined(ANDROID) or Defined(IOS)}
  for I := Length(Value) downto 0 do
  {$ELSE}
  for I := Length(Value) downto 1 do
  {$ENDIF}
  begin
      if (CharInSet(value[i], ['0'..'9']) or (value[i]='-')) then
        caracter := value[i] + caracter
      else
      begin
        if cont=0 then
        begin
          if ((value[i]='.') or (value[i]=',')) then
          begin
            value[i]:='.';
            caracter := value[i] + caracter;
            inc(cont);
          end;
        end;
      end;
  end;
  result:=caracter;
end;

class function TUtilitiesStr.TestRgbColor(Value: string): string;
var
  Color : TArray<string>;
  ColorInt, I : Integer;
begin
  Result := Value;
  Color := Value.Split([',']);
  if Length(Color) <> 3 then exit;
  for I := 0 to Length(Color) - 1 do
  begin
    if not TryStrToInt(Trim(color[i]), ColorInt) then exit;
    if (ColorInt < 0) or (ColorInt > 255) then exit;
  end;
  Result := format('rgb(%s)', [Result]);
end;

end.
