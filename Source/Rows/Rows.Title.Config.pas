unit Rows.Title.Config;

interface

uses
  Interfaces, Injection;

Type
  TModelHTMLRowsTitleConfig = class(TInterfacedObject,
    IModelRowsTitleConfig)
  private
    [weak]
    FParent : iModelHTMLRowsTitle;
    FH1 : String;
    FH2 : String;
    FH3 : String;
    FH4 : String;
    FH5 : String;
  public
    constructor Create(Parent : iModelHTMLRowsTitle);
    destructor Destroy; override;
    class function New(Parent : iModelHTMLRowsTitle) : IModelRowsTitleConfig;
    function H1(Value: String): IModelRowsTitleConfig; overload;
    function H1: String; overload;
    function H2(Value: String): IModelRowsTitleConfig; overload;
    function H2: String; overload;
    function H3(Value: String): IModelRowsTitleConfig; overload;
    function H3: String; overload;
    function H4(Value: String): IModelRowsTitleConfig; overload;
    function H4: String; overload;
    function H5(Value: String): IModelRowsTitleConfig; overload;
    function H5: String; overload;
    function &End: iModelHTMLRowsTitle;
  end;

implementation

{ TModelHTMLRowsTitleConfig }

function TModelHTMLRowsTitleConfig.&End: iModelHTMLRowsTitle;
begin
  Result := FParent;
end;

constructor TModelHTMLRowsTitleConfig.Create(Parent : iModelHTMLRowsTitle);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, IInterface(Parent));
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelHTMLRowsTitleConfig.Destroy;
begin

  inherited;
end;

function TModelHTMLRowsTitleConfig.H1: String;
begin
  Result := FH1;
end;

function TModelHTMLRowsTitleConfig.H1(
  Value: String): IModelRowsTitleConfig;
begin
  Result := Self;
  FH1 := Value;
end;

function TModelHTMLRowsTitleConfig.H2: String;
begin
  Result := FH2;
end;

function TModelHTMLRowsTitleConfig.H2(
  Value: String): IModelRowsTitleConfig;
begin
  Result := Self;
  FH2 := Value;
end;

function TModelHTMLRowsTitleConfig.H3(
  Value: String): IModelRowsTitleConfig;
begin
  Result := Self;
  FH3 := Value;
end;

function TModelHTMLRowsTitleConfig.H3: String;
begin
  Result := FH3;
end;

function TModelHTMLRowsTitleConfig.H4(
  Value: String): IModelRowsTitleConfig;
begin
  Result := Self;
  FH4 := Value;
end;

function TModelHTMLRowsTitleConfig.H4: String;
begin
  Result := FH4;
end;

function TModelHTMLRowsTitleConfig.H5(
  Value: String): IModelRowsTitleConfig;
begin
  Result := Self;
  FH5 := Value;
end;

function TModelHTMLRowsTitleConfig.H5: String;
begin
  Result := FH5;
end;

class function TModelHTMLRowsTitleConfig.New(Parent : iModelHTMLRowsTitle): IModelRowsTitleConfig;
begin
  Result := Self.Create(Parent);
end;

end.
