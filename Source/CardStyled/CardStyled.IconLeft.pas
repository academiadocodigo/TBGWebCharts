unit CardStyled.IconLeft;

interface
uses
  Interfaces,
  Generics.Collections,
  CardStyled.Shape;

Type
  TModelCardStyledIconLeft = class(TInterfacedObject, IModelCardStyledGeneric)
  private
    [weak]
    FParent : iModelCardStyled;
    FBackgroundColor : String;
    FBody : TList<iModelCardStyledText>;
    FCallBack : iModelCardStyledCallback;
    FColMd : string;
    FColXl : string;
    FDefaultFontColor : string;
    FFooter : TList<iModelCardStyledText>;
    FProgress : iModelGenericProgressBar<iModelCardStyledGeneric>;
    FHTML : String;
    FName : String;
    FShape : iModelCardStyledShape;
    FTitle : TList<iModelCardStyledText>;
    procedure GenerateHTML;
    function GenerateTitle : String;
    function GenerateBody : String;
    function GenerateFooter : String;
    function GenerateShape : string;
    function GenerateProgress : string;
  public
    constructor Create(Parent : iModelCardStyled);
    destructor Destroy; override;
    class function New(Parent : iModelCardStyled) : iModelCardStyledGeneric;
    function BackgroundColor(Value : String) : iModelCardStyledGeneric;
    function Body : iModelCardStyledText;
    function Callback : iModelCardStyledCallback;
    function Col(Value : Integer) : iModelCardStyledGeneric;
    function Colmd(Value : Integer) : iModelCardStyledGeneric;
    function Colxl(Value : Integer) : iModelCardStyledGeneric;
    function DefaultFontColor(Value : string) : iModelCardStyledGeneric;
    function Footer : iModelCardStyledText;
    function HTML : String;
    function Name(Value : String) : iModelCardStyledGeneric;
    function Progress : iModelGenericProgressBar<iModelCardStyledGeneric>;
    function Shape : iModelCardStyledShape;
    function Title : iModelCardStyledText;
    function &End : iModelCardStyled;
  end;

implementation

uses
  Injection,
  Utilities.Str,
  CardStyled.Text,
  System.SysUtils, Generic.ProgressBar, CardStyled.Callback;

{ TModelCardStyledIconLeft }

function TModelCardStyledIconLeft.BackgroundColor(
  Value: String): iModelCardStyledGeneric;
begin
  Result := Self;
  FBackgroundColor := TUtilitiesStr.TestRgbColor(Value);
end;

function TModelCardStyledIconLeft.Body: iModelCardStyledText;
begin
  FBody.Add(TModelCardStyledText.New(Self));
  Result := FBody[Pred(FBody.Count)];
  Result
    .Style
      .Color(FDefaultFontColor)
      .FontSize(14)
      .FontWeight('bold');
end;

function TModelCardStyledIconLeft.Callback: iModelCardStyledCallback;
begin
  if not Assigned(FCallBack) then
    FCallBack := TModelCardStyledCallback.New(self);
  Result := FCallBack;
end;

function TModelCardStyledIconLeft.Col(Value: Integer): iModelCardStyledGeneric;
begin
  Result := Self;
  FColmd := Format('col-md-%d', [Value]);
  FColxl := Format('col-xl-%d', [Value]);
end;

function TModelCardStyledIconLeft.Colmd(
  Value: Integer): iModelCardStyledGeneric;
begin
  Result := Self;
  FColmd := Format('col-md-%d', [Value]);
end;

function TModelCardStyledIconLeft.Colxl(
  Value: Integer): iModelCardStyledGeneric;
begin
  Result := Self;
  FColxl := Format('col-xl-%d', [Value]);
end;

function TModelCardStyledIconLeft.&End: iModelCardStyled;
begin
  GenerateHTML;
  Result := FParent;
end;

constructor TModelCardStyledIconLeft.Create;
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FName := 'CardStyle' + IntToStr(Random(100));
  FBackgroundColor := 'rgb(255,255,255)';
  FBody := TList<iModelCardStyledText>.Create;
  FDefaultFontColor := 'rgb(0,0,0)';
  FFooter := TList<iModelCardStyledText>.Create;
  FTitle := TList<iModelCardStyledText>.Create;
end;

function TModelCardStyledIconLeft.DefaultFontColor(
  Value: string): iModelCardStyledGeneric;
begin
  Result := Self;
  FDefaultFontColor := TUtilitiesStr.TestRgbColor(Value);
end;

destructor TModelCardStyledIconLeft.Destroy;
begin
  FTitle.Free;
  FBody.Free;
  FFooter.Free;
  inherited;
end;

function TModelCardStyledIconLeft.Footer: iModelCardStyledText;
begin
  FFooter.Add(TModelCardStyledText.New(Self));
  Result := FFooter[Pred(FFooter.Count)];
  Result
    .Style
      .Color(FDefaultFontColor)
      .FontSize(9);
end;

function TModelCardStyledIconLeft.GenerateBody: String;
var
  Body : iModelCardStyledText;
begin
  for Body in FBody do
    Result := Result + Format('<span class="mb-0" %s>%s</span>',
      [Body.Style.ResultStyle, Body.Text]);
end;

function TModelCardStyledIconLeft.GenerateFooter: String;
var
  Footer : iModelCardStyledText;
  LineSeparator : string;
begin
  Result := '';
  if FFooter.Count > 0 then
  begin
   for Footer in FFooter do
      Result := Result + Format('<span %s>%s</span>',
        [Footer.Style.ResultStyle, Footer.Text]);
   LineSeparator := Format('<hr style="margin-top: 1rem; margin-bottom: -0.5rem; border: 0; border-top: 1px solid %s;"/>',
    [FDefaultFontColor]);

   Result := Format('%s<p class="mt-3 mb-0" style="font-size:.575rem;">%s</p>', [LineSeparator, Result]);
  end;
end;

procedure TModelCardStyledIconLeft.GenerateHTML;
var
  CardCallback : string;
begin
  CardCallback := '';
  if Assigned(FCallBack) then
    CardCallback := FCallBack.ResultClass;
  FHTML := Format('<div id="%s" class="%s %s"%s>', [FName, FColMd, Fcolxl, CardCallback]) +
    '<div class="card" style="background: ' + FBackgroundColor +'">' +
      '<div class="card-body">' +
        '<div class="row">' +
          GenerateShape +
          '<div class="col">' +
            GenerateTitle +
            GenerateBody +
          '</div>' +
        '</div>' +
          GenerateFooter +
          GenerateProgress +
      '</div>' +
    '</div>' +
  '</div>';
end;

function TModelCardStyledIconLeft.GenerateProgress: string;
begin
  Result := '';
  if not Assigned(FProgress) then
    exit;
  Result := Format('<div class="progress mt-1"%s>%s</div>', [FProgress.Height, FProgress.HTML]);
end;

function TModelCardStyledIconLeft.GenerateShape: string;
begin
  if Assigned(FShape) then
    Result := FShape.ResultClass;
end;

function TModelCardStyledIconLeft.GenerateTitle: String;
var
  Title : iModelCardStyledText;
begin
  for Title in FTitle do
    Result := Result + Format('<h5 class="card-title mb-0" %s>%s</h5>',
      [Title.Style.ResultStyle, Title.Text]);
end;

function TModelCardStyledIconLeft.HTML: String;
begin
  Result := FHTML;
end;

function TModelCardStyledIconLeft.Name(Value: String): iModelCardStyledGeneric;
begin
  Result := Self;
  FName := Value;
end;

class function TModelCardStyledIconLeft.New(
  Parent: iModelCardStyled): iModelCardStyledGeneric;
begin
  Result := Self.Create(Parent);
end;

function TModelCardStyledIconLeft.Progress: iModelGenericProgressBar<iModelCardStyledGeneric>;
begin
  if not Assigned(FProgress) then
    FProgress := TModelGenericProgressBar<iModelCardStyledGeneric>.New(Self)
      .Height(8);
  Result := FProgress;
end;

function TModelCardStyledIconLeft.Shape: iModelCardStyledShape;
begin
  if Not Assigned(FShape) then
    FShape := TModelCardStyledShape.New(Self)
      .ShapeClass
        .Rounded
        .Shadow
      .&End
      .Style
        .Width('3rem')
        .Height('3rem')
        .Padding(12)
        .TextAlign('center')
        .Display('inline-flex')
        .AlignItems('center')
        .JustifyContent('center')
        .FontSize('1.25rem')
        .Background('linear-gradient(87deg, #f5365c, #f56036)')
        .Color('#fff !important')
      .&End;
  Result := FShape;
end;

function TModelCardStyledIconLeft.Title: iModelCardStyledText;
begin
  FTitle.Add(TModelCardStyledText.New(Self));
  Result := FTitle[Pred(FTitle.Count)];
  Result
    .Style
      .Color(FDefaultFontColor)
      .FontSize(10);
end;

end.
