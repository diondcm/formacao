inherited dmdCliente: TdmdCliente
  OnCreate = DataModuleCreate
  Height = 448
  Width = 720
  PixelsPerInch = 120
  inherited qryDados: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select IDCLIENTE, CODIGO, NOME, DATA_CADASTRO, SALDO_DISPONIVEL '
      'from cliente')
    object qryDadosIDCLIENTE: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryDadosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryDadosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryDadosDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryDadosSALDO_DISPONIVEL: TBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO_DISPONIVEL'
      Origin = 'SALDO_DISPONIVEL'
      currency = True
      Precision = 15
      Size = 2
    end
  end
end
