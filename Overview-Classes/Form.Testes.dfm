inherited frmTestes: TfrmTestes
  Caption = 'Testes'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object PanelBotoes: TPanel
    AlignWithMargins = True
    Left = 434
    Top = 3
    Width = 185
    Height = 408
    Align = alRight
    TabOrder = 0
    object ButtonArr: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Arrays'
      TabOrder = 0
      OnClick = ButtonArrClick
    end
    object ButtonExcept: TButton
      AlignWithMargins = True
      Left = 4
      Top = 51
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Exception'
      TabOrder = 1
      OnClick = ButtonExceptClick
    end
    object ButtonPessoaFisica: TButton
      AlignWithMargins = True
      Left = 4
      Top = 269
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Pessoa F'#237'sica'
      TabOrder = 2
      OnClick = ButtonPessoaFisicaClick
    end
    object ButtonPessoaJuridica: TButton
      AlignWithMargins = True
      Left = 4
      Top = 316
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Pessoa Jur'#237'dica'
      TabOrder = 3
      OnClick = ButtonPessoaJuridicaClick
    end
    object ButtonRemovePessoa: TButton
      AlignWithMargins = True
      Left = 4
      Top = 363
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Remove Primeira'
      TabOrder = 4
      OnClick = ButtonRemovePessoaClick
    end
    object ButtonTypes: TButton
      Left = 1
      Top = 95
      Width = 183
      Height = 41
      Align = alTop
      Caption = 'Types && Sets'
      TabOrder = 5
      OnClick = ButtonTypesClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 414
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object MemoInfos: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 229
      Width = 425
      Height = 182
      Align = alBottom
      TabOrder = 0
    end
    object PanelLista: TPanel
      Left = 0
      Top = 185
      Width = 431
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ButtonLista: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 117
        Height = 35
        Align = alLeft
        Caption = 'Serealiza Lista'
        TabOrder = 0
        OnClick = ButtonListaClick
      end
    end
  end
end
