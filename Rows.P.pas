unit Rows.P;

interface

uses
  Interfaces, Generics.Collections;

Type
  TModelHTMLRowsP = class(TInterfacedObject, IModelHTMLRowsP)
    private
      FParent : IModelHTMLRows;
      FLista : TList<String>;
      FClass : String;
    public
      constructor Create(Parent : IModelHTMLRows);
      destructor Destroy; override;
      class function New(Parent : IModelHTMLRows) : IModelHTMLRowsP;
      function Add(Value : String) : iModelHTMLRowsP;
      function _Class(Value : String) : IModelHTMLRowsP;
      function &End : IModelHTMLRows;
  end;

implementation

uses
  Injection, SysUtils;

{ TModelHTMLRowsP }

function TModelHTMLRowsP.Add(Value: String): iModelHTMLRowsP;
begin
  Result := Self;
  FLista.Add(Value);
end;

function TModelHTMLRowsP.&End: IModelHTMLRows;
var
  I: Integer;
begin
  Result := FParent;
  FParent.HTML('<p ');
  if not FClass.IsEmpty then
    FParent.HTML('class="' + FClass + '"');
  FParent.HTML(' >');
  for I := 0 to Pred(FLista.Count) do
    FParent.HTML(FLista.Items[I]);
  FParent.HTML('</p>');

end;

constructor TModelHTMLRowsP.Create(Parent : IModelHTMLRows);
begin
  TInjection.Weak(@FParent, Parent);
  FLista := TList<String>.Create;
end;

destructor TModelHTMLRowsP.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

class function TModelHTMLRowsP.New(Parent : IModelHTMLRows) : IModelHTMLRowsP;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLRowsP._Class(Value: String): IModelHTMLRowsP;
begin
  Result := Self;
  FClass := Value;
end;

end.
