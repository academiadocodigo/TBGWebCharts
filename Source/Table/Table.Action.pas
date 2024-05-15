unit Table.Action;

interface

uses
  Interfaces;

type
  TModelTableAction = class(TInterfacedObject, iModelTableAction)
    private
      [weak]
      FParent : iModelTableDataSet;
      FHeader : String;
      FImage : iModelTableActionImage;
      FMethodName : String;
      FField : String;
    public
      constructor Create(Parent : iModelTableDataSet);
      destructor Destroy; override;
      class function New(Parent : iModelTableDataSet) : iModelTableAction;
      function ActionHeader (Value : String) : iModelTableAction; overload;
      function Image : iModelTableActionImage; overload;
      function CallbackLink(Field : String; MethodName : String) : iModelTableAction;
      function ActionHeader : String; overload;
      function ImageTag : String; overload;
      function MethodName : String;
      function FieldName : String;
      function ResultStyle : String;
      function &End : iModelTableDataSet;

  end;

implementation

uses
  Injection,
  Table.Action.Image,
  Utilities.Encoder,
  SysUtils;

{ TModelTableAction }

function TModelTableAction.ActionHeader(Value: String): iModelTableAction;
begin
  Result := Self;
  FHeader := Value;
end;

function TModelTableAction.ActionHeader: String;
begin
  Result := FHeader;
end;

function TModelTableAction.CallbackLink(Field,
  MethodName: String): iModelTableAction;
begin
  Result := Self;
  FMethodName := MethodName;
  FField := Field;
end;

constructor TModelTableAction.Create(Parent: iModelTableDataSet);
begin
  TInjection.Weak(@FParent, Parent);
  FImage := TModelTableActionImage.Create(Self);
end;

destructor TModelTableAction.Destroy;
begin
  inherited;
end;

function TModelTableAction.&End: iModelTableDataSet;
begin
  Result := FParent;
end;

function TModelTableAction.FieldName: String;
begin
  Result := FField;
end;

function TModelTableAction.ImageTag: String;
begin
  Result := '<img class= "' + FImage.StyleClass + '" ' + FImage.Tooltip + '/>';
end;

function TModelTableAction.Image: iModelTableActionImage;
begin
  Result:= FImage;
end;

class function TModelTableAction.New(Parent: iModelTableDataSet): iModelTableAction;
begin
  Result := Self.Create(Parent);
end;


function TModelTableAction.ResultStyle: String;
begin
  Result := '.' + FImage.StyleClass + '{' +
    'background: url("' + FImage.Image + '");' +
    'background-size: cover;' +
    'display: block;' +
    'margin-left: auto;' +
    'margin-right: auto;' +
    FImage.Width +
    FImage.Height +
    '}';
end;

function TModelTableAction.MethodName: String;
begin
  Result := FMethodName
end;

end.
