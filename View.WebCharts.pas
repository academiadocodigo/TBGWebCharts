unit View.WebCharts;

interface

uses
  Interfaces,
  Classes,
  Generics.Collections,
  SysUtils, Charts.Types,
  Credenciais;

Type

  {$IF (RTLVERSION > 27) AND (RTLVERSION < 32) }[ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidAndroid)]{$IFEND}
  {$IF RTLVERSION > 32 }[ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidAndroid32Arm)]{$IFEND}
  TWebCharts = class(TComponent, iWebCharts)
    private
//      FModelHTML : iModelHTML;
      FCss : TList<String>;
      FFolderDefaultRWC: String;
      FBackgroundColor : String;
      FFontColor : String;
      FContainerClass : TTypeContainer;
      FCDN : Boolean;
      FCredenciais : iModelCredenciais;
    procedure SetFolderDefaultRWC(const Value: String);
    public
      constructor Create; reintroduce;
      destructor Destroy; override;
      class function New : iWebCharts;
      function AddResource(Value : String) : iWebCharts;
      function NewProject : iModelHTML; overload;
      function NewProject(Container : Boolean) : iModelHTML; overload;
      function ContinuosProject : iModelHTML;
      function BackgroundColor(Value : String) : iWebCharts;
      function FontColor(Value : String) : iWebCharts;
      function Container(Value : TTypeContainer) : iWebCharts;
      function CDN(Value : Boolean) : iWebCharts;
      function Credenciais : iModelCredenciais;
    published
      property FolderDefaultRWC : String read FFolderDefaultRWC write SetFolderDefaultRWC;
  end;

implementation

uses
  HTML, TypInfo;

{ TWebCharts }

constructor TWebCharts.Create;
begin
//  FModelHTML := TModelHTML.New;
  FCDN := False;
end;

function TWebCharts.Credenciais: iModelCredenciais;
begin
  FCredenciais := TModelCredenciais.New(Self);
  Result := FCredenciais;
end;

destructor TWebCharts.Destroy;
begin
  if Assigned(FCss) then
    FreeAndNil(FCss);
  inherited;
end;

function TWebCharts.FontColor(Value: String): iWebCharts;
begin
  Result := Self;
  FFontColor := Value;
end;

function TWebCharts.AddResource(Value: String): iWebCharts;
begin
  Result := Self;
  if not Assigned(FCss) then
    FCss := TList<String>.Create;

  FCss.Add(Value);
end;

function TWebCharts.BackgroundColor(Value: String): iWebCharts;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TWebCharts.CDN(Value: Boolean): iWebCharts;
begin
  Result := Self;
  FCDN := Value;
end;

function TWebCharts.Container(Value: TTypeContainer): iWebCharts;
begin
  Result := Self;
  FContainerClass := Value;
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
  Result.Credenciais(FCredenciais);
  Result
    .Container(Container)
    .FolderDefaultRWC(FFolderDefaultRWC)
    .BackgroundColor(FBackgroundColor)
    .FontColor(FFontColor)
    .GenerateHead(FCss);
  Result.ContainerClass(FContainerClass);
end;

procedure TWebCharts.SetFolderDefaultRWC(const Value: String);
begin
  FFolderDefaultRWC := Value;
end;

function TWebCharts.NewProject: iModelHTML;
begin
  Result := TModelHTML.New;
  Result.ClearHTML;
  Result.CDN(FCDN);
  Result.Credenciais(FCredenciais);
  Result
    .BackgroundColor(FBackgroundColor)
    .FontColor(FFontColor)
    .GenerateHead(FCss);
  Result.ContainerClass(FContainerClass);
  Result.FolderDefaultRWC(FFolderDefaultRWC);
end;

end.
