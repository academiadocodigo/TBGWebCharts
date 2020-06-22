program ServerRel;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  System.JSON,
  REST.Json,
  DataSet.Serialize,
  Conexao in 'src\Conexao.pas' {FConexao: TDataModule},
  Entity.Relatorio in 'src\Entity.Relatorio.pas';

var
  App: THorse;

begin
  App := THorse.Create(9030);

  App.Use(Jhonson);

  App.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  App.Post('/rel',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FConexao : TFConexao;
    FConn : ISimpleQuery;
    FDAORelatorios : iSimpleDAO<TRELATORIOS>;
  begin
      FConexao := TFConexao.Create(nil);
      try
        FConn := TSimpleQueryFiredac.New(FConexao.FDConnection1);
        FDAORelatorios := TSimpleDAO<TRELATORIOS>.New(FConn).DataSource(FConexao.DataSource1);
        FDAORelatorios.Insert(TJson.JsonToObject<TRELATORIOS>(Req.Body<TJSONObject>));
        Res.Send<TJSONObject>(TJSONObject.Create);
      finally
        FConexao.Free;
      end;
  end);

  App.Get('/rel',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FConexao : TFConexao;
    FConn : ISimpleQuery;
    FDAORelatorios : iSimpleDAO<TRELATORIOS>;
  begin
      FConexao := TFConexao.Create(nil);
      try
        FConn := TSimpleQueryFiredac.New(FConexao.FDConnection1);
        FDAORelatorios := TSimpleDAO<TRELATORIOS>.New(FConn).DataSource(FConexao.DataSource1);
        FDAORelatorios.Find;
        Res.Send<TJSONArray>(FConexao.DataSource1.DataSet.ToJSONArray);
      finally
        FConexao.Free;
      end;
  end);

  App.Start;
end.
