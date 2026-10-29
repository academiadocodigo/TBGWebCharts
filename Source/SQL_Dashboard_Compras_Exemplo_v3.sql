-- Exemplos de SELECTs para alimentar o Dashboard.Compras.Exemplo.v3.pas
-- Ajuste nomes de campos caso as views finais tenham aliases diferentes.

-- qryKPI
SELECT
  SUM(valor_comprado) AS valor_comprado,
  SUM(valor_comprometido) AS valor_comprometido,
  SUM(qtd_aprovacao_pendente) AS qtd_aprovacao_pendente,
  SUM(qtd_aprovacao_vencida) AS qtd_aprovacao_vencida,
  SUM(qtd_entrega_atrasada) AS qtd_entrega_atrasada
FROM vw_cpr_dashboard_kpi
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND ddata BETWEEN :dataini AND :datafim;

-- qryEvolucao: Charts.DataSet trabalha muito bem com Label/Value.
SELECT
  TO_CHAR(competencia, 'MM/YYYY') AS "Label",
  SUM(valor_comprado) AS "Value"
FROM vw_cpr_dashboard_evolucao
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND ddata BETWEEN :dataini AND :datafim
GROUP BY competencia
ORDER BY competencia;

-- qrySaving
SELECT
  TO_CHAR(DATE_TRUNC('month', data_cotacao), 'MM/YYYY') AS "Label",
  SUM(saving_vs_media) AS "Value"
FROM vw_cpr_dashboard_saving
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND data_cotacao BETWEEN :dataini AND :datafim
GROUP BY DATE_TRUNC('month', data_cotacao)
ORDER BY DATE_TRUNC('month', data_cotacao);

-- qryFunil: uma unica linha; consumida por Dashboard.FunnelFields.
SELECT
  SUM(etapa_solicitacao) AS solicitacoes,
  SUM(etapa_cotacao) AS cotacoes,
  SUM(etapa_oc) AS ordens,
  SUM(etapa_comprada) AS compradas,
  SUM(etapa_encerrada) AS encerradas
FROM vw_cpr_dashboard_funil
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND ddata_solic BETWEEN :dataini AND :datafim;

-- qryAprovacoes: linhas; consumida por Dashboard.AgingDataSet.
SELECT
  faixa_aging,
  CASE faixa_aging
    WHEN 'ATE_4H' THEN 'Ate 4 horas'
    WHEN '4_A_8H' THEN '4 a 8 horas'
    WHEN 'ATE_1_DIA' THEN '8 a 24 horas'
    WHEN 'ATE_2_DIAS' THEN '1 a 2 dias'
    ELSE 'Acima de 2 dias'
  END AS descricao_aging,
  COUNT(*) AS quantidade,
  CASE faixa_aging
    WHEN 'ATE_4H' THEN 'info'
    WHEN '4_A_8H' THEN 'info'
    WHEN 'ATE_1_DIA' THEN 'warning'
    WHEN 'ATE_2_DIAS' THEN 'warning'
    ELSE 'danger'
  END AS status_cor
FROM vw_cpr_dashboard_aprovacoes
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND data_oc BETWEEN :dataini AND :datafim
  AND status_aprovacao <> 'APROVADA'
GROUP BY faixa_aging
ORDER BY CASE faixa_aging
  WHEN 'ATE_4H' THEN 1
  WHEN '4_A_8H' THEN 2
  WHEN 'ATE_1_DIA' THEN 3
  WHEN 'ATE_2_DIAS' THEN 4
  ELSE 5 END;

-- qryFornecedores: RankingDataSet calcula automaticamente a barra relativa ao maior valor.
SELECT
  ncodigfocot,
  fornecedor,
  SUM(valor_total) AS valor_comprado
FROM vw_cpr_dashboard_fornecedor
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND data_oc BETWEEN :dataini AND :datafim
GROUP BY ncodigfocot, fornecedor
ORDER BY valor_comprado DESC
LIMIT 5;

-- qryEntregas: TableDataSet renderiza status como badge e percentual como progress.
SELECT
  ncodigorcpr,
  fornecedor,
  TO_CHAR(data_prevista, 'DD/MM/YYYY') AS data_prevista_fmt,
  status_entrega,
  percentual_entregue,
  TO_CHAR(percentual_entregue, 'FM990D0') || '%' AS percentual_entregue_fmt,
  TO_CHAR(valor_pendente, 'FM999G999G990D00') AS valor_pendente_fmt
FROM vw_cpr_dashboard_entregas
WHERE ncodigempre = :empresa
  AND (:filial = 0 OR ncodigfilia = :filial)
  AND status_entrega IN ('ATRASADA', 'VENCE_HOJE', 'PENDENTE')
ORDER BY
  CASE status_entrega
    WHEN 'ATRASADA' THEN 1
    WHEN 'VENCE_HOJE' THEN 2
    ELSE 3
  END,
  dias_atraso DESC,
  valor_pendente DESC
LIMIT 15;
