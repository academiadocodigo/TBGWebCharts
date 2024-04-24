unit Browser.Chromium.Resources;

interface

uses
  Interfaces,
  Generics.Collections;

type
  TChromiumResources = class (TInterfacedObject, iModelChromiumResources)
    private
      FChromiumResourcesPages : iModelChromiumResourcesPages;
      FChromiumResourcesJSCallback : iModelChromiumResourcesJSCallback;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelChromiumResources;
      function Pages : iModelChromiumResourcesPages;
      function JSCallback : iModelChromiumResourcesJSCallback;
  end;
implementation

uses
  Browser.Chromium.Resources.Pages,
  Browser.Chromium.Resources.JSCallback;

{ TChromiumResources }

constructor TChromiumResources.Create;
begin
  FChromiumResourcesPages := TChromiumResourcesPages.New;
  FChromiumResourcesJSCallback := TChromiumResourcesJSCallBack.New;
end;

destructor TChromiumResources.Destroy;
begin

  inherited;
end;

function TChromiumResources.JSCallback: iModelChromiumResourcesJSCallback;
begin
  Result := FChromiumResourcesJSCallback;
end;

class function TChromiumResources.New: iModelChromiumResources;
begin
  Result := Self.Create;
end;

function TChromiumResources.Pages: iModelChromiumResourcesPages;
begin
  Result := FChromiumResourcesPages;
end;

end.
