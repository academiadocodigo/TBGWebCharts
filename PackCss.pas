unit PackCss;

interface

uses Interfaces, Classes, BootstrapCss;

type
  TPackCss = class(TInterfacedObject,iModelCSS)
    private
      FPack : TStringList;
      FBackgroundColor : String;
      FFontColor : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCSS;
      function PackCSS : String;
      function BackgroundColor ( Value : String ) :  iModelCSS;
      function FontColor ( Value : String ) : iModelCSS;
  end;

implementation

uses
  SysUtils;

{ TPackCss }

function TPackCss.BackgroundColor(Value: String): iModelCSS;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

constructor TPackCss.Create;
begin
  FPack := TStringList.Create;
end;

destructor TPackCss.Destroy;
begin
  FreeAndNil(FPack);
  inherited;
end;

function TPackCss.FontColor(Value: String): iModelCSS;
begin
  Result := Self;
  FFontColor := Value;
end;

class function TPackCss.New: iModelCSS;
begin
  Result := Self.Create;
end;

function TPackCss.PackCSS: String;
begin
  Result := TBootstrapCss.New
              .BackgroundColor(FBackgroundColor)
              .FontColor(FFontColor)
              .PackCSS;
end;

end.
