unit Table.Footer.Field;

interface

uses
  Interfaces;

type
  TModelTableFooterField = class (TInterfacedObject, iModelTableFooterField)
    private
      [week]
      FParent : iModelTableFooter;
      FFieldName : String;
      FFieldValue : String;
    public
      constructor Create(Parent : iModelTableFooter);
      destructor Destroy; override;
      class function New(Parent : iModelTableFooter) : iModelTableFooterField;
      function FieldName(Value : String) : iModelTableFooterField; overload;
      function FieldValue(Value : String) : iModelTableFooterField; overload;
      function &End : iModelTableFooter;
      function FieldName : String; overload;
      function FieldValue : String; overload;

  end;
implementation

uses
  Injection;

{ TModelTableFooterField }

constructor TModelTableFooterField.Create(Parent: iModelTableFooter);
begin
  TInjection.Weak(@FParent, Parent);
end;

destructor TModelTableFooterField.Destroy;
begin

  inherited;
end;

function TModelTableFooterField.&End: iModelTableFooter;
begin
  FParent.Fields.Add(FFieldName, Self);
  Result := FParent;
end;

function TModelTableFooterField.FieldName(
  Value: String): iModelTableFooterField;
begin
  Result := Self;
  FFieldName := Value;
end;

function TModelTableFooterField.FieldName: String;
begin
  Result := FFieldName;
end;

function TModelTableFooterField.FieldValue(
  Value: String): iModelTableFooterField;
begin
  Result := Self;
  FFieldValue := Value;
end;

function TModelTableFooterField.FieldValue: String;
begin
  Result := FFieldValue;
end;

class function TModelTableFooterField.New(
  Parent: iModelTableFooter): iModelTableFooterField;
begin
  Result := Self.Create(Parent);
end;

end.
