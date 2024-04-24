unit Alerts;

interface

uses
  Interfaces;

type
  TModelAlerts = class(TInterfacedObject, iModelAlerts)
    private
      [weak]
      FParent : iModelHTML;
      FTitle : String;
      FClass : iModelAlertsClass;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelAlerts;
      function Title(Value : String) : iModelAlerts;
      function AlertsClass : iModelAlertsClass;
      function &End : iModelHTML;
  end;
implementation

uses
  Injection,
  Alerts.Classes;

{ TModelHTMLAlerts }

function TModelAlerts.AlertsClass: iModelAlertsClass;
begin
  Result := FClass;
end;

constructor TModelAlerts.Create(Parent: IModelHTML);
begin
  TInjection.Weak(@FParent, Parent);
  FClass := TModelAlertsClass.New(Self);
end;

destructor TModelAlerts.Destroy;
begin

  inherited;
end;

function TModelAlerts.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML('<div class="' + FClass.ResultClass + '" role="alert">');
  FParent.HTML(FTitle);
  FParent.HTML('</div>');
end;

class function TModelAlerts.New(Parent: IModelHTML): iModelAlerts;
begin
  Result := self.Create(Parent);
end;

function TModelAlerts.Title(Value: String): iModelAlerts;
begin
  Result := Self;
  FTitle := Value;
end;

end.
