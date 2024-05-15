unit CardStyled.Text;

interface

uses
  Interfaces;

Type
  TModelCardStyledText = class(TInterfacedObject, iModelCardStyledText)
  private
    FParent : iModelCardStyledGeneric;
    FText : String;
    FStyle : iModelGenericStyle<iModelCardStyledText>;
  public
    constructor Create(Parent : iModelCardStyledGeneric);
    destructor Destroy; override;
    class function New(Parent : iModelCardStyledGeneric) : iModelCardStyledText;
    function Text(Value : String) : iModelCardStyledText; overload;
    function Text : String; overload;
    function Style : iModelGenericStyle<iModelCardStyledText>;
    function &End : iModelCardStyledGeneric;
  end;

implementation
uses
  Injection,
  Generic.Style;

{ TModelCardStyledText }

function TModelCardStyledText.&End: iModelCardStyledGeneric;
begin
  Result := FParent;
end;

constructor TModelCardStyledText.Create(Parent : iModelCardStyledGeneric);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FStyle := TModelGenericStyle<iModelCardStyledText>.New(Self);
end;

destructor TModelCardStyledText.Destroy;
begin

  inherited;
end;

class function TModelCardStyledText.New(Parent : iModelCardStyledGeneric) : iModelCardStyledText;
begin
  Result := Self.Create(Parent);
end;

function TModelCardStyledText.Style: iModelGenericStyle<iModelCardStyledText>;
begin
  Result := FStyle;
end;

function TModelCardStyledText.Text(Value: String): iModelCardStyledText;
begin
  Result := Self;
  FText := Value;
end;

function TModelCardStyledText.Text: String;
begin
  Result := FText;
end;

end.
