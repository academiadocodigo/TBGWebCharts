unit Table.Data;

interface

uses
  interfaces,
  injection;

type
  TModelTableData = class (TInterfacedObject, iModelTableData)
    private
      FParent : iModelTable;
      FServer : String;
      FColumns : String;
      FJType : String;
      FDataSrc : String;
      FHeadTable : String;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableData;
      function Server(Value : String) : iModelTableData;
      function Columns(Value : Array of String) : iModelTableData;
      function JType(Value : String) : iModelTableData;
      function DataSrc(Value : String) : iModelTableData;
      function ResultTable : String;
      function Result : String;
      function &End : iModelTable;
  end;

implementation

uses
  System.SysUtils;

{ TModelTableData }

function TModelTableData.&End: iModelTable;
begin
  Result := FParent;
end;

function TModelTableData.Columns(Value: array of String): iModelTableData;
var
  vData:String;
  I: Integer;
begin
  Result := Self;
  vData:='';
  FHeadTable:= '<thead><tr>';
  for I := Low(Value) to High(Value) do
  begin
    FHeadTable := FHeadTable + '<th>'+Value[i]+'</th>';
    if vData='' then
       vData:= vData + '{ data: '+QuotedStr(Value[i])+'}'
    else
       vData:= vData + ',{ data: '+QuotedStr(Value[i])+'}';
  end;
  FHeadTable := FHeadTable + '</tr></thead>';
  FColumns := 'columns: ['+vData+']';
end;

function TModelTableData.JType(Value: String): iModelTableData;
begin
  Result := Self;
  FJType := 'type: ' + Value;
end;

constructor TModelTableData.Create(Parent : iModelTable);
begin
  {$IF RTLVERSION > 27 }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FColumns:='';
end;

function TModelTableData.DataSrc(Value: String): iModelTableData;
begin
  Result := self;
  FDataSrc := Value;
end;

destructor TModelTableData.Destroy;
begin

  inherited;
end;

class function TModelTableData.New(Parent : iModelTable) : iModelTableData;
begin
  Result := Self.Create(Parent);
end;

function TModelTableData.Result: String;
begin
  Result := '';
  if FServer<>'' then
  begin
    Result := ',' + FServer;
    Result := Result + ',' + FColumns;
  end;
end;

function TModelTableData.ResultTable: String;
begin
  Result := FHeadTable;
end;

function TModelTableData.Server(Value: String): iModelTableData;
begin
  Result := Self;
  FServer := 'processing: true,ajax: {';
  FServer := FServer + ' url: '+QuotedStr(Value);
  if FJType<>'' then
    FServer := FServer + ',' + FJType;
  FServer := FServer + ',' + 'dataSrc: '+QuotedStr(FDataSrc)+'}';
end;

end.
