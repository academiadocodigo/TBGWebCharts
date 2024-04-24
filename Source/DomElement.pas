unit DomElement;

interface

uses
  Interfaces;

Type
  TModelDomElement = class(TInterfacedObject, iModelDomElement)
  private
    [weak]
    FParent : iModelHTML;
    FId : string;
    FHtml : string;
  public
    constructor Create(Parent : iModelHTML);
    destructor Destroy; override;
    class function New(Parent : iModelHTML) : iModelDomElement;
    function Id(Value : string) : iModelDomElement;
    function Html(Value : string) : iModelDomElement;
    function Update : iModelDOMElement;
    function &End : iModelHTML;
  end;

implementation

uses
  Injection,
  JSCommand,
  System.SysUtils;

{ TModelDomElement }

function TModelDomElement.&End: iModelHTML;
begin
  Result := FParent;
end;

constructor TModelDomElement.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelDomElement.Destroy;
begin

  inherited;
end;

function TModelDomElement.Html(Value: string): iModelDomElement;
begin
  Result := Self;
  FHtml := Value;
end;

function TModelDomElement.Id(Value: string): iModelDomElement;
begin
  Result := Self;
  FId := Value;
end;

class function TModelDomElement.New(Parent : iModelHTML) : iModelDomElement;
begin
  Result := Self.Create(Parent);
end;

function TModelDomElement.Update: iModelDOMElement;
var
  JSCommand : iModelJSCommand;
begin
  if FId = '' then
    raise Exception.Create('ID do elemento não informado.');

  JSCommand := TModelJSCommand.New
    .Command('UpdateDOM')
    .Paramters
      .Add(QuotedStr(FID))
      .Add(QuotedStr(FHtml))
    .&End
    .TestBeforeExecute(true);
  FParent.ExecuteScript(JSCommand);
end;

end.
