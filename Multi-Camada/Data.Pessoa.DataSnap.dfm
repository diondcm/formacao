object dmdPessoaDataSnap: TdmdPessoaDataSnap
  Height = 289
  Width = 519
  PixelsPerInch = 120
  object qryPessoa: TFDQuery
    CachedUpdates = True
    SQL.Strings = (
      'SELECT ID, NOME, CPF, DATA_NASCIMENTO, SALDO, DATA_CADASTRO'
      'FROM PESSOA')
    Left = 200
    Top = 56
    object qryPessoaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
  object memDelta: TFDMemTable
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
  object memPessoaLocal: TFDMemTable
    BeforePost = memPessoaLocalBeforePost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 56
    object memPessoaLocalID: TIntegerField
      FieldName = 'ID'
    end
    object memPessoaLocalNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object memPessoaLocalCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object memPessoaLocalDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object memPessoaLocalSALDO: TFloatField
      FieldName = 'SALDO'
      Origin = 'SALDO'
    end
    object memPessoaLocalDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 208
    Top = 160
  end
  object memPessoaREST: TFDMemTable
    BeforePost = memPessoaRESTBeforePost
    BeforeDelete = memPessoaRESTBeforeDelete
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 128
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object WideStringField1: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object WideStringField2: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object FloatField1: TFloatField
      FieldName = 'SALDO'
      Origin = 'SALDO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
end
