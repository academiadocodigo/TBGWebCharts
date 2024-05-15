unit Progress.Info.Text;

interface

uses
  Interfaces;

Type
  TModelProgressInfoText = class(TInterfacedObject, iModelProgressInfoText)
  private
    [weak]
    FParent : iModelProgressInfo;
    FStyle : iModelGenericStyle<iModelProgressInfoText>;
    FText : string;
  public
    constructor Create(Parent : iModelProgressInfo);
    destructor Destroy; override;
    class function New(Parent : iModelProgressInfo) : iModelProgressInfoText;
    function Style : iModelGenericStyle<iModelProgressInfoText>;
    function Text(Value : String) : iModelProgressInfoText; overload;
    function Text : String; overload;
    function &End : iModelProgressInfo;
  end;

implementation

uses
  Injection, Generic.Style;

{ TModelProgressInfoText }

function TModelProgressInfoText.&End: iModelProgressInfo;
begin
  Result := FParent;
end;

constructor TModelProgressInfoText.Create(Parent : iModelProgressInfo);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FStyle := TModelGenericStyle<iModelProgressInfoText>.New(Self)
end;

destructor TModelProgressInfoText.Destroy;
begin

  inherited;
end;

class function TModelProgressInfoText.New (Parent : iModelProgressInfo) : iModelProgressInfoText;
begin
  Result := Self.Create(Parent);
end;

function TModelProgressInfoText.Style: iModelGenericStyle<iModelProgressInfoText>;
begin
  Result := FStyle;
end;

function TModelProgressInfoText.Text(Value: String): iModelProgressInfoText;
begin
  Result := Self;
  FText := Value;
end;

function TModelProgressInfoText.Text: String;
begin
  Result := FText;
end;

end.
