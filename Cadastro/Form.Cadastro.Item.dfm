inherited frmCadastroItem: TfrmCadastroItem
  Caption = 'Item de Pedido'
  ClientHeight = 308
  ClientWidth = 526
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 544
  ExplicitHeight = 355
  TextHeight = 15
  object PanelPedido: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 520
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'Item do Pedido XX'
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 128
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 520
    Height = 192
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 364
    ExplicitTop = 120
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 15
      Caption = 'Produto'
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 20
      Height = 15
      Caption = 'Qtd'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 192
      Top = 56
      Width = 67
      Height = 15
      Caption = 'Data Entrega'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 8
      Top = 112
      Width = 59
      Height = 15
      Caption = 'Vlr Unit'#225'rio'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 192
      Top = 112
      Width = 42
      Height = 15
      Caption = 'Vlr Total'
      FocusControl = DBEdit7
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 75
      Width = 154
      Height = 23
      DataField = 'QTD'
      DataSource = dtsItens
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 192
      Top = 75
      Width = 121
      Height = 23
      DataField = 'DATA_ENTREGA'
      DataSource = dtsItens
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 128
      Width = 154
      Height = 23
      DataField = 'VALOR_UNITARIO'
      DataSource = dtsItens
      TabOrder = 2
    end
    object DBEdit7: TDBEdit
      Left = 192
      Top = 128
      Width = 154
      Height = 23
      Color = cl3DLight
      DataField = 'VALOR_TOTAL'
      DataSource = dtsItens
      ReadOnly = True
      TabOrder = 3
    end
    object LookupProduto: TDBLookupComboBox
      Left = 8
      Top = 27
      Width = 338
      Height = 23
      DataField = 'IDPRODUTO'
      DataSource = dtsItens
      KeyField = 'IDPRODUTO'
      ListField = 'DESCRICAO'
      ListSource = dtsProduto
      TabOrder = 4
    end
    object DatePicker1: TDatePicker
      Left = 336
      Top = 75
      Date = 44695.000000000000000000
      DateFormat = 'dd/mm/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 248
    Width = 520
    Height = 57
    Align = alBottom
    TabOrder = 2
    object ButtonCancelar: TBitBtn
      AlignWithMargins = True
      Left = 411
      Top = 4
      Width = 105
      Height = 49
      Align = alRight
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 424
    end
    object ButtonSalvar: TBitBtn
      AlignWithMargins = True
      Left = 300
      Top = 4
      Width = 105
      Height = 49
      Align = alRight
      Caption = 'Salvar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 323
    end
  end
  object dtsItens: TDataSource
    Left = 424
    Top = 64
  end
  object dtsProduto: TDataSource
    Left = 424
    Top = 168
  end
  object BindSourceDB1: TBindSourceDB
    ScopeMappings = <>
    Left = 256
    Top = 160
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkPropertyToFieldDate: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DATA_ENTREGA'
      Component = DatePicker1
      ComponentProperty = 'Date'
    end
  end
end
