unit CardStyled.Shape;

interface

uses
  Interfaces;

Type
  TModelCardStyledShape = class(TInterfacedObject, iModelCardStyledShape)
  private
    [weak]
    FParent : iModelCardStyledGeneric;
    FColAuto : boolean;
    FShapeClass : iModelCardStyledShapeClasses;
    FStyle : iModelGenericStyle<iModelCardStyledShape>;
    FText : string;
    FIcon : string;
  public
    constructor Create(Parent : iModelCardStyledGeneric);
    destructor Destroy; override;
    class function New(Parent : iModelCardStyledGeneric) : iModelCardStyledShape;
    function ColAuto(Value : boolean) : iModelCardStyledShape;
    function Icon(Value : String) :  iModelCardStyledShape;
    function ResultClass : String;
    function ShapeClass : iModelCardStyledShapeClasses;
    function Style : iModelGenericStyle<iModelCardStyledShape>;
    function Text(Value : String) : iModelCardStyledShape; overload;
    function &End : iModelCardStyledGeneric;
  end;

implementation

uses
  Injection,
  CardStyled.Shape.Classes,
  System.SysUtils, Generic.Style;

{ TModelCardStyledShape }

function TModelCardStyledShape.&End: iModelCardStyledGeneric;
begin
  Result := FParent;
end;

function TModelCardStyledShape.Icon(Value: String): iModelCardStyledShape;
begin
  Result := Self;
  FIcon := format('<i class="%s"></i>', [Value]);
end;

function TModelCardStyledShape.ColAuto(Value: boolean): iModelCardStyledShape;
begin
  Result := Self;
  FColAuto := Value;
end;

constructor TModelCardStyledShape.Create(Parent : iModelCardStyledGeneric);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FColAuto := True;
  FShapeClass := TModelCardStyledShapeClasses.New(Self);
  FStyle := TModelGenericStyle<iModelCardStyledShape>.New(Self);
end;

destructor TModelCardStyledShape.Destroy;
begin

  inherited;
end;

class function TModelCardStyledShape.New(Parent : iModelCardStyledGeneric) : iModelCardStyledShape;
begin
  Result := Self.Create(Parent);
end;

function TModelCardStyledShape.ResultClass: String;
begin
  Result := Format('<div %s %s>%s</div>', [FShapeClass.ResultShapeClass,
      FStyle.ResultStyle, FIcon]);
  if FColAuto then
    Result := Format('<div class="col-auto col">%s</div>', [Result]);
end;

function TModelCardStyledShape.ShapeClass: iModelCardStyledShapeClasses;
begin
  Result := FShapeClass;
end;

function TModelCardStyledShape.Style: iModelGenericStyle<iModelCardStyledShape>;
begin
  Result := FStyle;
end;

function TModelCardStyledShape.Text(Value: String): iModelCardStyledShape;
begin
  Result := Self;
  FText := Value;
end;

end.
