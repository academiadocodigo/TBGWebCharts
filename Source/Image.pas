unit Image;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelImage = class(TInterfacedObject, iModelImage)
    private
      [weak]
      FParent : iModelHTML;
      FDataSet : TList<iModelImageDataSet>;
      FImageClass : iModelImageClass;
    public
      constructor Create(Parent : iModelHTML);
      destructor Destroy; override;
      class function New(Parent : iModelHTML) : iModelImage;
      function &End : iModelHTML;
      function DataSet : iModelImageDataSet;
      function ImageClass : iModelImageClass;
  end;

implementation

uses
  Injection, SysUtils, Image.DataSet, Image.Classes;

{ TModelImage }

function TModelImage.&End: iModelHTML;
var
  I: Integer;
begin
  Result := FParent;
  for I := 0 to Pred(FDataSet.Count) do
    FParent.HTML(FDataSet[I].ResultScript);
end;

function TModelImage.ImageClass: iModelImageClass;
begin
  Result := FImageClass;
end;

constructor TModelImage.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TList<iModelImageDataSet>.Create;
  FImageClass := TModelImageClass.New(Self);
end;

function TModelImage.DataSet: iModelImageDataSet;
begin
  FDataSet.Add(TModelImageDataSet.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

destructor TModelImage.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

class function TModelImage.New(Parent : iModelHTML) : iModelImage;
begin
  Result := Self.Create(Parent);
end;

end.
