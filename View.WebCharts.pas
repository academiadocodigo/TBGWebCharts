unit View.WebCharts;

interface

uses
  Interfaces, Classes, Generics.Collections, SysUtils;

Type
  iWebCharts = interface
    ['{D98D23CE-5E37-4941-89E3-92AF922ACE60}']
    function NewProject : iModelHTML; overload;
    function NewProject(Container : Boolean) : iModelHTML; overload;
    function ContinuosProject : iModelHTML;
    function AddResource(Value : String) : iWebCharts;
  end;

  {$IF RTLVERSION > 23 }[ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidAndroid)]{$IFEND}
  TWebCharts = class(TComponent, iWebCharts)
    private
      FModelHTML : iModelHTML;
      FCss : TList<String>;
    FFolderDefaultRWC: String;
    procedure SetFolderDefaultRWC(const Value: String);
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iWebCharts;
      function AddResource(Value : String) : iWebCharts;
      function NewProject : iModelHTML; overload;
      function NewProject(Container : Boolean) : iModelHTML; overload;
      function ContinuosProject : iModelHTML;
    published
      property FolderDefaultRWC : String read FFolderDefaultRWC write SetFolderDefaultRWC;
  end;

implementation

uses
  HTML, TypInfo;

{ TWebCharts }

constructor TWebCharts.Create;
begin
  FModelHTML := TModelHTML.New;
end;

destructor TWebCharts.Destroy;
begin
  if Assigned(FCss) then
    FreeAndNil(FCss);
  inherited;
end;

function TWebCharts.AddResource(Value: String): iWebCharts;
begin
  Result := Self;
  if not Assigned(FCss) then
    FCss := TList<String>.Create;

  FCss.Add(Value);
end;

function TWebCharts.ContinuosProject: iModelHTML;
begin
 Result := TModelHTML.New;
end;

class function TWebCharts.New: iWebCharts;
begin
  Result := Self.Create;
end;

function TWebCharts.NewProject(Container: Boolean): iModelHTML;
begin
  Result := TModelHTML.New;
  Result.ClearHTML;
  Result.Container(Container);
  Result.FolderDefaultRWC(FFolderDefaultRWC);
  Result.GenerateHead(FCss);
end;

procedure TWebCharts.SetFolderDefaultRWC(const Value: String);
begin
  FFolderDefaultRWC := Value;
end;

function TWebCharts.NewProject: iModelHTML;
begin
  Result := TModelHTML.New;
  Result.ClearHTML;
  Result.GenerateHead(FCss);
  Result.FolderDefaultRWC(FFolderDefaultRWC);
end;

end.
