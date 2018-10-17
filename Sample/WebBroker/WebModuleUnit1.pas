unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, Datasnap.DBClient,
  View.WebCharts;

type
  TWebModule1 = class(TWebModule)
    WebCharts1: TWebCharts;
    ClientDataSet1: TClientDataSet;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1tbgchartAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +
    '</html>';
end;

procedure TWebModule1.WebModule1tbgchartAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
Response.Content :=
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
      .Bar
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .Title('Meu Gráfico de Barras')
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
        .&End
      .&End
    .&End
  .GenerateFooter
  .HTML;
  ClientDataSet1.Active := False;
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
ClientDataSet1.LoadFromFile('C:\Projetos\TBGWebCharts.git\trunk\Sample\VCL\Data\CDSChats.xml');
ClientDataSet1.Active:=True;
end;

end.
