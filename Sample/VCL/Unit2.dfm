object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 699
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
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 65
      Height = 57
      Align = alLeft
      OnClick = SpeedButton1Click
      ExplicitTop = 6
      ExplicitHeight = 51
    end
  end
  object SplitView1: TSplitView
    Left = 0
    Top = 57
    Width = 200
    Height = 642
    Color = clGrayText
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 1
    object StackPanel1: TStackPanel
      Left = 0
      Top = 0
      Width = 200
      Height = 642
      Align = alClient
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = SpeedButton3
          HorizontalPositioning = sphpLeft
        end
        item
          Control = SpeedButton10
        end
        item
          Control = SpeedButton4
        end
        item
          Control = SpeedButton6
        end
        item
          Control = SpeedButton7
        end
        item
          Control = SpeedButton2
        end
        item
          Control = SpeedButton8
        end
        item
          Control = SpeedButton9
        end
        item
          Control = SpeedButton5
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpBottom
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      HorizontalPositioning = sphpFill
      ParentFont = False
      TabOrder = 0
      object SpeedButton3: TSpeedButton
        Left = 0
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
        Left = 0
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
        Left = 0
        Top = 124
        Width = 200
        Height = 60
        Caption = 'Lines'
        Flat = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton6: TSpeedButton
        Left = 0
        Top = 186
        Width = 200
        Height = 60
        Caption = 'LineStacked'
        Flat = True
        OnClick = SpeedButton6Click
      end
      object SpeedButton7: TSpeedButton
        Left = 0
        Top = 248
        Width = 200
        Height = 60
        Caption = 'Pie'
        Flat = True
        OnClick = SpeedButton7Click
      end
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 310
        Width = 200
        Height = 60
        Caption = 'Doughnut'
        Flat = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton8: TSpeedButton
        Left = 0
        Top = 372
        Width = 200
        Height = 60
        Caption = 'Dashboard'
        Flat = True
        OnClick = SpeedButton8Click
      end
      object SpeedButton9: TSpeedButton
        Left = 0
        Top = 434
        Width = 200
        Height = 60
        Caption = 'Dashboard 2'
        Flat = True
        OnClick = SpeedButton9Click
      end
      object SpeedButton5: TSpeedButton
        Left = 0
        Top = 496
        Width = 200
        Height = 60
        Align = alBottom
        Caption = 'DataSet'
        Flat = True
        OnClick = SpeedButton5Click
      end
    end
  end
  object Panel2: TPanel
    Left = 200
    Top = 57
    Width = 720
    Height = 642
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object CardPanel1: TCardPanel
      Left = 0
      Top = 0
      Width = 720
      Height = 642
      Align = alClient
      ActiveCard = Card1
      Caption = 'CardPanel1'
      TabOrder = 0
      object Card1: TCard
        Left = 1
        Top = 1
        Width = 718
        Height = 640
        Caption = 'Card1'
        CardIndex = 0
        TabOrder = 0
        object WebBrowser1: TWebBrowser
          Left = 0
          Top = 0
          Width = 718
          Height = 640
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 920
          ControlData = {
            4C000000354A0000254200000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
      object Card2: TCard
        Left = 1
        Top = 1
        Width = 718
        Height = 640
        Caption = 'Card2'
        CardIndex = 1
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 41
          Width = 457
          Height = 274
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBGrid2: TDBGrid
          Left = 463
          Top = 41
          Width = 455
          Height = 274
          DataSource = DataSource2
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 457
          Height = 41
          BevelOuter = bvNone
          TabOrder = 2
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
        object Panel4: TPanel
          Left = 463
          Top = 0
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 3
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
        object DBGrid3: TDBGrid
          Left = 5
          Top = 361
          Width = 455
          Height = 274
          DataSource = DataSource3
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel5: TPanel
          Left = 10
          Top = 320
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 5
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
        object DBGrid4: TDBGrid
          Left = 466
          Top = 364
          Width = 455
          Height = 274
          DataSource = DataSource4
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel6: TPanel
          Left = 471
          Top = 323
          Width = 450
          Height = 41
          BevelOuter = bvNone
          TabOrder = 7
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
        object DBNavigator1: TDBNavigator
          Left = 144
          Top = 528
          Width = 240
          Height = 25
          DataSource = DataSource3
          TabOrder = 8
        end
        object DBNavigator2: TDBNavigator
          Left = 600
          Top = 536
          Width = 240
          Height = 25
          DataSource = DataSource4
          TabOrder = 9
        end
      end
      object Card3: TCard
        Left = 1
        Top = 1
        Width = 718
        Height = 640
        Caption = 'Card3'
        CardIndex = 2
        TabOrder = 2
      end
    end
  end
  object Panel7: TPanel
    Left = 920
    Top = 57
    Width = 202
    Height = 642
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 177
      Height = 117
      Caption = 
        'Observer atentamente o funcionamento deste sample para ter suces' +
        'so em suas implementa'#231#245'es. N'#227'o se esquecendo de embarcar nos seu' +
        's projetos as pastas css e js que acompanham este exemplo, sem e' +
        'las  seus gr'#225'ficos n'#227'o ser'#227'o exibidos.'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 16
      Top = 19
      Width = 155
      Height = 17
      Caption = 'Informa'#231#245'es Importantes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object WebCharts1: TWebCharts
    Left = 248
    Top = 160
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 153
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 441
    Top = 154
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 769
    Top = 146
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 864
    Top = 152
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 474
  end
  object ClientDataSet4: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 466
  end
  object DataSource3: TDataSource
    DataSet = ClientDataSet3
    Left = 545
    Top = 482
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet4
    Left = 849
    Top = 490
  end
end
