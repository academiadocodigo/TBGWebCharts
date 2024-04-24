unit Generic.List;

interface

uses
  Interfaces,
  Generics.Collections;

type
  TModelGenericList<T : IInterface> = class(TInterfacedObject, iModelGenericList<T>)
    private
      [weak]
      FParent : T;
      FLista : TList<String>;

    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelGenericList<T>;
      function Add(Value : string) : iModelGenericList<T>;
      function List : TList<string>;
      function &End : T;

  end;
implementation

uses
  Injection;

{ TModelGenericList<T> }

function TModelGenericList<T>.Add(Value: string): iModelGenericList<T>;
begin
  Result := Self;
  FLista.Add(Value);
end;

constructor TModelGenericList<T>.Create(Parent: T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FLista := TList<string>.Create;
end;

destructor TModelGenericList<T>.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TModelGenericList<T>.&End: T;
begin
  Result := FParent;
end;

function TModelGenericList<T>.List: TList<string>;
begin
  Result := FLista;
end;

class function TModelGenericList<T>.New(Parent: T): iModelGenericList<T>;
begin
  Result := Self.Create(Parent);
end;

end.
