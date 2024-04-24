unit Injection;

interface

Type
  TInjection = class
    private
    public
      constructor Create;
      destructor Destroy; override;
      class procedure Weak(aInterfaceField: Pointer; const aValue: IInterface);
    end;

implementation

{ TInjection }

constructor TInjection.Create;
begin

end;

destructor TInjection.Destroy;
begin

  inherited;
end;

class procedure TInjection.Weak(aInterfaceField: Pointer;
  const aValue: IInterface);
begin
  PPointer(aInterfaceField)^ := Pointer(aValue);
end;

end.
