unit Entity.Relatorio;

interface

uses
  SimpleAttributes;

Type
  [Tabela('RELATORIOS')]
  TRELATORIOS = class
  private
    FTITULO: String;
    FDESCRICAO: String;
    FID: Integer;
    FCONFIGURACOES: String;
    procedure SetCONFIGURACOES(const Value: String);
    procedure SetDESCRICAO(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetTITULO(const Value: String);

  public
    constructor Create;
    destructor Destroy; override;
  published
    [Campo('ID'), Pk, AutoInc]
    property ID: Integer read FID write SetID;
    [Campo('TITULO')]
    property TITULO: String read FTITULO write SetTITULO;
    [Campo('DESCRICAO')]
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
    [Campo('CONFIGURACOES')]
    property CONFIGURACOES: String read FCONFIGURACOES write SetCONFIGURACOES;

  end;

implementation

{ TPEDIDO }

constructor TRELATORIOS.Create;
begin

end;

destructor TRELATORIOS.Destroy;
begin

  inherited;
end;

procedure TRELATORIOS.SetCONFIGURACOES(const Value: String);
begin
  FCONFIGURACOES := Value;
end;

procedure TRELATORIOS.SetDESCRICAO(const Value: String);
begin
  FDESCRICAO := Value;
end;

procedure TRELATORIOS.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TRELATORIOS.SetTITULO(const Value: String);
begin
  FTITULO := Value;
end;

end.
