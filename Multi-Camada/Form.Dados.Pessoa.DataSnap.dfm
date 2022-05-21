object frmDadosPessoaDataSnap: TfrmDadosPessoaDataSnap
  Left = 0
  Top = 0
  Caption = 'Dados Pessoa'
  ClientHeight = 625
  ClientWidth = 949
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 394
    Width = 949
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 60
    ExplicitWidth = 337
  end
  object Splitter2: TSplitter
    Left = 185
    Top = 101
    Height = 293
    ExplicitLeft = 480
    ExplicitTop = 288
    ExplicitHeight = 100
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 943
    Height = 54
    DataSource = dtsPessoa
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    Align = alTop
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 191
    Top = 104
    Width = 755
    Height = 287
    Align = alClient
    DataSource = dtsPessoa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_NASCIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Width = 200
        Visible = True
      end>
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 400
    Width = 943
    Height = 222
    Align = alBottom
    TabOrder = 2
    object DBNavigator2: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 935
      Height = 37
      DataSource = dtsCache
      Align = alTop
      TabOrder = 0
    end
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 47
      Width = 935
      Height = 171
      Align = alClient
      Color = clSkyBlue
      DataSource = dtsCache
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = -32
    ExplicitTop = 8
    object ButtonCarregaDefaultDataSnap: TButton
      AlignWithMargins = True
      Left = 789
      Top = 3
      Width = 157
      Height = 35
      Align = alRight
      Caption = 'Carrega Default DataSnap'
      TabOrder = 0
      OnClick = ButtonCarregaDefaultDataSnapClick
      ExplicitLeft = 792
      ExplicitTop = 0
      ExplicitHeight = 41
    end
    object ButtonEnvioDefault: TButton
      AlignWithMargins = True
      Left = 616
      Top = 3
      Width = 167
      Height = 35
      Align = alRight
      Caption = 'Envio Default DataSnap'
      TabOrder = 1
      OnClick = ButtonEnvioDefaultClick
    end
    object ButtonCarregaDadosREST: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 142
      Height = 35
      Align = alLeft
      Caption = 'Carrega Dados REST'
      TabOrder = 2
      OnClick = ButtonCarregaDadosRESTClick
    end
  end
  object MemoLog: TMemo
    Left = 0
    Top = 101
    Width = 185
    Height = 293
    Align = alLeft
    Lines.Strings = (
      'MemoLog')
    TabOrder = 4
    Visible = False
    ExplicitLeft = 392
    ExplicitTop = 296
    ExplicitHeight = 89
  end
  object dtsPessoa: TDataSource
    Left = 344
    Top = 128
  end
  object dtsCache: TDataSource
    Left = 336
    Top = 472
  end
end
