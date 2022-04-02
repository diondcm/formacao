object dmdProduto: TdmdProduto
  OnCreate = DataModuleCreate
  Height = 574
  Width = 900
  PixelsPerInch = 120
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT ID, TITULO, PRECO, DESCRICAO, URL_IMAGEM '
      'FROM PRODUTOS')
    Left = 288
    Top = 180
    object qryProdutoID: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryProdutoTITULO: TWideStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Size = 200
    end
    object qryProdutoPRECO: TLargeintField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = '0.,00'
      EditFormat = '0.00'
    end
    object qryProdutoDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 500
    end
    object qryProdutoURL_IMAGEM: TWideStringField
      DisplayLabel = 'URL'
      FieldName = 'URL_IMAGEM'
      Origin = 'URL_IMAGEM'
      Size = 300
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\Exemplo-Formacao\Intro-Cadastro\Win32\De' +
        'bug\ERP-Local.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 288
    Top = 64
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://fakestoreapi.com/products'
    Params = <>
    Left = 528
    Top = 312
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 528
    Top = 168
  end
  object RESTResponse1: TRESTResponse
    Left = 528
    Top = 240
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = memWSProduto
    FieldDefs = <>
    Response = RESTResponse1
    Left = 728
    Top = 248
  end
  object memWSProduto: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'title'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'price'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'image'
        DataType = ftString
        Size = 300
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 728
    Top = 328
    object memWSProdutotitle: TStringField
      FieldName = 'title'
      Size = 200
    end
    object memWSProdutoprice: TCurrencyField
      FieldName = 'price'
    end
    object memWSProdutodescription: TStringField
      FieldName = 'description'
      Size = 500
    end
    object memWSProdutoimage: TStringField
      FieldName = 'image'
      Size = 300
    end
  end
  object qryImagens: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select ID_PRODUTO, IMAGEM, QR_CODE '
      'FROM PRODUTO_IMAGEM'
      'WHERE ID_PRODUTO = :ID_PRODUTO')
    Left = 144
    Top = 208
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryImagensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryImagensIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
    end
    object qryImagensQR_CODE: TBlobField
      FieldName = 'QR_CODE'
      Origin = 'QR_CODE'
    end
  end
end
