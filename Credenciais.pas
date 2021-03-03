unit Credenciais;

interface
uses
  Interfaces;

type
  TModelCredenciais = class(TInterfacedObject, iModelCredenciais)
    private
      FParent : iWebCharts;
      FAPIGoogle : string;
    public
      constructor Create(Parent : iWebCharts);
      destructor Destroy; override;
      class function New(Parent : iWebCharts) : iModelCredenciais;
      function APIGoogle(Value : string) : iModelCredenciais; overload;
      function APIGoogle : string; overload;
      function &End : iWebCharts;

  end;
implementation

uses
  Injection;

{ TModelCredenciais }

function TModelCredenciais.APIGoogle(Value: string): iModelCredenciais;
begin
  Result := Self;
  FAPIGoogle := Value;
end;

function TModelCredenciais.APIGoogle: string;
begin
  Result := FAPIGoogle;
end;

constructor TModelCredenciais.Create(Parent: iWebCharts);
begin
  TInjection.Weak(@FParent, Parent);
end;

destructor TModelCredenciais.Destroy;
begin

  inherited;
end;

function TModelCredenciais.&End: iWebCharts;
begin
  Result := FParent;
end;

class function TModelCredenciais.New(Parent: iWebCharts): iModelCredenciais;
begin
  Result := Self.Create(Parent);
end;

end.
