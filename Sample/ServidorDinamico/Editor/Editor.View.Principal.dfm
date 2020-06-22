object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 640
  ClientWidth = 1059
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1059
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 15
    TabOrder = 0
    object Button3: TButton
      Left = 983
      Top = 10
      Width = 66
      Height = 45
      Margins.Bottom = 10
      Align = alRight
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = Button3Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 10
      Top = 10
      Width = 663
      Height = 31
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'TITULO'
      ListSource = DataSource1
      ParentFont = False
      TabOrder = 1
      OnClick = DBLookupComboBox1Click
      ExplicitLeft = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 599
    Width = 1059
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 984
      Top = 0
      Width = 75
      Height = 41
      Align = alRight
      Caption = 'Sair'
      TabOrder = 0
    end
    object Button4: TButton
      Left = 907
      Top = 0
      Width = 77
      Height = 41
      Align = alRight
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 70
    Width = 1059
    Height = 529
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel5: TPanel
      Left = 336
      Top = 0
      Width = 723
      Height = 529
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 377
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 0
        object Memo1: TMemo
          Left = 401
          Top = 123
          Width = 317
          Height = 249
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object ListBox1: TListBox
          Left = 5
          Top = 123
          Width = 196
          Height = 249
          Align = alLeft
          ItemHeight = 13
          TabOrder = 1
        end
        object ListBox2: TListBox
          Left = 201
          Top = 123
          Width = 200
          Height = 249
          Align = alLeft
          ItemHeight = 13
          TabOrder = 2
        end
        object Panel8: TPanel
          Left = 5
          Top = 5
          Width = 713
          Height = 118
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            713
            118)
          object Label1: TLabel
            Left = 1
            Top = 38
            Width = 107
            Height = 13
            Caption = 'Descri'#231#227'o do Relat'#243'rio'
          end
          object LabeledEdit1: TLabeledEdit
            Left = 1
            Top = 14
            Width = 432
            Height = 21
            EditLabel.Width = 87
            EditLabel.Height = 13
            EditLabel.Caption = 'Titulo do Relat'#243'rio'
            TabOrder = 0
          end
          object Memo2: TMemo
            Left = 1
            Top = 57
            Width = 711
            Height = 45
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 377
        Width = 723
        Height = 152
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        object WebBrowser1: TWebBrowser
          Left = 5
          Top = 5
          Width = 713
          Height = 142
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 1
          ExplicitTop = 4
          ExplicitWidth = 839
          ExplicitHeight = 395
          ControlData = {
            4C000000B1490000AD0E00000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
        object Panel9: TPanel
          Left = 5
          Top = 5
          Width = 713
          Height = 142
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 713
            Height = 142
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object WebBrowser2: TWebBrowser
              Left = 0
              Top = 0
              Width = 713
              Height = 142
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 867
              ExplicitHeight = 588
              ControlData = {
                4C000000B1490000AD0E00000000000000000000000000000000000000000000
                000000004C000000000000000000000001000000E0D057007335CF11AE690800
                2B2E126208000000000000004C0000000114020000000000C000000000000046
                8000000000000000000000000000000000000000000000000000000000000000
                00000000000000000100000000000000000000000000000000000000}
            end
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 336
      Height = 529
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      object StringGrid1: TStringGrid
        Left = 5
        Top = 5
        Width = 326
        Height = 470
        Align = alClient
        ColCount = 4
        FixedCols = 0
        RowCount = 100
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
        TabOrder = 0
        ColWidths = (
          89
          70
          78
          64)
      end
      object Button2: TButton
        Left = 5
        Top = 475
        Width = 326
        Height = 49
        Align = alBottom
        Caption = 'Gerar Relat'#243'rio'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object WebCharts1: TWebCharts
    Left = 528
    Top = 450
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 688
    Top = 448
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 608
    Top = 448
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 449
    Top = 449
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Bancos\Firebird\GUARA_BARREIRAS.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 369
    Top = 449
  end
end
