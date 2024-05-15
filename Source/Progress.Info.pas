unit Progress.Info;

interface

uses
  Interfaces;

Type
  TModelProgressInfo = class(TInterfacedObject, iModelProgressInfo)
  private
    [weak]
    FParent : iModelProgress;
    FIcon : iModelProgressInfoIcon;
    FTitle : iModelProgressInfoText;
    FValue : iModelProgressInfoText;
    function GenerateIcon : string;
    function GenerateTitle : string;
    function GenerateValue : string;
  public
    constructor Create(Parent : iModelProgress);
    destructor Destroy; override;
    class function New(Parent : iModelProgress) : iModelProgressInfo;
    function Icon : iModelProgressInfoIcon;
    function ResultClass : string;
    function Title : iModelProgressInfoText;
    function Value : iModelProgressInfoText;
    function &End : iModelProgress;
  end;

implementation
uses
  Injection, Progress.Info.Text, System.SysUtils, Progress.Info.Icon;

{ TModelProgressInfo }

function TModelProgressInfo.&End: iModelProgress;
begin
  Result := FParent;
end;

constructor TModelProgressInfo.Create(Parent : iModelProgress);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FTitle := TModelProgressInfoText.New(Self);
  FTitle.Style.Color('gray').FontWeight('bold');

  FValue := TModelProgressInfoText.New(Self);
  FValue.Style.Color('gray').FontWeight('bold');

end;

destructor TModelProgressInfo.Destroy;
begin

  inherited;
end;

function TModelProgressInfo.GenerateIcon: string;
begin
  Result := '';
  if Assigned(FIcon) then
  begin
    Result := Format('<i class="%s" %s></i>', [FIcon.Icon, FIcon.Style.ResultStyle]);
  end;
end;

function TModelProgressInfo.GenerateTitle: string;
begin
  Result := Format('<span %s>%s</span>', [FTitle.Style.ResultStyle, FTitle.Text]);
end;

function TModelProgressInfo.GenerateValue: string;
begin
  Result := Format('<span %s>%s</span>', [FValue.Style.ResultStyle, FValue.Text]);
end;

function TModelProgressInfo.Icon: iModelProgressInfoIcon;
begin
  if not Assigned(FIcon) then
    FIcon := TModelProgressInfoIcon.New(Self);
  Result := FIcon;
end;

class function TModelProgressInfo.New (Parent : iModelProgress) : iModelProgressInfo;
begin
  Result := Self.Create(Parent);
end;

function TModelProgressInfo.ResultClass: string;
begin
  Result := '<div class="row">' +
    '<div class="col-6">' +
      GenerateTitle +
    '</div>' +
    '<div class="col-6 text-right">' +
      GenerateValue +
      GenerateIcon +
    '</div>' +
  '</div>';
end;

function TModelProgressInfo.Title: iModelProgressInfoText;
begin
  Result := FTitle;
end;

function TModelProgressInfo.Value: iModelProgressInfoText;
begin
  Result := FValue;
end;

end.
