unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.OleCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  View.WebCharts,
  SHDocVw;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
  strict private
    procedure PreencherDataSet(const MemTable: TFDMemTable);
  end;

var
  Form1: TForm1;

implementation

uses
  System.Generics.Collections,
  Interfaces,
  Charts.Types;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ChartsConfig: IModelHTMLChartsConfig;
  LengthList: UInt8;
  ListMemTable: TObjectList<TFDMemTable>;
  ModelHTML: IModelHTML;
begin
  ListMemTable := TObjectList<TFDMemTable>.Create;
  try
    for var I: UInt8 := 1 to StrToInt(Edit1.Text) do
    begin
      ListMemTable.Add(TFDMemTable.Create(nil));
      PreencherDataSet(ListMemTable.Last);
    end;

    ModelHTML := WebCharts1.NewProject;

    ChartsConfig :=
    ModelHTML.Charts
             ._ChartType(bar)
             .Attributes;

    for var MemTable: TFDMemTable in ListMemTable do
      ChartsConfig.DataSet.DataSet(MemTable).&End;

    ChartsConfig.Name('G1').&End.&End;
    ModelHTML
      .WebBrowser(WebBrowser1)
      .Generated;
  finally
    ListMemTable.Free;
  end;
end;

procedure TForm1.PreencherDataSet(const MemTable: TFDMemTable);
var
  Color: string;
begin
  Color := Random(255).ToString + ',' + Random(255).ToString + ',' + Random(255).ToString;

  MemTable.FieldDefs.Add('Label', TFieldType.ftString, 60, False);
  MemTable.FieldDefs.Add('Value', TFieldType.ftString, 60, False);
  MemTable.FieldDefs.Add('RGB', TFieldType.ftString, 60, False);
  MemTable.CreateDataSet;

  MemTable.Open;
  MemTable.AppendRecord(['Teste1', Random(100).ToString, Color]);
  MemTable.AppendRecord(['Teste2', Random(100).ToString, Color]);
  MemTable.AppendRecord(['Teste3', Random(100).ToString, Color]);
end;

end.
