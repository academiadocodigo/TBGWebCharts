object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 370
  ClientWidth = 740
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
    Width = 740
    Height = 300
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 679
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 738
      Height = 69
      Align = alTop
      Alignment = taCenter
      Caption = 
        'Para gerar esse gr'#225'fico, '#233' necess'#225'rio ter uma chave de API Googl' +
        'e. Para obter informama'#231#227'o de como  gerar a chave, assista a aul' +
        'a espec'#237'fica no Portal do o Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 665
    end
    object CEFWindowParent1: TCEFWindowParent
      Left = 1
      Top = 70
      Width = 738
      Height = 229
      Align = alClient
      TabOrder = 0
      ExplicitTop = 47
      ExplicitWidth = 677
      ExplicitHeight = 252
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 740
    Height = 70
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 679
    object Button1: TButton
      Left = 1
      Top = 33
      Width = 88
      Height = 36
      Align = alLeft
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 738
      Height = 32
      Align = alTop
      Padding.Left = 5
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      TabOrder = 1
      ExplicitWidth = 677
      object Label1: TLabel
        AlignWithMargins = True
        Left = 9
        Top = 6
        Width = 74
        Height = 20
        Align = alLeft
        Caption = 'Google API Key'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Edit1: TEdit
        AlignWithMargins = True
        Left = 89
        Top = 6
        Width = 337
        Height = 20
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 21
      end
    end
  end
  object Chromium1: TChromium
    Left = 624
    Top = 248
  end
  object WebCharts1: TWebCharts
    Left = 560
    Top = 248
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      130300009619E0BD010000001800000004000F000000030000004501034C4154
      0100490010000100055749445448020002003C00034C4E470100490010000100
      055749445448020002003C00054C4142454C0100490010000100055749445448
      020002003C000556414C55450100490010000100055749445448020002003C00
      01000A4348414E47455F4C4F47040082002D0000000100000000000000040000
      0002000000010000000800000003000000000000000400000004000000030000
      0008000000050000000000000004000000060000000200000008000000070000
      0004000000080000000800000005000000080000000900000008000000080000
      000A00000006000000080000000B0000000A000000080000000C000000070000
      00080000000D0000000C000000080000000E00000000000000040000000F0000
      000E0000000800000005540574657374650D00082D32332E35353034082D3436
      2E363333390953E36F205061756C6F0832323034363030300550082D32322E39
      303833082D34332E313936340D00082D32322E39303833082D34332E31393634
      0E52696F206465204A616E6569726F0831323237323030300500082D31392E38
      393137082D34332E393437380E42656C6F20486F72697A6F6E74650735313539
      3030300D00082D32332E35353034082D34362E363333390953E36F205061756C
      6F0231300D00082D32322E39303833082D34332E313936340E52696F20646520
      4A616E6569726F0232300D00082D31392E38393137082D34332E393437380E42
      656C6F20486F72697A6F6E74650233300C00062D31382E3535062D34342E3535
      024D47063330343032350D000B2D2D32312E383239373232082D34392E323037
      35025350063930353131360C000A2D32312E383239373232082D34392E323037
      35025350063930353131360D000A2D32322E3931363636370A2D34332E313833
      33333302524A0232300C000A2D32322E3931363636370A2D34332E3138333333
      3302524A0632363832313405050245530538313036330C000A2D32302E323636
      3636370A2D34302E323833333333024553053831303633}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 152
    object ClientDataSet1LAT: TStringField
      DisplayWidth = 14
      FieldName = 'LAT'
      Size = 60
    end
    object ClientDataSet1LNG: TStringField
      DisplayWidth = 11
      FieldName = 'LNG'
      Size = 60
    end
    object ClientDataSet1LABEL: TStringField
      DisplayWidth = 27
      FieldName = 'LABEL'
      Size = 60
    end
    object ClientDataSet1VALUE: TStringField
      DisplayWidth = 48
      FieldName = 'VALUE'
      Size = 60
    end
  end
  object ClientDataSet2: TClientDataSet
    PersistDataPacket.Data = {
      800200009619E0BD010000001800000005000A000000030000001801034C4154
      0100490010000100055749445448020002003C00034C4E470100490010000100
      055749445448020002003C000255460100490010000100055749445448020002
      0002000A4E554D564143494E415308000400100000001050455243504F505641
      43494E41444153080004001000000001000A4348414E47455F4C4F4704008200
      1E00000001000000000000000400000002000000000000000400000003000000
      0000000004000000040000000000000004000000050000000300000008000000
      0600000004000000080000000700000001000000080000000800000002000000
      080000000900000005000000080000000A000000060000000800000005000106
      2D31382E3535062D34342E3535024D4700000000648E12410500010A2D32312E
      383239373232082D34392E3230373502535000000000389F2B410500010A2D32
      322E393136363637092D343331383333333302524A00000000D85E1041055001
      0A2D32302E3236363636370A2D34302E3238333333330D00010A2D32322E3931
      363636370A2D34332E31383333333302524A00000000D85E10410D00010A2D32
      302E3236363636370A2D34302E3238333333330245530000000070CAF3400C00
      00062D31382E3535062D34342E3535024D4700000000648E1241E17A14AE47E1
      F63F0C00000A2D32312E383239373232082D34392E3230373502535000000000
      389F2B415C8FC2F5285CFF3F0C00000A2D32322E3931363636370A2D34332E31
      383333333302524A00000000D85E1041A4703D0AD7A3F83F0C00000A2D32302E
      3236363636370A2D34302E3238333333330245530000000070CAF340D7A3703D
      0AD7FF3F}
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
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 104
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
      DisplayWidth = 11
      FieldName = 'NUMVACINAS'
    end
    object ClientDataSet2PERCPOPVACINADAS: TFloatField
      DisplayLabel = '% da popula'#231#227'o Vacinada'
      DisplayWidth = 17
      FieldName = 'PERCPOPVACINADAS'
    end
  end
end
