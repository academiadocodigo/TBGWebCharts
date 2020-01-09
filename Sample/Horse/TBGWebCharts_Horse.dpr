program TBGWebCharts_Horse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  View.WebCharts,
  Data.DB,
  Datasnap.DBClient,
  Charts.Types,
  MidasLib;

var
  App: THorse;

begin
  App := THorse.Create(9001);

  App.Get('/chart',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      WebCharts1: iWebCharts;
      FDataSet1 : TClientDataSet;
      FDataSet2 : TClientDataSet;
      FDataSet3 : TClientDataSet;
      FDataSet4 : TClientDataSet;
      FDataSet5 : TClientDataSet;
    begin
      WebCharts1 := TWebCharts.New;
      FDataSet1 := TClientDataSet.Create(nil);
      FDataSet2 := TClientDataSet.Create(nil);
      FDataSet3 := TClientDataSet.Create(nil);
      FDataSet4 := TClientDataSet.Create(nil);
      FDataSet5 := TClientDataSet.Create(nil);
      try
        FDataSet1.LoadFromFile('CDSChats.xml');
        FDataSet2.LoadFromFile('CDSChats2.xml');
        FDataSet3.LoadFromFile('CDSChats3.xml');
        FDataSet4.LoadFromFile('CDSChats4.xml');
        FDataSet5.LoadFromFile('customer.xml');
        Res.Send(
            WebCharts1
            .CDN(True)
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
                    .Heigth(80)
                    .DataSet
                      .DataSet(FDataSet1)
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
                              .DataSet(FDataSet3)
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
                              .DataSet(FDataSet4)
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
                              .DataSet(FDataSet3)
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
                                .DataSet(FDataSet2)
                                .textLabel('Analise de Compras Mensal')
                                .BackgroundColor('227,233,235')
                                .BorderColor('227,233,235')
                                .Fill(False)
                              .&End
                              .DataSet
                                .DataSet(FDataSet1)
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
              .TableOptions
                .Responsive(true)
              .&End
              .TableFeatures
                .AutoWidth(false)
                .LengthChange(false)
                .Info(false)
              .&End
              .Datatable(True)
              .DataSet
                .DataSet(FDataSet5)
              .&End
            .&End
            .GenerateFooter
            .HTML);
      finally
        FDataSet1.Free;
        FDataSet2.Free;
        FDataSet3.Free;
        FDataSet4.Free;
      end;
    end);


     App.Get('/chartcdnoff',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      WebCharts1: iWebCharts;
      FDataSet1 : TClientDataSet;
      FDataSet2 : TClientDataSet;
      FDataSet3 : TClientDataSet;
      FDataSet4 : TClientDataSet;
      FDataSet5 : TClientDataSet;
    begin
      WebCharts1 := TWebCharts.New;
      FDataSet1 := TClientDataSet.Create(nil);
      FDataSet2 := TClientDataSet.Create(nil);
      FDataSet3 := TClientDataSet.Create(nil);
      FDataSet4 := TClientDataSet.Create(nil);
      FDataSet5 := TClientDataSet.Create(nil);
      try
        FDataSet1.LoadFromFile('CDSChats.xml');
        FDataSet2.LoadFromFile('CDSChats2.xml');
        FDataSet3.LoadFromFile('CDSChats3.xml');
        FDataSet4.LoadFromFile('CDSChats4.xml');
        FDataSet5.LoadFromFile('customer.xml');
        Res.Send(
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
                    .Heigth(80)
                    .DataSet
                      .DataSet(FDataSet1)
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
                              .DataSet(FDataSet3)
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
                              .DataSet(FDataSet4)
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
                              .DataSet(FDataSet3)
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
                                .DataSet(FDataSet2)
                                .textLabel('Analise de Compras Mensal')
                                .BackgroundColor('227,233,235')
                                .BorderColor('227,233,235')
                                .Fill(False)
                              .&End
                              .DataSet
                                .DataSet(FDataSet1)
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
              .TableOptions
                .Responsive(true)
              .&End
              .TableFeatures
                .AutoWidth(false)
                .LengthChange(false)
                .Info(false)
              .&End
              .Datatable(True)
              .DataSet
                .DataSet(FDataSet5)
              .&End
            .&End
            .GenerateFooter
            .HTML);
      finally
        FDataSet1.Free;
        FDataSet2.Free;
        FDataSet3.Free;
        FDataSet4.Free;
      end;
    end);

  App.Start;
end.
