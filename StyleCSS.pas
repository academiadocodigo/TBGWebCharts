unit StyleCSS;

interface

uses
  Interfaces,
  System.Classes;

type
  TStyleCSS = class (TInterfacedObject, iModelCSS)
    private
      FBackgroundColor : String;
      FFontColor : String;
      FBorderColor : String;
      FStyle : TStringList;
      procedure GenerateStyle;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCSS;
      function BackgroundColor ( Value : String ) : iModelCSS;
      function FontColor ( Value : String ) : iModelCSS;
      function BorderColor ( Value : String ) : iModelCSS;
      function PackCSS : String;
      function CDN(Value : Boolean) : iModelCSS;
  end;

implementation

{ TStyleCSS }

function TStyleCSS.BackgroundColor(Value: String): iModelCSS;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TStyleCSS.BorderColor(Value: String): iModelCSS;
begin
  Result := Self;
  FBorderColor := Value;
end;

function TStyleCSS.CDN(Value: Boolean): iModelCSS;
begin
  Result := Self;
end;

constructor TStyleCSS.Create;
begin
  FFontColor := '#212529';
  FBackgroundColor := '#fff';
  FBorderColor := '';
  FStyle := TStringList.Create;
end;

destructor TStyleCSS.Destroy;
begin
  FStyle.DisposeOf;
  inherited;
end;

function TStyleCSS.FontColor(Value: String): iModelCSS;
begin
  Result := Self;
  FFontColor := Value;
end;

procedure TStyleCSS.GenerateStyle;
begin
  FStyle.Add('<style>'+#13);
  FStyle.Add('body {');
  FStyle.Add('color: '+FFontColor+';');
  FStyle.Add('background-color:'+FBackgroundColor+';');
  FStyle.Add('}');
  FStyle.Add('');
  FStyle.Add('.form-control {');
  FStyle.Add('background-color: '+FBackgroundColor+';');
  FStyle.Add('}');
  FStyle.Add('');
  FStyle.Add('.form-control:focus {');
  FStyle.Add('background-color: '+FBackgroundColor+';');
  FStyle.Add('}');
  FStyle.Add('');
  FStyle.Add('.page-item.active .page-link {');
  FStyle.Add('color: '+FFontColor+';');
  FStyle.Add('background-color: '+FBackgroundColor+';');
  FStyle.Add('border-color: #007bff');
  FStyle.Add('}');
  FStyle.Add('');
  FStyle.Add('.page-item.disabled .page-link {');
  FStyle.Add('color: '+FFontColor+';');
  FStyle.Add('background-color: '+FBackgroundColor+';');
  FStyle.Add('border-color: #dee2e6');
  FStyle.Add('}');
  FStyle.Add('');
  FStyle.Add('.page-link {');
  FStyle.Add('color: '+FFontColor+';');
  FStyle.Add('background-color: '+FBackgroundColor+';');
  FStyle.Add('border: 1px solid #dee2e6');
  FStyle.Add('}');
  FStyle.Add('');
  FStyle.Add('.page-link:hover {');
  FStyle.Add('color: '+FFontColor+';');
  FStyle.Add('background-color: '+FBackgroundColor+';');
  FStyle.Add('border-color: #dee2e6');
  FStyle.Add('}');
  FStyle.Add('</style>'+#13);
end;

class function TStyleCSS.New: iModelCSS;
begin
  Result := Self.Create;
end;

function TStyleCSS.PackCSS: String;
begin
  GenerateStyle;
  Result := FStyle.Text;
end;

end.
