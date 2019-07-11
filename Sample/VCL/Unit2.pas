unit Unit2;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Buttons,
  ExtCtrls, View.WebCharts, OleCtrls, SHDocVw,
  DBCtrls, StdCtrls,
  DB, DBClient,  Grids, DBGrids,
  ComCtrls, Vcl.ValEdit, Interfaces;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    WebCharts1: TWebCharts;
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
    DBNavigator1: TDBNavigator;
    Panel8: TPanel;
    ComboBox1: TComboBox;
    Carregar: TButton;
    Panel9: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ValueListEditor1: TValueListEditor;
    ValueListEditor2: TValueListEditor;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    ValueListEditor11: TValueListEditor;
    TabSheet8: TTabSheet;
    ValueListEditor12: TValueListEditor;
    Panel16: TPanel;
    ValueListEditor13: TValueListEditor;
    TabSheet9: TTabSheet;
    ValueListEditor14: TValueListEditor;
    Panel17: TPanel;
    ValueListEditor15: TValueListEditor;
    Panel18: TPanel;
    cbTypeChart: TComboBox;
    TabSheet10: TTabSheet;
    ValueListEditor16: TValueListEditor;
    SpeedButton1: TSpeedButton;
    ScrollBox1: TScrollBox;
    ValueListEditor7: TValueListEditor;
    Panel13: TPanel;
    ValueListEditor8: TValueListEditor;
    Panel14: TPanel;
    ValueListEditor9: TValueListEditor;
    Panel15: TPanel;
    ValueListEditor10: TValueListEditor;
    ScrollBox2: TScrollBox;
    ValueListEditor3: TValueListEditor;
    Panel10: TPanel;
    ValueListEditor4: TValueListEditor;
    Panel11: TPanel;
    ValueListEditor5: TValueListEditor;
    Panel12: TPanel;
    ValueListEditor6: TValueListEditor;
    TabSheet11: TTabSheet;
    ValueListEditor17: TValueListEditor;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CarregarClick(Sender: TObject);
    procedure teste22Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure btnSemiCirculeClick(Sender: TObject);
    procedure btnBarsStackedClick(Sender: TObject);
    procedure btnBarCallClick(Sender: TObject);
    procedure btnBarLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RelCust(Value : Integer);
    procedure ShowButtons(Value : String);
    procedure RelAvatar(Value : Currency);
    procedure RelContato(Value : String);
    procedure SampleWC(Value : Currency);
    procedure CallBack(value : string);
  end;

var
  Form2: TForm2;

implementation

uses
  Charts.Types, TypInfo;

{$R *.dfm}

procedure TForm2.btnBarCallClick(Sender: TObject);
begin
PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .CallBackLink('CallBack')
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
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
  .CallbackJS
      .ClassProvider(Self)
    .&End
  .Generated;
end;

procedure TForm2.btnBarLabelClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Labelling
            .Format('$0,0.00') //Consultar em http://numeraljs.com/#format
            .RGBColor('102,102,102') //Cor RGB separado por Virgula
            .FontSize(10) //Tamanho da Fonte
            .FontStyle('normal') //normal, bold, italic
            .FontFamily('Open Sans') //Open Sans, Arial, Helvetica e etc..
            .Padding(5) //Numeros negativos e positivos
          .&End
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          //.Title('Meu Gráfico de Barras')
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
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

procedure TForm2.btnBarsStackedClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
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
          .Options
            .Scales
              .Axes
                .xAxe
                  .Stacked(True)
                .&End
                .yAxe
                  .Stacked(True)
                .&End
              .&End
            .&End
          .&End
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

procedure TForm2.btnSemiCirculeClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Name('Meu Grafico Doughnut')
          .ColSpan(12)
          .Options
            .SemiCircule(True)
          .&End
          .DataSet
            .textLabel('Meu DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ClientDataSet1.SaveToFile('Data\CDSChats.xml');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ClientDataSet2.SaveToFile('Data\CDSChats2.xml');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ClientDataSet3.SaveToFile('Data\CDSChats3.xml');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  ClientDataSet4.SaveToFile('Data\CDSChats4.xml');
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Grafico de Barras')
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
         //.Title('Meu Grafico de Barras')
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
          .DataSet
            .textLabel('Meu DataSet 2')
            .DataSet(ClientDataSet2)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.CarregarClick(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : DataSource1.DataSet := ClientDataSet1;
    1 : DataSource1.DataSet := ClientDataSet2;
    2 : DataSource1.DataSet := ClientDataSet3;
    3 : DataSource1.DataSet := ClientDataSet4;
    4 : DataSource1.DataSet := ClientDataSet5;
    5 : DataSource1.DataSet := ClientDataSet6;
    6 : DataSource1.DataSet := ClientDataSet7;
  end;

end;

procedure TForm2.RelAvatar(Value : Currency);
begin
  PageControl1.ActivePageIndex := 0;

  ClientDataSet6.Filtered := false;
  ClientDataSet6.Filter := 'ACCT_NBR = ' + CurrToStr(Value);
  ClientDataSet6.Filtered := true;



  WebCharts1
    .NewProject
    .Rows
      ._Div
        .ColSpan(3)
        .Add(
          WebCharts1
          .ContinuosProject
          .Image
            .ImageClass
              .rounded
              .imgThumbnail
            .&End
            .DataSet
              .Field('PICTURE')
              .DataSet(ClientDataSet6)
            .&End
          .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(6)
        .Add(
          WebCharts1
          .ContinuosProject
          .Rows
            .Title
              .Configuracoes
                .H1(
                  ClientDataSet6.FieldByName('FIRST_NAME').AsString + ' ' +
                  ClientDataSet6.FieldByName('LAST_NAME').AsString
                )
              .&End
            .&End
          .&End
          .HTML
          +
          WebCharts1
          .ContinuosProject
          .Rows
            .Title
              .Configuracoes
                .H5(
                  ClientDataSet6.FieldByName('CITY').AsString + ' - ' +
                  ClientDataSet6.FieldByName('STATE').AsString
                )
              .&End
            .&End
          .&End
          .HTML
          +
          WebCharts1
          .ContinuosProject
          .Jumpline
          .Rows
            ._P
              ._Class('text-muted')
              .Add('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dictum nisl ut porttitor feugiat. ')
              .Add('Mauris et velit id diam laoreet efficitur. Sed a accumsan ligula, ut interdum risus. Donec vel libero')
              .Add('id enim efficitur lobortis. Nulla aliquam felis at nisi pretium porta. Sed id leo sem. Suspendisse consequat,')
              .Add(' purus at aliquet auctor, dolor felis sollicitudin massa, ut vestibulum est ipsum eu tortor.')
            .&End
          .&End
          .HTML
        )
      .&End
      ._Div
        .ColSpan(3)
        .Add(
          '<ul class="list-group">' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Cras justo odio' +
          '<span class="badge badge-primary badge-pill">$ 14.256,23</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Dapibus ac facilisis' +
          '<span class="badge badge-primary badge-pill">$ 236,22</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-success badge-pill">#1</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-danger badge-pill">-561</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-warning badge-pill">1</span>' +
          '</li>' +
          '</ul>')
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Rows
      ._Div
        .ColSpan(3)
        .Add(
          '<ul class="list-group">' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Cras justo odio' +
          '<span class="badge badge-light badge-pill">$ 14.256,23</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Dapibus ac facilisis' +
          '<span class="badge badge-light badge-pill">$ 236,22</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-light badge-pill">#1</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-light badge-pill">-561</span>' +
          '</li>' +
          '<li class="list-group-item d-flex justify-content-between align-items-center">' +
          'Morbi leo risus' +
          '<span class="badge badge-light badge-pill">1</span>' +
          '</li>' +
          '</ul>')
      .&End
      ._Div
        .ColSpan(9)
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(line)
              .Attributes
                .ColSpan(12)
                .Name('l1')
                .Heigth(100)
                //.Legend(False)
                .DataSet
                  .textLabel('l1')
                  .DataSet(ClientDataSet3)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
    .&End
    .Jumpline
    .Rows
      .Tag
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(doughnut)
              .Attributes
                .ColSpan(4)
                .Name('d1')
                //.Legend(True)
                .DataSet
                  .textLabel('d1')
                  .DataSet(ClientDataSet4)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
      .Tag
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(doughnut)
              .Attributes
                .ColSpan(4)
                .Name('d2')
                //.Legend(True)
                .DataSet
                  .textLabel('d2')
                  .DataSet(ClientDataSet4)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
      .Tag
        .Add(
           WebCharts1
          .ContinuosProject
          .Charts
            ._ChartType(doughnut)
              .Attributes
                .ColSpan(4)
                .Name('d3')
                //.Legend(True)
                .DataSet
                  .textLabel('d3')
                  .DataSet(ClientDataSet4)
                  .Fill(False)
                .&End
            .&End
          .&End
          .HTML
        )
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;

end;

procedure TForm2.RelContato(Value: String);
begin
  WebCharts1
    .NewProject
      .Rows
        .Title
          .Configuracoes
            .H2(Value)
          .&End
        .&End
      .&End
      .Charts
        ._ChartType(line)
          .Attributes
            .Name('l1')
            .ColSpan(12)
            .DataSet
              .DataSet(ClientDataSet1)
              .textLabel('Vendas do Mes')
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   TabSheet1.TabVisible := False;
   TabSheet2.TabVisible := False;
end;

procedure TForm2.RelCust(Value: Integer);
begin
  ShowMessage(IntToStr(Value));
end;

procedure TForm2.SampleWC(Value: Currency);
begin
  ShowMessage(CurrToStr(Value));
end;

procedure TForm2.ShowButtons(Value: String);
begin
  ShowMessage(Value);
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
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
                    .autoSkip(ValueListEditor4.Values['autoSkip'].ToBoolean)
                    .autoSkipPadding(ValueListEditor4.Values['autoSkipPadding'].ToInteger)
                    .labelOffset(ValueListEditor4.Values['labelOffset'].ToInteger)
                    .maxRotation(ValueListEditor4.Values['maxRotation'].ToInteger)
                    .minRotation(ValueListEditor4.Values['minRotation'].ToInteger)
                    .mirror(ValueListEditor4.Values['mirror'].ToBoolean)
                    .padding(ValueListEditor4.Values['padding'].ToInteger)
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
                    .autoSkip(ValueListEditor8.Values['autoSkip'].ToBoolean)
                    .autoSkipPadding(ValueListEditor8.Values['autoSkipPadding'].ToInteger)
                    .labelOffset(ValueListEditor8.Values['labelOffset'].ToInteger)
                    .maxRotation(ValueListEditor8.Values['maxRotation'].ToInteger)
                    .minRotation(ValueListEditor8.Values['minRotation'].ToInteger)
                    .mirror(ValueListEditor8.Values['mirror'].ToBoolean)
                    .padding(ValueListEditor8.Values['padding'].ToInteger)
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
            .Tootip
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

procedure TForm2.SpeedButton11Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
    .Cards
      .FieldHeader('Company')
      .FieldTitle('City')
      .FieldBody('Contact')
      .ColSpan(4)
      .Colors
        .Secondary
      .&End
      .DataSet
        .DataSet(ClientDataSet5)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton12Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  WebCharts1
    .NewProject
    .Image
      .ImageClass
        .rounded
        .imgThumbnail
      .&End
      .DataSet
        .Field('PICTURE')
        .DataSet(ClientDataSet6)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton13Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  WebCharts1
    .NewProject
    .Table
      .TableClass
        .tableSm
        .tableHover
      .EndTableClass
      .DataSet
        .CallbackLink('ACCT_NBR', 'RelAvatar')
        .DataSet(ClientDataSet7)
      .&End
    .&End
    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm2.SpeedButton14Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  WebCharts1
    .NewProject

    .Buttons
      .Title('Primary')
      .ButtonClass
        .primary
      .&End
      .CallbackLink('Primary', 'ShowButtons')
    .&End

    .Buttons
      .Title('secondary')
      .ButtonClass
        .secondary
      .&End
      .CallbackLink('secondary', 'ShowButtons')
    .&End

    .Buttons
      .Title('success')
      .ButtonClass
        .success
      .&End
      .CallbackLink('success', 'ShowButtons')
    .&End

    .Buttons
      .Title('danger')
      .ButtonClass
        .danger
      .&End
      .CallbackLink('danger', 'ShowButtons')
    .&End

    .Buttons
      .Title('warning')
      .ButtonClass
        .warning
      .&End
      .CallbackLink('warning', 'ShowButtons')
    .&End

    .Buttons
      .Title('info')
      .ButtonClass
        .info
      .&End
      .CallbackLink('info', 'ShowButtons')
    .&End

    .Buttons
      .Title('light')
      .ButtonClass
        .light
      .&End
      .CallbackLink('light', 'ShowButtons')
    .&End

    .Buttons
      .Title('dark')
      .ButtonClass
        .dark
      .&End
      .CallbackLink('dark', 'ShowButtons')
    .&End

    .Jumpline
    .Jumpline

    .Buttons
      .Title('outline')
      .ButtonClass
        .outline
        .primary
      .&End
      .CallbackLink('outline', 'ShowButtons')
    .&End

    .Buttons
      .Title('small')
      .ButtonClass
        .secondary
        .small
      .&End
      .CallbackLink('small', 'ShowButtons')
    .&End

    .Buttons
      .Title('large')
      .ButtonClass
        .success
        .large
      .&End
      .CallbackLink('large', 'ShowButtons')
    .&End

    .Jumpline
    .Jumpline

    .Buttons
      .Title('block')
      .ButtonClass
        .danger
        .block
      .&End
      .CallbackLink('block', 'ShowButtons')
    .&End

    .Jumpline
    .Jumpline

    .Buttons
      .Title('active')
      .ButtonClass
        .warning
        .active
      .&End
      .CallbackLink('active', 'ShowButtons')
    .&End

    .Buttons
      .Title('disabled')
      .ButtonClass
        .info
        .disabled
      .&End
      .CallbackLink('disabled', 'ShowButtons')
    .&End


    .WebBrowser(WebBrowser1)
    .CallbackJS
      .ClassProvider(Self)
    .&End
    .Generated;
end;

procedure TForm2.SpeedButton15Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
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
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  WebCharts1
    .NewProject
    .Table
      .TableClass
        .tableSm
        .tableHover
      .EndTableClass
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
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(doughnut)
        .Attributes
          .Labelling
            .Format('0%') //Consultar em http://numeraljs.com/#format
            .RGBColor('255,255,255') //Cor RGB separado por Virgula
            .FontSize(12)
            .FontStyle('bold') //normal, bold, italic
            .FontFamily('Arial') //Open Sans, Arial, Helvetica e etc..
            .Padding(5) //Numeros negativos e positivos
          .&End
          .Name('Meu Grafico Doughnut')
          .ColSpan(12)
          .DataSet
            .textLabel('Meu DataSet 4')
            .DataSet(ClientDataSet4)
          .&End
          .DataSet
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gráfico de Barras')
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

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Charts
        ._ChartType(line)
          .Attributes
            //.Labelling(True)
            .Name('Meu Grafico de Barras')
            .ColSpan(12)
            //.Title('Meu Grafico de Barras')
            .DataSet
              .textLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
              .Fill(False)
            .&End
            .DataSet
              .textLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
              .BackgroundColor('30,182,203')
              .BorderColor('30,182,203')
              .Fill(False)
            .&End

          .&End
        .&End
      .&End
      .Charts
        ._ChartType(line)
          .Attributes
            .Name('Meu Grafico de Barras')
            .ColSpan(12)
            //.Title('Meu Grafico de Barras')
            .DataSet
              .textLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
              .Fill(False)
            .&End
            .DataSet
              .textLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
              .BackgroundColor('30,182,203')
              .BorderColor('30,182,203')
              .Fill(False)
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
 PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Charts
        ._ChartType(line)
          .Attributes
            .Name('Meu Grafico de Barras')
            .ColSpan(12)
            //.Title('Meu Grafico de Barras')
            .DataSet
              .textLabel('Meu DataSet 1')
              .DataSet(ClientDataSet1)
              .BackgroundColor('227,233,235')
              .BorderColor('227,233,235')
            .&End
            .DataSet
              .textLabel('Meu DataSet 2')
              .DataSet(ClientDataSet2)
              .BackgroundColor('30,182,203')
              .BorderColor('30,182,203')
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
    .Charts
      ._ChartType(pie)
        .Attributes
          .Name('Meu Grafico Pie')
          .ColSpan(12)
          //.Title('Meu Grafico Pie')
          .DataSet
            .textLabel('Meu DataSet 3')
            .DataSet(ClientDataSet3)
          .&End
        .&End
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    .NewProject
      .Rows
        .Title
          .Configuracoes
            .H2('Dashboard')
          .&End
        .&End
      .&End

      .Jumpline
      .Jumpline

      .Rows
        .Title
          .Configuracoes
            .H4('Movimento Financeiro')
          .&End
        .&End
      .&End

      .Jumpline

      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('analiseMensal')
            //.Title('Analise Mensal')
            .Heigth(80)
            .DataSet
              .DataSet(ClientDataSet1)
            .&End
          .&End
        .&End
      .&End


      .Jumpline

      .Rows
        .Title
          .Configuracoes
            .H4('Entradas/Saidas')
          .&End
        .&End
      .&End



      .Rows

        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(doughnut)
                  .Attributes
                    //.Legend(false)
                    .Name('movimento1')
                    .ColSpan(4)
                    .DataSet
                      .textLabel('Movimento 1')
                      .DataSet(ClientDataSet3)
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
        .&End

        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(doughnut)
                  .Attributes
                    //.Legend(false)
                    .Name('movimento2')
                    .ColSpan(4)
                    .DataSet
                      .textLabel('Movimento 2')
                      .DataSet(ClientDataSet4)
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
        .&End

        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(doughnut)
                  .Attributes
                    //.Legend(false)
                    .Name('movimento3')
                    .ColSpan(4)
                    .DataSet
                      .textLabel('Movimento 3')
                      .DataSet(ClientDataSet3)
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
        .&End
      .&End
      .Jumpline
      .Rows
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('graficolinhas')
                      .ColSpan(12)
                      .Heigth(50)
                      .DataSet
                        .DataSet(ClientDataSet2)
                        .textLabel('Analise de Compras Mensal')
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .DataSet(ClientDataSet1)
                        .textLabel('Analise de Compras Mensal')
                        .BackgroundColor('30,182,203')
                        .BorderColor('30,182,203')
                        .Fill(False)
                      .&End
                    .&End
                  .&End
                .&End
              .HTML
          )
        .&End
      .&End
      .Jumpline
      .Rows
        .Title
          .Configuracoes
            .H4('Registros de Atividades')
          .&End
        .&End
      .&End
      .Jumpline
      .Jumpline
      .Table
        .TableClass
          .tableSm
          .tableHover
        .EndTableClass
        .DataSet
          .DataSet(ClientDataSet5)
        .&End
      .&End


    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
    //.AddResource('<link href="green.css" rel="stylesheet">')
    //.AddResource('<link href="style.css" rel="stylesheet">')
    .BackgroundColor('#23272b')
    .FontColor('#8f9894')
    .NewProject

      //Criando uma Linha com 6 Colunas e Adicionando conteudo HTML em cada uma
      //dessas colunas
      .Rows
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-user"></i> Total Users ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>4% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-clock-o"></i> Average Time ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">123</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>3% </i> From last Week' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Males ' +
               '</span>' +
               '<div class="count" style="font-size: 40px; color: #1ABB9C;">2,500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Females ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">4,567</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="red"><i class="fa fa-angle-down"></i>12% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Collections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2,315</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Connections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">7,325</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>54% </i> From last Week ' +
               '</span> ')
        .&End
      .&End

      //Pulando Linha
      .Jumpline

      //Adicionando uma nova linha com um gráfico LineStack e Barras Horizontal
      .Rows

        //Adicionando Grafico LineStacked
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('linestacked1')
                      .ColSpan(8)
                      .Heigth(150)
                      //.Title('Network Activities Graph title sub-title')
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet1)
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 2')
                        .DataSet(ClientDataSet2)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End

        //Adicionando Grafico Barras Horizontal
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(bar)
                    .Attributes
                      .Name('horizontabar1')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('Top Campaign Performance')
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
      .&End

      .Rows
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(bar)
                    .Attributes
                      .Name('horizontabar2')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('App Usage across versions')
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End

        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Doughnut')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('Device Usage')
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet4)
                        .BackgroundColor('26,187,156')
                        .BorderColor('227,233,235')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End

        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Pie1')
                      .ColSpan(4)
                      .Heigth(295)
                      //.Title('Device Usage')
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('227,233,235')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TForm2.CallBack(value: string);
begin
  ShowMessage(value);
end;

procedure TForm2.teste22Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  WebCharts1
  .NewProject
  .Table
    .TableClass
      .tableSm
      .tableHover
    .EndTableClass
    .DataSet
      .CallbackLink('ACCT_NBR', 'SampleWC')
      .DataSet(ClientDataSet7)
    .&End
  .&End
  .WebBrowser(WebBrowser1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated;
end;

end.
