unit CallBackJS;

{$I TBGWebCharts.inc}

interface

uses
  SysUtils,
  RTTI,
  Generics.Collections,
  Classes;

Type
  TCallBackJS = class
    private
      FParent : TObject;
    public
      constructor Create;
      destructor Destroy; override;
      function TryGetValue(Value : String; Params : TStringList) : Boolean;
      function ClassProvider(Value : TObject) : TCallBackJS;

    end;

var
  vCallBackJS : TCallBackJS;

implementation

uses
  TypInfo,
  {$IFDEF HAS_FMX}
  {$ELSE}
  Vcl.Forms,
  {$IFEND}
  Injection,
  IdCoderMIME;

{ TCallBackJS }

function TCallBackJS.ClassProvider(Value: TObject): TCallBackJS;
begin
  Result := Self;
  FParent := Value;
end;

constructor TCallBackJS.Create;
begin
end;

destructor TCallBackJS.Destroy;
begin
  inherited;
end;

function TCallBackJS.TryGetValue(Value : String; Params : TStringList) : Boolean;
var
  ctx: TRttiContext;
  t: TRttiType;
  m: TRttiMethod;
  i: Integer;
  Param : TRttiParameter;
  P : array of TValue;
begin
  try
    if not Assigned(FParent) then
      raise Exception.Create('Dependencia não Injetada para Callback');

    t := ctx.GetType(FParent.ClassType);
    m := t.GetMethod(Value);
    i := 0;
    for Param in m.GetParameters do
    begin
      SetLength(P, (i+1));
      case Param.ParamType.TypeKind of
        tkString,
        tkUString : P[i] := TValue.From<string>(stringreplace(TIdDecoderMIME.DecodeString(Params[i]), '%20', ' ',[rfReplaceAll, rfIgnoreCase]));
        tkFloat   : P[i] := TValue.From<Currency>(StrToCurr(TIdDecoderMIME.DecodeString(Params[i])));
        tkInteger : P[i] := TValue.From<Integer>(StrToInt(TIdDecoderMIME.DecodeString(Params[i])));
      end;
      Inc(i);
    end;
    m.Invoke(FParent, P);
    Result := True;
  except
    Result := False;
  end;
end;

initialization
  vCallBackJS := TCallBackJS.Create;

finalization
  FreeAndNil(vCallBackJS);

end.

