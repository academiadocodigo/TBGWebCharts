program TBGWebCharts_VCL;







{$R 'TBGWebChartsResource.res' '..\..\TBGWebChartsResource.rc'}

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //ReportMemoryLeaksOnShutdown := true;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
