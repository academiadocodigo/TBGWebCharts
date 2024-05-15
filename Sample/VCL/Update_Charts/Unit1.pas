unit Unit1;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
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
  SHDocVw;

type
  TForm13 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1RGB: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  Form13: TForm13;

implementation

uses
  Charts.Types;

{$R *.dfm}

procedure TForm13.Button1Click(Sender: TObject);
begin
  WebCharts1
  .CDN(True)
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Bar Chart')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('215,0,181')
            .BackgroundOpacity(4)
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .BackgroundOpacity(5)
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  ClientDataset1.First;

  for var I: Int32 := 0 to Pred(ClientDataSet1.RecordCount) do
  begin
    ClientDataset1.Edit;
    ClientDataset1.FieldByName('VALUE').AsString := Random(200).ToString;
    ClientDataSet1.Post;
    ClientDataSet1.Next;
  end;

  ClientDataSet1.AppendRecord(['Teste1', Random(100).ToString, Format('%d, %d, %d', [Random(255), Random(255), Random(255)])]);

  WebCharts1
  .ContinuosProject
    .WebBrowser(WebBrowser1)
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .DataSet
            .TextLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .TextLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .TextLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
        .UpdateChart
      .&End
    .&End

end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  Self.WindowState := TWindowState.wsMaximized;
end;

end.
