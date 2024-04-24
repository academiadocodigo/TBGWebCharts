unit Alerts.Classes;

interface

uses
  Interfaces,
  Generics.Collections;

type
  TModelAlertsClass = class(TInterfacedObject, iModelAlertsClass)
    private
      FParent : iModelAlerts;
      FList : TList<String>;

    public
      Constructor Create(Parent : IModelAlerts);
      Destructor Destroy; override;
      class function New(Parent : iModelAlerts) : iModelAlertsClass;
      function primary : iModelAlertsClass;
      function secondary : iModelAlertsClass;
      function success : iModelAlertsClass;
      function danger : iModelAlertsClass;
      function warning : iModelAlertsClass;
      function info : iModelAlertsClass;
      function light : iModelAlertsClass;
      function dark : iModelAlertsClass;
      function ResultClass : String;
      function &End : iModelAlerts;
  end;

implementation

uses
  Injection, System.SysUtils;

{ TModelAlertsClass }

constructor TModelAlertsClass.Create(Parent: IModelAlerts);
begin
  TInjection.Weak(@FParent, Parent);
  FList := TList<String>.Create;
end;

function TModelAlertsClass.danger: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-danger');
end;

function TModelAlertsClass.dark: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-dark');
end;

destructor TModelAlertsClass.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TModelAlertsClass.&End: iModelAlerts;
begin
  Result := FParent;
end;

function TModelAlertsClass.info: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-info');
end;

function TModelAlertsClass.light: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-light');
end;

class function TModelAlertsClass.New(Parent: iModelAlerts): iModelAlertsClass;
begin
  Result := Self.Create(Parent);
end;

function TModelAlertsClass.primary: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-primary');
end;

function TModelAlertsClass.ResultClass: String;
var
  I: Integer;
begin
  Result := 'alert alert';
  for I := 0 to Pred(FList.Count) do
    Result := Result + FList[I];
end;

function TModelAlertsClass.secondary: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-secondary');
end;

function TModelAlertsClass.success: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-success');
end;

function TModelAlertsClass.warning: iModelAlertsClass;
begin
  Result := Self;
  FList.Add('-warning');
end;

end.
