unit RichTextEditor.Config.PrintHeader.Divv;
interface

uses
  Interfaces,
  Generics.Collections;

Type
  TModelRichTextEditorConfigPrintHeaderDiv = class(TInterfacedObject, iModelRichTextEditorConfigPrintHeaderDiv)
  private
    [weak]
    FParent : iModelRichTextEditorConfigPrintHeader;
    FCol : String;
    FImage : iModelRichTextEditorConfigPrintHeaderImage;
    FTitle : TList<iModelRichTextEditorConfigPrintHeaderTitle>;
  public
    constructor Create(Parent : iModelRichTextEditorConfigPrintHeader);
    destructor Destroy; override;
    class function New(Parent : iModelRichTextEditorConfigPrintHeader) : iModelRichTextEditorConfigPrintHeaderDiv;
    function Col(aValue : Integer) : iModelRichTextEditorConfigPrintHeaderDiv; overload;
    function Col(aValue : String) : iModelRichTextEditorConfigPrintHeaderDiv; overload;
    function Title : iModelRichTextEditorConfigPrintHeaderTitle;
    function Image : iModelRichTextEditorConfigPrintHeaderImage;
    function HTML : String;
    function &End : iModelRichTextEditorConfigPrintHeader;
  end;

implementation

uses
  Injection, RichTextEditor.Config.PrintHeader.Image,
  RichTextEditor.Config.PrintHeader.Title, System.SysUtils;

{ TModelRichTextEditorConfigPrintHeaderDiv }

function TModelRichTextEditorConfigPrintHeaderDiv.&End: iModelRichTextEditorConfigPrintHeader;
begin
  Result := FParent;
end;

function TModelRichTextEditorConfigPrintHeaderDiv.HTML: String;
var
  I: Integer;
begin
  Result := Format('<div class="%s">', [FCol]);
  Result := Result + FImage.HTML;
  for I := 0 to Pred(FTitle.Count) do
    Result := Result + FTitle[I].HTML;
  Result := Result + '</div>';
end;

function TModelRichTextEditorConfigPrintHeaderDiv.Col(
  aValue: String): iModelRichTextEditorConfigPrintHeaderDiv;
begin
  Result := Self;
  FCol := aValue;
end;

function TModelRichTextEditorConfigPrintHeaderDiv.Col(
  aValue: Integer): iModelRichTextEditorConfigPrintHeaderDiv;
begin
  Result := Self;
  FCol := Format('col-%d', [aValue]);
end;

constructor TModelRichTextEditorConfigPrintHeaderDiv.Create(Parent : iModelRichTextEditorConfigPrintHeader);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FTitle := TList<iModelRichTextEditorConfigPrintHeaderTitle>.Create;
  FImage := TModelRichTextEditorConfigPrintHeaderImage.New(Self);
  FCol := 'col';
end;

destructor TModelRichTextEditorConfigPrintHeaderDiv.Destroy;
begin
  FTitle.Free;
  inherited;
end;

function TModelRichTextEditorConfigPrintHeaderDiv.Image: iModelRichTextEditorConfigPrintHeaderImage;
begin
  Result := FImage;
end;

class function TModelRichTextEditorConfigPrintHeaderDiv.New (Parent : iModelRichTextEditorConfigPrintHeader) : iModelRichTextEditorConfigPrintHeaderDiv;
begin
  Result := Self.Create(Parent);
end;

function TModelRichTextEditorConfigPrintHeaderDiv.Title: iModelRichTextEditorConfigPrintHeaderTitle;
begin
  FTitle.Add(TModelRichTextEditorConfigPrintHeaderTitle.New(Self));
  Result := FTitle[Pred(FTitle.Count)];
end;

end.
