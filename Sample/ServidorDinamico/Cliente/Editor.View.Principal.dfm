object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Gerador de Relat'#243'rios'
  ClientHeight = 565
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    1085
    565)
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1085
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 24
    DesignSize = (
      1085
      89)
    object Label1: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 16
      Width = 1065
      Height = 19
      Margins.Right = 25
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Titulo'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 40
      Width = 1065
      Height = 13
      Margins.Right = 25
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label3: TLabel
      Left = 8
      Top = 69
      Width = 100
      Height = 13
      Caption = 'Selecione o Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 1085
    Height = 476
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 808
      Top = 0
      Width = 277
      Height = 476
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 277
        Height = 432
        Align = alClient
        ColCount = 2
        FixedCols = 0
        RowCount = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          138
          120)
      end
      object Button2: TButton
        Left = 0
        Top = 432
        Width = 277
        Height = 44
        Align = alBottom
        Caption = 'Gerar'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 808
      Height = 476
      Align = alClient
      BevelOuter = bvNone
      Padding.Right = 10
      TabOrder = 1
      object WebBrowser1: TWebBrowser
        Left = 241
        Top = 0
        Width = 557
        Height = 476
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 224
        ExplicitTop = 176
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C00000091390000323100000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 241
        Height = 476
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object DBLookupListBox1: TDBLookupListBox
          Left = 0
          Top = 0
          Width = 241
          Height = 420
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'TITULO'
          ListSource = DataSource1
          ParentFont = False
          TabOrder = 0
          OnDblClick = DBLookupListBox1DblClick
        end
        object Button1: TButton
          Left = 0
          Top = 432
          Width = 241
          Height = 44
          Align = alBottom
          Caption = 'Atualizar Lista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 114
    Top = 8
    Width = 849
    Height = 549
    Anchors = []
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Memo1: TMemo
      Left = 16
      Top = 24
      Width = 817
      Height = 513
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'ATEN'#199#195'O'
        'OCULTE OU EXCLUA ESSE PANEL AP'#211'S LER E ENTENDER AS ORIENTA'#199#213'ES'
        ''
        
          '================================================================' +
          '=='
        'ESSE '#201' APENAS UM DEMO - N'#195'O DAMOS SUPORTE OU MANUTEN'#199#195'O NO MESMO'
        
          '================================================================' +
          '=='
        ''
        
          'Esse demo foi desenvolvido no intuito de demonstrar as possibili' +
          'dades de implementa'#231#227'o que podem ser realizadas com o TBGWebChar' +
          'ts, '
        
          'ele '#233' apenas uma demonstra'#231#227'o, n'#227'o deve ser usado em produto no ' +
          'contexto original que foi desenvolvido, '
        ''
        
          #201' DE SUA TOTAL RESPONSABILIDADE o uso, altera'#231#245'es, implanta'#231#227'o e' +
          ' atualiza'#231#245'es sobre o mesmo.'
        ''
        
          'Nossa equipe n'#227'o se preocupar'#225' em manter compatibilidade com ess' +
          'e demo, portanto ao utilizar em produ'#231#227'o tenha ci'#234'ncia que '#233' de ' +
          'sua '
        
          'respons'#225'bilidade manter e adequar o mesmo para futuras implement' +
          'a'#231#245'es e melhorias.'
        ''
        
          'Dentro do treinamento do TBGWebCharts voc'#234' pode encontrar o vide' +
          'o com o passo-a-passo da constru'#231#227'o desse projeto para que voc'#234' '
        'possa tirar todas as d'#250'vidas e entender seu funcionamento.'
        ''
        
          'N'#195'O DAMOS SUPORTE NEM TIRAMOS D'#218'VIDA SOBRE O DESENVOLVIMENTO DO ' +
          'MESMO EM NOSSOS GRUPOS E CANAIS OFICIAIS.'
        ''
        '======'
        'USO'
        '======'
        ''
        
          'Para o correto funcionamento, '#233' necess'#225'rio que voc'#234' configure o ' +
          'FDConnection da aplica'#231#227'o CLIENT e EDITOR apontando para o Banco' +
          ' de '
        
          'Dados local da sua aplica'#231#227'o de onde os dados ser'#227'o extraidos pa' +
          'ra os relat'#243'rios.'
        ''
        
          'Caso voc'#234' utilize um Banco diferente do FIREBIRD '#233' necess'#225'rio qu' +
          'e o Banco de Relatorios tenha uma tabela com a mesma estrutura d' +
          'a '
        
          'tabela de RELATORIOS do Banco .FDB disponibilizado dentro da pas' +
          'ta SERVER.')
      ParentFont = False
      TabOrder = 0
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 16
    Top = 96
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Bancos\Firebird\GUARA_BARREIRAS.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 88
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 168
    Top = 96
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 248
    Top = 96
  end
end
