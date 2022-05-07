object dmdBase: TdmdBase
  Height = 414
  Width = 724
  PixelsPerInch = 120
  object qryDados: TFDQuery
    Left = 160
    Top = 192
  end
  object sqlDados: TSQLDataSet
    Params = <>
    Left = 536
    Top = 120
  end
  object dspDados: TDataSetProvider
    DataSet = sqlDados
    Left = 536
    Top = 192
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    Left = 536
    Top = 264
  end
end
