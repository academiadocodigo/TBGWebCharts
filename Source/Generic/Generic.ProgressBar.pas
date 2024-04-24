unit Generic.ProgressBar;

interface

uses
  Interfaces, Colors.Bootstrap;

Type
  TModelGenericProgressBar<T : IInterface> = class(TInterfacedObject, iModelGenericProgressBar<T>)
  private
    [weak]
    FParent : T;
    FBackground : string;
    FColor : string;
    FDisplayLabel : Boolean;
    FHeight : string;
    FHTML : String;
    FStyle : string;
    FValue : string;
    procedure GenerateHTML;
  public
    constructor Create(Parent : T);
    destructor Destroy; override;
    class function New(Parent : T) : iModelGenericProgressBar<T>;
    function Background(aValue : string) : iModelGenericProgressBar<T>;
    function Color(aValue : string) : iModelGenericProgressBar<T>;
    function DisplayLabel(aValue : Boolean) : iModelGenericProgressBar<T>;
    function Height(aValue : Integer) : iModelGenericProgressBar<T>; overload;
    function Height : string; overload;
    function HTML : String;
    function Sytle(aValue : TTypeBackgroundColor) : iModelGenericProgressBar<T>;
    function Value(aValue : string) : iModelGenericProgressBar<T>;
    function &End : T;
  end;

implementation
uses
  Injection,
  Utilities.Str,
  System.SysUtils;

{ TModelProgress<T> }

function TModelGenericProgressBar<T>.&End: T;
begin
  Result := FParent;
end;

procedure TModelGenericProgressBar<T>.GenerateHTML;
var
  LLabel : string;
begin
  LLabel := '';
  if FDisplayLabel then
    LLabel := FValue + '%';
  FHTML :=
    '<div '  +
    'class="progress-bar' + FStyle + ' "' +
    'role="progressbar" '  +
    'data-width="' + FValue + '%" ' +
    'aria-valuenow="' + FValue + '" ' +
    'aria-valuemin="0" aria-valuemax="100" ' +
    'style="width: ' + FValue + '%;' + FBackground + FColor + '"' +
    '>' + LLAbel + '</div>';

end;

function TModelGenericProgressBar<T>.Background(
  aValue: string): iModelGenericProgressBar<T>;
begin
  Result := Self;
  FBackground := Format('background: %s;', [aValue]);
end;

function TModelGenericProgressBar<T>.Color(
  aValue: string): iModelGenericProgressBar<T>;
begin
  Result := Self;
  FColor := Format('color: %s;', [TUtilitiesStr.TestRgbColor(aValue)]);
end;

constructor TModelGenericProgressBar<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelGenericProgressBar<T>.Destroy;
begin

  inherited;
end;

function TModelGenericProgressBar<T>.DisplayLabel(
  aValue: Boolean): iModelGenericProgressBar<T>;
begin
  Result := Self;
  FDisplayLabel := aValue;
end;

function TModelGenericProgressBar<T>.Height(
  aValue: Integer): iModelGenericProgressBar<T>;
begin
  Result := Self;
  FHeight := Format(' style="height: %dpx;"', [aValue]);
end;

function TModelGenericProgressBar<T>.Height: string;
begin
  Result := FHeight;
end;

function TModelGenericProgressBar<T>.HTML: String;
begin
  GenerateHTML;
  Result := FHTML;
end;

class function TModelGenericProgressBar<T>.New(Parent : T) : iModelGenericProgressBar<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelGenericProgressBar<T>.Sytle(
  aValue: TTypeBackgroundColor): iModelGenericProgressBar<T>;
begin
  Result := Self;
  FStyle := Format(' %s',[aValue.ToString]);
end;

function TModelGenericProgressBar<T>.Value(
  aValue: string): iModelGenericProgressBar<T>;
begin
  Result := Self;
  FValue := aValue;
end;

end.
