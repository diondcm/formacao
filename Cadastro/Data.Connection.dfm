object dmdConnection: TdmdConnection
  Height = 251
  Width = 486
  object SQLConnection: TSQLConnection
    Left = 352
    Top = 120
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\Exemplo-Formacao\Cadastro\Win32\Debug\te' +
        'steCadastro.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 120
  end
end
