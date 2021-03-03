unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCEFWinControl, uCEFChromiumWindow,
  uCEFInterfaces, Vcl.StdCtrls, Vcl.ExtCtrls, View.WebCharts,
  Data.DB, Datasnap.DBClient,uCEFWindowParent, uCEFChromium,
  uCEFChromiumCore, uCEFTypes;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    WebCharts1: TWebCharts;
    Chromium1: TChromium;
    CEFWindowParent1: TCEFWindowParent;
    ClientDataSet8: TClientDataSet;
    ClientDataSet8OrderNo: TFloatField;
    ClientDataSet8CustNo: TFloatField;
    ClientDataSet8SaleDate: TDateTimeField;
    ClientDataSet8ShipDate: TDateTimeField;
    ClientDataSet8EmpNo: TIntegerField;
    ClientDataSet8ShipToContact: TStringField;
    ClientDataSet8ShipToAddr1: TStringField;
    ClientDataSet8ShipToAddr2: TStringField;
    ClientDataSet8ShipToCity: TStringField;
    ClientDataSet8ShipToState: TStringField;
    ClientDataSet8ShipToZip: TStringField;
    ClientDataSet8ShipToCountry: TStringField;
    ClientDataSet8ShipToPhone: TStringField;
    ClientDataSet8ShipVIA: TStringField;
    ClientDataSet8PO: TStringField;
    ClientDataSet8Terms: TStringField;
    ClientDataSet8PaymentMethod: TStringField;
    ClientDataSet8ItemsTotal: TCurrencyField;
    ClientDataSet8TaxRate: TFloatField;
    ClientDataSet8Freight: TCurrencyField;
    ClientDataSet8AmountPaid: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    FPivotConfig : string;
  public
    { Public declarations }
    procedure btnPivotConfigSave;
    procedure PivotConfigSave(value : string);
    procedure PivotConfigLoad;
    procedure PivotShowUI;
    procedure PivotHideUI;
  end;

var
  Form5: TForm5;

implementation

uses
  Charts.Types, uCEFMiscFunctions;

{$R *.dfm}

procedure TForm5.btnPivotConfigSave;
begin
  WebCharts1.ContinuosProject
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
    .PivotTable.SaveConfig(PivotConfigSave);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  WebCharts1
  .Container(fluid)
  .NewProject
    .Jumpline
    .Rows
      ._Div
        .Add('<h1>Pivot Table</h1>')
        .ColSpan(7)
      .&End
      ._Div
        .ColSpan(5)
        .Add(
          WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Save Config')
                .CallbackLink('','btnPivotConfigSave')
                .ButtonClass
                  .success
                  .small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Load Config')
                .CallbackLink('','PivotConfigLoad')
                .ButtonClass
                  .primary
                  .small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Show UI')
                .CallbackLink('','PivotShowUI')
                .ButtonClass
                  .secondary
                  .small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Hide UI')
                .CallbackLink('','PivotHideUI')
                .ButtonClass
                  .info
                  .small
                .&End
              .&End
            .HTML

        )
      .&End
    .&End
    .Jumpline
    .PivotTable
      .Attributes
        .DataSet
          .DataSet(ClientDataSet8)
        .&End
        .ConfigBackgroundColor('#b0ceeb')
        .PivotType
          .Tabela
        .&End
        .ConfigHeadStyle
        .&End

        .ConfigBodyStyle
         .&End
        .Rows
          .Add('Transportadora')
        .&End
        .Cols
          .Add('Forma de Pagamento')
        .&End
      .&End
    .&End
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TForm5.PivotConfigLoad;
begin
  if not FPivotConfig.IsEmpty then
    WebCharts1.ContinuosProject
      .WindowParent(CEFWindowParent1)
      .WebBrowser(Chromium1)
      .PivotTable.LoadConfig(FPivotConfig);
end;

procedure TForm5.PivotConfigSave(Value : String);
begin
  FPivotConfig := Value;
  ShowMessage(FPivotConfig);
end;

procedure TForm5.PivotHideUI;
begin
  WebCharts1.ContinuosProject
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
    .PivotTable.HideUI;
end;

procedure TForm5.PivotShowUI;
begin
  WebCharts1.ContinuosProject
    .WindowParent(CEFWindowParent1)
    .WebBrowser(Chromium1)
    .PivotTable.ShowUI;
end;
end.
