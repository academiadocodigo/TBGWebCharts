unit Table.Features;

interface

uses
  Interfaces,
  Injection;

type
  TModelTableFeatures = class (TInterfacedObject, iModelTableFeatures)
    private
      FParent : iModelTable;
      FAutoWidth : String;
      FDeferRender : String;
      FInfo : String;
      FLengthChange : String;
      FOrdering : String;
      FPaging : String;
      FProcessing : String;
      FScrollX : String;
      FScrolly : String;
      FSearching : String;
      FServerSide : String;
      FStateSave : String;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableFeatures;
      function AutoWidth(Value : Boolean) : iModelTableFeatures;
      function deferRender(Value : Boolean) : iModelTableFeatures;
      function Info(Value : Boolean) : iModelTableFeatures;
      function LengthChange(Value : Boolean) : iModelTableFeatures;
      function Ordering(Value : Boolean) : iModelTableFeatures;
      function Paging(Value : Boolean) : iModelTableFeatures;
      function Processing(Value : Boolean) : iModelTableFeatures;
      function ScrollX(Value : Boolean) : iModelTableFeatures;
      function ScrollY(Value : Integer) : iModelTableFeatures;
      function Searching(Value : Boolean) : iModelTableFeatures;
      function ServerSide(Value : Boolean) : iModelTableFeatures;
      function StateSave(Value : Boolean) : iModelTableFeatures;
      function Result : String;
      function &End : iModelTable;
  end;

implementation

uses
  System.SysUtils;

{ TModelTableFeatures }

function TModelTableFeatures.AutoWidth(
  Value: Boolean): iModelTableFeatures;
begin
  Result := self;
  FAutoWidth := 'autoWidth: '+ LowerCase(BoolToStr(Value,True))+',';
end;

constructor TModelTableFeatures.Create(Parent : iModelTable);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

function TModelTableFeatures.deferRender(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FDeferRender := 'deferRender: '+ LowerCase(BoolToStr(Value,True))+',';
end;

destructor TModelTableFeatures.Destroy;
begin

  inherited;
end;

function TModelTableFeatures.&End : iModelTable;
begin
  Result := FParent;
end;

function TModelTableFeatures.Info(
  Value: Boolean): iModelTableFeatures;
begin
  Result := self;
  FInfo := 'info: '+ LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.LengthChange(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FLengthChange := 'lengthChange: '+ LowerCase(BoolToStr(Value,True))+',';
end;

class function TModelTableFeatures.New(Parent : iModelTable) : iModelTableFeatures;
begin
  Result := Self.Create(Parent);
end;

function TModelTableFeatures.Ordering(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FOrdering := 'ordering: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.Paging(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FPaging := 'paging : ' + LowerCase(BoolToStr(Value,True)) +',';
end;

function TModelTableFeatures.Processing(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FProcessing := 'processing: ' + LowerCase(BoolToStr(Value,True)) +',';
end;

function TModelTableFeatures.Result: String;
begin
  Result := '';
  Result := Result + FAutoWidth;
  Result := Result + FDeferRender;
  Result := Result + FInfo;
  Result := Result + FLengthChange;
  Result := Result + FOrdering;
  Result := Result + FPaging;
  Result := Result + FProcessing;
  Result := Result + FScrollX;
  Result := Result + FScrolly;
  Result := Result + FSearching;
  Result := Result + FStateSave;
end;

function TModelTableFeatures.ScrollX(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FScrollX := 'scrollX : ' + LowerCase(BoolToStr(Value,True)) +',';
end;

function TModelTableFeatures.ScrollY(
  Value: Integer): iModelTableFeatures;
begin
  Result := Self;
  FScrolly := 'scrollY: ' + IntToStr(Value)+',';
end;

function TModelTableFeatures.Searching(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FSearching := 'searching: ' + LowerCase(BoolToStr(Value,True)) +',';
end;

function TModelTableFeatures.ServerSide(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FServerSide := 'serverSide: ' + LowerCase(BoolToStr(Value,True)) +',';
end;

function TModelTableFeatures.StateSave(
  Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FStateSave := 'stateSave: ' + LowerCase(BoolToStr(Value,True)) +',';
  FStateSave := FStateSave +
  'stateSaveCallback: function(settings,data) { '+
  '    localStorage.setItem( '+QuotedStr('DataTables_')+' + settings.sInstance, JSON.stringify(data) ) '+
  '  }, '+
  'stateLoadCallback: function(settings) { '+
  '  return JSON.parse( localStorage.getItem( '+QuotedStr('DataTables_')+' + settings.sInstance ) ) '+
  '  }, ';
end;

end.
