object dmdCliente: TdmdCliente
  Height = 290
  Width = 486
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\Exemplo-Formacao\Multi-Camada\Win32\Debu' +
        'g\dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 224
    Top = 104
  end
  object qryValidaCPF: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select id, nome'
      'from pessoa'
      'where cpf = :cpf')
    Left = 224
    Top = 184
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
