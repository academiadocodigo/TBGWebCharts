object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 572
  ClientWidth = 1284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1284
    Height = 502
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1282
      Height = 500
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Maps'
        object CEFWindowParent1: TCEFWindowParent
          Left = 0
          Top = 0
          Width = 1274
          Height = 472
          Align = alClient
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Configurations'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1274
          Height = 472
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 1274
            Height = 137
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Panel4'
            TabOrder = 0
            object DBGrid2: TDBGrid
              Left = 0
              Top = 0
              Width = 1274
              Height = 137
              Align = alClient
              DataSource = DataSource2
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 137
            Width = 1274
            Height = 335
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel5'
            TabOrder = 1
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 265
              Height = 335
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Panel6'
              TabOrder = 0
              object PageControl2: TPageControl
                Left = 0
                Top = 33
                Width = 265
                Height = 302
                ActivePage = TabSheet3
                Align = alClient
                TabOrder = 0
                object TabSheet3: TTabSheet
                  Caption = 'Config'
                  object ValueListConfig: TValueListEditor
                    Left = 0
                    Top = 0
                    Width = 257
                    Height = 274
                    Align = alClient
                    DefaultColWidth = 130
                    TabOrder = 0
                    ColWidths = (
                      130
                      121)
                  end
                end
                object Marker: TTabSheet
                  Caption = 'Marker'
                  ImageIndex = 4
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object ValueListMarker: TValueListEditor
                    Left = 0
                    Top = 0
                    Width = 257
                    Height = 274
                    Align = alClient
                    DefaultColWidth = 130
                    Strings.Strings = (
                      '')
                    TabOrder = 0
                    ColWidths = (
                      130
                      121)
                  end
                end
                object TabSheet4: TTabSheet
                  Caption = 'Circle'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object ValueListCircle: TValueListEditor
                    Left = 0
                    Top = 0
                    Width = 257
                    Height = 274
                    Align = alClient
                    DefaultColWidth = 130
                    Strings.Strings = (
                      '')
                    TabOrder = 0
                    ColWidths = (
                      130
                      121)
                  end
                end
                object TabSheet5: TTabSheet
                  Caption = 'HeatMap'
                  ImageIndex = 2
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object ValueListHeatMap: TValueListEditor
                    Left = 0
                    Top = 0
                    Width = 257
                    Height = 274
                    Align = alClient
                    DefaultColWidth = 130
                    Strings.Strings = (
                      '')
                    TabOrder = 0
                    ColWidths = (
                      130
                      121)
                  end
                end
                object Directions: TTabSheet
                  Caption = 'Directions'
                  ImageIndex = 3
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object ValueListDirections: TValueListEditor
                    Left = 0
                    Top = 0
                    Width = 257
                    Height = 274
                    Align = alClient
                    DefaultColWidth = 130
                    Strings.Strings = (
                      '')
                    TabOrder = 0
                    ColWidths = (
                      130
                      121)
                  end
                end
              end
              object DBNavigator1: TDBNavigator
                Left = 0
                Top = 0
                Width = 265
                Height = 33
                DataSource = DataSource2
                Align = alTop
                TabOrder = 1
              end
            end
            object Memo1: TMemo
              Left = 265
              Top = 0
              Width = 1009
              Height = 335
              Align = alClient
              Lines.Strings = (
                'Memo1')
              ScrollBars = ssBoth
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 502
    Width = 1284
    Height = 70
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      1284
      70)
    object Button1: TButton
      Left = 18
      Top = 0
      Width = 400
      Height = 68
      Anchors = [akTop, akBottom]
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 442
      Top = 0
      Width = 400
      Height = 68
      Anchors = [akTop, akBottom]
      Caption = 'Atualizar  Endere'#231'os sem Geolocaliza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 866
      Top = 1
      Width = 400
      Height = 68
      Anchors = [akTop, akBottom]
      Caption = 'Obter dados do Directions'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Chromium1: TChromium
    Left = 1040
    Top = 80
  end
  object WebCharts1: TWebCharts
    Left = 1008
    Top = 80
  end
  object ClientDataSet2: TClientDataSet
    PersistDataPacket.Data = {
      AC0700009619E0BD010000001800000008000D000000030000008301034C4154
      0100490010000100055749445448020002003C00034C4E470100490010000100
      055749445448020002003C000255460100490010000100055749445448020002
      0002000A4E554D564143494E415308000400100000001050455243504F505641
      43494E4144415308000400100000000741444452455353010049001000010005
      574944544802000200640009494441444452455353040001001000000004494E
      464F010049001000010005574944544802000200C80001000A4348414E47455F
      4C4F470400820027000000010000000000000004000000020000000100000008
      0000000300000002000000080000000400000003000000080000000500000000
      0000000400000006000000050000000800000007000000060000000800000008
      00000000000000040000000900000008000000080000000A0000000900000008
      0000000B0000000A000000080000000C00000000000000040000000D0000000C
      000000080000000505400253500000000004D35541B81E85EB51B828400C53C2
      4F205041554C4F205350010000000D00400B2D32332E353530353139390B2D34
      362E363333333039340253500000000004D35541B81E85EB51B828400C53C24F
      205041554C4F205350010000000D00000B2D32332E353530353139390B2D3436
      2E363333333039340253500000000004D35541B81E85EB51B828400C53C24F20
      5041554C4F20535001000000633C68343E53E36F205061756C6F3C2F68343E3C
      703E3C623E382E3134372E3430303C2F623E20766163696E61732061706C6963
      616461733C62722F3E3C623E31322C3336253C2F623E20646120706F70756C61
      E7E36F20766163696E6164613C2F703E0C00000B2D32332E353530353139390B
      2D34362E363333333039340253500000000004D35541B81E85EB51B828400C53
      C24F205041554C4F20535001000000613C623E53E36F205061756C6F3C2F623E
      3C703E3C623E382E3134372E3430303C2F623E20766163696E61732061706C69
      63616461733C62722F3E3C623E31322C3336253C2F623E20646120706F70756C
      61E7E36F20766163696E6164613C2F703E05050002524A00000000AC1A3A4133
      33333333B323401152494F204445204A414E4549524F20524A020000005F3C62
      3E53E36F205061756C6F3C2F623E3C703E3C623E312E3731302E3736343C2F62
      3E20766163696E61732061706C6963616461733C62722F3E3C623E392C38353C
      2F623E20646120706F70756C61E7E36F20766163696E6164613C2F703E0D0000
      0B2D32322E393036383436370B2D34332E3137323839363502524A00000000AC
      1A3A413333333333B323401152494F204445204A414E4549524F20524A020000
      005F3C623E53E36F205061756C6F3C2F623E3C703E3C623E312E3731302E3736
      343C2F623E20766163696E61732061706C6963616461733C62722F3E3C623E39
      2C38353C2F623E20646120706F70756C61E7E36F20766163696E6164613C2F70
      3E0C00000B2D32322E393036383436370B2D34332E3137323839363502524A00
      000000AC1A3A413333333333B323401152494F204445204A414E4549524F2052
      4A02000000643C623E52696F206465204A616E6569726F3C2F623E3C703E3C62
      3E312E3731302E3736343C2F623E20766163696E61732061706C696361646173
      3C62722F3E3C623E392C38353C2F623E20646120706F70756C61E7E36F207661
      63696E6164613C2F703E050540024D47000000009B6A4241AE47E17A14AE2640
      0F4D494E415320474552414953204D47030000000D0500024D47000000009B6A
      4241AE47E17A14AE26400F4D494E415320474552414953204D4703000000623C
      623E4D696E6173204765726169733C2F623E3C703E3C623E312E3731302E3736
      343C2F623E20766163696E61732061706C6963616461733C62722F3E3C623E39
      2C38353C2F623E20646120706F70756C61E7E36F20766163696E6164613C2F70
      3E0D0500024D47000000009B6A4241AE47E17A14AE26400F4D494E4153204745
      52414953204D4703000000633C623E4D696E6173204765726169733C2F623E3C
      703E3C623E322E3431332E3837383C2F623E20766163696E61732061706C6963
      616461733C62722F3E3C623E31312C33343C2F623E20646120706F70756C61E7
      E36F20766163696E6164613C2F703E0C00000A2D31382E3531323137380B2D34
      342E35353530333038024D47000000009B6A4241AE47E17A14AE26400F4D494E
      415320474552414953204D4703000000633C623E4D696E617320476572616973
      3C2F623E3C703E3C623E322E3431332E3837383C2F623E20766163696E617320
      61706C6963616461733C62722F3E3C623E31312C33343C2F623E20646120706F
      70756C61E7E36F20766163696E6164613C2F703E05054002455300000000043F
      1F41333333333333294011455350495249544F2053414E544F20455304000000
      0C050002455300000000043F1F41333333333333294011455350495249544F20
      53414E544F20455304000000633C623E457370ED7269746F2053616E746F3C2F
      623E3C703E3C623E3531312E3933373C2F623E20766163696E61732061706C69
      63616461733C62722F3E3C623E31322C36303C2F623E20646120706F70756C61
      E7E36F20766163696E6164613C2F703E}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'LAT'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LNG'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NUMVACINAS'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'PERCPOPVACINADAS'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'ADDRESS'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IDADDRESS'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'INFO'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1008
    Top = 32
    object ClientDataSet2LAT: TStringField
      DisplayLabel = 'Latitude'
      DisplayWidth = 11
      FieldName = 'LAT'
      Size = 60
    end
    object ClientDataSet2LNG: TStringField
      DisplayLabel = 'Longitude'
      DisplayWidth = 12
      FieldName = 'LNG'
      Size = 60
    end
    object ClientDataSet2UF: TStringField
      DisplayWidth = 2
      FieldName = 'UF'
      Size = 2
    end
    object ClientDataSet2NUMVACINAS: TFloatField
      DisplayLabel = 'N'#186' de Vacinas Aplicadas'
      DisplayWidth = 19
      FieldName = 'NUMVACINAS'
    end
    object ClientDataSet2PERCPOPVACINADAS: TFloatField
      DisplayLabel = '% da popula'#231#227'o Vacinada'
      DisplayWidth = 20
      FieldName = 'PERCPOPVACINADAS'
    end
    object ClientDataSet2ADDRESS: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 20
      FieldName = 'ADDRESS'
      Size = 100
    end
    object ClientDataSet2IDADDRESS: TIntegerField
      DisplayLabel = 'ID Endere'#231'o'
      DisplayWidth = 9
      FieldName = 'IDADDRESS'
    end
    object ClientDataSet2INFO: TStringField
      FieldName = 'INFO'
      Size = 200
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 1013
    Top = 137
  end
end
