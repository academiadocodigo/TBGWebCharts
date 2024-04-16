unit frmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.OleCtrls,
  Vcl.ExtCtrls,
  SHDocVw,
  View.WebCharts;

type
  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    WebCharts1: TWebCharts;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  strict private
    FContent : String;
  public
    procedure SaveContent(aValue : String);
    procedure SaveRichText(aValue : String);
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var
  imagem: TResourceStream;
begin
  imagem := TResourceStream.Create(HInstance, 'ico_relatorio', RT_RCDATA);
  try
    WebCharts1
    .CDN(true)
    .NewProject
      .RichTextEditor
        .Attributes
          .Height('400px')
          .Width('600px')
          .PrintHeader
            .&Div
              .Col(2)
              .Image
                .Image(imagem)
                .Style
                  .Width(100)
                  .Height(100)
                .&End
              .&End
            .&End
            .&Div
              .Col(10)
              .Title
                .Text('TBGWebCharts')
              .&End
              .Title
                .Text('SimpleSoluções')
                .Style
                  .FontSize(20)
                .&End
              .&End
            .&End
          .&End
          .PlaceHolder('Enter your text here')
//        .ReadOnly(true)
          .Content('Hello World!\nHello World!')
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
  finally
    imagem.Free;
  end;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  WebCharts1
  .ContinuosProject
  .WebBrowser(WebBrowser1)
    .RichTextEditor
    .SaveContent(SaveContent);

end;

procedure TForm7.Button3Click(Sender: TObject);
begin
  WebCharts1
  .ContinuosProject
  .WebBrowser(WebBrowser1)
    .RichTextEditor
    .SaveContentText(SaveRichText);
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
  WebCharts1
  .ContinuosProject
  .WebBrowser(WebBrowser1)
    .RichTextEditor
    .SaveContentHtml(SaveRichText);
end;

procedure TForm7.Button5Click(Sender: TObject);
begin
  WebCharts1
  .ContinuosProject
  .WebBrowser(WebBrowser1)
  .Print;
end;

procedure TForm7.Button6Click(Sender: TObject);
begin
  WebCharts1
  .ContinuosProject
  .WebBrowser(WebBrowser1)
    .RichTextEditor
    .LoadContent(FContent);
end;

procedure TForm7.SaveContent(aValue: String);
begin
  FContent := aValue;
  ShowMessage(FContent);
end;

procedure TForm7.SaveRichText(aValue: String);
begin
  ShowMessage(aValue);
end;

end.
