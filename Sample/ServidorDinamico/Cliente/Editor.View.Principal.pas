unit Editor.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.Grids, Vcl.OleCtrls, SHDocVw,
  Vcl.ExtCtrls,
  Editor.Controller.Relatorio,
  Editor.Controller.Relatorio.Interfaces,
  Editor.Controller.Relatorio.Helpers,
  Vcl.StdCtrls,
  System.JSON;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    WebBrowser1: TWebBrowser;
    StringGrid1: TStringGrid;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Panel5: TPanel;
    DBLookupListBox1: TDBLookupListBox;
    Button1: TButton;
    Panel6: TPanel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
    FController : iControllerRelatorio;
    procedure ReadSettings;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  FController.GetRel;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  FController
    .GeneratedRel
      .SQL(FDMemTable1
            .FieldByName('CONFIGURACOES')
            .AsJsonValueBase64Decode
            .GetValue<String>('SQL')
      )
      .Params(StringGrid1.ToParamJsonArray)
      .Config(FDMemTable1
                .FieldByName('CONFIGURACOES')
                .AsJsonValueBase64Decode
                .GetValue<TJsonObject>('CONFIG')
      )
    .Execute;
end;

procedure TForm5.DBLookupComboBox1Click(Sender: TObject);
begin
   FController
    .LoadRel
      .Title(procedure (aValue : String)
      begin
        Label1.Caption := aValue;
      end)
      .Description(procedure (aValue : String)
      begin
        Label2.Caption := aValue;
      end)
      .Params(procedure (aValue : TJsonArray)
      begin
        StringGrid1.LoadParamJsonArray(aValue);
      end)
    .Execute;
end;

procedure TForm5.DBLookupComboBox1DropDown(Sender: TObject);
begin
  FController.GetRel;
end;

procedure TForm5.DBLookupListBox1DblClick(Sender: TObject);
begin
  FController
    .LoadRel
      .Title(procedure (aValue : String)
      begin
        Label1.Caption := aValue;
      end)
      .Description(procedure (aValue : String)
      begin
        Label2.Caption := aValue;
      end)
      .Params(procedure (aValue : TJsonArray)
      begin
        StringGrid1.LoadParamJsonArray(aValue);
      end)
    .Execute;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
   FController := TControllerRelatorio
                  .New
                    .DataSet(DataSource1)
                    .WebBrowser(WebBrowser1)
                    .Connection(FDConnection1)
                    .Query(FDQuery1)
                  .GetRel;
   ReadSettings;
end;

procedure TForm5.ReadSettings;
begin
  StringGrid1.Cells[0, 0] := 'Param';
  StringGrid1.Cells[1, 0] := 'Default';
  StringGrid1.Cells[2, 0] := 'Display';
  StringGrid1.Cells[3, 0] := 'Type';
end;

end.
