object dmdPessoa: TdmdPessoa
  Height = 251
  Width = 486
  PixelsPerInch = 120
  object qryPessoa: TFDQuery
    CachedUpdates = True
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'SELECT ID, NOME, CPF, DATA_NASCIMENTO, SALDO, DATA_CADASTRO'
      'FROM PESSOA')
    Left = 200
    Top = 56
    object qryPessoaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryPessoaNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryPessoaCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object qryPessoaDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object qryPessoaSALDO: TFloatField
      FieldName = 'SALDO'
      Origin = 'SALDO'
    end
    object qryPessoaDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
  object memCache: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 320
    Top = 136
  end
end
