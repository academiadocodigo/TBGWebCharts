unit Rows.Title.Config;

interface

uses
  Interfaces;

Type
  TModelHTMLRowsTitleConfig<T> = class(TInterfacedObject,
    IModelRowsTitleConfig<T>)
  private
    {$IFDEF VER320}
    [unsafe]
    {$ENDIF}
    FParent : T;
    FH1 : String;
    FH2 : String;
    FH3 : String;
    FH4 : String;
    FH5 : String;
  public
    constructor Create(Parent : T);
    destructor Destroy; override;
    class function New(Parent : T) : IModelRowsTitleConfig<T>;
    function H1(Value: String): IModelRowsTitleConfig<T>; overload;
    function H1: String; overload;
    function H2(Value: String): IModelRowsTitleConfig<T>; overload;
    function H2: String; overload;
    function H3(Value: String): IModelRowsTitleConfig<T>; overload;
    function H3: String; overload;
    function H4(Value: String): IModelRowsTitleConfig<T>; overload;
    function H4: String; overload;
    function H5(Value: String): IModelRowsTitleConfig<T>; overload;
    function H5: String; overload;
    function &End: T;
  end;

implementation

{ TModelHTMLRowsTitleConfig<T> }

function TModelHTMLRowsTitleConfig<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelHTMLRowsTitleConfig<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TModelHTMLRowsTitleConfig<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLRowsTitleConfig<T>.H1: String;
begin
  Result := FH1;
end;

function TModelHTMLRowsTitleConfig<T>.H1(
  Value: String): IModelRowsTitleConfig<T>;
begin
  Result := Self;
  FH1 := Value;
end;

function TModelHTMLRowsTitleConfig<T>.H2: String;
begin
  Result := FH2;
end;

function TModelHTMLRowsTitleConfig<T>.H2(
  Value: String): IModelRowsTitleConfig<T>;
begin
  Result := Self;
  FH2 := Value;
end;

function TModelHTMLRowsTitleConfig<T>.H3(
  Value: String): IModelRowsTitleConfig<T>;
begin
  Result := Self;
  FH3 := Value;
end;

function TModelHTMLRowsTitleConfig<T>.H3: String;
begin
  Result := FH3;
end;

function TModelHTMLRowsTitleConfig<T>.H4(
  Value: String): IModelRowsTitleConfig<T>;
begin
  Result := Self;
  FH4 := Value;
end;

function TModelHTMLRowsTitleConfig<T>.H4: String;
begin
  Result := FH4;
end;

function TModelHTMLRowsTitleConfig<T>.H5(
  Value: String): IModelRowsTitleConfig<T>;
begin
  Result := Self;
  FH5 := Value;
end;

function TModelHTMLRowsTitleConfig<T>.H5: String;
begin
  Result := FH5;
end;

class function TModelHTMLRowsTitleConfig<T>.New(Parent : T): IModelRowsTitleConfig<T>;
begin
  Result := Self.Create(Parent);
end;

end.
