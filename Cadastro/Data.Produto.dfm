inherited dmdProduto: TdmdProduto
  Height = 431
  Width = 767
  PixelsPerInch = 120
  inherited qryDados: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'SELECT IDPRODUTO,'
      '       DESCRICAO,'
      '       PRECO_DESEJADO,'
      '       MODELO,'
      '       DATA_CADASTRO'
      '  FROM PRODUTO')
    object qryDadosIDPRODUTO: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryDadosDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryDadosPRECO_DESEJADO: TFloatField
      DisplayLabel = 'Pre'#231'o Desejado'
      FieldName = 'PRECO_DESEJADO'
      Origin = 'PRECO_DESEJADO'
      currency = True
    end
    object qryDadosMODELO: TWideStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 50
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 100
    end
    object qryDadosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
end
