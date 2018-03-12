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
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
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
        object DBGrid4: TDBGrid
          Left = 442
          Top = 361
          Width = 455
          Height = 274
          DataSource = DataSource4
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBGrid3: TDBGrid
          Left = -4
          Top = 361
          Width = 440
          Height = 274
          DataSource = DataSource3
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel5: TPanel
          Left = -4
          Top = 320
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            450
            41)
          object Label3: TLabel
            Left = 11
            Top = 8
            Width = 75
            Height = 21
            Caption = 'DATASET 3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Button3: TButton
            Left = 360
            Top = 10
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = Button3Click
          end
        end
        object Panel6: TPanel
          Left = 449
          Top = 323
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            450
            41)
          object Label4: TLabel
            Left = 11
            Top = 8
            Width = 75
            Height = 21
            Caption = 'DATASET 4'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Button4: TButton
            Left = 360
            Top = 10
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = Button4Click
          end
        end
        object Panel4: TPanel
          Left = 445
          Top = 6
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 4
          DesignSize = (
            450
            41)
          object Label2: TLabel
            Left = 11
            Top = 8
            Width = 75
            Height = 21
            Caption = 'DATASET 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Button2: TButton
            Left = 360
            Top = 10
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = Button2Click
          end
        end
        object Panel3: TPanel
          Left = -3
          Top = 6
          Width = 457
          Height = 41
          BevelOuter = bvNone
          TabOrder = 5
          DesignSize = (
            457
            41)
          object Label1: TLabel
            Left = 11
            Top = 8
            Width = 75
            Height = 21
            Caption = 'DATASET 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Button1: TButton
            Left = 367
            Top = 10
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = Button1Click
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 47
          Width = 431
          Height = 274
          DataSource = DataSource1
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBGrid2: TDBGrid
          Left = 437
          Top = 47
          Width = 459
          Height = 274
          DataSource = DataSource2
          TabOrder = 7
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
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
        Left = -15
        Top = 0
        Width = 200
        Height = 60
        BiDiMode = bdLeftToRight
        Caption = 'Bars'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        ParentBiDiMode = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton10: TSpeedButton
        Left = -15
        Top = 62
        Width = 200
        Height = 60
        BiDiMode = bdLeftToRight
        Caption = 'Horizontal Bar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        ParentBiDiMode = False
        OnClick = SpeedButton10Click
      end
      object SpeedButton4: TSpeedButton
        Left = -15
        Top = 124
        Width = 200
        Height = 60
        Caption = 'Lines'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton4Click
      end
      object SpeedButton6: TSpeedButton
        Left = -15
        Top = 186
        Width = 200
        Height = 60
        Caption = 'LineStacked'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton6Click
      end
      object SpeedButton7: TSpeedButton
        Left = -15
        Top = 248
        Width = 200
        Height = 60
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
        Left = -15
        Top = 310
        Width = 200
        Height = 60
        Caption = 'Doughnut'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object SpeedButton8: TSpeedButton
        Left = -15
        Top = 372
        Width = 200
        Height = 60
        Caption = 'Dashboard'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton8Click
      end
      object SpeedButton9: TSpeedButton
        Left = -15
        Top = 434
        Width = 200
        Height = 60
        Caption = 'Dashboard 2'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton9Click
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
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 161
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 305
    Top = 162
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 218
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 304
    Top = 224
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
  object DataSource3: TDataSource
    DataSet = ClientDataSet3
    Left = 305
    Top = 282
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet4
    Left = 305
    Top = 346
  end
  object WebCharts1: TWebCharts
    Left = 269
    Top = 113
  end
end
