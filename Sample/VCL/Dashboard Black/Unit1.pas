unit Unit1;

interface

uses
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.OleCtrls,
  System.SysUtils,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  View.WebCharts,
  SHDocVw;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure FormCreate(Sender: TObject);
  strict private
  const
    FTitleCart: string = 'My dashboard';
    FTitleTextInputXOutput: string = 'Input x Output';
    FTitleTextSocialMedia: string = 'Social media';
    FTitleTextTotalPoints: string = 'Total points';
    procedure DashboardPrincipal;
  end;

var
  Form1: TForm1;

implementation

uses
  Charts.Types;

{$R *.dfm}

procedure TForm1.DashboardPrincipal;
begin
  WebCharts1
  .Container(fluid)
  .BackgroundColor('#1f2327')
  .FontColor('#FFF')
  .NewProject
    .Jumpline
    .Jumpline
    .Rows
      ._Div
        .ColSpan(12)
        .Add(Format('<h2 style="color : #FFF";>%s </h2>', [FTitleCart]))
      .&End
    .&End
    .Jumpline
    .Rows
      ._Div
        .ColSpan(12)
        .Add('<div style="padding: 2%;  background-color: #292e32">' +
             WebCharts1
             .ContinuosProject
             .Charts
              ._ChartType(line)
                .Attributes
                  .Name('g1')
                  .ColSpan(12)
                  .Heigth(60)
                  .Options
                    .Title
                      .Text(FTitleTextTotalPoints)
                      .Display(True)
                      .Position('top')
                      .FontColorHEX('#a6a7aa')
                      .FontSize(25)
                      .Padding(10)
                    .&End
                  .&End
                  .DataSet
                    .TextLabel(FTitleTextTotalPoints)
                    .DataSet(ClientDataSet1)
                    .BackgroundColor('90,142,244')
                    .BorderColor('90,142,244')
                  .&End
                .&End
              .&End
            .&End
            .HTML +
             '</div>')
      .&End
    .&End
    .Jumpline
    .Rows
      ._Div
        .ColSpan(6)
        .Add(
        '<div style="padding: 2%; background-color: #292e32">' +
        WebCharts1
          .ContinuosProject
          .Jumpline
          .Rows
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#50cc89">' +
                   '$1,002.24' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Tax deduction</p>')
            .&End
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#ff8801">' +
                   '$2,075' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Miles driven</p>')
            .&End
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#29a0fe">' +
                   '$1,856' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Business miles</p>')
            .&End
          .&End
          .Jumpline
          .Jumpline
          .Jumpline
          .Rows
            ._Div
              .ColSpan(6)
              .Add(
                WebCharts1
                 .ContinuosProject
                 .Charts
                  ._ChartType(pie)
                    .Attributes
                      .Name('g3')
                      .ColSpan(12)
                      .Options
                        .SemiCircule(True)
                        .Legend
                          .display(False)
                        .&End
                        .Title
                          .Text(FTitleTextInputXOutput)
                          .Display(True)
                          .Position('top')
                          .FontColorHEX('#a6a7aa')
                          .FontSize(16)
                          .Padding(10)
                        .&End
                      .&End
                      .DataSet
                        .TextLabel(FTitleTextInputXOutput)
                        .DataSet(ClientDataSet3)
                      .&End
                    .&End
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
                   .Charts
                    ._ChartType(pie)
                      .Attributes
                        .Name('g4')
                        .ColSpan(12)
                        .Options
                          .SemiCircule(True)
                          .Legend
                            .Display(False)
                          .&End
                          .Title
                            .Text(FTitleTextSocialMedia)
                            .Display(True)
                            .Position('top')
                            .FontColorHEX('#a6a7aa')
                            .FontSize(16)
                            .Padding(10)
                          .&End
                        .&End
                        .DataSet
                          .TextLabel(FTitleTextSocialMedia)
                          .DataSet(ClientDataSet2)
                        .&End
                      .&End
                    .&End
                  .&End
                  .HTML
              )
            .&End
          .&End
          .Jumpline
          .Jumpline
        .HTML +
        '</div>'
        )
      .&End
      ._Div
        .ColSpan(6)
        .Add('<div style="padding: 2%;  background-color: #292e32">' +
             WebCharts1
               .ContinuosProject
               .Charts
                ._ChartType(horizontalBar)
                  .Attributes
                    .Name('g2')
                    .ColSpan(12)
                    .Options
                      .Title
                        .Text(FTitleTextSocialMedia)
                        .Display(True)
                        .Position('top')
                        .FontColorHEX('#a6a7aa')
                        .FontSize(16)
                        .Padding(10)
                      .&End
                    .&End
                    .DataSet
                      .TextLabel(FTitleTextSocialMedia)
                      .DataSet(ClientDataSet2)
                    .&End
                  .&End
                .&End
              .&End
              .HTML +
            '</div>')
      .&End
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DashboardPrincipal;
end;

end.
