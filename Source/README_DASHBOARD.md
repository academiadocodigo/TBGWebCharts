# Extensoes de Dashboard - Delphi 10.2 Tokyo

Esta versao adiciona uma camada de dashboard ao TBGWebCharts sem remover as APIs existentes.

## Novas units

- `Dashboard.pas` - API fluente e renderizacao dos elementos.
- `Dashboard.Theme.pas` - CSS centralizado do dashboard.
- `Dashboard.Utils.pas` - HTML encoding, numeros JS, status e callbacks.

## Elementos adicionados

- KPI Card
- Badge
- Progress
- Panel
- Alert
- Funnel
- Ranking
- Aging
- Timeline
- Gauge (SVG)
- Sparkline (SVG)
- HeatMap
- Grid responsivo Row/Col
- Callback opcional para Delphi usando o mecanismo `ActionCallBackJS` existente

## Exemplo basico

```delphi
uses
  Interfaces, View.WebCharts;

procedure TFrmPrincipal.MontarDashboard;
var
  H: iModelHTML;
begin
  H := TWebCharts.New
    .NewProject
    .WebBrowser(WebBrowser1);

  H.Dashboard
    .BeginDashboard
      .RowBegin
        .ColBegin(3)
          .KPI('Valor Comprado', 'R$ 1.842.350,00', 'Periodo atual',
               'fas fa-shopping-cart', 'success', 12.4,
               'AbrirCompras', 'PERIODO')
        .ColEnd
        .ColBegin(3)
          .KPI('Aprovacoes Pendentes', '17', '3 vencidas',
               'fas fa-clock', 'warning', 0,
               'AbrirAprovacoes', 'PENDENTE')
        .ColEnd
      .RowEnd

      .RowBegin
        .ColBegin(6)
          .PanelBegin('Fluxo de Compras')
            .FunnelBegin
              .FunnelStep('Solicitacoes', 148, 100, '100%')
              .FunnelStep('Cotacoes', 96, 82, '64,9%')
              .FunnelStep('Ordens de Compra', 76, 68, '79,2%')
              .FunnelStep('Compradas', 64, 58, '84,2%')
              .FunnelStep('Encerradas', 59, 50, '92,2%')
            .FunnelEnd
          .PanelEnd
        .ColEnd

        .ColBegin(6)
          .PanelBegin('Aging de Aprovacoes')
            .RankingBegin
              .AgingItem('Ate 4 horas', 8, 100, 'success')
              .AgingItem('4 a 8 horas', 4, 50, 'info')
              .AgingItem('1 a 2 dias', 3, 38, 'warning')
              .AgingItem('Acima de 2 dias', 2, 25, 'danger')
            .RankingEnd
          .PanelEnd
        .ColEnd
      .RowEnd

      .RowBegin
        .ColBegin(4)
          .PanelBegin('Entregas no Prazo')
            .Gauge('SLA de Entrega', 91.7, '91,7%', 'success')
          .PanelEnd
        .ColEnd
        .ColBegin(4)
          .PanelBegin('Saving')
            .Sparkline('Ultimos meses', '8,12,10,18,16,22,28', 'R$ 47.280', 'success')
          .PanelEnd
        .ColEnd
        .ColBegin(4)
          .PanelBegin('Entrega OC 15842')
            .Progress('Andamento', 72, '72% entregue', 'warning', 'AbrirOC', '15842')
            .Badge('Atrasada', 'danger')
          .PanelEnd
        .ColEnd
      .RowEnd
    .EndDashboard
  .&End
  .Generated;
end;
```

## Callback para Delphi

O dashboard reutiliza o mecanismo de callback existente da biblioteca. Antes de renderizar, registre a classe que recebera os callbacks conforme o fluxo ja usado pelo TBGWebCharts.

Exemplo de metodo publico:

```delphi
procedure TFrmPrincipal.AbrirOC(const AOC: string);
begin
  // abrir tela de OC filtrada
end;
```

E no elemento:

```delphi
.Progress('Entrega', 72, '72%', 'warning', 'AbrirOC', '15842')
```

## Status aceitos

`primary`, `success`, `warning`, `danger`, `info`, `dark`.

## Compatibilidade

A implementacao evita WebView2 e usa apenas HTML/CSS/SVG simples. O objetivo e manter compatibilidade com Delphi 10.2 Tokyo e com o `TWebBrowser` utilizado pela biblioteca atual. Chromium pode ser habilitado posteriormente sem alterar a API de dashboard.

## Tema

O CSS padrao ja e aplicado automaticamente. E possivel sobrescrever as cores principais:

```delphi
H.Dashboard
  .Theme('#245d8f', '#28a745', '#f0ad4e', '#dc3545', '#17a2b8')
  .BeginDashboard
  // ...
  .EndDashboard
.&End;
```

## Composicao com ContinuosProject

O Dashboard segue o mesmo modelo de composicao existente em `Rows._Div.Add`.
Para injetar um Chart, Table ou outro projeto interno dentro de um painel:

```delphi
WebCharts1
  .NewProject
    .Dashboard
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
    .&End
  .WebBrowser(WebBrowser1)
  .Generated;
```

`Inject(...)` e um alias de `Add(...)`. `CustomHTML(...)` continua disponivel para compatibilidade.
