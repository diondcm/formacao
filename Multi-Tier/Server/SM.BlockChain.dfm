object smBlockChain: TsmBlockChain
  Height = 251
  Width = 486
  PixelsPerInch = 120
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://blockchain.info/rawblock/0000000000000bae09a7a393a8acded' +
      '75aa67e46cb81f7acaa5ad94f9eacd103'
    Params = <>
    Left = 64
    Top = 24
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 176
    Top = 24
  end
  object RESTResponse1: TRESTResponse
    Left = 296
    Top = 24
  end
end
