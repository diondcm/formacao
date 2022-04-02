object dmdProduto: TdmdProduto
  Height = 395
  Width = 694
  PixelsPerInch = 120
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT ID, TITULO, PRECO, DESCRICAO, URL_IMAGEM '
      'FROM PRODUTOS')
    Left = 288
    Top = 180
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 288
    Top = 64
  end
end
