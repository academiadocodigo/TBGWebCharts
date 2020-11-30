unit Utilities.Encoder;

interface

uses
  Classes;

type
    TUtilitiesEncoder = class
      public
        class function Base64Encode(input : TCustomMemoryStream) : String; overload;
        class function ImageToBase64URI(input : TCustomMemoryStream) : String;
        class function Base64Encode(Value : String) : String; overload;
        class function Base64Decode(Value : String) : String;

    end;

implementation

uses
  IdCoderMIME, SysUtils;

{ TUtilitiesEncoder }

class function TUtilitiesEncoder.Base64Decode(Value: String): String;
begin
  Result := TIdDecoderMIME.DecodeString(Value);
end;

class function TUtilitiesEncoder.Base64Encode(
  input: TCustomMemoryStream): String;
var
  Base64 : TIdEncoderMIME;
begin
  Result := '';
  try
    input.Seek(0, soBeginning);
    try
      base64 := TIdEncoderMIME.Create(nil);
      Result := base64.Encode(input);
    finally
    end;
  finally
    FreeAndNil(Base64);
  end;
end;

class function TUtilitiesEncoder.Base64Encode(Value: String): String;
begin
  Result := TIdEncoderMIME.EncodeString(Value);
end;

class function TUtilitiesEncoder.ImageToBase64URI(
  input: TCustomMemoryStream): String;
begin
  Result := 'data:image;base64,' + Base64Encode(input);
end;

end.
