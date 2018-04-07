unit View.WebCharts;

interface

uses
  Interfaces, Classes, Generics.Collections, SysUtils;

Type
  iWebCharts = interface
    ['{D98D23CE-5E37-4941-89E3-92AF922ACE60}']
    function NewProject : iModelHTML;
    function ContinuosProject : iModelHTML;
    function AddResource(Value : String) : iWebCharts;
  end;

  TWebCharts = class(TComponent, iWebCharts)
    private
      FModelHTML : iModelHTML;
      FCss : TList<String>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iWebCharts;
      function AddResource(Value : String) : iWebCharts;
      function NewProject : iModelHTML;
      function ContinuosProject : iModelHTML;

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

function TWebCharts.NewProject: iModelHTML;
begin
  Result := TModelHTML.New;
  Result.ClearHTML;
  Result.GenerateHead(FCss);
end;

end.
