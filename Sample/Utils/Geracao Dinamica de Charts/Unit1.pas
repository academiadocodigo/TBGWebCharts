unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.WebCharts, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Charts,
  Charts.Generic, Interfaces;


type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    chart : iModelHTMLCharts;
    htmlChart : array of String;

    procedure generateBars;
    function resultBars : String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Charts.Types;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  generateBars;
   WebCharts1
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
      .Rows
        .Tag
          .Add(
            resultBars
          )
        .&End
      .&End
    .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.generateBars;
var
  I : Integer;
begin
 SetLength(htmlChart, 3);
 for I := 0 to 3 do
 begin
   htmlChart[I] := TWebCharts.Create
    .ContinuosProject
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('Meu Grafico de Barras' + IntToStr(I))
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
          .&End
        .&End
      .HTML;
 end;
end;

Function TForm1.resultBars : String;
var
  I : Integer;
begin
  for I := 0 to Pred(Length(htmlChart)) do
    Result := Result + htmlChart[I];
end;

end.
