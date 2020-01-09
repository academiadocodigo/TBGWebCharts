unit Table;

interface

uses
  Interfaces, Generics.Collections, Table.Data;

Type
  TModelTable = class(TInterfacedObject, iModelTable, iModelTableClass)
    private
      [weak]
      FParent : iModelHTML;
      FClass : String;
      FDataSet : TList<iModelTableDataSet>;
      FTableData : iModelTableData;
      FTableOptions : iModelTableOption;
      FFeatures : iModelTableFeatures;
      FDatatable : Boolean;
    public
      constructor Create(Parent : iModelHTML);
      destructor Destroy; override;
      class function New(Parent : iModelHTML) : iModelTable;
      function &End : iModelHTML;
      function DataSet : iModelTableDataSet;
      function TableClass : iModelTableClass;
      function TableOptions : iModelTableOption;
      function TableFeatures : iModelTableFeatures;
      function TableData : iModelTableData;
      function Datatable(Value : Boolean) : iModelTable;

      //iModelTableClass
      function tableDark : iModelTableClass;
      function tableStriped : iModelTableClass;
      function tableBordered : iModelTableClass;
      function tableHover : iModelTableClass;
      function tableSm : iModelTableClass;
      function tableResponsive : iModelTableClass;
      function &EndTableClass : iModelTable;
  end;

implementation

uses
  Table.DataSet, SysUtils, Injection, Table.Options, Table.Features;

{ TModelTable }

function TModelTable.&End: iModelHTML;
var
  I: Integer;
begin
  Result := FParent;
  if FDatatable then
  begin
    FParent.HTML('<script>');
    FParent.HTML('$(document).ready(function() {');
    FParent.HTML('	$('+QuotedStr('#tbgwebchart')+').DataTable({');
    FParent.HTML(FTableOptions.Result);
    FParent.HTML(FFeatures.Result);
    FParent.HTML('language : {');
    FParent.HTML('"sEmptyTable": "Nenhum registro encontrado",');
    FParent.HTML('"sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",');
    FParent.HTML('"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",');
    FParent.HTML('"sInfoFiltered": "(Filtrados de _MAX_ registros)",');
    FParent.HTML('"sInfoPostFix": "",');
    FParent.HTML('"sInfoThousands": ".",');
    FParent.HTML('"sLengthMenu": "_MENU_ resultados por página",');
    FParent.HTML('"sLoadingRecords": "Carregando...",');
    FParent.HTML('"sProcessing": "Processando...",');
    FParent.HTML('"sZeroRecords": "Nenhum registro encontrado",');
    FParent.HTML('"sSearch": "Pesquisar",');
    FParent.HTML('"oPaginate": {');
    FParent.HTML('"sNext": "Próximo",');
    FParent.HTML('"sPrevious": "Anterior",');
    FParent.HTML('"sFirst": "Primeiro",');
    FParent.HTML('"sLast": "Último"');
    FParent.HTML('},');
    FParent.HTML('"oAria": {');
    FParent.HTML('"sSortAscending": ": Ordenar colunas de forma ascendente",');
    FParent.HTML('"sSortDescending": ": Ordenar colunas de forma descendente"');
    FParent.HTML('},');
    FParent.HTML('"select": {');
    FParent.HTML('"rows": {');
    FParent.HTML('"_": "Selecionado %d linhas",');
    FParent.HTML('"0": "Nenhuma linha selecionada",');
    FParent.HTML('"1": "Selecionado 1 linha"');
    FParent.HTML('}');
    FParent.HTML('}');
    FParent.HTML('}');
    FParent.HTML(FTableData.Result);
    FParent.HTML('});');
    FParent.HTML('} );');
    FParent.HTML('</script>');
    FParent.HTML('<table id="tbgwebchart" class="' + FClass + '" style="width:100%">');
    FParent.HTML(FTableData.ResultTable);
  end
  else
    FParent.HTML('<table class="' + FClass + '">');

  for I := 0 to Pred(FDataSet.Count) do
    FParent.HTML(FDataSet[I].ResultScript);
  FParent.HTML('</table>');
end;

function TModelTable.EndTableClass: iModelTable;
begin
  Result := Self;
end;

constructor TModelTable.Create(Parent : iModelHTML);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FDataSet := TList<iModelTableDataSet>.Create;
  FClass := 'table';
  FTableOptions := TModelTableOptions.New(Self);
  FTableData := TModelTableData.New(Self);
  FFeatures := TModelTableFeatures.New(Self);
  FDatatable := False;
end;

function TModelTable.TableData: iModelTableData;
begin
  Result := FTableData;
end;

function TModelTable.TableFeatures: iModelTableFeatures;
begin
  Result := FFeatures;
end;

function TModelTable.DataSet: iModelTableDataSet;
begin
  FDataSet.Add(TModelTableDataSet.New(Self));
  Result := FDataSet[Pred(FDataSet.Count)];
end;

function TModelTable.Datatable(Value: Boolean): iModelTable;
begin
  Result := self;
  FDatatable := Value;
end;

destructor TModelTable.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

class function TModelTable.New(Parent : iModelHTML) : iModelTable;
begin
  Result := Self.Create(Parent);
end;

function TModelTable.tableBordered: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-bordered';
end;

function TModelTable.TableClass: iModelTableClass;
begin
  Result := Self;
end;

function TModelTable.tableDark: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-dark';
end;

function TModelTable.tableHover: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-hover';
end;

function TModelTable.TableOptions: iModelTableOption;
begin
  Result := FTableOptions;
end;

function TModelTable.tableResponsive: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-responsive';
end;

function TModelTable.tableSm: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-sm';
end;

function TModelTable.tableStriped: iModelTableClass;
begin
  Result := Self;
  FClass := FClass + ' table-striped';
end;

end.
