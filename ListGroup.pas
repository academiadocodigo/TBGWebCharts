unit ListGroup;

interface

uses
  Interfaces;

type
  TModelListGroup = class(TInterfacedObject, iModelListGroup)
    private
      [weak]
      FParent : iModelHTML;
      FListGroupClass : iModelListGroupClass;
      FDataSet : iModelGenericDataSet<iModelListGroup>;
      FData : String;
      FColorBadge : String;
      procedure generatedData;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelListGroup;
      function ListGroupType : iModelListGroupClass;
      function DataSet : iModelGenericDataSet<iModelListGroup>;
      function &End : iModelHTML;
 end;
implementation

uses
  ListGroup.Classes,
  Injection,
  Generic.DataSet;

{ TListGroup }

constructor TModelListGroup.Create(Parent: iModelHTML);
begin
  FColorBadge := 'primary';
  TInjection.Weak(@FParent, Parent);
end;

function TModelListGroup.DataSet: iModelGenericDataSet<iModelListGroup>;
begin
  FDataSet := TModelGenericDataset<iModelListGroup>.New(Self);
  Result := FDataSet;
end;

destructor TModelListGroup.Destroy;
begin

  inherited;
end;

function TModelListGroup.&End: iModelHTML;
begin
  Result := FParent;
  generatedData;
  FParent.HTML(FData);
end;

procedure TModelListGroup.generatedData;
var
  I: Integer;
  _MethodName : string;
  Badge : string;
  ClassTypeComplement : string;
begin
  FDataSet.DataSet.First;
  for I := 0 to Pred(FDataSet.DataSet.RecordCount) do
  begin
    if FDataSet.ValueName <> '' then
    begin
      ClassTypeComplement := ' d-flex justify-content-between align-items-center';
      if  FDataSet.RGBName <> '' then
        FColorBadge := FDataSet.DataSet.FieldByName(FDataSet.RGBName).AsString;
      Badge := '<span class="badge badge-' + FColorBadge + ' badge-pill">'
      + FDataSet.DataSet.FieldByName(FDataSet.ValueName).AsString + '</span>';
    end;
    if FDataSet.CallbackLink.TryGetValue(FDataSet.LabelName, _MethodName) then
      FData := FData + '<a class="' + FListGroupClass.ClassType + ClassTypeComplement
      + '" href="ActionCallBackJS:'+_MethodName+'('
      + FDataSet.DataSet.FieldByName(FDataSet.LabelName).AsString + ')">'
      + FDataSet.DataSet.FieldByName(FDataSet.LabelName).AsString + Badge + '</a>'
    else
      FData := FData + '<' + FListGroupClass.TagIn + ' class="' + FListGroupClass.ClassType
      + ClassTypeComplement + '">' + FDataSet.DataSet.FieldByName(FDataSet.LabelName).AsString
      + Badge + '</' + FListGroupClass.TagIn + '>';
    FDataSet.DataSet.Next;
  end;
  FData := FListGroupClass.ElementIn + FData + FListGroupClass.ElementOut;
end;

function TModelListGroup.ListGroupType : iModelListGroupClass;
begin
  FListGroupClass := TModelListGroupClass.New(self);
  Result := FListGroupClass;
end;

class function TModelListGroup.New(Parent: IModelHTML): iModelListGroup;
begin
  Result := self.Create(Parent);
end;

end.
