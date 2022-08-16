unit Progress.Info.Icon;

interface

uses
  Interfaces;

Type
  TModelProgressInfoIcon = class(TInterfacedObject, iModelProgressInfoIcon)
  private
    [weak]
    FParent : iModelProgressInfo;
    FIcon : string;
    FStyle : iModelGenericStyle<iModelProgressInfoIcon>;
  public
    constructor Create(Parent : iModelProgressInfo);
    destructor Destroy; override;
    class function New(Parent : iModelProgressInfo) : iModelProgressInfoIcon;
    function Icon(Value : String) : iModelProgressInfoIcon; overload;
    function Icon : String; overload;
    function Positive(Value : Boolean = true) : iModelProgressInfoIcon;
    function Style : iModelGenericStyle<iModelProgressInfoIcon>;
    function Up(Value : Boolean = true) : iModelProgressInfoIcon;
    function &End : iModelProgressInfo;
  end;

implementation

uses
  Injection, Generic.Style;

{ TModelProgressInfoIcon }

function TModelProgressInfoIcon.&End: iModelProgressInfo;
begin
  Result := FParent;
end;

constructor TModelProgressInfoIcon.Create(Parent : iModelProgressInfo);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FStyle := TModelGenericStyle<iModelProgressInfoIcon>.New(Self).MarginLeft(3).VerticalAlign('text-bottom');
end;

destructor TModelProgressInfoIcon.Destroy;
begin

  inherited;
end;

function TModelProgressInfoIcon.Icon(Value: String): iModelProgressInfoIcon;
begin
  Result := Self;
  FIcon := Value;
end;

function TModelProgressInfoIcon.Icon: String;
begin
  Result := FIcon;
end;

class function TModelProgressInfoIcon.New (Parent : iModelProgressInfo) : iModelProgressInfoIcon;
begin
  Result := Self.Create(Parent);
end;

function TModelProgressInfoIcon.Positive(
  Value: Boolean): iModelProgressInfoIcon;
begin
  Result := Self;
  FStyle.Color('#28a745');
  if not Value then
    FStyle.Color('#dc3545');
end;

function TModelProgressInfoIcon.Style: iModelGenericStyle<iModelProgressInfoIcon>;
begin
  Result := FStyle;
end;

function TModelProgressInfoIcon.Up(Value: Boolean): iModelProgressInfoIcon;
begin
  Result := Self;
  FIcon := 'fas fa-caret-up';
  if Not Value then
    FIcon := 'fas fa-caret-down';
end;

end.
