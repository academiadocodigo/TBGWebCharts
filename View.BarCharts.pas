unit View.BarCharts;

interface

uses
  SHDocVw, Model.Interfaces, Data.DB;

Type
  iTBGBarCharts = interface
    ['{62770AC1-55E0-417E-97D8-5C6412D96392}']
    //function Generated : iTBGBarCharts;
  end;

  TTBGBarCharts = class(TWebBrowser, iTBGBarCharts)
    private
       FModelHTML : iModelHTML;
    FGenerated: Boolean;
    FDataSet: TDataSet;
    FLabels: String;
    FName: String;
    FWidth: Integer;
    FTitle: String;
    FColSpan: Integer;
    FBackgroundColor: String;
    FHeight: Integer;
    procedure SetGenerated(const Value: Boolean);
    procedure SetBackgroundColor(const Value: String);
    procedure SetColSpan(const Value: Integer);
    procedure SetDataSet(const Value: TDataSet);
    procedure SetHeight(const Value: Integer);
    procedure SetLabels(const Value: String);
    procedure SetName(const Value: String);
    procedure SetTitle(const Value: String);
    procedure SetWidth(const Value: Integer);
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iTBGBarCharts;
    published
      property Generated : Boolean read FGenerated write SetGenerated;
      property Name : String read FName write SetName;
      property Labels : String read FLabels write SetLabels;
      property ColSpan : Integer read FColSpan write SetColSpan;
      property Width : Integer read FWidth write SetWidth;
      property Height : Integer read FHeight write SetHeight;
      property Title : String read FTitle write SetTitle;
      property BackgroundColor : String read FBackgroundColor write SetBackgroundColor;
      property DataSet : TDataSet read FDataSet write SetDataSet;
  end;

implementation

uses
  Model.HTML;

{ TTBGBarCharts }

constructor TTBGBarCharts.Create;
begin
  FModelHTML :=
    TModelHTML.New
      .WebBrowser(Self);
end;

destructor TTBGBarCharts.Destroy;
begin

  inherited;
end;

class function TTBGBarCharts.New: iTBGBarCharts;
begin
  Result := Self.Create;
end;

procedure TTBGBarCharts.SetBackgroundColor(const Value: String);
begin
  FBackgroundColor := Value;
end;

procedure TTBGBarCharts.SetColSpan(const Value: Integer);
begin
  FColSpan := Value;
end;

procedure TTBGBarCharts.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  if not Assigned(FModelHTML) then
    FModelHTML := TModelHTML.New.WebBrowser(Self);

  FModelHTML
      .Charts
        .Bar
          .Attributes
            .DataSet
              .DataSet(Value)
            .&End
          .&End
        .&End
      .&End;
end;

procedure TTBGBarCharts.SetGenerated(const Value: Boolean);
begin
  FGenerated := Value;

  if FGenerated then
  begin
    FModelHTML
      .Charts
        .Bar
          .Attributes
            .Name(FName)
            .Labels(FLabels)
            .ColSpan(FColSpan)
            .Width(FWidth)
            .Heigth(FHeight)
            .Title(FTitle)
            .BackgroundColor(FBackgroundColor)
          .&End
        .&End
      .&End
    .Generated;
  end;

end;

procedure TTBGBarCharts.SetHeight(const Value: Integer);
begin
  FHeight := Value;
end;

procedure TTBGBarCharts.SetLabels(const Value: String);
begin
  FLabels := Value;
end;

procedure TTBGBarCharts.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TTBGBarCharts.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

procedure TTBGBarCharts.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;


end.
