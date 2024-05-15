unit ListGroup.Classes;

interface

uses
  Interfaces,
  Data.DB;

type
  TModelListGroupClass = class(TInterfacedObject, iModelListGroupClass)
    private
      [weak]
      FParent : iModelListGroup;
      FTagIn : String;
      FElementIn : String;
      FElementOut : String;
      FClass : String;
    public
      constructor Create(Parent : iModelListGroup);
      destructor Destroy; override;
      class function New(Parent : iModelListGroup) : iModelListGroupClass;
      function Basic : iModelListGroupClass;
      function Flush : iModelListGroupClass;
      function Action : iModelListGroupClass;
      function Horizontal : iModelListGroupClass;
      function &End : iModelListGroup;
      function TagIn : String;
      function ElementIn : String;
      function ElementOut : String;
      function ClassType : String;

  end;
implementation

uses
  Injection,
  Generic.DataSet;

{ TListGroupClass }

function TModelListGroupClass.Action: iModelListGroupClass;
begin
  Result := Self;
  FElementIn := '<div class="list-group">';
  FTagIn := 'a';
  FClass := 'list-group-item list-group-item-action';
  FElementOut := '</div>';
end;

function TModelListGroupClass.Basic: iModelListGroupClass;
begin
  Result := Self;
  FElementIn := '<ul class="list-group">';
  FTagIn := 'li';
  FClass := 'list-group-item';
  FElementOut := '</ul>';
end;

function TModelListGroupClass.ClassType: String;
begin
  Result := FClass;
end;

constructor TModelListGroupClass.Create(Parent: iModelListGroup);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelListGroupClass.Destroy;
begin

  inherited;
end;

function TModelListGroupClass.ElementIn: String;
begin
  Result := FElementIn
end;

function TModelListGroupClass.ElementOut: String;
begin
  Result := FElementOut
end;

function TModelListGroupClass.&End: iModelListGroup;
begin
  Result := FParent;
end;

function TModelListGroupClass.Flush: iModelListGroupClass;
begin
  Result := Self;
  FElementIn := '<ul class="list-group list-group-flush">';
  FTagIn := 'li';
  FClass := 'list-group-item';
  FElementOut := '</ul>';
end;

function TModelListGroupClass.Horizontal: iModelListGroupClass;
begin
  Result := Self;
  FElementIn := '<ul class="list-group list-group-horizontal">';
  FTagIn := 'li';
  FClass := 'list-group-item';
  FElementOut := '</ul>';
end;

class function TModelListGroupClass.New(Parent: iModelListGroup): iModelListGroupClass;
begin
  Result := Self.Create(Parent);
end;

function TModelListGroupClass.TagIn: String;
begin
  Result := FTagIn;
end;

end.
