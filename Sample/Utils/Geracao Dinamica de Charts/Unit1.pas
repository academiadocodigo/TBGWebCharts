unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.OleCtrls,
  View.WebCharts,
  SHDocVw,
  Charts,
  Charts.Generic,
  Interfaces;


type
  TForm1 = class(TForm)
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  strict private
    FListHtmlChart: TList<string>;
    procedure GenerateBars;
    function ResultBars: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

uses
  Charts.Types;

{$R *.dfm}

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
  FListHtmlChart := TList<string>.Create;
end;

destructor TForm1.Destroy;
begin
  FListHtmlChart.Free;
  inherited;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GenerateBars;
   WebCharts1
    .NewProject
      .Rows
        .Title
          .Config
            .H1('Bar chart')
          .&End
        .&End
      .&End
      .Jumpline
      .Jumpline
      .Rows
        .Tag
          .Add(
            ResultBars
          )
        .&End
      .&End
    .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.WindowState := TWindowState.wsMaximized;
end;

procedure TForm1.GenerateBars;
begin
 for var I: UInt8 := 0 to 3 do
 begin
   FListHtmlChart.Add(TWebCharts.Create
    .ContinuosProject
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('Meu Grafico de Barras' + IntToStr(I))
            .ColSpan(12)
            .DataSet
              .TextLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
            .&End
            .DataSet
              .BackgroundColor('30,182,203')
              .TextLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
            .&End
          .&End
        .&End
      .HTML);
 end;
end;

function TForm1.ResultBars: String;
begin
  for var Html: string in FListHtmlChart do
    Result := Result + Html;
end;

end.
