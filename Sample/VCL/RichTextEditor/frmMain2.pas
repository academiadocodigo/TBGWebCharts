unit frmMain2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw, View.WebCharts;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    WebCharts1: TWebCharts;
    WebBrowser1: TWebBrowser;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button2Click(Sender: TObject);
begin
  WebCharts1
  .CDN(true)
  .NewProject
    .Rows
      .HTML(
       '<style>' +
        '#cabecalho-impressao {' +
         'display: none;' +
          '}' +
           '@media print {' +
            '#cabecalho-impressao {' +
             'display: flex;' +
              '}' +
               '}' +
                '</style>' +
 '<div class="container">' +
  '<div id="cabecalho-impressao" class="row">' +
   '<div class="col-2"></div>' +
    '<div class="col-10">' +
     '<h1>Teste Cabeçalho Empresa</h1>' +
      '</div>' +
       '</div>'

      )
    .&End
    .RichTextEditor
      .Attributes
        .Margin('0px')
        .Height('300px')
        .PlaceHolder('Digite o seu texto aqui!!')
        .Content('Olá Mundo!')
      .&End
//      .ReadOnly(true)
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
end;

end.
