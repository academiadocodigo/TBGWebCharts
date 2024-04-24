unit Browser.Chromium.Resources.JSCallback;

interface

uses
  Interfaces,
  Generics.Collections,
  System.SysUtils;

type
  TChromiumResourcesJSCallback = class (TInterfacedObject, iModelChromiumResourcesJSCallback)
    private
      FProcedures : TDictionary<string, TProc<string>>;
      FContador : integer;
      function GetContador: integer;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelChromiumResourcesJSCallback;
      function Add(Proc : TProc<String>) : string;
      function Get(Key : string) : TProc<string>;
      function Extract(Key : string) : TProc<string>;
      procedure Remove(Key : string);
  end;

implementation

{ TChromiumResoucesJSCallback }

function TChromiumResourcesJSCallback.Add(Proc: TProc<String>): string;
var
  key: integer;
begin
  key := getContador;
  FProcedures.add(intToStr(Key), Proc);
  Result := IntToStr(Key);
end;

constructor TChromiumResourcesJSCallback.Create;
begin
  FProcedures := TDictionary<string, TProc<String>>.Create;
  FContador := 0;
end;

destructor TChromiumResourcesJSCallback.Destroy;
begin
  FreeAndNil(FProcedures);
  inherited;
end;

function TChromiumResourcesJSCallback.Extract(Key: string): TProc<string>;
begin
  Result := FProcedures.ExtractPair(Key).Value;
end;

function TChromiumResourcesJSCallback.Get(Key: string): TProc<string>;
begin
  Result := nil;
  if FProcedures.ContainsKey(Key) then
    Result := FProcedures.Items[Key];
end;

function TChromiumResourcesJSCallback.GetContador: integer;
begin
  inc(FContador);
  Result := FContador;
end;

class function TChromiumResourcesJSCallback.New: iModelChromiumResourcesJSCallback;
begin
  Result := Self.Create;
end;

procedure TChromiumResourcesJSCallback.Remove(Key: string);
begin
  FProcedures.Remove(Key);
end;

end.
