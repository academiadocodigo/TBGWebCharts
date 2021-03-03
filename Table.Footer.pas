unit Table.Footer;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelTableFooter = class(TInterfacedObject, iModelTableFooter)
    private
      [weak]
      FParent : iModelTableDataSet;
      FDisplayLabel : String;
      FFields : TDictionary<string, iModelTableFooterField>;
    public
      constructor Create(Parent : iModelTableDataSet);
      destructor Destroy; override;
      class function New(Parent : iModelTableDataSet) : iModelTableFooter;
      function DisplayLabel(Value : String) : iModelTableFooter; overload;
      function Field : iModelTableFooterField;
      function &End : iModelTableDataSet;
      function DisplayLabel : String; overload;
      function Fields : TDictionary<string, iModelTableFooterField>;

  end;

implementation

uses
  Injection, Table.Footer.Field, System.SysUtils;

{ TModelTableFooter }

constructor TModelTableFooter.Create(Parent: iModelTableDataSet);
begin
  TInjection.Weak(@FParent, Parent);
  FFields := TDictionary<String,iModelTableFooterFIeld>.Create;
  FDisplayLabel := 'Total';
end;

destructor TModelTableFooter.Destroy;
begin
  FreeAndNil(FFields);
  inherited;
end;

function TModelTableFooter.DisplayLabel: String;
begin
  Result := FDisplayLabel;
end;

function TModelTableFooter.DisplayLabel(Value: String): iModelTableFooter;
begin
  Result := Self;
  FDisplayLabel := Value;
end;

function TModelTableFooter.&End: iModelTableDataSet;
begin
  Result :=FParent;
end;

function TModelTableFooter.Field: iModelTableFooterField;
begin
  Result := TModelTableFooterField.New(Self);
end;

function TModelTableFooter.Fields : TDictionary<string, iModelTableFooterField>;
begin
  Result := FFields;
end;

class function TModelTableFooter.New(
  Parent: iModelTableDataSet): iModelTableFooter;
begin
  Result := Self.Create(Parent);
end;

end.
