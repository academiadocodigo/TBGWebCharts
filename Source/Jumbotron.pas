unit Jumbotron;

interface

uses
  Interfaces;

type
  TModelJumbotron = class(TInterfacedObject, iModelJumbotron)
    private
      [weak]
      FParent : iModelHTML;
      FTitle : String;
      FDescription : String;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : iModelJumbotron;
      function Title(Value : String) : iModelJumbotron;
      function Description(Value : String) : iModelJumbotron;
      function &End : iModelHTML;

  end;
implementation

{ TModelHTMLJumbotron }

constructor TModelJumbotron.Create(Parent: IModelHTML);
begin
  FParent := Parent;
end;

function TModelJumbotron.Description(Value: String): iModelJumbotron;
begin
  Result := Self;
  FDescription := Value;
end;

destructor TModelJumbotron.Destroy;
begin

  inherited;
end;

function TModelJumbotron.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML('<div class="jumbotron jumbotron-fluid">');
  FParent.HTML('<div class="container">');
  FParent.HTML('<h1 class="display-4">' + FTitle + '</h1>');
  FParent.HTML('<p class="lead">' + FDescription + '</p>');
  FParent.HTML('</div>');
  FParent.HTML('</div>');

end;

class function TModelJumbotron.New(Parent: IModelHTML): iModelJumbotron;
begin
  Result := self.Create(Parent);
end;

function TModelJumbotron.Title(Value: String): iModelJumbotron;
begin
  Result := Self;
  FTitle := Value;
end;

end.
