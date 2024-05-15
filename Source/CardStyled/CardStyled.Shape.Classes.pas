unit CardStyled.Shape.Classes;

interface

uses
  Interfaces,
  Generics.Collections;

Type
  TModelCardStyledShapeClasses = class(TInterfacedObject, iModelCardStyledShapeClasses)
  private
    [weak]
    FParent : iModelCardStyledShape;
    FClasses : TList<String>;
  public
    constructor Create(Parent : iModelCardStyledShape);
    destructor Destroy; override;
    class function New(Parent : iModelCardStyledShape) : iModelCardStyledShapeClasses;
    function ResultShapeClass : String;
    function RoundedCircle : iModelCardStyledShapeClasses;
    function Rounded : iModelCardStyledShapeClasses;
    function Shadow : iModelCardStyledShapeClasses;
    function &End : iModelCardStyledShape;
  end;

implementation

uses
  Injection,
  System.SysUtils;

{ TModelCardStyledShapeClasses }

function TModelCardStyledShapeClasses.&End: iModelCardStyledShape;
begin
  Result := FParent;
end;

constructor TModelCardStyledShapeClasses.Create(Parent : iModelCardStyledShape);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FClasses := Tlist<string>.Create;
end;

destructor TModelCardStyledShapeClasses.Destroy;
begin
  FClasses.Free;
  inherited;
end;

class function TModelCardStyledShapeClasses.New(Parent : iModelCardStyledShape) : iModelCardStyledShapeClasses;
begin
  Result := Self.Create(Parent);
end;

function TModelCardStyledShapeClasses.ResultShapeClass: String;
var
  I : Integer;
begin
  if FClasses.Count > 0 then
  begin
    for I := 0 to Pred(FClasses.Count) do
      Result := Result + FClasses.Items[I] + ' ';
    Result := Format('class="%s"', [Trim(Result)]);
  end;
end;

function TModelCardStyledShapeClasses.Rounded: iModelCardStyledShapeClasses;
begin
  Result := Self;
  FClasses.Add('rounded');
end;

function TModelCardStyledShapeClasses.RoundedCircle: iModelCardStyledShapeClasses;
begin
  Result := Self;
  FClasses.Add('rounded-circle');
end;

function TModelCardStyledShapeClasses.Shadow: iModelCardStyledShapeClasses;
begin
  Result := Self;
  FClasses.Add('shadow');
end;

end.
