unit Button;

interface

uses
  Interfaces;

Type
  TModelButton = class(TInterfacedObject, iModelButton)
    private
      FParent : iModelHTML;
      FParam : String;
      FMethod : String;
      FClass : iModelButtonClass;
      FTitle : String;
    public
      constructor Create(Parent : iModelHTML);
      destructor Destroy; override;
      class function New(Parent : iModelHTML) : iModelButton;
      function ButtonClass : iModelButtonClass;
      function CallbackLink(Param : String; Method : String) : iModelButton;
      function Title(Value : String) : iModelButton;
      function &End : iModelHTML;
  end;

implementation

uses
  Injection,
  Buttons.Classes,
  IdCoderMIME;

{ TModelButton }

function TModelButton.ButtonClass: iModelButtonClass;
begin
  Result := FClass;
end;

function TModelButton.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML('<a class="'+ FClass.ResultClass +'" href="ActionCallBackJS:' + FMethod+'(' + TIdEncoderMIME.EncodeString(FParam) + ')">' + FTitle + '</a>')
end;

function TModelButton.CallbackLink(Param, Method: String): iModelButton;
begin
  Result := Self;
  FParam := Param;
  FMethod := Method;
end;

constructor TModelButton.Create(Parent : iModelHTML);
begin
  TInjection.Weak(@FParent, Parent);
  FClass := TModelButtonClass.New(Self);
end;

destructor TModelButton.Destroy;
begin

  inherited;
end;

class function TModelButton.New(Parent : iModelHTML) : iModelButton;
begin
  Result := Self.Create(Parent);
end;

function TModelButton.Title(Value: String): iModelButton;
begin
  Result := Self;
  FTitle := Value;
end;

end.
