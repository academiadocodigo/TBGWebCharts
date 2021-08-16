unit LiquidFillGauge;

interface

uses
  Interfaces;

Type
  TModelLiquidFillGauge = class(TInterfacedObject, iModelLiquidFillGauge)
  private
    FConfig : iModelLiquidFillGaugeConfig;
    FHeight : string;
    FName : string;
    [weak]
    FParent : iModelHTML;
    FWidth : string;
    FValue : string;
    function Generate : string;
  public
    constructor Create(Parent : ImodelHTML);
    destructor Destroy; override;
    class function New(Parent : ImodelHTML) : iModelLiquidFillGauge;
    function Config : iModelLiquidFillGaugeConfig;
    function Height(Value : string) : iModelLiquidFillGauge;
    function Name(Value : string) : iModelLiquidFillGauge; overload;
    function Name : string; overload;
    function Width(Value : string) : iModelLiquidFillGauge;
    function Value(Value : string) : iModelLiquidFillGauge;
    function UpdateValue : iModelLiquidFillGauge;
    function &End : iModelHTML;
  end;

implementation

uses
  System.SysUtils,
  LiquidFillGauge.Config,
  Injection,
  JSCommand;

{ TModelLiquidFillGauge }

function TModelLiquidFillGauge.Config: iModelLiquidFillGaugeConfig;
begin
  Result := FConfig;
end;

function TModelLiquidFillGauge.&End: iModelHTML;
begin
  FParent.HTML(Generate);
  Result := FParent;
end;

function TModelLiquidFillGauge.Generate: string;
begin
  Result := '<svg id="' + FName + '" width="' + FWidth + '" height="' + FHeight + '"></svg>'
      + '<script>'
      + 'var config' + FName + ' = liquidFillGaugeDefaultSettings();'
      + FConfig.ResultScript
      + 'var gauge' + FName + ' = loadLiquidFillGauge("' + FName + '", ' + FValue + ', config' + FName + ');'
      + 'gauge' + FName + '.update(' + FValue + ');'
      + '</script>'
end;

constructor TModelLiquidFillGauge.Create(Parent : ImodelHTML);
begin
  TInjection.Weak(@FParent, Parent);
  FConfig := TModelLiquidFillGaugeConfig.New(Self);
  FName := 'fillgauge' + IntToStr(Random(100));
  FWidth := '100';
  FHeight := '100';
end;

destructor TModelLiquidFillGauge.Destroy;
begin

  inherited;
end;

function TModelLiquidFillGauge.Height(Value: string): iModelLiquidFillGauge;
begin
  Result := Self;
  FHeight := Value;
end;

function TModelLiquidFillGauge.Name(Value: string): iModelLiquidFillGauge;
begin
  Result := Self;
  FName := Value;
end;

function TModelLiquidFillGauge.Name: string;
begin
  Result := FName;
end;

class function TModelLiquidFillGauge.New (Parent : ImodelHTML) : iModelLiquidFillGauge;
begin
  Result := Self.Create(Parent);
end;

function TModelLiquidFillGauge.UpdateValue: iModelLiquidFillGauge;
var
  CommandJS : iModelJSCommand;
begin
  Result := Self;
  CommandJS := TModelJSCommand.New
    .Command('gauge' + FName + '.update')
    .Paramters
      .Add(FValue)
    .&End
    .TestBeforeExecute(true);

    FParent.ExecuteScript(CommandJS);
end;

function TModelLiquidFillGauge.Value(Value: string): iModelLiquidFillGauge;
begin
  Result := Self;
  FValue := Value;
end;

function TModelLiquidFillGauge.Width(Value: string): iModelLiquidFillGauge;
begin
  Result := Self;
  FWidth := Value;
end;

end.
