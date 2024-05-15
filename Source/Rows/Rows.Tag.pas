unit Rows.Tag;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelHTMLRowsTag = class(TInterfacedObject, IModelHTMLRowsTag)
    private
      [weak]
      FParent : IModelHTMLRows;
      FLista : TList<String>;
    public
      constructor Create(Parent : IModelHTMLRows);
      destructor Destroy; override;
      class function New(Parent : IModelHTMLRows)  : IModelHTMLRowsTag;
      function Add(Value : String) : IModelHTMLRowsTag;
      function &End : IModelHTMLRows;
  end;

implementation

uses
  Injection;

{ TModelHTMLRowsTag }

function TModelHTMLRowsTag.Add(Value: String): IModelHTMLRowsTag;
begin
  Result := Self;
  FLista.Add(Value);
end;

function TModelHTMLRowsTag.&End: IModelHTMLRows;
var
  I: Integer;
begin
  Result := FParent;

  for I := 0 to Pred(FLista.Count) do
    FParent.HTML(FLista.Items[I]);

end;

constructor TModelHTMLRowsTag.Create(Parent : IModelHTMLRows);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FLista := TList<String>.Create;
end;

destructor TModelHTMLRowsTag.Destroy;
begin
  FLista.Free;
  inherited;
end;

class function TModelHTMLRowsTag.New(Parent : IModelHTMLRows)  : IModelHTMLRowsTag;
begin
  Result := Self.Create(Parent);
end;

end.
