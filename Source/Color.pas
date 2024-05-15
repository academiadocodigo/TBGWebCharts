unit Color;

interface

uses
  Interfaces;

Type
  TModelColor<T : IInterface> = class(TInterfacedObject, iModelColors<T>)
    private
      [weak]
      FParent : T;
      FColor : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelColors<T>;
      function Primary : iModelColors<T>;
      function Secondary : iModelColors<T>;
      function Success : iModelColors<T>;
      function Danger : iModelColors<T>;
      function Warning : iModelColors<T>;
      function Info : iModelColors<T>;
      function Light : iModelColors<T>;
      function Dark : iModelColors<T>;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  Injection;

{ TModelColor }

function TModelColor<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelColor<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

function TModelColor<T>.Danger: iModelColors<T>;
begin
  Result := Self;
  FColor := 'danger';
end;

function TModelColor<T>.Dark: iModelColors<T>;
begin
  Result := Self;
  FColor := 'dark';
end;

destructor TModelColor<T>.Destroy;
begin

  inherited;
end;

function TModelColor<T>.Info: iModelColors<T>;
begin
  Result := Self;
  FColor := 'info';
end;

function TModelColor<T>.Light: iModelColors<T>;
begin
  Result := Self;
  FColor := 'light';
end;

class function TModelColor<T>.New(Parent : T): iModelColors<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelColor<T>.Primary: iModelColors<T>;
begin
  Result := Self;
  FColor := 'primary';
end;

function TModelColor<T>.Result : String;
begin
  Result := FColor;
end;

function TModelColor<T>.Secondary: iModelColors<T>;
begin
  Result := Self;
  FColor := 'secondary';
end;

function TModelColor<T>.Success: iModelColors<T>;
begin
  Result := Self;
  FColor := 'success';
end;

function TModelColor<T>.Warning: iModelColors<T>;
begin
  Result := Self;
  FColor := 'warning';
end;

end.
