# Alteracoes - extensao Dashboard

## Adicionado

- `iModelDashboard` em `Interfaces.pas`.
- `Dashboard` em `iModelHTML` / `TModelHTML`.
- Units `Dashboard.pas`, `Dashboard.Theme.pas`, `Dashboard.Utils.pas`.
- Referencias das novas units no `TBGWebCharts.dpk` e `TBGWebCharts.dproj`.
- KPI, Badge, Progress, Panel, Alert, Funnel, Ranking, Aging, Timeline, Gauge SVG, Sparkline SVG e HeatMap.
- Grid responsivo `RowBegin/ColBegin`.
- Tema padrao e sobrescrita de cores.
- Escape de HTML/atributos e conversao numerica independente do locale para os novos elementos.
- Callbacks opcionais aproveitando `ActionCallBackJS` ja existente.
- `README_DASHBOARD.md` com exemplo de uso.
- Rosca (`iModelHTMLOptions`): `DoughnutCenterText(Texto, Subtitulo)` - texto fixo no centro no lugar do total calculado; `SemiCircleLabels(Min, Max)` - rotulos nas pontas da meia rosca (com `SemiCircule(True)`). Na meia rosca o centro fica na base do arco.

## Compatibilidade

As novas units nao dependem de `TEdgeBrowser`/WebView2. Foram escritas visando Delphi 10.2 Tokyo e o `TWebBrowser` ja utilizado pelo componente.

## Observacao de validacao

Foi realizada validacao estrutural/estatica dos fontes e das declaracoes das interfaces. O ambiente em que a alteracao foi produzida nao possui o compilador Delphi 10.2; portanto recomenda-se compilar primeiro o package em uma copia/branch do projeto antes de substituir a biblioteca instalada em producao.

## Composicao com ContinuosProject

- Adicionado `iModelDashboard.Add(const Value: string)` para injetar diretamente HTML produzido por `ContinuosProject`, seguindo o mesmo conceito de `Rows._Div.Add`.
- Adicionado `iModelDashboard.Inject(const Value: string)` como alias semantico de `Add`.
- `CustomHTML` foi preservado para compatibilidade.
- Nenhuma alteracao no comportamento de `NewProject` ou `ContinuosProject`.

Exemplo:

```delphi
.PanelBegin('Evolucao')
  .Add(
    WebCharts1
      .ContinuosProject
      .Charts
        // ...
      .&End
      .HTML
  )
.PanelEnd
```

## v3 - DataSet binding e tabela operacional
- Adicionado `FunnelDataSet` para funis baseados em linhas Label/Value.
- Adicionado `FunnelFields` para funis baseados em uma unica linha com varios campos.
- Adicionado `RankingDataSet` com percentual automatico pelo maior valor e formatacao opcional.
- Adicionado `AgingDataSet` com percentual automatico sobre o total.
- Adicionado `TableDataSet` com headers, Badge, Progress e callback por linha/celula.
- Bindings preservam a posicao atual do `TDataSet` quando bookmarks sao suportados.
- `ContinuosProject` permanece como mecanismo oficial de injecao de Charts e demais blocos.
