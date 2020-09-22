unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  View.WebCharts, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw;

type
  TForm13 = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    WebCharts1: TWebCharts;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet1RGB: TStringField;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
  .CDN(true)
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
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm13.Button2Click(Sender: TObject);
var
  I : Integer;
begin
  ClientDataset1.First;
  for I := 0 to Pred(ClientDataSet1.RecordCount) do
  begin
    ClientDataset1.Edit;
    ClientDataset1.FieldByName('VALUE').AsString := IntToStr(Random(200));
    ClientDataSet1.Post;
    ClientDataSet1.Next;
  end;
  ClientDataSet1.AppendRecord(['Teste1', IntToStr(Random(100)), ClientDataset1.FieldByName('RGB').AsString]);

  WebCharts1
  .ContinuosProject
    .WebBrowser(WebBrowser1)
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
          .DataSet
            .BackgroundColor('30,182,100')
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
        .UpdateChart
      .&End
    .&End

end;

end.
