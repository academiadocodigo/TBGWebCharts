object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 433
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 0
      Width = 696
      Height = 392
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 168
      ExplicitTop = 104
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C000000EF470000842800000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 392
    Width = 696
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 105
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      Caption = 'Save Content'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 315
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      Caption = 'Save Text'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 420
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      Caption = 'Save Html'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 525
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      Caption = 'Print'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 210
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      Caption = 'Load Content'
      TabOrder = 5
      OnClick = Button6Click
    end
  end
  object WebCharts1: TWebCharts
    Left = 632
    Top = 360
  end
end
