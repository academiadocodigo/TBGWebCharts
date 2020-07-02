unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniButton, uniHTMLFrame, uniGUIBaseClasses, uniPanel, Data.DB, Datasnap.DBClient, View.WebCharts, uniURLFrame, ServerModule;

type
  TMainForm = class(TUniForm)
    UniPanel1: TUniPanel;
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
    WebCharts1: TWebCharts;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet3: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    ClientDataSet5: TClientDataSet;
    ClientDataSet5CustNo: TFloatField;
    ClientDataSet5Company: TStringField;
    ClientDataSet5City: TStringField;
    ClientDataSet5State: TStringField;
    ClientDataSet5Zip: TStringField;
    ClientDataSet5Country: TStringField;
    ClientDataSet5Phone: TStringField;
    ClientDataSet5TaxRate: TFloatField;
    ClientDataSet5Contact: TStringField;
    ClientDataSet7: TClientDataSet;
    ClientDataSet7LAST_NAME: TStringField;
    ClientDataSet7FIRST_NAME: TStringField;
    ClientDataSet7ACCT_NBR: TFloatField;
    ClientDataSet7CITY: TStringField;
    ClientDataSet7STATE: TStringField;
    ClientDataSet7ZIP: TStringField;
    ClientDataSet7TELEPHONE: TStringField;
    ClientDataSet7DATE_OPEN: TDateField;
    ClientDataSet7SS_NUMBER: TFloatField;
    ClientDataSet7BIRTH_DATE: TDateField;
    ClientDataSet7RISK_LEVEL: TStringField;
    ClientDataSet7OCCUPATION: TStringField;
    ClientDataSet7OBJECTIVES: TStringField;
    ClientDataSet6: TClientDataSet;
    ClientDataSet6LAST_NAME: TStringField;
    ClientDataSet6FIRST_NAME: TStringField;
    ClientDataSet6ACCT_NBR: TFloatField;
    ClientDataSet6ADDRESS_1: TStringField;
    ClientDataSet6CITY: TStringField;
    ClientDataSet6STATE: TStringField;
    ClientDataSet6ZIP: TStringField;
    ClientDataSet6TELEPHONE: TStringField;
    ClientDataSet6DATE_OPEN: TDateField;
    ClientDataSet6SS_NUMBER: TFloatField;
    ClientDataSet6PICTURE: TStringField;
    ClientDataSet6BIRTH_DATE: TDateField;
    ClientDataSet6RISK_LEVEL: TStringField;
    ClientDataSet6OCCUPATION: TStringField;
    ClientDataSet6OBJECTIVES: TStringField;
    ClientDataSet6INTERESTS: TStringField;
    ClientDataSet6IMAGE: TBlobField;
    uniURLFrame: TUniURLFrame;
    UniButton3: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Charts.Types;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
var
  ts: TStringList;
  arq: string;
begin
  ts := TStringList.Create;
  ts.Text := WebCharts1.NewProject.Rows.Title.Configuracoes.H1('Gráfico de Barras').&End.&End.&End.Jumpline.Jumpline.Charts._ChartType(bar).Attributes.Name('Meu Grafico de Barras').ColSpan(12).DataSet.textLabel('Meu DataSet 1')
     .DataSet(ClientDataSet1).&End.DataSet.BackgroundColor('30,182,203').textLabel('Meu DataSet 2').DataSet(ClientDataSet2).&End.DataSet.BackgroundColor('30,182,100').textLabel('Meu DataSet 3').DataSet(ClientDataSet3).&End.&End.&End.&End
  // .WebBrowser(WebBrowser1)
  // .Generated;
     .HTML;

  Arq:='.\tbgwebcharts1.html';

  ts.SaveToFile(arq);
  ts.Free;

  uniURLFrame.URL := arq;
end;

procedure TMainForm.UniButton2Click(Sender: TObject);
begin
  uniURLFrame.URL := '.\teste.html';
end;

procedure TMainForm.UniButton3Click(Sender: TObject);
var
  ts: TStringList;
  arq: string;
begin
  ts := TStringList.Create;
  ts.Text :=
   WebCharts1
  .NewProject
    .Rows
      .Title
        .Config
          .H1('Bar/Line Chart')
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
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
            .Types('line')
            .Fill(false)
            .BorderWidth(2)
            .BorderColor('30,182,203')
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
          .DataSet
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet2)
            .Types('bar')
          .&End
        .&End
      .&End
    .&End
//  .WebBrowser(WebBrowser1)
//  .Generated;
    .HTML;

  Arq:='.\tbgwebcharts2.html';

  ts.SaveToFile(arq);
  ts.Free;

  uniURLFrame.URL := arq;

end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  ClientDataSet1.Open;
  ClientDataSet2.Open;
  ClientDataSet3.Open;
end;

initialization

RegisterAppFormClass(TMainForm);

end.
