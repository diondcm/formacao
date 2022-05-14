inherited frmCadPedidos: TfrmCadPedidos
  Caption = 'Cadastro de Pedidos'
  ClientHeight = 625
  ClientWidth = 1099
  OnCreate = FormCreate
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 1117
  ExplicitHeight = 672
  PixelsPerInch = 96
  TextHeight = 15
  inherited PanelNavigator: TPanel
    Width = 1093
    object DBText1: TDBText [1]
      Left = 968
      Top = 22
      Width = 97
      Height = 17
      DataField = 'TOTAL_GERAL'
      DataSource = dtsDados
    end
  end
  inherited PageControl: TPageControl
    Width = 1093
    Height = 551
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 1085
      ExplicitHeight = 521
      inherited DBGridDados: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1079
        Height = 263
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 333
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ITENS'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_CADASTRO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_VALOR_MEDIO_ITEM'
            Visible = True
          end>
      end
      inherited StatusBarPesquisa: TStatusBar
        Top = 269
        Width = 1085
        ExplicitLeft = -39
        ExplicitTop = 229
        ExplicitWidth = 954
      end
      object Panel1: TPanel
        Left = 0
        Top = 288
        Width = 1085
        Height = 233
        Align = alBottom
        Caption = 'Panel1'
        TabOrder = 2
        object Label7: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 1077
          Height = 28
          Align = alTop
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 46
        end
        object StatusBarItens: TStatusBar
          Left = 1
          Top = 213
          Width = 1083
          Height = 19
          Panels = <
            item
              Width = 250
            end
            item
              Width = 200
            end
            item
              Width = 50
            end>
          ExplicitTop = 45
          ExplicitWidth = 791
        end
        object DBGridItens: TDBGrid
          AlignWithMargins = True
          Left = 4
          Top = 38
          Width = 1077
          Height = 172
          Align = alClient
          DataSource = dtsItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 266
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ENTREGA'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNITARIO'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Visible = True
            end>
        end
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 1085
      ExplicitHeight = 521
      object Label2: TLabel
        Left = 32
        Top = 72
        Width = 37
        Height = 15
        Caption = 'Cliente'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 32
        Top = 120
        Width = 74
        Height = 15
        Caption = 'Data Cadastro'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 32
        Top = 168
        Width = 54
        Height = 15
        Caption = 'Valor Total'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 32
        Top = 216
        Width = 48
        Height = 15
        Caption = 'Qtd Itens'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 32
        Top = 16
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
        FocusControl = DBEdit6
      end
      object DBEdit2: TDBEdit
        Left = 32
        Top = 88
        Width = 58
        Height = 23
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 32
        Top = 136
        Width = 154
        Height = 23
        Color = cl3DLight
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 32
        Top = 184
        Width = 154
        Height = 23
        DataField = 'VALOR_TOTAL'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 32
        Top = 232
        Width = 154
        Height = 23
        DataField = 'QTD_ITENS'
        DataSource = dtsDados
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 32
        Top = 32
        Width = 154
        Height = 23
        DataField = 'CODIGO'
        DataSource = dtsDados
        TabOrder = 4
      end
      object PanelCadItemPedido: TPanel
        Left = 0
        Top = 280
        Width = 1085
        Height = 241
        Align = alBottom
        TabOrder = 5
        object Label1: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 1077
          Height = 28
          Align = alTop
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 46
        end
        object DBGrid1: TDBGrid
          AlignWithMargins = True
          Left = 4
          Top = 38
          Width = 1032
          Height = 180
          Align = alClient
          DataSource = dtsItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 281
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ENTREGA'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNITARIO'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Visible = True
            end>
        end
        object StatusBarItensCadastro: TStatusBar
          Left = 1
          Top = 221
          Width = 1083
          Height = 19
          Panels = <
            item
              Width = 250
            end
            item
              Width = 200
            end
            item
              Width = 50
            end>
          ExplicitTop = 45
          ExplicitWidth = 791
        end
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 1042
          Top = 38
          Width = 39
          Height = 180
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitLeft = 704
          ExplicitTop = 24
          ExplicitHeight = 171
          object ShapeAddItem: TShape
            Left = 0
            Top = 0
            Width = 39
            Height = 32
            Align = alTop
            Brush.Color = clGreen
            Shape = stRoundSquare
            ExplicitLeft = -2
            ExplicitTop = 6
            ExplicitWidth = 38
          end
          object LabelAddItem: TLabel
            Left = 1
            Top = 0
            Width = 37
            Height = 31
            Alignment = taCenter
            AutoSize = False
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clCream
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = LabelAddItemClick
          end
          object ShapeEditItem: TShape
            AlignWithMargins = True
            Left = 0
            Top = 35
            Width = 39
            Height = 32
            Margins.Left = 0
            Margins.Right = 0
            Align = alTop
            Brush.Color = clTeal
            Shape = stRoundSquare
            ExplicitLeft = 1
            ExplicitTop = 36
            ExplicitWidth = 37
          end
          object LabelEditItem: TLabel
            Left = 4
            Top = 35
            Width = 30
            Height = 30
            Alignment = taCenter
            AutoSize = False
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clCream
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = LabelEditItemClick
          end
          object Shape1: TShape
            Left = 0
            Top = 70
            Width = 39
            Height = 32
            Align = alTop
            Brush.Color = 3487231
            Shape = stRoundSquare
            ExplicitLeft = 6
            ExplicitTop = 129
            ExplicitWidth = 37
          end
          object LabelDeleteItem: TLabel
            Left = 5
            Top = 68
            Width = 29
            Height = 37
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clCream
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = LabelDeleteItemClick
          end
        end
      end
      object LookupCliente: TDBLookupComboBox
        Left = 96
        Top = 88
        Width = 273
        Height = 23
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        KeyField = 'IDCLIENTE'
        ListField = 'NOME'
        ListSource = dtsCliente
        TabOrder = 6
      end
    end
  end
  inherited dtsDados: TDataSource
    DataSet = dmdPedido.qryDados
  end
  inherited TimerOpen: TTimer
    Left = 464
    Top = 232
  end
  object dtsItens: TDataSource
    DataSet = dmdPedido.qryItens
    OnDataChange = dtsItensDataChange
    Left = 352
    Top = 232
  end
  object dtsCliente: TDataSource
    Left = 464
    Top = 312
  end
  object TimerContador: TTimer
    OnTimer = TimerContadorTimer
    Left = 936
    Top = 464
  end
end
