unit Table.Options;

interface

uses
  Interfaces, Injection;

type
  TModelTableOptions = class (TInterfacedObject, iModelTableOption)
    private
      [weak]
      FParent : iModelTable;
      FScrollCollapse : String;
      FResponsive : String;
      FdeferLoading : String;
      FDestroy : String;
      FDisplayStart : String;
      FlengthMenu : String;
      FOrder : String;
      FOrderCellsTop : String;
      FOrderClasses : String;
      FOrderFixed : String;
      FOrderMulti : String;
      FPageLength : String;
      FPagingType : String;
      FRetrieve : String;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableOption;
      function ScrollCollapse(Value : Boolean) : iModelTableOption;
      function Responsive(Value : Boolean) : iModelTableOption;
      function DeferLoading(Value : Integer) : iModelTableOption;
      function OpDestroy(Value : Boolean) : iModelTableOption;
      function DisplayStart(Value : Integer) : iModelTableOption;
      function LengthMenu(Value : String) : iModelTableOption;
      function Order(Value : String) : iModelTableOption;
      function OrderCellsTop(Value : Boolean) : iModelTableOption;
      function OrderClasses(Value : Boolean) : iModelTableOption;
      function OrderFixed(Value : String) : iModelTableOption;
      function OrderMulti(Value : Boolean) : iModelTableOption;
      function PageLength(Value : Integer) : iModelTableOption;
      function PagingType(Value : String) : iModelTableOption;
      function Retrieve(Value : Boolean) : iModelTableOption;
      function Result : String;
      function &End : iModelTable;
  end;

implementation

uses
  System.SysUtils, System.TypInfo;

{ TModelTableOptions }

function TModelTableOptions.&End: iModelTable;
begin
  Result := FParent;
end;

function TModelTableOptions.lengthMenu(Value: String): iModelTableOption;
begin
  Result := Self;
  FlengthMenu := 'lengthMenu: [' + Value + '],';
end;

constructor TModelTableOptions.Create(Parent : iModelTable);
begin
  {$IF RTLVERSION > 27 }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

function TModelTableOptions.deferLoading(Value: Integer): iModelTableOption;
begin
  Result := Self;
  FdeferLoading := 'deferLoading: ' + IntToStr(VAlue) + ',';
end;

destructor TModelTableOptions.Destroy;
begin

  inherited;
end;

function TModelTableOptions.displayStart(Value: Integer): iModelTableOption;
begin
  Result := Self;
  FDisplayStart := 'displayStart: ' + InttoStr(Value) + ',';
end;

class function TModelTableOptions.New(Parent : iModelTable) : iModelTableOption;
begin
  Result := Self.Create(Parent);
end;

function TModelTableOptions.OpDestroy(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FDestroy := 'destroy: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableOptions.PageLength(Value: Integer): iModelTableOption;
begin
  Result := self;
  FPageLength := 'pageLength: ' + IntToStr(Value) + ',';
end;

function TModelTableOptions.Order(Value : String) : iModelTableOption;
begin
  Result := Self;
  FOrder := 'order: ['+ Value +'],';
end;

function TModelTableOptions.OrderCellsTop(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FOrderCellsTop := 'orderCellsTop: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableOptions.OrderClasses(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FOrderClasses := 'orderClasses: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableOptions.OrderFixed(Value: String): iModelTableOption;
begin
  Result := Self;
  FOrderFixed := 'orderFixed: [' + Value + '],';
end;

function TModelTableOptions.OrderMulti(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FOrderMulti := 'orderMulti: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableOptions.PagingType(Value: String): iModelTableOption;
begin
  Result := Self;
  FPagingType := 'pagingType: ' + QuotedStr(Value) +',';
end;

function TModelTableOptions.Responsive(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FResponsive := 'responsive: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableOptions.Result: String;
begin
  Result := '';
  Result := Result + FScrollCollapse;
  Result := Result + FResponsive;
  Result := Result + FDeferLoading;
  Result := Result + FDestroy;
  Result := Result + FDisplayStart;
  Result := Result + FLengthMenu;
  Result := Result + FOrder;
  Result := Result + FOrderCellsTop;
  Result := Result + FOrderClasses;
  Result := Result + FOrderFixed;
  Result := Result + FOrderMulti;
  Result := Result + FPageLength;
  Result := Result + FPagingType;
  Result := Result + FRetrieve;
end;

function TModelTableOptions.Retrieve(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FRetrieve := 'retrieve: ' + LowerCase(BoolToStr(Value,True)) +',';
end;

function TModelTableOptions.ScrollCollapse(Value: Boolean): iModelTableOption;
begin
  Result := Self;
  FScrollCollapse := 'scrollCollapse : ' + LowerCase(BoolToStr(Value,True)) +',';
end;

end.
