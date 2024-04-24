unit CardStyled.Callback;

interface

uses
  Interfaces;

Type
  TModelCardStyledCallback = class(TInterfacedObject, iModelCardStyledCallback)
  private
    [weak]
    FParent : iModelCardStyledGeneric;
    FMethodName : String;
    FParamValue : String;
  public
    constructor Create(Parent : iModelCardStyledGeneric);
    destructor Destroy; override;
    class function New(Parent : iModelCardStyledGeneric) : iModelCardStyledCallback;
    function MethodName(aValue : string) : iModelCardStyledCallback;
    function ParamValue(aValue : string) : iModelCardStyledCallback;
    function ResultClass : string;
    function &End : iModelCardStyledGeneric;
  end;

implementation
uses
  Injection,
  System.SysUtils,
  Utilities.Encoder;

{ TModelCardStyledCallback }

function TModelCardStyledCallback.&End: iModelCardStyledGeneric;
begin
  Result := FParent;
end;

constructor TModelCardStyledCallback.Create(Parent : iModelCardStyledGeneric);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelCardStyledCallback.Destroy;
begin

  inherited;
end;

function TModelCardStyledCallback.MethodName(
  aValue: string): iModelCardStyledCallback;
begin
  Result := Self;
  FMethodName := aValue;
end;

class function TModelCardStyledCallback.New (Parent : iModelCardStyledGeneric) : iModelCardStyledCallback;
begin
  Result := Self.Create(Parent);
end;

function TModelCardStyledCallback.ParamValue(
  aValue: string): iModelCardStyledCallback;
begin
  Result := Self;
  FParamValue := aValue;
end;

function TModelCardStyledCallback.ResultClass: string;
var
  url : string;
begin
  url := Format('ActionCallBackJS:%s(%s)', [FMethodName, TUtilitiesEncoder.Base64Encode(FParamValue)]);
  Result := Format(' onclick="location.assign(%s)" style="cursor: pointer;"', [QuotedStr(url)]);
end;

end.
