unit Image.Classes;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelImageClass = class(TInterfacedObject, iModelImageClass)
    private
      [weak]
      FParent : iModelImage;
      FList : TList<String>;
    public
      constructor Create(Parent : iModelImage);
      destructor Destroy; override;
      class function New(Parent : iModelImage)  : iModelImageClass;
      function imgFluid : iModelImageClass;
      function imgThumbnail : iModelImageClass;
      function FloatLeft : iModelImageClass;
      function FloatRight : iModelImageClass;
      function MxAuto : iModelImageClass;
      function DBlock : iModelImageClass;
      function rounded : iModelImageClass;
      function &End : iModelImage;
      function ResultClass : String;
  end;

implementation

uses
  SysUtils, Injection;

{ TModelImageClass }

function TModelImageClass.&End: iModelImage;
begin
  Result := FParent;
end;

constructor TModelImageClass.Create(Parent : iModelImage);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FList := TList<String>.Create;
end;

function TModelImageClass.DBlock: iModelImageClass;
begin
  Result := Self;
  FList.Add('d-block');
end;

destructor TModelImageClass.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TModelImageClass.imgFluid: iModelImageClass;
begin
  Result := Self;
  FList.Add('img-fluid');
end;

function TModelImageClass.imgThumbnail: iModelImageClass;
begin
  Result := Self;
  FList.Add('img-thumbnail');
end;

class function TModelImageClass.New(Parent : iModelImage)  : iModelImageClass;
begin
  Result := Self.Create(Parent);
end;

function TModelImageClass.ResultClass: String;
var
  I: Integer;
begin
  for I := 0 to Pred(FList.Count) do
    Result := Result + ' ' + FList[I];
end;

function TModelImageClass.rounded: iModelImageClass;
begin
  Result := Self;
  FList.Add('rounded');
end;

function TModelImageClass.FloatLeft: iModelImageClass;
begin
  Result := Self;
  FList.Add('float-left');
end;

function TModelImageClass.FloatRight: iModelImageClass;
begin
  Result := Self;
  FList.Add('float-right');
end;

function TModelImageClass.MxAuto: iModelImageClass;
begin
  Result := Self;
  FList.Add('mx-auto');
end;

end.
