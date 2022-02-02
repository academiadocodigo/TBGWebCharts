object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 458
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 0
      Width = 536
      Height = 408
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 231
      ExplicitTop = -6
      ExplicitWidth = 311
      ControlData = {
        4C000000663700002B2A00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 536
      Height = 408
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      Visible = False
      ExplicitLeft = -6
      ExplicitTop = -1
      ExplicitWidth = 225
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 408
    Width = 536
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object Button1: TButton
      Left = 105
      Top = 5
      Width = 100
      Height = 40
      Align = alLeft
      Caption = 'Imprimir'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 5
      Top = 5
      Width = 100
      Height = 40
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object WebCharts1: TWebCharts
    Left = 456
    Top = 376
  end
end
