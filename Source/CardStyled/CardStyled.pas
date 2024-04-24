unit CardStyled;

interface

uses
  Interfaces, Charts.Types;

Type
  TModelHTMLCardStyled = class(TInterfacedObject, iModelCardStyled)
  private
    [weak]
    FParent : iModelHTML;
    FCardStyled : iModelCardStyledGeneric;
  public
    constructor Create(Parent : iModelHTML);
    destructor Destroy; override;
    class function New(Parent : iModelHTML) : iModelCardStyled;
    function CardType(Value : TTypeCardStyled) : iModelCardStyledGeneric;
    function &End : iModelHTML;
  end;

implementation

uses
  Injection,
  CardStyled.IconRight, CardStyled.IconLeft, CardStyled.IconBackground;

{ TModelHTMLCardStyle }

function TModelHTMLCardStyled.CardType(
  Value: TTypeCardStyled): iModelCardStyledGeneric;
begin
  case Value of
    CardStyledIconRight : FCardStyled := TModelCardStyledIconRight.New(Self);
    CardStyledIconLeft : FCardStyled := TModelCardStyledIconLeft.New(Self);
    CardStyledIconBackground : FCardStyled := TModelCardStyledIconBackground.New(Self);
  end;
  Result := FCardStyled;
end;

function TModelHTMLCardStyled.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML(FCardStyled.HTML)
end;

constructor TModelHTMLCardStyled.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelHTMLCardStyled.Destroy;
begin

  inherited;
end;

class function TModelHTMLCardStyled.New(Parent : iModelHTML) : iModelCardStyled;
begin
  Result := Self.Create(Parent);
end;

end.
