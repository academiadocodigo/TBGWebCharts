unit Rows.Divv;
interface
uses
  Interfaces,
  Generics.Collections,
  SysUtils;
Type
  TModelHTMLRowsDiv = class(TInterfacedObject, IModelHTMLRowsDiv)
    private
      [weak]
      FParent : IModelHTMLRows;
      FID : string;
      FLista : TList<String>;
      FColSpan : String;
    public
      constructor Create(Parent : IModelHTMLRows);
      destructor Destroy; override;
      class function New(Parent : IModelHTMLRows)  : IModelHTMLRowsDiv;
      function Add(Value : String) : IModelHTMLRowsDiv;
      function ColSpan(Value : Integer) : IModelHTMLRowsDiv;
      function ID(Value : string) : IModelHTMLRowsDiv;
      function &End : IModelHTMLRows;
  end;
implementation
uses
  Injection;
{ TModelHTMLRowsDiv }
function TModelHTMLRowsDiv.Add(Value: String): IModelHTMLRowsDiv;
begin
  Result := Self;
  FLista.Add(Value);
end;
function TModelHTMLRowsDiv.&End: IModelHTMLRows;
var
  I: Integer;
begin
  Result := FParent;
  FParent.HTML('<div' + FID + FColSpan + '>');
  for I := 0 to Pred(FLista.Count) do
    FParent.HTML(FLista.Items[I]);
  FParent.HTML('</div>');
end;
function TModelHTMLRowsDiv.ID(Value: string): IModelHTMLRowsDiv;
begin
  Result := Self;
  FID := Format(' id="%s"', [Value]);
end;

function TModelHTMLRowsDiv.ColSpan(Value: Integer): IModelHTMLRowsDiv;
begin
  Result := Self;
  FColSpan := Format(' class="col-sm-%d"', [Value]);
end;
constructor TModelHTMLRowsDiv.Create(Parent : IModelHTMLRows);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FLista := TList<String>.Create;
end;
destructor TModelHTMLRowsDiv.Destroy;
begin
  FLista.Free;
  inherited;
end;
class function TModelHTMLRowsDiv.New(Parent : IModelHTMLRows)  : IModelHTMLRowsDiv;
begin
  Result := Self.Create(Parent);
end;
end.
