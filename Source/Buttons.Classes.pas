unit Buttons.Classes;

interface

uses
  Interfaces,
  Generics.Collections;

Type
  TModelButtonClass = class(TInterfacedObject, iModelButtonClass)
  private
    FParent : iModelButton;
    FList : TList<String>;
  public
    constructor Create(Parent : iModelButton);
    destructor Destroy; override;
    class function New(Parent : iModelButton): iModelButtonClass;
    function primary: iModelButtonClass;
    function secondary: iModelButtonClass;
    function success: iModelButtonClass;
    function danger: iModelButtonClass;
    function warning: iModelButtonClass;
    function info: iModelButtonClass;
    function light: iModelButtonClass;
    function dark: iModelButtonClass;
    function outline: iModelButtonClass;
    function small: iModelButtonClass;
    function large: iModelButtonClass;
    function block: iModelButtonClass;
    function active: iModelButtonClass;
    function disabled: iModelButtonClass;
    function ResultClass : String;
    function &End: iModelButton;
  end;

implementation

uses
  SysUtils, Injection;

{ TModelButtonClass }

function TModelButtonClass.active: iModelButtonClass;
begin
  Result := Self;
  FList.Add(' active');
end;

function TModelButtonClass.block: iModelButtonClass;
begin
  Result := Self;
  FList.Add(' btn-block');
end;

function TModelButtonClass.&End: iModelButton;
begin
  Result := FParent;
end;

constructor TModelButtonClass.Create(Parent : iModelButton);
begin
  TInjection.Weak(@FParent, Parent);
  FList := TList<String>.Create;
end;

function TModelButtonClass.danger: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-danger');
end;

function TModelButtonClass.dark: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-dark');
end;

destructor TModelButtonClass.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TModelButtonClass.disabled: iModelButtonClass;
begin
  Result := Self;
  FList.Add(' disabled');
end;

function TModelButtonClass.info: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-info');
end;

function TModelButtonClass.large: iModelButtonClass;
begin
  Result := Self;
  FList.Add(' btn-lg');
end;

function TModelButtonClass.light: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-light');
end;

class function TModelButtonClass.New(Parent : iModelButton): iModelButtonClass;
begin
  Result := Self.Create(Parent);
end;

function TModelButtonClass.outline: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-outline');
end;

function TModelButtonClass.primary: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-primary');
end;

function TModelButtonClass.ResultClass: String;
var
  I: Integer;
begin
  Result := 'btn btn';
  for I := 0 to Pred(FList.Count) do
    Result := Result + FList[I];
end;

function TModelButtonClass.secondary: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-secondary');
end;

function TModelButtonClass.small: iModelButtonClass;
begin
  Result := Self;
  FList.Add(' btn-sm');
end;

function TModelButtonClass.success: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-success');
end;

function TModelButtonClass.warning: iModelButtonClass;
begin
  Result := Self;
  FList.Add('-warning');
end;

end.
