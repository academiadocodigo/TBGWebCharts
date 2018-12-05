unit Cards;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelCards = class(TInterfacedObject, iModelCards)
    private
      [weak]
      FParent : iModelHtml;
      FFieldHearder : String;
      FFieldTitle : String;
      FFieldBody : String;
      FColors : iModelColors<iModelCards>;
      FDataSet : TList<iModelCardsDataSet>;
      FColSpan : Integer;
    public
      constructor Create(Value : iModelHTML);
      destructor Destroy; override;
      class function New(Value : iModelHTML) : iModelCards;
      function Colors : iModelColors<iModelCards>;
      function DataSet : iModelCardsDataSet;
      function FieldHeader(Value : String) : iModelCards; overload;
      function FieldTitle(Value : String) : iModelCards; overload;
      function FieldBody(Value : String) : iModelCards; overload;
      function FieldHeader : String; overload;
      function FieldTitle : String; overload;
      function FieldBody : String; overload;
      function ColSpan(Value : Integer) : iModelCards; overload;
      function ColSpan : Integer; overload;
      function &End : iModelHTML;
  end;

implementation

uses
  Color, Cards.DataSet, SysUtils, Injection;

{ TModelCards  }

function TModelCards.&End: iModelHTML;
var
  I: Integer;
begin
  Result := FParent;
  for I := 0 to Pred(FDataSet.Count) do
    FParent.HTML(FDataSet[I].ResultScript);
end;

function TModelCards.Colors: iModelColors<iModelCards>;
begin
  Result := FColors;
end;

function TModelCards.ColSpan: Integer;
begin
  Result := FColSpan;
end;

function TModelCards.ColSpan(Value: Integer): iModelCards;
begin
  Result := Self;
  FColSpan := Value;
end;

constructor TModelCards.Create(Value : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Value);
  {$ELSE}
    FParent := Value;
  {$IFEND}
  FColors := TModelColor<iModelCards>.New(Self);
  FDataSet := TList<iModelCardsDataSet>.Create;
end;

function TModelCards.DataSet: iModelCardsDataSet;
begin
  FDataSet.Add(TModelCardsDataSet.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

destructor TModelCards.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

function TModelCards.FieldBody(Value: String): iModelCards;
begin
  Result := Self;
  FFieldBody := Value;
end;

function TModelCards.FieldHeader(Value: String): iModelCards;
begin
  Result := Self;
  FFieldHearder := Value;
end;

function TModelCards.FieldTitle(Value: String): iModelCards;
begin
  Result := Self;
  FFieldTitle := Value;
end;

class function TModelCards.New(Value : iModelHTML) : iModelCards;
begin
  Result := Self.Create(Value);
end;

function TModelCards.FieldBody: String;
begin
  Result := FFieldBody;
end;

function TModelCards.FieldHeader: String;
begin
  Result := FFieldHearder;
end;

function TModelCards.FieldTitle: String;
begin
  Result := FFieldTitle;
end;

end.
