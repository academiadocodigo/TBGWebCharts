unit CallBackJS;

{$I TBGWebCharts.inc}

interface

uses
  {$IFDEF HAS_FMX}
    FMX.WebBrowser,
  {$ELSE}
    SHDocVw,
  {$ENDIF}
  SysUtils,
  RTTI,
  Generics.Collections,
  Classes;

Type
  TCallBackJS = class
    private
      FParent : TObject;
      FWebBrowser : TWebBrowser;
      FActionMethod : String;
    public
      constructor Create;
      destructor Destroy; override;
      function TryGetValue(Value : String; Params : TStringList) : Boolean;
      function ClassProvider(Value : TObject) : TCallBackJS;
      function WebBrowser(Value : TWebBrowser) : TCallBackJS;
      function ActionMethod(Value : String) : TCallBackJS;
      procedure BeforeNavigate(ASender: TObject; const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);

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
  Injection;



{ TCallBackJS }

function TCallBackJS.ActionMethod(Value: String): TCallBackJS;
begin
  Result := Self;
  FActionMethod := Value;
end;

procedure TCallBackJS.BeforeNavigate(ASender: TObject; const pDisp: IDispatch;
  const URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
var
  Target : String;
  Aux, Method: string;
  Params : TStringList;
begin
  Target := URL;
  Method := Copy(Target, Pos(':', Target) + 1, Length(Target));
  Method := Copy(Method, 1, Pos('(', Method) - 1);
  Params := TStringList.Create;
  try
    Aux := Copy(Target, Pos('(', Target) + 1, Length(Target));
    Aux := Copy(Aux, 1, Pos(')', Aux)-1);
    Params.CommaText := Aux;
    if not Method.IsEmpty then
      if TryGetValue(Method, Params) then
        Cancel := True;
  finally
    Params.Free;
  end;
end;

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
  _a : String;
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
        tkUString : P[i] := TValue.From<string>(stringreplace(Params[i], '%20', ' ',[rfReplaceAll, rfIgnoreCase]));
        tkFloat   : P[i] := TValue.From<Currency>(StrToCurr(Params[i]));
        tkInteger : P[i] := TValue.From<Integer>(StrToInt(Params[i]));
      end;
      Inc(i);
    end;
    m.Invoke(FParent, P);
    Result := True;
  except
    Result := False;
  end;
end;

function TCallBackJS.WebBrowser(Value: TWebBrowser): TCallBackJS;
begin
  Result := Self;
  FWebBrowser := Value;
  {$IFDEF HAS_FMX}
  {$ELSE}
    FWebBrowser.OnBeforeNavigate2 := BeforeNavigate;
  {$ENDIF}
end;

initialization
  vCallBackJS := TCallBackJS.Create;

finalization
  FreeAndNil(vCallBackJS);

end.

