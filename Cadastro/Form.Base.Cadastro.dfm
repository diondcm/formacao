inherited frmBaseCadastro: TfrmBaseCadastro
  Caption = ''
  ClientHeight = 442
  ClientWidth = 968
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 986
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 15
  object PanelNavigator: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 962
    Height = 62
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 616
    object ImageLogoCadastro: TImage
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 105
      Height = 54
      Align = alLeft
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 2
      ExplicitHeight = 60
    end
    object ButtonInserir: TBitBtn
      AlignWithMargins = True
      Left = 196
      Top = 4
      Width = 75
      Height = 54
      Action = ActionInserir
      Align = alLeft
      Caption = '&Inserir'
      TabOrder = 0
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonEditar: TBitBtn
      AlignWithMargins = True
      Left = 277
      Top = 4
      Width = 75
      Height = 54
      Action = ActionEditar
      Align = alLeft
      Caption = '&Editar'
      TabOrder = 1
      ExplicitLeft = 132
      ExplicitTop = 5
    end
    object ButtonCancelar: TBitBtn
      AlignWithMargins = True
      Left = 358
      Top = 4
      Width = 75
      Height = 54
      Action = ActionCancelar
      Align = alLeft
      Caption = '&Cancelar'
      TabOrder = 2
      ExplicitLeft = 221
    end
    object ButtonSalvar: TBitBtn
      AlignWithMargins = True
      Left = 439
      Top = 4
      Width = 75
      Height = 54
      Action = ActionSalvar
      Align = alLeft
      Caption = '&Salvar'
      TabOrder = 3
      ExplicitLeft = 328
    end
    object ButtonDeletar: TBitBtn
      AlignWithMargins = True
      Left = 520
      Top = 4
      Width = 75
      Height = 54
      Action = ActionDeletar
      Align = alLeft
      Caption = '&Deletar'
      TabOrder = 4
      ExplicitLeft = 429
      ExplicitTop = 12
    end
    object ButtonPrimeiro: TBitBtn
      AlignWithMargins = True
      Left = 601
      Top = 4
      Width = 75
      Height = 54
      Action = ActionPrimeiro
      Align = alLeft
      Caption = 'P&rimeiro'
      TabOrder = 5
      ExplicitLeft = 533
    end
    object ButtonAnterior: TBitBtn
      AlignWithMargins = True
      Left = 682
      Top = 4
      Width = 75
      Height = 54
      Action = ActionAnterior
      Align = alLeft
      Caption = '&Anterior'
      TabOrder = 6
      ExplicitLeft = 541
    end
    object ButtonProximo: TBitBtn
      AlignWithMargins = True
      Left = 763
      Top = 4
      Width = 75
      Height = 54
      Action = ActionProximo
      Align = alLeft
      Caption = 'P&r'#243'ximo'
      TabOrder = 7
      ExplicitLeft = 637
      ExplicitTop = -12
    end
    object ButtonUltimo: TBitBtn
      AlignWithMargins = True
      Left = 844
      Top = 4
      Width = 75
      Height = 54
      Hint = #218'ltimo'
      Action = ActionUltimo
      Align = alLeft
      Caption = '&'#218'ltimo'
      TabOrder = 8
      WordWrap = True
      ExplicitLeft = 763
    end
    object ButtonImagemTemp: TBitBtn
      AlignWithMargins = True
      Left = 115
      Top = 4
      Width = 75
      Height = 54
      Align = alLeft
      ImageIndex = 3
      TabOrder = 9
      WordWrap = True
      ExplicitLeft = 75
      ExplicitTop = -20
    end
  end
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 962
    Height = 368
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 763
    ExplicitHeight = 359
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisar'
      object DBGridDados: TDBGrid
        Left = 0
        Top = 0
        Width = 954
        Height = 338
        Align = alClient
        DataSource = dtsDados
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
    end
  end
  object ActionList: TActionList
    Left = 584
    Top = 144
    object ActionInserir: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Inserir'
      Hint = 'Inserir'
      ImageIndex = 4
      DataSource = dtsDados
    end
    object ActionPrimeiro: TDataSetFirst
      Category = 'Dataset'
      Caption = 'P&rimeiro'
      Hint = 'Primeiro'
      ImageIndex = 0
      DataSource = dtsDados
    end
    object ActionAnterior: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Anterior'
      Hint = 'Anterior'
      ImageIndex = 1
      DataSource = dtsDados
    end
    object ActionProximo: TDataSetNext
      Category = 'Dataset'
      Caption = 'P&r'#243'ximo'
      Hint = 'Pr'#243'ximo'
      ImageIndex = 2
      DataSource = dtsDados
    end
    object ActionUltimo: TDataSetLast
      Category = 'Dataset'
      Caption = '&'#218'ltimo'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dtsDados
    end
    object ActionDeletar: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Deletar'
      Hint = 'Deletar'
      ImageIndex = 5
      DataSource = dtsDados
    end
    object ActionEditar: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Editar'
      ImageIndex = 6
      DataSource = dtsDados
    end
    object ActionSalvar: TDataSetPost
      Category = 'Dataset'
      Caption = '&Salvar'
      Hint = 'Salvar'
      ImageIndex = 7
      DataSource = dtsDados
    end
    object ActionCancelar: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 8
      DataSource = dtsDados
    end
    object ActionAtualizar: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Atualizar'
      Hint = 'Atualizar'
      ImageIndex = 9
      DataSource = dtsDados
    end
  end
  object dtsDados: TDataSource
    Left = 464
    Top = 144
  end
end
