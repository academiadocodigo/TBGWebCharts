unit Cards.DataSet;

interface

uses
  Interfaces, DB;

Type
  TModelCardsDataSet = class(TInterfacedObject, iModelCardsDataSet)
    private
      [weak]
      FParent : iModelCards;
      FDataSet : TDataSet;
    public
      constructor Create(Parent : iModelCards);
      destructor Destroy; override;
      class function New(Parent : iModelCards) : iModelCardsDataSet;
      function DataSet (Value : TDataSet) : iModelCardsDataSet;
      function ResultScript : String;
      function &End : iModelCards;
  end;

implementation

uses
  SysUtils, Injection;

{ TModelCardsDataSet  }

function TModelCardsDataSet.&End: iModelCards;
begin
  Result := FParent;
end;

constructor TModelCardsDataSet.Create(Parent : iModelCards);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

function TModelCardsDataSet.DataSet(Value: TDataSet): iModelCardsDataSet;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TModelCardsDataSet.Destroy;
begin

  inherited;
end;

class function TModelCardsDataSet.New(Parent : iModelCards) : iModelCardsDataSet;
begin
  Result := Self.Create(Parent);
end;

function TModelCardsDataSet.ResultScript: String;
begin
  Result := Result + '<div class="row">';
  FDataSet.First;
  while not FDataSet.Eof do
  begin
    Result := Result + '<div class="col-sm-'+IntToStr(FParent.ColSpan)+'">';
    Result := Result + '<div class="card text-white bg-'+FParent.Colors.Result+' mb-3">';
    Result := Result + '<div class="card-header">'+FDataSet.FieldByName(FParent.FieldHeader).AsString+'</div>';
    Result := Result + '<div class="card-body">';
    Result := Result + '<h5 class="card-title">'+FDataSet.FieldByName(FParent.FieldTitle).AsString+'</h5>';
    Result := Result + '<p class="card-text">'+FDataSet.FieldByName(FParent.FieldBody).AsString+'</p>';
    Result := Result + '</div>';
    Result := Result + '</div>';
    Result := Result + '</div>';
    FDataSet.Next;
  end;
  Result := Result + '</div>';

end;

end.
