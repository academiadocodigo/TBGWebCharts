unit Image.DataSet;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces, DB, Classes, Generics.Collections;

Type
  TModelImageDataSet = class(TInterfacedObject, iModelImageDataSet)
    private
      [weak]
      FParent : iModelImage;
      FDataSet : TDataSet;
      FField : String;
    public
      constructor Create(Parent : iModelImage);
      destructor Destroy; override;
      class function New(Parent : iModelImage) : iModelImageDataSet;
      function DataSet (Value : TDataSet) : iModelImageDataSet;
      function ResultScript : String;
      function Field(Value : String) : iModelImageDataSet;
      function &End : iModelImage;
  end;

implementation

uses
  SysUtils,
  {$IFDEF HAS_FMX}
      FMX.ExtCtrls,
  {$ELSE}
    {$IF RTLVERSION > 27 }
      VCL.ExtCtrls,
    {$IFEND}
    {$IF RTLVERSION < 28 }
      ExtCtrls,
    {$IFEND}
  {$ENDIF}
  Injection;

{ TModelImageDataSet }

function TModelImageDataSet.&End: iModelImage;
begin
  Result := FParent;
end;

function TModelImageDataSet.Field(Value: String): iModelImageDataSet;
begin
  Result := Self;
  FField := Value;
end;

constructor TModelImageDataSet.Create(Parent : iModelImage);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

function TModelImageDataSet.DataSet(Value: TDataSet): iModelImageDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelImageDataSet.Destroy;
begin
  inherited;
end;

class function TModelImageDataSet.New(Parent : iModelImage) : iModelImageDataSet;
begin
  Result := Self.Create(Parent);
end;

function TModelImageDataSet.ResultScript: String;
var
  I: Integer;
begin
  Result := '';
  FDataSet.First;
  for I := 0 to Pred(FDataSet.RecordCount) do
  begin
    Result := Result + '<img class="'+FParent.ImageClass.ResultClass+'" ';
    Result := REsult + 'src="'+FDataSet.FieldByName(FField).AsString+'" ' ;
    Result := Result + 'data-holder-rendered="true">';
    FDataSet.Next;
  end;
end;

end.

