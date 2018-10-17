object WebModule1: TWebModule1
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'tbgchart'
      PathInfo = '/tbgchart'
      OnAction = WebModule1tbgchartAction
    end>
  Height = 230
  Width = 415
  object WebCharts1: TWebCharts
    Left = 208
    Top = 56
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 112
  end
end
