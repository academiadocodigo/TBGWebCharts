object IWForm3: TIWForm3
  Left = 0
  Top = 0
  Width = 1032
  Height = 664
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWURLWindow1: TIWURLWindow
    Left = 0
    Top = 185
    Width = 1032
    Height = 479
    Align = alClient
    FriendlyName = 'IWURLWindow1'
    URI = 'http://localhost:9001/chart'
    Border = False
    MarginWidth = 0
    MarginHeight = 0
    Scrolling = usYes
    ExplicitTop = 191
  end
  object IWLabel1: TIWLabel
    Left = 0
    Top = 0
    Width = 1032
    Height = 49
    Align = alTop
    Font.Color = clNone
    Font.Size = 25
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'IntraWeb TBGWebCharts'
    ExplicitWidth = 555
  end
  object IWMemo1: TIWMemo
    Left = 0
    Top = 49
    Width = 1032
    Height = 136
    Align = alTop
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 1
    SubmitOnAsyncEvent = True
    FriendlyName = 'IWMemo1'
    Lines.Strings = (
      
        'Para Rodar o TBGWebCharts no IntraWeb '#233' necess'#225'rio usar o compon' +
        'ente IWURLWindows'
      ''
      
        'voc'#234' deve levantar um servidor de aplica'#231#227'o que retorne o gr'#225'fic' +
        'o do WebCharts em HTML e apontar'
      'a URL do seu servidor no campo URI do IWURLWindow'#11
      #11
      
        'Para testar o Exemplo, basta levantar o Servidor HORSE que '#233' dis' +
        'ponibilizado'
      
        'nos samples do componente e em seguida executar o sample do Intr' +
        'aWeb')
    ExplicitWidth = 555
  end
end
