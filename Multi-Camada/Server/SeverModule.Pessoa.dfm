object SMPessoa: TSMPessoa
  Height = 251
  Width = 486
  PixelsPerInch = 120
  object qryPessoa: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT ID, NOME, CPF, DATA_NASCIMENTO, SALDO, DATA_CADASTRO'
      'FROM PESSOA')
    Left = 208
    Top = 104
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
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 208
    Top = 32
  end
  object qryUpdatePessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'UPDATE PESSOA'
      '   SET NOME = :NOME,'
      '       CPF = :CPF,'
      '       DATA_NASCIMENTO = :DATA_NASCIMENTO,'
      '       SALDO = :SALDO'
      ' WHERE ID = :ID')
    Left = 312
    Top = 104
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        Name = 'DATA_NASCIMENTO'
        ParamType = ptInput
      end
      item
        Name = 'SALDO'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryInsertPessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO PESSOA ('
      '                       NOME,'
      '                       CPF,'
      '                       DATA_NASCIMENTO,'
      '                       SALDO'
      '                   )'
      '                   VALUES ('
      '                       :NOME,'
      '                       :CPF,'
      '                       :DATA_NASCIMENTO,'
      '                       :SALDO'
      '                   )')
    Left = 312
    Top = 176
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        Name = 'DATA_NASCIMENTO'
        ParamType = ptInput
      end
      item
        Name = 'SALDO'
        ParamType = ptInput
      end>
  end
  object qryDeletePessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'DELETE FROM PESSOA WHERE ID = :ID')
    Left = 312
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
