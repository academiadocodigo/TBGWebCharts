unit JSCommand;

interface
uses
  Interfaces;
type
  TModelJSCommand = Class(TInterfacedObject, iModelJSCommand)
    private
      FCommand : string;
      FParamters : iModelGenericList<iModelJSCommand>;
      FTagName : string;
      FTagId : string;
      FTagAttribute : string;
      function ResultParamters : string; overload;
    public
      constructor Create;
      destructor Destroy; override;
      class function New() : iModelJSCommand;
      function Command(Value : string) :iModelJSCommand; overload;
      function Paramters : iModelGenericList<iModelJSCommand>; overload;
      function TagName(Value : string) :iModelJSCommand; overload;
      function TagID(Value : string) : iModelJSCommand; overload;
      function TagAttribute(Value : string) : iModelJSCommand; overload;
      function ResultCommand : string; overload;
      function TagName : string; overload;
      function TagID : string; overload;
      function TagAttribute : string; overload;

  End;

implementation

uses
  Generic.List;

{ TModelJSCommand }

function TModelJSCommand.Command(Value: string): iModelJSCommand;
begin
  Result := Self;
  FCommand := Value;
end;

constructor TModelJSCommand.Create;
begin

end;

destructor TModelJSCommand.Destroy;
begin

  inherited;
end;

class function TModelJSCommand.New: iModelJSCommand;
begin
  Result := Self.Create;
end;

function TModelJSCommand.Paramters: iModelGenericList<iModelJSCommand>;
begin
  FParamters := TModelGenericList<iModelJSCommand>.New(Self);
  Result := FParamters;
end;

function TModelJSCommand.ResultCommand: string;
begin
  Result :=  FCommand + '(' + ResultParamters + ')';
end;

function TModelJSCommand.ResultParamters: string;
var
  I: Integer;
  Aux: string;
begin
  Result := '';
  if Assigned(FParamters) then
  begin
    for I := 0 to Pred(FParamters.List.Count) do
    begin
      if I = Pred(FParamters.List.Count) then
        Aux := '';
      Result := Result + '''' + FParamters.List[I] + '''' + aux;
    end;
  end;
end;

function TModelJSCommand.TagAttribute: string;
begin
  Result := FTagAttribute;
end;

function TModelJSCommand.TagAttribute(Value: string): iModelJSCommand;
begin
  Result := Self;
  FTagAttribute := Value;
end;

function TModelJSCommand.TagID: string;
begin
  Result := FTagID;
end;

function TModelJSCommand.TagID(Value: string): iModelJSCommand;
begin
  Result := Self;
  FTagId := Value;
end;

function TModelJSCommand.TagName(Value: string): iModelJSCommand;
begin
  Result := Self;
  FTagName := Value;
end;

function TModelJSCommand.TagName: string;
begin
  Result := FTagName;
end;

end.
