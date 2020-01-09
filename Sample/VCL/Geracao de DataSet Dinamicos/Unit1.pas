unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  View.WebCharts, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    WebCharts1: TWebCharts;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherDataSet(FDMemTable : TFDMemTable);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Interfaces, Charts.Types;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  viModelHTML : iModelHTML;
  vChartsConfig : iModelHTMLChartsConfig;
  vFDMemTable : array of TFDMemTable;
  I: Integer;
begin

  SetLength(vFDMemTable, StrToInt(Edit1.Text));

  for I := 0 to Pred(Length(vFDMemTable)) do
  begin
    vFDMemTable[I] := TFDMemTable.Create(nil);
    PreencherDataSet(vFDMemTable[I]);
  end;



  viModelHTML := WebCharts1.New.NewProject;

  vChartsConfig :=
  viModelHTML.Charts
      ._ChartType(bar)
        .Attributes;


  for I := 0 to Pred(Length(vFDMemTable)) do
    vChartsConfig.DataSet.DataSet(vFDMemTable[I]).&End;


  vChartsConfig.Name('G1').&End.&End;

  viModelHTML
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm1.PreencherDataSet(FDMemTable : TFDMemTable);
var
  Color : String;
begin
  Color := IntToStr(Random(255)) + ',' + IntToStr(Random(255)) + ',' + IntToStr(Random(255));

  FDMemTable.FieldDefs.Add('Label', ftString, 60, false);
  FDMemTable.FieldDefs.Add('Value', ftString, 60, false);
  FDMemTable.FieldDefs.Add('RGB', ftString, 60, false);
  FDMemTable.CreateDataSet;

  FDMemTable.Open;
  FDMemTable.AppendRecord(['Teste1', IntToStr(Random(100)), Color]);
  FDMemTable.AppendRecord(['Teste2', IntToStr(Random(100)), Color]);
  FDMemTable.AppendRecord(['Teste3', IntToStr(Random(100)), Color]);
end;

end.
