unit Rows;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces;

Type
  TModelHTMLRows = class(TInterfacedObject, IModelHTMLRows)
    private
      [weak]
      FParent : IModelHTML;
      FID : string;
      FDivOpened : Boolean;
      FRowsTitle : iModelHTMLRowsTitle;
      FRowTag : IModelHTMLRowsTag;
      procedure OpenDiv;
    public
      constructor Create(Parent : IModelHTML);
      destructor Destroy; override;
      class function New(Parent : IModelHTML) : IModelHTMLRows;
      function ID(Value : string) : IModelHTMLRows;
      function Title : iModelHTMLRowsTitle;
      function &End : iModelHTML;
      function HTML(Value : String) : IModelHTMLRows; overload;
      function HTML : String; overload;
      function Tag : iModelHTMLRowsTag;
      {$IFDEF FULL}
      function _Div : IModelHTMLRowsDiv;
      function _P : IModelHTMLRowsP;
      {$ENDIF}
  end;

implementation

uses
  Rows.Title,
  {$IFDEF FULL}
  Rows.Divv,
  Rows.P,
  {$ENDIF}
  Rows.Tag,
  Injection,
  System.SysUtils;

{ TModelHTMLRows }

function TModelHTMLRows.&End: iModelHTML;
begin
  Result := FParent;
  OpenDiv;
  FParent.HTML('</div>');
end;

function TModelHTMLRows.HTML: String;
begin
  OpenDiv;
  Result := FParent.HTML;
end;

function TModelHTMLRows.ID(Value: string): IModelHTMLRows;
begin
  Result := Self;
  if Trim(Value) <> '' then
    FID := Format(' id="%s"', [Value]);
  OpenDiv;
end;

function TModelHTMLRows.HTML(Value: String): IModelHTMLRows;
begin
  Result := Self;
  OpenDiv;
  FParent.HTML(Value);
end;

constructor TModelHTMLRows.Create(Parent : IModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelHTMLRows.Destroy;
begin

  inherited;
end;

class function TModelHTMLRows.New(Parent : IModelHTML) : IModelHTMLRows;
begin
  Result := Self.Create(Parent);
end;

procedure TModelHTMLRows.OpenDiv;
begin
  if not FDivOpened then
  begin
    FDivOpened := True;
    FParent.HTML(Format('<div%s class="row">', [FID]));
  end;
end;

function TModelHTMLRows.Tag: iModelHTMLRowsTag;
begin
  OpenDiv;
  FRowTag :=  TModelHTMLRowsTag.New(Self);
  Result := FRowTag;
end;

function TModelHTMLRows.Title: iModelHTMLRowsTitle;
begin
  OpenDiv;
  FRowsTitle := TModelHTMLRowsTitle.New(Self);
  Result := FRowsTitle;
end;

{$IFDEF FULL}
function TModelHTMLRows._Div: IModelHTMLRowsDiv;
begin
  OpenDiv;
  Result := TModelHTMLRowsDiv.New(Self);
end;

function TModelHTMLRows._P : IModelHTMLRowsP;
begin
  OpenDiv;
  Result := TModelHTMLRowsP.New(Self);
end;
{$ENDIF}

end.
