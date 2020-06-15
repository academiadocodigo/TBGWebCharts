unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient;

type
  TForm2 = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    SpeedButton1: TSpeedButton;
    cbTypeChart: TComboBox;
    SpeedButton2: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    ValueListEditor1: TValueListEditor;
    Panel17: TPanel;
    ValueListEditor15: TValueListEditor;
    TabSheet4: TTabSheet;
    ValueListEditor2: TValueListEditor;
    TabSheet5: TTabSheet;
    ScrollBox2: TScrollBox;
    ValueListEditor3: TValueListEditor;
    Panel10: TPanel;
    ValueListEditor4: TValueListEditor;
    Panel11: TPanel;
    ValueListEditor5: TValueListEditor;
    Panel12: TPanel;
    ValueListEditor6: TValueListEditor;
    TabSheet6: TTabSheet;
    ScrollBox1: TScrollBox;
    ValueListEditor7: TValueListEditor;
    Panel13: TPanel;
    ValueListEditor8: TValueListEditor;
    Panel14: TPanel;
    ValueListEditor9: TValueListEditor;
    Panel15: TPanel;
    ValueListEditor10: TValueListEditor;
    TabSheet7: TTabSheet;
    ValueListEditor11: TValueListEditor;
    TabSheet8: TTabSheet;
    ValueListEditor12: TValueListEditor;
    Panel16: TPanel;
    ValueListEditor13: TValueListEditor;
    TabSheet9: TTabSheet;
    ValueListEditor14: TValueListEditor;
    TabSheet10: TTabSheet;
    ValueListEditor16: TValueListEditor;
    TabSheet11: TTabSheet;
    ValueListEditor17: TValueListEditor;
    Table: TTabSheet;
    ValueListEditor18: TValueListEditor;
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
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  View.WebCharts, Charts.Types, System.TypInfo;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
    PageControl2.ActivePageIndex := 0;
    SpeedButton2Click(Self);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var
  WebCharts1 : TWebCharts;
begin
  WebCharts1 := TWebCharts.Create;
  if cbTypeChart.Text='table' then
  begin
  WebCharts1
    .NewProject
    .Table
      .TableClass
        .tableSm
        .tableHover
      .EndTableClass
      .TableOptions
        .Responsive(ValueListEditor18.Values['Responsive'].ToBoolean)
        .ScrollCollapse(ValueListEditor18.Values['ScrollCollapse'].ToBoolean)
        .DisplayStart(ValueListEditor18.Values['DisplayStart'].ToInteger)
        .LengthMenu(ValueListEditor18.Values['LengthMenu'])
        .Order(ValueListEditor18.Values['Order'])
        .OrderFixed(ValueListEditor18.Values['OrderFixed'])
        .OrderMulti(ValueListEditor18.Values['OrderMulti'].ToBoolean)
        .PageLength(ValueListEditor18.Values['PageLength'].ToInteger)
        .PagingType(ValueListEditor18.Values['PagingType'])
      .&End
      .TableFeatures
        .Info(ValueListEditor18.Values['Info'].ToBoolean)
        .LengthChange(ValueListEditor18.Values['LengthChange'].ToBoolean)
        .Ordering(ValueListEditor18.Values['Ordering'].ToBoolean)
        .Paging(ValueListEditor18.Values['Paging'].ToBoolean)
        .Processing(ValueListEditor18.Values['Processing'].ToBoolean)
        .ScrollX(ValueListEditor18.Values['ScrollX'].ToBoolean)
        .ScrollY(ValueListEditor18.Values['ScrollY'].ToInteger)
        .Searching(ValueListEditor18.Values['Searching'].ToBoolean)
      .&End
      .DataSet
        .CallbackLink('CustNo', 'RelCust')
        .CallbackLink('Contact', 'RelContato')
        .DataSet(ClientDataSet5)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
  end
  else
  begin
  WebCharts1
  .CDN(false)
  .BackgroundColor(ValueListEditor1.Values['BackgroundColor'])
  .FontColor(ValueListEditor1.Values['FontColor'])
  .NewProject
    .Charts
      ._ChartType(TTypeChart(GetEnumValue(TypeInfo(TTypeChart), cbTypeChart.Text)))
        .Attributes
          .Name(ValueListEditor2.Values['Name'])
          .ColSpan(ValueListEditor2.Values['ColSpan'].ToInteger)
          .Width(ValueListEditor2.Values['Width'].ToInteger)
          .Heigth(ValueListEditor2.Values['Heigth'].ToInteger)
          .BackgroundColor(ValueListEditor2.Values['BackgroundColor'])
          .Options
            .SemiCircule(ValueListEditor15.Values['SemiCircule'].ToBoolean)
            .Legend
              .display(ValueListEditor12.Values['display'].ToBoolean)
              .position(ValueListEditor12.Values['position'])
              .Labels
                .fontSize(ValueListEditor13.Values['fontSize'].ToInteger)
                .fontStyle(ValueListEditor13.Values['fontStyle'])
                .fontColorHEX(ValueListEditor13.Values['fontColorHEX'])
                .fontFamily(ValueListEditor13.Values['fontFamily'])
                .padding(ValueListEditor13.Values['padding'].ToInteger)
              .&End
            .&End
            .Title
              .text(ValueListEditor14.Values['text'])
              .display(ValueListEditor14.Values['display'].ToBoolean)
              .position(ValueListEditor14.Values['position'])
              .fontSize(ValueListEditor14.Values['fontSize'].ToInteger)
              .fontFamily(ValueListEditor14.Values['fontFamily'])
              .fontColorHEX(ValueListEditor14.Values['fontColorHEX'])
              .fontStyle(ValueListEditor14.Values['fontStyle'])
              .padding(ValueListEditor14.Values['padding'].ToInteger)
            .&End
            .Scales
              .Axes
                .xAxe
                  .Position(ValueListEditor3.Values['Position']) //top', 'left', 'bottom','right'
                  .OffSet(ValueListEditor3.Values['OffSet'].ToBoolean)
                  ._Type(ValueListEditor3.Values['type'])
                  .Stacked(ValueListEditor3.Values['Stacked'].ToBoolean)
                  .Ticks
                    .fontColor(ValueListEditor4.Values['fontColor'])
                    .fontSize(ValueListEditor4.Values['fontSize'].ToInteger)
                    .autoSkip(ValueListEditor4.Values['autoSkip'].ToBoolean)
                    .autoSkipPadding(ValueListEditor4.Values['autoSkipPadding'].ToInteger)
                    .labelOffset(ValueListEditor4.Values['labelOffset'].ToInteger)
                    .maxRotation(ValueListEditor4.Values['maxRotation'].ToInteger)
                    .minRotation(ValueListEditor4.Values['minRotation'].ToInteger)
                    .mirror(ValueListEditor4.Values['mirror'].ToBoolean)
                    .padding(ValueListEditor4.Values['padding'].ToInteger)
                    .format(ValueListEditor4.Values['format'])
                  .&End
                  .GridLines
                    .display(ValueListEditor5.Values['display'].ToBoolean)
                    .circular(ValueListEditor5.Values['circular'].ToBoolean)
                    .colorRGBA(ValueListEditor5.Values['colorRGBA'])
                    .drawBorder(ValueListEditor5.Values['drawBorder'].ToBoolean)
                    .drawOnChartArea(ValueListEditor5.Values['drawOnChartArea'].ToBoolean)
                    .drawTicks(ValueListEditor5.Values['drawTicks'].ToBoolean)
                    .tickMarkLength(ValueListEditor5.Values['tickMarkLength'].ToInteger)
                    .zeroLineWidth(ValueListEditor5.Values['zeroLineWidth'].ToInteger)
                    .zeroLineColorRGBA(ValueListEditor5.Values['zeroLineColorRGBA'])
                  .&End
                  .ScaleLabel
                    .display(ValueListEditor6.Values['display'].ToBoolean)
                    .labelString(ValueListEditor6.Values['labelString'])
                    .fontColorHEX(ValueListEditor6.Values['fontColorHEX'])
                    .fontFamily(ValueListEditor6.Values['fontFamily'])
                    .fontSize(ValueListEditor6.Values['fontSize'].ToInteger)
                    .fontStyle(ValueListEditor6.Values['fontStyle']) //i.e. normal, bold, italic, oblique, initial, inherit
                    .padding(ValueListEditor6.Values['padding'].ToInteger)
                  .&End
                .&End
                .yAxe
                  .Position(ValueListEditor7.Values['Position']) //top', 'left', 'bottom','right'
                  .OffSet(ValueListEditor7.Values['OffSet'].ToBoolean)
                  ._type(ValueListEditor7.Values['type'])
                  .Stacked(ValueListEditor7.Values['Stacked'].ToBoolean)
                  .Ticks
                    .fontColor(ValueListEditor8.Values['fontColor'])
                    .fontSize(ValueListEditor8.Values['fontSize'].ToInteger)
                    .autoSkip(ValueListEditor8.Values['autoSkip'].ToBoolean)
                    .autoSkipPadding(ValueListEditor8.Values['autoSkipPadding'].ToInteger)
                    .labelOffset(ValueListEditor8.Values['labelOffset'].ToInteger)
                    .maxRotation(ValueListEditor8.Values['maxRotation'].ToInteger)
                    .minRotation(ValueListEditor8.Values['minRotation'].ToInteger)
                    .mirror(ValueListEditor8.Values['mirror'].ToBoolean)
                    .padding(ValueListEditor8.Values['padding'].ToInteger)
                    .format(ValueListEditor8.Values['format'])
                  .&End
                  .GridLines
                    .display(ValueListEditor9.Values['display'].ToBoolean)
                    .circular(ValueListEditor9.Values['circular'].ToBoolean)
                    .colorRGBA(ValueListEditor9.Values['colorRGBA'])
                    .drawBorder(ValueListEditor9.Values['drawBorder'].ToBoolean)
                    .drawOnChartArea(ValueListEditor9.Values['drawOnChartArea'].ToBoolean)
                    .drawTicks(ValueListEditor9.Values['drawTicks'].ToBoolean)
                    .tickMarkLength(ValueListEditor9.Values['tickMarkLength'].ToInteger)
                    .zeroLineWidth(ValueListEditor9.Values['zeroLineWidth'].ToInteger)
                    .zeroLineColorRGBA(ValueListEditor9.Values['zeroLineColorRGBA'])
                  .&End
                  .ScaleLabel
                    .display(ValueListEditor10.Values['display'].ToBoolean)
                    .labelString(ValueListEditor10.Values['labelString'])
                    .fontColorHEX(ValueListEditor10.Values['fontColorHEX'])
                    .fontFamily(ValueListEditor10.Values['fontFamily'])
                    .fontSize(ValueListEditor10.Values['fontSize'].ToInteger)
                    .fontStyle(ValueListEditor10.Values['fontStyle']) //i.e. normal, bold, italic, oblique, initial, inherit
                    .padding(ValueListEditor10.Values['padding'].ToInteger)
                  .&End
                .&End
              .&End
            .&End
            .Tooltip
              .Format(ValueListEditor17.Values['Format'])
            .&End
          .&End
          .Labelling
            .Format(ValueListEditor11.Values['Format']) //Consultar em http://numeraljs.com/#format
            .RGBColor(ValueListEditor11.Values['RGBColor']) //Cor RGB separado por Virgula
            .FontSize(ValueListEditor11.Values['FontSize'].ToInteger)
            .FontStyle(ValueListEditor11.Values['FontStyle']) //normal, bold, italic
            .FontFamily(ValueListEditor11.Values['FontFamily']) //Open Sans, Arial, Helvetica e etc..
            .Padding(ValueListEditor11.Values['Padding'].ToInteger) //Numeros negativos e positivos
          .&End
          .DataSet
            .DataSet(ClientDataSet1)
            .textLabel(ValueListEditor16.Values['textLabel'])
            .BackgroundColor(ValueListEditor16.Values['BackgroundColor'])
            .BorderColor(ValueListEditor16.Values['BorderColor'])
            .BorderWidth(ValueListEditor16.Values['BorderWidth'].ToInteger)
            .Fill(ValueListEditor16.Values['Fill'].ToBoolean)
          .&End
          .DataSet
            .BackgroundColor('30,182,203')
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
  end;
end;

end.
