unit Model.HTML.Rows;

interface

uses
  Model.Interfaces;

Type
  TModelHTMLRows = class(TInterfacedObject, IModelHTMLRows)
    private
      [weak]
      FParent : IModelHTML;
      FRowsTitle : iModelHTMLRowsTitle;
      FRowTag : IModelHTMLRowsTag;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : IModelHTMLRows;
      function Title : iModelHTMLRowsTitle;
      function &End : iModelHTML;
      function HTML(Value : String) : IModelHTMLRows; overload;
      function HTML : String; overload;
      function Tag : iModelHTMLRowsTag;
      function _Div : IModelHTMLRowsDiv;
  end;

implementation

uses
  Model.HTML.Rows.Title, Model.HTML.Rows.Tag, Model.HTML.Rows.Divv;

{ TModelHTMLRows }

function TModelHTMLRows.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML('</div>');
end;

function TModelHTMLRows.HTML: String;
begin
  Result := FParent.HTML;
end;

function TModelHTMLRows.HTML(Value: String): IModelHTMLRows;
begin
  Result := Self;
  FParent.HTML(Value);
end;

constructor TModelHTMLRows.Create(Parent : IModelHTML);
begin
  FParent := Parent;
  FParent.HTML('<div class="row">');
end;

destructor TModelHTMLRows.Destroy;
begin

  inherited;
end;

class function TModelHTMLRows.New(Parent : IModelHTML) : IModelHTMLRows;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLRows.Tag: iModelHTMLRowsTag;
begin
  FRowTag :=  TModelHTMLRowsTag.New(Self);
  Result := FRowTag;
end;

function TModelHTMLRows.Title: iModelHTMLRowsTitle;
begin
  FRowsTitle := TModelHTMLRowsTitle.New(Self);
  Result := FRowsTitle;
end;

function TModelHTMLRows._Div: IModelHTMLRowsDiv;
begin
  Result := TModelHTMLRowsDiv.New(Self);
end;

end.
