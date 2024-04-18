unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.ValEdit,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.OleCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.DBGrids,
  SHDocVw;

type
  TForm2 = class(TForm)
    Button1: TButton;
    cbTypeChart: TComboBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Label: TStringField;
    ClientDataSet1RGB: TStringField;
    ClientDataSet1Value: TStringField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet5: TClientDataSet;
    ClientDataSet5City: TStringField;
    ClientDataSet5Company: TStringField;
    ClientDataSet5Contact: TStringField;
    ClientDataSet5Country: TStringField;
    ClientDataSet5CustNo: TFloatField;
    ClientDataSet5Phone: TStringField;
    ClientDataSet5State: TStringField;
    ClientDataSet5TaxRate: TFloatField;
    ClientDataSet5Zip: TStringField;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label3: TLabel;
    PageControl2: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    pnlEditar: TPanel;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Table: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    ValueListEditor1: TValueListEditor;
    ValueListEditor10: TValueListEditor;
    ValueListEditor11: TValueListEditor;
    ValueListEditor12: TValueListEditor;
    ValueListEditor13: TValueListEditor;
    ValueListEditor14: TValueListEditor;
    ValueListEditor15: TValueListEditor;
    ValueListEditor16: TValueListEditor;
    ValueListEditor17: TValueListEditor;
    ValueListEditor18: TValueListEditor;
    ValueListEditor2: TValueListEditor;
    ValueListEditor3: TValueListEditor;
    ValueListEditor4: TValueListEditor;
    ValueListEditor5: TValueListEditor;
    ValueListEditor6: TValueListEditor;
    ValueListEditor7: TValueListEditor;
    ValueListEditor8: TValueListEditor;
    ValueListEditor9: TValueListEditor;
    WebBrowser1: TWebBrowser;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  end;

var
  Form2: TForm2;

implementation

uses
  System.TypInfo,
  View.WebCharts,
  Charts.Types;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  WebCharts1: TWebCharts;
begin
  WebCharts1 := TWebCharts.Create;
  try
    WebCharts1
    .ContinuosProject
      .WebBrowser(WebBrowser1)
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name(ValueListEditor2.Values['Name'])
            .DataSet
              .DataSet(ClientDataSet1)
              .TextLabel(ValueListEditor16.Values['textLabel'])
              .BackgroundColor(ValueListEditor16.Values['BackgroundColor'])
            .&End
            .DataSet
              .BackgroundColor('30,182,203')
              .TextLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
            .&End
          .&End
        .UpdateChart
      .&End
    .&End
  finally
    WebCharts1.Free;
  end;

end;

procedure TForm2.ComboBox1Select(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: DataSource1.DataSet := ClientDataset1;
    1: DataSource1.DataSet := ClientDataset2;
    2: DataSource1.DataSet := ClientDataset5;
  end;
end;

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
  WebCharts1: TWebCharts;
begin
  WebCharts1 := TWebCharts.Create;
  try
    if cbTypeChart.Text = 'table' then
    begin
      WebCharts1
        .NewProject
        .Table
          .TableClass
            .TableSm
            .TableHover
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
                .HideLabelEmptyData(ValueListEditor15.Values['HideLabelEmptyData'].ToBoolean)
                .SkipEmptyData(ValueListEditor15.Values['SkipEmptyData'].ToBoolean)
                .Legend
                  .Display(ValueListEditor12.Values['display'].ToBoolean)
                  .Position(ValueListEditor12.Values['position'])
                  .Labels
                    .FontSize(ValueListEditor13.Values['fontSize'].ToInteger)
                    .FontStyle(ValueListEditor13.Values['fontStyle'])
                    .FontColorHEX(ValueListEditor13.Values['fontColorHEX'])
                    .FontFamily(ValueListEditor13.Values['fontFamily'])
                    .Padding(ValueListEditor13.Values['padding'].ToInteger)
                  .&End
                .&End
                .Title
                  .Text(ValueListEditor14.Values['text'])
                  .Display(ValueListEditor14.Values['display'].ToBoolean)
                  .Position(ValueListEditor14.Values['position'])
                  .FontSize(ValueListEditor14.Values['fontSize'].ToInteger)
                  .FontFamily(ValueListEditor14.Values['fontFamily'])
                  .FontColorHEX(ValueListEditor14.Values['fontColorHEX'])
                  .FontStyle(ValueListEditor14.Values['fontStyle'])
                  .Padding(ValueListEditor14.Values['padding'].ToInteger)
                .&End
                .Scales
                  .Axes
                    .XAxe
                      .Position(ValueListEditor3.Values['Position']) //top', 'left', 'bottom','right'
                      .OffSet(ValueListEditor3.Values['OffSet'].ToBoolean)
                      ._Type(ValueListEditor3.Values['type'])
                      .Stacked(ValueListEditor3.Values['Stacked'].ToBoolean)
                      .Ticks
                        .FontColor(ValueListEditor4.Values['fontColor'])
                        .FontFamily(ValueListEditor4.Values['fontFamily'])
                        .FontSize(ValueListEditor4.Values['fontSize'].ToInteger)
                        .AutoSkip(ValueListEditor4.Values['autoSkip'].ToBoolean)
                        .AutoSkipPadding(ValueListEditor4.Values['autoSkipPadding'].ToInteger)
                        .LabelOffset(ValueListEditor4.Values['labelOffset'].ToInteger)
                        .MaxRotation(ValueListEditor4.Values['maxRotation'].ToInteger)
                        .MinRotation(ValueListEditor4.Values['minRotation'].ToInteger)
                        .Mirror(ValueListEditor4.Values['mirror'].ToBoolean)
                        .Padding(ValueListEditor4.Values['padding'].ToInteger)
                        .Format(ValueListEditor4.Values['format'])
                        .BeginAtZero(ValueListEditor4.Values['BeginAtZero'].ToBoolean)
                      .&End
                      .GridLines
                        .Display(ValueListEditor5.Values['display'].ToBoolean)
                        .Circular(ValueListEditor5.Values['circular'].ToBoolean)
                        .ColorRGBA(ValueListEditor5.Values['colorRGBA'])
                        .DrawBorder(ValueListEditor5.Values['drawBorder'].ToBoolean)
                        .DrawOnChartArea(ValueListEditor5.Values['drawOnChartArea'].ToBoolean)
                        .DrawTicks(ValueListEditor5.Values['drawTicks'].ToBoolean)
                        .TickMarkLength(ValueListEditor5.Values['tickMarkLength'].ToInteger)
                        .ZeroLineWidth(ValueListEditor5.Values['zeroLineWidth'].ToInteger)
                        .ZeroLineColorRGBA(ValueListEditor5.Values['zeroLineColorRGBA'])
                      .&End
                      .ScaleLabel
                        .Display(ValueListEditor6.Values['display'].ToBoolean)
                        .LabelString(ValueListEditor6.Values['labelString'])
                        .FontColorHEX(ValueListEditor6.Values['fontColorHEX'])
                        .FontFamily(ValueListEditor6.Values['fontFamily'])
                        .FontSize(ValueListEditor6.Values['fontSize'].ToInteger)
                        .FontStyle(ValueListEditor6.Values['fontStyle']) //i.e. normal, bold, italic, oblique, initial, inherit
                        .Padding(ValueListEditor6.Values['padding'].ToInteger)
                      .&End
                    .&End
                    .YAxe
                      .Position(ValueListEditor7.Values['Position']) //top', 'left', 'bottom','right'
                      .OffSet(ValueListEditor7.Values['OffSet'].ToBoolean)
                      ._Type(ValueListEditor7.Values['type'])
                      .Stacked(ValueListEditor7.Values['Stacked'].ToBoolean)
                      .Ticks
                        .FontColor(ValueListEditor8.Values['fontColor'])
                        .FontFamily(ValueListEditor8.Values['fontFamily'])
                        .FontSize(ValueListEditor8.Values['fontSize'].ToInteger)
                        .AutoSkip(ValueListEditor8.Values['autoSkip'].ToBoolean)
                        .AutoSkipPadding(ValueListEditor8.Values['autoSkipPadding'].ToInteger)
                        .LabelOffset(ValueListEditor8.Values['labelOffset'].ToInteger)
                        .MaxRotation(ValueListEditor8.Values['maxRotation'].ToInteger)
                        .MinRotation(ValueListEditor8.Values['minRotation'].ToInteger)
                        .Mirror(ValueListEditor8.Values['mirror'].ToBoolean)
                        .Padding(ValueListEditor8.Values['padding'].ToInteger)
                        .Format(ValueListEditor8.Values['format'])
                        .BeginAtZero(ValueListEditor8.Values['BeginAtZero'].ToBoolean)
                      .&End
                      .GridLines
                        .Display(ValueListEditor9.Values['display'].ToBoolean)
                        .Circular(ValueListEditor9.Values['circular'].ToBoolean)
                        .ColorRGBA(ValueListEditor9.Values['colorRGBA'])
                        .DrawBorder(ValueListEditor9.Values['drawBorder'].ToBoolean)
                        .DrawOnChartArea(ValueListEditor9.Values['drawOnChartArea'].ToBoolean)
                        .DrawTicks(ValueListEditor9.Values['drawTicks'].ToBoolean)
                        .TickMarkLength(ValueListEditor9.Values['tickMarkLength'].ToInteger)
                        .ZeroLineWidth(ValueListEditor9.Values['zeroLineWidth'].ToInteger)
                        .ZeroLineColorRGBA(ValueListEditor9.Values['zeroLineColorRGBA'])
                      .&End
                      .ScaleLabel
                        .Display(ValueListEditor10.Values['display'].ToBoolean)
                        .LabelString(ValueListEditor10.Values['labelString'])
                        .FontColorHEX(ValueListEditor10.Values['fontColorHEX'])
                        .FontFamily(ValueListEditor10.Values['fontFamily'])
                        .FontSize(ValueListEditor10.Values['fontSize'].ToInteger)
                        .FontStyle(ValueListEditor10.Values['fontStyle']) //i.e. normal, bold, italic, oblique, initial, inherit
                        .Padding(ValueListEditor10.Values['padding'].ToInteger)
                      .&End
                    .&End
                  .&End
                .&End
                .Tooltip
                  .Enabled(ValueListEditor17.Values['Enabled'].ToBoolean)
                  .Format(ValueListEditor17.Values['Format'])
                  .Intersect(ValueListEditor17.Values['Intersect'].ToBoolean)
                  .DisplayTitle(ValueListEditor17.Values['DisplayTitle'].ToBoolean)
                  .HideZeroValues(ValueListEditor17.Values['HideZeroValues'].ToBoolean)
                .&End
              .&End
              .Labelling
                .Format(ValueListEditor11.Values['Format']) //Consultar em http://numeraljs.com/#Format
                .RGBColor(ValueListEditor11.Values['RGBColor']) //Cor RGB separado por Virgula
                .FontSize(ValueListEditor11.Values['FontSize'].ToInteger)
                .FontStyle(ValueListEditor11.Values['FontStyle']) //normal, bold, italic
                .FontFamily(ValueListEditor11.Values['FontFamily']) //Open Sans, Arial, Helvetica e etc..
                .HideZeroValues(ValueListEditor11.Values['HideZeroValues'].ToBoolean)
                .Padding(ValueListEditor11.Values['Padding'].ToInteger) //Numeros negativos e positivos
                .PaddingX(ValueListEditor11.Values['PaddingX'].ToInteger)
              .&End
              .DataSet
                .Hidden(ValueListEditor16.Values['Hidden'].ToBoolean)
                .HideZeroValuesControl(ValueListEditor16.Values['HideZeroValuesControl'].ToBoolean)
                .DataSet(ClientDataSet1)
                .TextLabel(ValueListEditor16.Values['textLabel'])
                .BackgroundColor(ValueListEditor16.Values['BackgroundColor'])
                .BorderColor(ValueListEditor16.Values['BorderColor'])
                .BorderWidth(ValueListEditor16.Values['BorderWidth'].ToInteger)
                .Fill(ValueListEditor16.Values['Fill'].ToBoolean)
                .LineTension(ValueListEditor16.Values['LineTension'].ToInteger)
                .BorderDash(ValueListEditor16.Values['BorderDash(Lenght)'].ToInteger, ValueListEditor16.Values['BorderDash(Space)'].ToInteger)
              .&End
              .DataSet
                .BackgroundColor('30,182,203')
                .TextLabel('Meu DataSet 2')
                .DataSet(ClientDataSet2)
              .&End
            .&End
          .&End
        .&End
      .WebBrowser(WebBrowser1)
      .Generated;
    end;
  finally
    webcharts1.free;
  end;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  pnlEditar.Visible := not pnlEditar.Visible;
end;

end.
