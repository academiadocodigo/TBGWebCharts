unit Browser.Chromium.Resources.Pages;

interface

uses
  Interfaces,
  uCEFInterfaces,
  Generics.Collections;

type
  TChromiumResourcesPages = class (TInterfacedObject, iModelChromiumResourcesPages)
    private
      FPages : TDictionary<string, ICefResourceHandler>;
      FContador : integer;
      function GetContador: integer;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelChromiumResourcesPages;
      function Add(HTML : String) : string;
      function Get(Key : String) : ICefResourceHandler;
      function Extract(Key : String) :ICefResourceHandler;
      procedure Remove(Key : String);
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  Chromium.CustomResourceHandler,
  uCEFMiscFunctions;

{ TBrowserPages }

function TChromiumResourcesPages.Add(HTML: string): string;
var
  key : integer;
  TempStream : TStringStream;
begin
  key := GetContador;
  try
    try
      TempStream := TStringStream.Create(HTML, TEncoding.UTF8, false);
      FPages.Add(IntToStr(key), TCustomResourceHandler.Create(nil, nil, '', nil, TStream(TempStream), CefGetMimeType('html')));
    except
      raise Exception.Create('Erro ao gerar Handle HTML');
    end;
  finally
    if TempStream <> nil then
      FreeAndNil(TempStream);
  end;
  Result := IntToStr(key);
end;

constructor TChromiumResourcesPages.Create;
begin
  FPages := TDictionary<string, ICefResourceHandler>.Create;
  FContador := 0;
end;

destructor TChromiumResourcesPages.Destroy;
begin
  FreeAndNil(FPages);
  inherited;
end;

function TChromiumResourcesPages.Extract(Key: String): ICefResourceHandler;
begin
  Result := FPages.ExtractPair(Key).Value;
end;

function TChromiumResourcesPages.Get(Key: String): ICefResourceHandler;
begin
  Result := nil;
  if FPages.ContainsKey(Key) then
    Result := FPAges.Items[Key];
end;

function TChromiumResourcesPages.GetContador: integer;
begin
  inc(FContador);
  Result := FContador;
end;

class function TChromiumResourcesPages.New: iModelChromiumResourcesPages;
begin
  Result := Self.Create;
end;

Procedure TChromiumResourcesPages.Remove(Key: String);
begin
  FPages.Remove(Key);
end;

end.
