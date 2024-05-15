unit CardStyled.IconBackground;

interface

uses
  Interfaces,
  Generics.Collections,
  System.Classes;

Type
  TModelCardStyledIconBackground = class(TInterfacedObject, iModelCardStyledGeneric)
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
    FHTML : String;
    FName : String;
    FProgress : iModelGenericProgressBar<iModelCardStyledGeneric>;
    FShape : iModelCardStyledShape;
    FTitle : TList<iModelCardStyledText>;
    procedure GenerateHTML;
    function GenerateTitle : String;
    function GenerateBody : String;
    function GenerateFooter : String;
    function GenerateProgress : String;
    function GenerateShape : string;
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
  CardStyled.Text,
  System.SysUtils,
  Utilities.Str,
  CardStyled.Shape,
  Generic.ProgressBar, CardStyled.Callback;

{ TModelCardStyledGeneric }

function TModelCardStyledIconBackground.BackgroundColor(
  Value: String): iModelCardStyledGeneric;
begin
  Result := Self;
  FBackgroundColor := TUtilitiesStr.TestRgbColor(Value);
end;

function TModelCardStyledIconBackground.Body: iModelCardStyledText;
begin
  FBody.Add(TModelCardStyledText.New(Self));
  Result := FBody[Pred(FBody.Count)];
  Result
    .Style
      .Color(FDefaultFontColor);
end;

function TModelCardStyledIconBackground.Callback: iModelCardStyledCallback;
begin
  if not Assigned(FCallBack) then
    FCallBack := TModelCardStyledCallback.New(self);
  Result := FCallBack;
end;

function TModelCardStyledIconBackground.Col(Value: Integer): iModelCardStyledGeneric;
begin
  Result := Self;
  FColmd := Format('col-md-%d', [Value]);
  FColxl := Format('col-xl-%d', [Value]);
end;

function TModelCardStyledIconBackground.Colmd(Value: Integer): iModelCardStyledGeneric;
begin
  Result := Self;
  FColmd := Format('col-md-%d', [Value]);
end;

function TModelCardStyledIconBackground.Colxl(Value: Integer): iModelCardStyledGeneric;
begin
  Result := Self;
  FColxl := Format('col-xl-%d', [Value]);
end;

function TModelCardStyledIconBackground.&End: iModelCardStyled;
begin
  GenerateHTML;
  Result := FParent;
end;

constructor TModelCardStyledIconBackground.Create(Parent : iModelCardStyled);
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

function TModelCardStyledIconBackground.DefaultFontColor(
  Value: string): iModelCardStyledGeneric;
begin
  Result := Self;
  FDefaultFontColor := TUtilitiesStr.TestRgbColor(Value);
end;

destructor TModelCardStyledIconBackground.Destroy;
begin
  FTitle.Free;
  FBody.Free;
  FFooter.Free;
  inherited;
end;

function TModelCardStyledIconBackground.Footer: iModelCardStyledText;
begin
  FFooter.Add(TModelCardStyledText.New(Self));
  Result := FFooter[Pred(FFooter.Count)];
  Result
    .Style
      .Color(FDefaultFontColor)
      .FontSize(16);
end;

function TModelCardStyledIconBackground.GenerateBody: String;
var
  Body : iModelCardStyledText;
begin
  for Body in FBody do
    Result := Result + Format('<span %s>%s</span>',
      [Body.Style.ResultStyle, Body.Text]);
  Result := Format('<h2 class="d-flex align-items-baseline mb-0">%s</h2>', [Result]);
end;

function TModelCardStyledIconBackground.GenerateFooter: String;
var
  Footer : iModelCardStyledText;
begin
  Result := '';
  for Footer in FFooter do
    Result := Result + Format('<span %s>%s</span>',
      [Footer.Style.ResultStyle, Footer.Text]);
end;

procedure TModelCardStyledIconBackground.GenerateHTML;
var
  CardCallback : string;
begin
  CardCallback := '';
  if Assigned(FCallBack) then
    CardCallback := FCallBack.ResultClass;
  FHTML := Format('<div id="%s" class="%s %s"%s>', [FName, FColMd, Fcolxl, CardCallback]) +
    '<div class="card" style="background: ' + FBackgroundColor +'; border-radius: 10px;">' +
      '<div class="p-4">' +
        GenerateShape +
        '<div class="mb-3">' +
          GenerateTitle +
        '</div>' +
        '<div class="row align-items-center mb-2 flex">' +
          '<div class="col-7">' +
            GenerateBody +
          '</div>' +
          '<div class="col-5 text-right">' +
            GenerateFooter +
          '</div>' +
        '</div>' +
        GenerateProgress +
      '</div>' +
    '</div>' +
  '</div>';
end;

function TModelCardStyledIconBackground.GenerateProgress: String;
begin
  Result := '';
  if not Assigned(FProgress) then
    exit;
  Result := Format('<div class="progress mt-1"%s>%s</div>', [FProgress.Height, FProgress.HTML]);
end;

function TModelCardStyledIconBackground.GenerateShape: string;
begin
  if Assigned(FShape) then
    Result := FShape.ResultClass;
end;

function TModelCardStyledIconBackground.GenerateTitle: String;
var
  Title : iModelCardStyledText;
begin
  for Title in FTitle do
    Result := Result + Format('<h5 class="card-title mb-0" %s>%s</h5>',
      [Title.Style.ResultStyle, Title.Text]);
end;

function TModelCardStyledIconBackground.HTML: String;
begin
  Result := FHTML;
end;

function TModelCardStyledIconBackground.Name(Value: String): iModelCardStyledGeneric;
begin
  Result := Self;
  FName := Value;
end;

class function TModelCardStyledIconBackground.New(Parent : iModelCardStyled) : iModelCardStyledGeneric;
begin
  Result := Self.Create(Parent);
end;

function TModelCardStyledIconBackground.Progress: iModelGenericProgressBar<iModelCardStyledGeneric>;
begin
  if not Assigned(FProgress) then
    FProgress := TModelGenericProgressBar<iModelCardStyledGeneric>.New(Self)
      .Height(8);
  Result := FProgress;
end;

function TModelCardStyledIconBackground.Shape: iModelCardStyledShape;
begin
  if Not Assigned(FShape) then
    FShape := TModelCardStyledShape.New(Self)
      .ColAuto(False)
      .Style
        .TextAlign('center')
        .LineHeight(50)
        .MarginLeft(15)
        .Color('#000 !important')
        .position('absolute')
        .Right(5)
        .Top(10)
        .Opacity('0.1')
        .FontSize(110)
      .&End;
  Result := FShape;
end;

function TModelCardStyledIconBackground.Title: iModelCardStyledText;
begin
  FTitle.Add(TModelCardStyledText.New(Self));
  Result := FTitle[Pred(FTitle.Count)];
  Result
    .Style
      .Color(FDefaultFontColor);
end;

end.
