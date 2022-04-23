inherited frmClasses: TfrmClasses
  Caption = 'Classes'
  ClientHeight = 490
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 15
  inherited StatusBarContato: TStatusBar
    Top = 471
    ExplicitTop = 471
  end
  object ButtonCachorro: TButton
    Left = 32
    Top = 24
    Width = 179
    Height = 89
    Caption = 'Cachorro'
    TabOrder = 0
    OnClick = ButtonCachorroClick
  end
  object ButtonGato: TButton
    Left = 232
    Top = 24
    Width = 179
    Height = 89
    Caption = 'Gato'
    TabOrder = 1
    OnClick = ButtonGatoClick
  end
  object Memo1: TMemo
    Left = 32
    Top = 224
    Width = 379
    Height = 185
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object ButtonPassear: TButton
    Left = 120
    Top = 136
    Width = 177
    Height = 57
    Caption = 'Passear'
    TabOrder = 3
    OnClick = ButtonPassearClick
  end
  object Button1: TButton
    Left = 417
    Top = 223
    Width = 176
    Height = 74
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object FDQuery1: TFDQuery
    Left = 496
    Top = 112
    object FDQuery1Nome: TStringField
      FieldName = 'Nome'
    end
    object FDQuery1ID: TIntegerField
      FieldName = 'ID'
    end
    object FDQuery1Imagem: TBlobField
      FieldName = 'Imagem'
    end
  end
end
