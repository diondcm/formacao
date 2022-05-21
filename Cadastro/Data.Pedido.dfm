inherited dmdPedido: TdmdPedido
  Height = 439
  Width = 720
  inherited qryDados: TFDQuery
    AfterOpen = qryDadosAfterOpen
    AfterScroll = qryDadosAfterScroll
    OnCalcFields = qryDadosCalcFields
    AggregatesActive = True
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'SELECT P.IDPEDIDO,'
      '       P.CODIGO,'
      '       P.IDCLIENTE,'
      '       P.DATA_CADASTRO,'
      '       P.VALOR_TOTAL,'
      '       P.QTD_ITENS,'
      '       C.NOME'
      '  FROM PEDIDO P'
      '  LEFT JOIN CLIENTE C'
      '  ON C.IDCLIENTE = P.IDCLIENTE')
    object qryDadosIDPEDIDO: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDadosIDCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
    end
    object qryDadosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryDadosVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      currency = True
    end
    object qryDadosQTD_ITENS: TFloatField
      DisplayLabel = 'Qtd Itens'
      FieldName = 'QTD_ITENS'
      Origin = 'QTD_ITENS'
    end
    object qryDadosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryDadosNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryDadosCALC_VALOR_MEDIO_ITEM: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_VALOR_MEDIO_ITEM'
    end
    object qryDadosTOTAL_GERAL: TAggregateField
      FieldName = 'TOTAL_GERAL'
      Active = True
      DisplayName = ''
      DisplayFormat = 'R$ 0.,00'
      Expression = 'SUM(VALOR_TOTAL)'
    end
  end
  object qryItens: TFDQuery
    AfterInsert = qryItensAfterInsert
    AfterEdit = qryItensAfterEdit
    AfterPost = qryItensAfterPost
    OnNewRecord = qryItensNewRecord
    MasterSource = dtsDados
    MasterFields = 'IDPEDIDO'
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'SELECT I.IDITEM,'
      '       I.IDPEDIDO,'
      '       I.IDPRODUTO,'
      '       I.QTD,'
      '       I.DATA_ENTREGA,'
      '       I.VALOR_UNITARIO,'
      '       I.VALOR_TOTAL,'
      '       P.DESCRICAO'
      '  FROM ITENS_PEDIDO I'
      '  LEFT JOIN PRODUTO P'
      '  ON P.IDPRODUTO = I.IDPRODUTO'
      'WHERE I.IDPEDIDO = :IDPEDIDO')
    Left = 72
    Top = 336
    ParamData = <
      item
        Name = 'IDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensIDITEM: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDITEM'
      Origin = 'IDITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryItensIDPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
    end
    object qryItensIDPRODUTO: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
    end
    object qryItensQTD: TFloatField
      DisplayLabel = 'Qtd'
      FieldName = 'QTD'
      Origin = 'QTD'
    end
    object qryItensDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Data de Entrega'
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object qryItensVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Vlr Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      currency = True
    end
    object qryItensVALOR_TOTAL: TFloatField
      DisplayLabel = 'Vlr Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      currency = True
    end
    object qryItensDESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object qryCliente: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select IDCLIENTE, NOME from CLIENTE order by NOME')
    Left = 256
    Top = 264
  end
  object qryProduto: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select IDPRODUTO, DESCRICAO from PRODUTO order by DESCRICAO')
    Left = 256
    Top = 344
  end
  object dtsDados: TDataSource
    DataSet = qryDados
    Left = 72
    Top = 272
  end
end
