unit Editor.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  View.WebCharts, Vcl.Grids, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  System.JSON,
  Editor.Controller.Relatorio,
  Editor.Controller.Relatorio.Interfaces,
  Editor.Controller.Relatorio.Helpers;

type
  TForm4 = class(TForm)
    Panel2: TPanel;
    Button3: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    Button1: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Memo1: TMemo;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Panel8: TPanel;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    Memo2: TMemo;
    Panel7: TPanel;
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Button2: TButton;
    WebCharts1: TWebCharts;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    Panel9: TPanel;
    Panel10: TPanel;
    WebBrowser2: TWebBrowser;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FController : iControllerRelatorio;
  public
    { Public declarations }
    procedure ReadSettings;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

{ TForm4 }

procedure TForm4.Button2Click(Sender: TObject);
begin
  FController
    .GeneratedRel
      .Params(StringGrid1.ToParamJsonArray)
      .SQL(Memo1.Text)
    .Execute;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  FController.GetRel;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  FController
    .SaveNewRel
      .Title(LabeledEdit1.Text)
      .Description(Memo2.Text)
      .SQL(Memo1.Text)
      .Params(StringGrid1.ToParamJsonArray)
    .Execute;
end;

procedure TForm4.DBLookupComboBox1Click(Sender: TObject);
begin
  FController
    .LoadRel
      .Title(procedure (aValue : String)
      begin
        LabeledEdit1.Text := aValue;
      end)
      .Description(procedure (aValue : String)
      begin
        Memo2.Text := aValue;
      end)
      .SQL(procedure (aValue : String)
      begin
        Memo1.Text := aValue;
      end)
      .Params(procedure (aValue : TJsonArray)
      begin
        StringGrid1.LoadParamJsonArray(aValue);
      end)
    .Execute;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FController := TControllerRelatorio
                  .New
                    .DataSet(DataSource1)
                    .WebBrowser(WebBrowser2)
                    .Connection(FDConnection1)
                    .Query(FDQuery1)
                    .GetTableList(ListBox1.Items)
                  .GetRel;
  ReadSettings;
end;


procedure TForm4.ReadSettings;
begin
  StringGrid1.Cells[0, 0] := 'Param';
  StringGrid1.Cells[1, 0] := 'Default';
  StringGrid1.Cells[2, 0] := 'Display';
  StringGrid1.Cells[3, 0] := 'Type';
end;


end.
