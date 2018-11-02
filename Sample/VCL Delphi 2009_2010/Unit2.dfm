object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TBGWebCharts VCL'
  ClientHeight = 764
  ClientWidth = 1122
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
    Width = 1122
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clWindowFrame
    ParentBackground = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 1122
    Height = 707
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 185
      Top = 0
      Width = 937
      Height = 707
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        object WebBrowser1: TWebBrowser
          Left = 0
          Top = 0
          Width = 929
          Height = 679
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 920
          ExplicitHeight = 640
          ControlData = {
            4C000000046000002D4600000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        object Panel5: TPanel
          Left = -4
          Top = 320
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel6: TPanel
          Left = 449
          Top = 323
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 445
          Top = 6
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 2
        end
        object Panel3: TPanel
          Left = -3
          Top = 6
          Width = 457
          Height = 41
          BevelOuter = bvNone
          TabOrder = 3
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 70
          Width = 929
          Height = 584
          Align = alClient
          DataSource = DataSource1
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 654
          Width = 929
          Height = 25
          DataSource = DataSource1
          Align = alBottom
          TabOrder = 5
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 70
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 6
          object ComboBox1: TComboBox
            Left = 16
            Top = 17
            Width = 145
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'ClientDataSet1'
            Items.Strings = (
              'ClientDataSet1'
              'ClientDataSet2'
              'ClientDataSet3'
              'ClientDataSet4'
              'ClientDataSet5'
              'ClientDataSet6'
              'ClientDataSet7')
          end
          object Carregar: TButton
            Left = 168
            Top = 16
            Width = 75
            Height = 25
            Caption = 'Carregar'
            TabOrder = 1
            OnClick = CarregarClick
          end
        end
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 707
      Align = alLeft
      BevelOuter = bvNone
      Color = clGrayText
      ParentBackground = False
      TabOrder = 1
      object SpeedButton3: TSpeedButton
        Left = 0
        Top = 0
        Width = 185
        Height = 40
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Bars'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        OnClick = SpeedButton3Click
        ExplicitLeft = -2
      end
      object SpeedButton10: TSpeedButton
        Left = 0
        Top = 80
        Width = 185
        Height = 40
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Horizontal Bar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        OnClick = SpeedButton10Click
        ExplicitTop = 50
      end
      object SpeedButton4: TSpeedButton
        Left = 0
        Top = 120
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Lines'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton4Click
        ExplicitTop = 100
      end
      object SpeedButton6: TSpeedButton
        Left = 0
        Top = 160
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'LineStacked'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton6Click
        ExplicitTop = 150
      end
      object SpeedButton7: TSpeedButton
        Left = 0
        Top = 200
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Pie'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton7Click
      end
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 240
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Doughnut'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
        ExplicitTop = 250
      end
      object SpeedButton8: TSpeedButton
        Left = 0
        Top = 280
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Dashboard'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton8Click
        ExplicitTop = 300
      end
      object SpeedButton9: TSpeedButton
        Left = 0
        Top = 320
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Dashboard 2'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton9Click
        ExplicitTop = 350
      end
      object SpeedButton5: TSpeedButton
        Left = 0
        Top = 647
        Width = 185
        Height = 60
        Align = alBottom
        Caption = 'DataSet'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton5Click
        ExplicitTop = 496
        ExplicitWidth = 200
      end
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 360
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Table'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitLeft = -2
        ExplicitTop = 354
      end
      object SpeedButton12: TSpeedButton
        Left = 0
        Top = 400
        Width = 185
        Height = 40
        Align = alTop
        Caption = 'Images'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton12Click
        ExplicitTop = 500
      end
      object SpeedButton15: TSpeedButton
        Left = 0
        Top = 40
        Width = 185
        Height = 40
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Bars/Lines'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        OnClick = SpeedButton15Click
        ExplicitTop = 34
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 161
  end
  object DataSource1: TDataSource
    Left = 305
    Top = 162
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 218
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 282
  end
  object ClientDataSet4: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 346
  end
  object WebCharts1: TWebCharts
    Left = 269
    Top = 113
  end
  object ClientDataSet5: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 409
    object ClientDataSet5CustNo: TFloatField
      FieldName = 'CustNo'
    end
    object ClientDataSet5Company: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object ClientDataSet5City: TStringField
      FieldName = 'City'
      Size = 15
    end
    object ClientDataSet5State: TStringField
      FieldName = 'State'
    end
    object ClientDataSet5Zip: TStringField
      FieldName = 'Zip'
      Size = 10
    end
    object ClientDataSet5Country: TStringField
      FieldName = 'Country'
    end
    object ClientDataSet5Phone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object ClientDataSet5TaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object ClientDataSet5Contact: TStringField
      FieldName = 'Contact'
    end
  end
  object ClientDataSet6: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 465
    object ClientDataSet6LAST_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'LAST_NAME'
    end
    object ClientDataSet6FIRST_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'FIRST_NAME'
    end
    object ClientDataSet6ACCT_NBR: TFloatField
      DisplayWidth = 10
      FieldName = 'ACCT_NBR'
    end
    object ClientDataSet6ADDRESS_1: TStringField
      DisplayWidth = 20
      FieldName = 'ADDRESS_1'
    end
    object ClientDataSet6CITY: TStringField
      DisplayWidth = 20
      FieldName = 'CITY'
    end
    object ClientDataSet6STATE: TStringField
      DisplayWidth = 5
      FieldName = 'STATE'
      Size = 2
    end
    object ClientDataSet6ZIP: TStringField
      DisplayWidth = 5
      FieldName = 'ZIP'
      Size = 5
    end
    object ClientDataSet6TELEPHONE: TStringField
      DisplayWidth = 12
      FieldName = 'TELEPHONE'
      Size = 12
    end
    object ClientDataSet6DATE_OPEN: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_OPEN'
    end
    object ClientDataSet6SS_NUMBER: TFloatField
      DisplayWidth = 10
      FieldName = 'SS_NUMBER'
    end
    object ClientDataSet6PICTURE: TStringField
      DisplayWidth = 50000
      FieldName = 'PICTURE'
      Size = 100000
    end
    object ClientDataSet6BIRTH_DATE: TDateField
      DisplayWidth = 10
      FieldName = 'BIRTH_DATE'
    end
    object ClientDataSet6RISK_LEVEL: TStringField
      DisplayWidth = 9
      FieldName = 'RISK_LEVEL'
      Size = 8
    end
    object ClientDataSet6OCCUPATION: TStringField
      DisplayWidth = 20
      FieldName = 'OCCUPATION'
    end
    object ClientDataSet6OBJECTIVES: TStringField
      DisplayWidth = 10
      FieldName = 'OBJECTIVES'
      Size = 10
    end
    object ClientDataSet6INTERESTS: TStringField
      DisplayWidth = 120
      FieldName = 'INTERESTS'
      Size = 120
    end
    object ClientDataSet6IMAGE: TBlobField
      DisplayWidth = 17
      FieldName = 'IMAGE'
      BlobType = ftTypedBinary
      Size = 1
    end
  end
  object ClientDataSet7: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 521
    object ClientDataSet7LAST_NAME: TStringField
      FieldName = 'LAST_NAME'
    end
    object ClientDataSet7FIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
    end
    object ClientDataSet7ACCT_NBR: TFloatField
      FieldName = 'ACCT_NBR'
    end
    object ClientDataSet7CITY: TStringField
      FieldName = 'CITY'
    end
    object ClientDataSet7STATE: TStringField
      FieldName = 'STATE'
      Size = 2
    end
    object ClientDataSet7ZIP: TStringField
      FieldName = 'ZIP'
      Size = 5
    end
    object ClientDataSet7TELEPHONE: TStringField
      FieldName = 'TELEPHONE'
      Size = 12
    end
    object ClientDataSet7DATE_OPEN: TDateField
      FieldName = 'DATE_OPEN'
    end
    object ClientDataSet7SS_NUMBER: TFloatField
      FieldName = 'SS_NUMBER'
    end
    object ClientDataSet7BIRTH_DATE: TDateField
      FieldName = 'BIRTH_DATE'
    end
    object ClientDataSet7RISK_LEVEL: TStringField
      FieldName = 'RISK_LEVEL'
      Size = 8
    end
    object ClientDataSet7OCCUPATION: TStringField
      FieldName = 'OCCUPATION'
    end
    object ClientDataSet7OBJECTIVES: TStringField
      FieldName = 'OBJECTIVES'
      Size = 10
    end
  end
end
