unit Table.Features;

interface

uses
  Interfaces,
  injection;

type
  TModelTableFeatures = class (TInterfacedObject, iModelTableFeatures)
    private
      [weak]
      FParent : iModelTable;
      FAutoWidth : String;
      FdeferRender : String;
      FInfo : String;
      FLengthChange : String;
      FOrdering : String;
      FPaging : String;
      FProcessing : String;
      FScrollX : String;
      FScrollY : String;
      FSearching : String;
      FServerSide : String;
      FStateSave : String;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModelTableFeatures;
      function AutoWidth(Value : Boolean) : iModelTableFeatures; //Controle de recursos Tratamento de largura de colunas inteligentes do DataTables
      function deferRender(Value : Boolean) : iModelTableFeatures; //Controle diferenciado renderização adiada para velocidade adicional de inicialização.
      function Info(Value : Boolean) : iModelTableFeatures; //Campo de exibição de informações da tabela de controle de recursos
      function LengthChange(Value : Boolean) : iModelTableFeatures; //O recurso controla a capacidade do usuário final de alterar o comprimento da exibição de paginação da tabela.
      function Ordering(Value : Boolean) : iModelTableFeatures; //Recursos de ordenação de controle de recursos (classificação) no DataTables.
      function Paging(Value : Boolean) : iModelTableFeatures; //Ativar ou desativar a paginação da tabela
      function Processing(Value : Boolean) : iModelTableFeatures; //O recurso controla o indicador de processamento
      function ScrollX(Value : Boolean) : iModelTableFeatures; //rolagem horizontal
      function ScrollY(Value : Integer) : iModelTableFeatures; //rolagem vertical
      function Searching(Value : Boolean) : iModelTableFeatures; //Recursos de pesquisa (filtragem) de controle de recursos
      function ServerSide(Value : Boolean) : iModelTableFeatures; //Controle de recurso Modo de processamento no lado do servidor do DataTables
      function StateSave(Value : Boolean) : iModelTableFeatures; //Economia de estado - restaura o estado da tabela no recarregamento da página.
      function Result : String;
      function &End : iModelTable;
  end;

implementation

uses
  System.SysUtils;

{ TModelTableFeatures }

function TModelTableFeatures.&End: iModelTable;
begin
  Result := FParent;
end;

function TModelTableFeatures.AutoWidth(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FAutoWidth := 'autoWidth: ' + LowerCase(BoolToStr(Value,True))+',';
end;

constructor TModelTableFeatures.Create(Parent : iModelTable);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

function TModelTableFeatures.deferRender(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FdeferRender := 'deferRender: ' + LowerCase(BoolToStr(Value,True))+','
end;

destructor TModelTableFeatures.Destroy;
begin

  inherited;
end;

function TModelTableFeatures.Info(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FInfo := 'info: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.LengthChange(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FLengthChange := 'lengthChange: ' + LowerCase(BoolToStr(Value,True))+',';
end;

class function TModelTableFeatures.New(Parent : iModelTable) : iModelTableFeatures;
begin
  Result := Self.Create(Parent);
end;

function TModelTableFeatures.Ordering(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FOrdering := 'ordering: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.Paging(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FPaging := 'paging: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.Processing(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FProcessing := 'processing: '+ LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.Result: String;
begin
  Result := '';
  Result := Result + FAutoWidth;
  Result := Result + FdeferRender;
  Result := Result + FInfo;
  Result := Result + FLengthChange;
  Result := Result + FOrdering;
  Result := Result + FPaging;
  Result := Result + FProcessing;
  Result := Result + FScrollX;
  Result := Result + FScrollY;
  Result := Result + FSearching;
  Result := Result + FServerSide;
  Result := Result + FStateSave;
end;

function TModelTableFeatures.ScrollX(Value : Boolean) : iModelTableFeatures;
begin
  Result := Self;
  FScrollX := 'scrollX: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.ScrollY(Value: Integer): iModelTableFeatures;
begin
  Result := Self;
  FScrollY := 'scrollY: ' + QuotedStr(IntToStr(Value)+'px')+',';
end;

function TModelTableFeatures.Searching(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FSearching := 'searching: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.ServerSide(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FServerSide := 'serverSide: ' + LowerCase(BoolToStr(Value,True))+',';
end;

function TModelTableFeatures.StateSave(Value: Boolean): iModelTableFeatures;
begin
  Result := Self;
  FStateSave := 'stateSave: ' + LowerCase(BoolToStr(Value,True))+',';
end;

end.
