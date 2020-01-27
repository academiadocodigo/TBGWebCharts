unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.WebCharts, Vcl.OleCtrls, SHDocVw,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DashboardPrincipal;
  public
    { Public declarations }
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
        .Add('<h2 style="color : #FFF";>My Dashboard </h2>')
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
                      .text('Total Points')
                      .display(True)
                      .position('top')
                      .fontColorHEX('#a6a7aa')
                      .fontSize(25)
                      .padding(10)
                    .&End
                  .&End
                  .DataSet
                    .textLabel('Total Points')
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
                   '<p style="font-size:16px; color:#a6a7aa">Tax Deduction</p>')
            .&End
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#ff8801">' +
                   '$2,075' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Miles Driven</p>')
            .&End
            ._Div
              .ColSpan(4)
              .Add('<span style="font-size:32px; color:#29a0fe">' +
                   '$1,856' +
                   '<span>' +
                   '<p style="font-size:16px; color:#a6a7aa">Business Miles</p>')
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
                          .text('Entrada x Saída')
                          .display(True)
                          .position('top')
                          .fontColorHEX('#a6a7aa')
                          .fontSize(16)
                          .padding(10)
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Entrada x Saída')
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
                            .display(False)
                          .&End
                          .Title
                            .text('Mídias Sociais')
                            .display(True)
                            .position('top')
                            .fontColorHEX('#a6a7aa')
                            .fontSize(16)
                            .padding(10)
                          .&End
                        .&End
                        .DataSet
                          .textLabel('Midias Sociais')
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
                        .text('Mídias Sociais')
                        .display(True)
                        .position('top')
                        .fontColorHEX('#a6a7aa')
                        .fontSize(16)
                        .padding(10)
                      .&End
                    .&End
                    .DataSet
                      .textLabel('Midias Sociais')
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
