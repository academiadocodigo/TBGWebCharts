unit Progress;

interface

uses
  Interfaces,
  Generics.Collections;

Type
  TModelProgress = class(TInterfacedObject, iModelProgress)
  private
    [weak]
    FParent : iModelHTML;
    FHeight : string;
    FMarginTop : string;
    FProgressBar : TList<iModelGenericProgressBar<iModelProgress>>;
    FProgressInfo : iModelProgressInfo;
  public
    constructor Create(Parent : iModelHTML);
    destructor Destroy; override;
    class function New(Parent : iModelHTML) : iModelProgress;
    function Height(aValue : integer) : iModelProgress;
    function Info : iModelProgressInfo;
    function HTML : string;
    function MarginTop(aValue : string) : iModelProgress;
    function ProgressBar : iModelGenericProgressBar<iModelProgress>;
    function &End : iModelHTML;
  end;

implementation
uses
  Injection, Generic.ProgressBar, System.SysUtils, Progress.Info;

{ TModelProgress }

function TModelProgress.&End: iModelHTML;
begin
  Result := FParent;
  FParent.HTML(HTML);
end;

function TModelProgress.Height(aValue: Integer): iModelProgress;
begin
  Result := Self;
  FHeight := Format(' height: %dpx;', [aValue]);
end;

function TModelProgress.HTML: string;
var
  LProgressBar : iModelGenericProgressBar<iModelProgress>;
begin
  Result := Format('<div style="margin-top:%s;">', [FMarginTop]);
  if Assigned(FProgressInfo) then
    Result := Result + FProgressInfo.ResultClass;

  Result := Result + Format('<div class="progress" style="%s">', [FHeight]);
  for LProgressBar in FProgressBar do
    Result := Result + LProgressBar.HTML;
  Result := Result + '</div></div>';
end;

function TModelProgress.Info: iModelProgressInfo;
begin
  if not Assigned(FProgressInfo) then
    FProgressInfo := TModelProgressInfo.New(Self);
  Result := FProgressInfo;
end;

function TModelProgress.MarginTop(aValue: string): iModelProgress;
begin
  Result := Self;
  FMarginTop := aValue;
end;

constructor TModelProgress.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FProgressBar := TList<iModelGenericProgressBar<iModelProgress>>.Create;
  FMarginTop := '1rem';
end;

destructor TModelProgress.Destroy;
begin
  FProgressBar.Free;
  inherited;
end;

class function TModelProgress.New (Parent : iModelHTML) : iModelProgress;
begin
  Result := Self.Create(Parent);
end;

function TModelProgress.ProgressBar: iModelGenericProgressBar<iModelProgress>;
begin
  FProgressBar.Add(TModelGenericProgressBar<iModelProgress>.New(Self));
  Result := FProgressBar[Pred(FProgressBar.Count)];
end;

end.
