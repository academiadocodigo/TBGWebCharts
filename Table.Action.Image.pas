unit Table.Action.Image;

interface

uses
  Interfaces, Classes;

type
  TModelTableActionImage = class(TInterfacedObject, iModelTableActionImage)
    private
      [weak]
      FParent : iModelTableAction;
      FImage : String;
      FWidth : Integer;
      FHeight : Integer;
      FTooltip : String;
      FStyleClass : String;
    public
      constructor Create(Parent : iModelTableAction);
      destructor Destroy; override;
      class function New(Parent : iModelTableAction) : iModelTableActionImage;
      function Image (Value : TCustomMemoryStream) : iModelTableActionImage; overload;
      function Image (Value : String) : iModelTableActionImage; overload;
      function Width (Value : Integer) : iModelTableActionImage; overload;
      function Height (Value : Integer) : iModelTableActionImage; overload;
      function Tooltip (Value : String) : iModelTableActionImage; overload;
      function Image : String; overload;
      function Width : String; overload;
      function Height : String; overload;
      function Tooltip : String overload;
      function StyleClass : String; overload;
      function &End : iModelTableAction;

  end;
implementation

uses
  Injection,
  Utilities.Encoder,
  SysUtils;

{ TModelTableActionImage }

constructor TModelTableActionImage.Create(Parent: iModelTableAction);
begin
  TInjection.Weak(@FParent, Parent);
  FWidth := 25;
  FHeight := 25;
  FStyleClass := 'img_' + IntToStr(Random(100));
end;

destructor TModelTableActionImage.Destroy;
begin

  inherited;
end;

function TModelTableActionImage.&End: iModelTableAction;
begin
  Result := FParent;
end;

function TModelTableActionImage.Height: String;
begin
  Result := 'height: ' + IntToStr(FHeight) + 'px;';
end;

function TModelTableActionImage.Image(Value: String): iModelTableActionImage;
begin
 Result := Self;
 FImage := Value;
end;

function TModelTableActionImage.Height(Value: Integer): iModelTableActionImage;
begin
  Result := Self;
  FHeight := Value;
end;

function TModelTableActionImage.Image(
  Value: TCustomMemoryStream): iModelTableActionImage;
begin
  Result := Self;
  FImage := TUtilitiesEncoder.ImageToBase64URI(Value);
end;

class function TModelTableActionImage.New(
  Parent: iModelTableAction): iModelTableActionImage;
begin
  Result := Self.Create(Parent);
end;

function TModelTableActionImage.StyleClass: String;
begin
  Result := FStyleClass;
end;

function TModelTableActionImage.Tooltip: String;
begin
  Result := FTooltip;
end;

function TModelTableActionImage.Tooltip(Value: String): iModelTableActionImage;
begin
  Result := Self;
  FToolTip := ' title="' + Value + '"';
end;

function TModelTableActionImage.Width: String;
begin
  Result := 'width: ' + IntToStr(FWidth) + 'px;';
end;

function TModelTableActionImage.Width(Value: Integer): iModelTableActionImage;
begin
  Result := Self;
  FWidth := Value;
end;

function TModelTableActionImage.Image: String;
begin
  Result := FImage;
end;

end.
