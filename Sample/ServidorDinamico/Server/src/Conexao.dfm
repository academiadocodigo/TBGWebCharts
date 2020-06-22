object FConexao: TFConexao
  OldCreateOrder = False
  Height = 413
  Width = 763
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Database\RELATORIOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 192
    Top = 120
  end
  object DataSource1: TDataSource
    Left = 432
    Top = 168
  end
end
