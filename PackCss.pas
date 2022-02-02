unit PackCss;

interface

uses
  Interfaces,
  Classes;

type
  TPackCss = class(TInterfacedObject,iModelCSS)
    private
      FBackgroundColor : String;
      FFontColor : String;
      FBorderColor : String;
      FCDN : Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCSS;
      function PackCSS : String;
      function CDN(Value : Boolean) : iModelCSS;
      function BackgroundColor ( Value : String ) :  iModelCSS;
      function BorderColor ( Value : String ) : iModelCSS;
      function FontColor ( Value : String ) : iModelCSS;
  end;

implementation

uses
  StyleCSS,
  BootstrapCss,
  DataTableCss,
  Chart.Easy.PieCSS,
  PivotTableCSS,
  LiquidFillGaugeCSS,
  QuillEditorCSS;

{ TPackCss }

function TPackCss.BackgroundColor(Value: String): iModelCSS;
begin
  Result := Self;
  FBackgroundColor := Value;
end;

function TPackCss.BorderColor(Value: String): iModelCSS;
begin
  Result := Self;
  FBorderColor := Value;
end;

function TPackCss.CDN(Value: Boolean): iModelCSS;
begin
  Result := SElf;
  FCDN := Value;
end;

constructor TPackCss.Create;
begin
  FCDN := False;
end;

destructor TPackCss.Destroy;
begin
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
  if FCDN then
  begin
    Result := Result + '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">';
		Result := Result + '<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/r-2.2.3/sl-1.3.1/datatables.min.css"/>';
    Result := Result + '<link rel="stylesheet" type="text/css" href="https://thuliobittencourt.com/tbgwebcharts/pivotjs/dist/pivot.css">';
    Result := Result + '<link rel="stylesheet" href="https://cdn.quilljs.com/1.3.6/quill.snow.css">';
    Result := Result + TStyleCSS.New
                        .BackgroundColor(FBackgroundColor)
                        .FontColor(FFontColor)
                        .BorderColor(FBorderColor)
                        .PackCSS;
    Result := Result + TChartEasyPieCSS.New.PackCSS;
    Result := Result + TLiquidFillGaugeCSS.New.PackCSS;
    Result := Result + TQuillEditorCSS.New.CDN(FCDN).PackCSS;
  end
  else
    Result :=  TBootstrapCss.New
              .PackCSS+
            TDataTableCss.New
              .PackCSS+
            TStyleCSS.New
              .BackgroundColor(FBackgroundColor)
              .FontColor(FFontColor)
              .BorderColor(FBorderColor)
              .PackCSS+
            TChartEasyPieCSS.New.PackCSS+
            TPivotTableCSS.New.PackCSS+
            TLiquidFillGaugeCSS.New.PackCSS+
            TQuillEditorCSS.New.PackCSS;
end;

end.
