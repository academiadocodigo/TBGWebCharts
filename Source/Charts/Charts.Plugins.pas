unit Charts.Plugins;

interface

uses
  Interfaces;

type
  TModelHTMLChartsPlugins = class(TInterfacedObject, iModelHTMLPlugins)
    private
      FParent : iModelHTMLOptions;
      FStreaming : Boolean;
    public
      constructor Create(Parent : iModelHTMLOptions);
      destructor Destroy; override;
      class function New(Parent : iModelHTMLOptions) : iModelHTMLPlugins;
      function Streaming(Value : Boolean) : iModelHTMLPlugins;
      function Result : String;
      function &End : iModelHTMLOptions;
  end;

implementation

uses
  Injection;

{ TModelHTMLChartsPlugins }

constructor TModelHTMLChartsPlugins.Create(Parent: iModelHTMLOptions);
begin
    TInjection.Weak(@FParent, Parent);
    FStreaming := True;
end;

destructor TModelHTMLChartsPlugins.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsPlugins.&End: iModelHTMLOptions;
begin
  Result := FParent;
end;

class function TModelHTMLChartsPlugins.New(
  Parent: iModelHTMLOptions): iModelHTMLPlugins;
begin
  Result := Self.Create(Parent);
end;

function TModelHTMLChartsPlugins.Result: String;
begin
  Result :=  'plugins: {';
  if FStreaming then Result := Result + 'streaming: true' else Result := Result + 'streaming: false';
  Result := Result + '},';
end;

function TModelHTMLChartsPlugins.Streaming(Value: Boolean): iModelHTMLPlugins;
begin
  Result := Self;
  FStreaming := Value;
end;

end.
