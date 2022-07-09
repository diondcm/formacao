object frmGrupoSimples: TfrmGrupoSimples
  Left = 0
  Top = 0
  Caption = 'Grupo Simples'
  ClientHeight = 643
  ClientWidth = 874
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
    Top = 273
    Width = 874
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -8
    ExplicitTop = 101
    ExplicitWidth = 622
  end
  object PanelControles: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 51
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 61
    ExplicitWidth = 622
    object ButtonRelatorio: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 117
      Height = 43
      Align = alLeft
      Caption = 'Relat'#243'rio'
      TabOrder = 0
      OnClick = ButtonRelatorioClick
    end
    object EditRelSimplesCaption: TEdit
      Left = 288
      Top = 14
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'Caption Rel Simples'
    end
    object ButtonRelSimples: TButton
      AlignWithMargins = True
      Left = 127
      Top = 4
      Width = 146
      Height = 43
      Align = alLeft
      Caption = 'Group Simples'
      TabOrder = 2
      OnClick = ButtonRelSimplesClick
    end
    object ColorBox1: TColorBox
      Left = 424
      Top = 14
      Width = 145
      Height = 22
      Selected = clAqua
      TabOrder = 3
    end
    object ButtonTesteGrafico: TButton
      AlignWithMargins = True
      Left = 709
      Top = 4
      Width = 161
      Height = 43
      Align = alRight
      Caption = 'Teste Gr'#225'fico'
      TabOrder = 4
      OnClick = ButtonTesteGraficoClick
      ExplicitLeft = 712
      ExplicitTop = 1
      ExplicitHeight = 49
    end
    object ButtonExport: TButton
      AlignWithMargins = True
      Left = 592
      Top = 4
      Width = 111
      Height = 43
      Align = alRight
      Caption = 'Export'
      DropDownMenu = PopupMenuExport
      Style = bsSplitButton
      TabOrder = 5
    end
  end
  object PanelPedidos: TPanel
    Left = 0
    Top = 276
    Width = 874
    Height = 367
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelPedidos'
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 136
    ExplicitWidth = 233
    ExplicitHeight = 177
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 874
      Height = 23
      Align = alTop
      Caption = 'Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 62
    end
    object DBNavigator2: TDBNavigator
      Left = 0
      Top = 23
      Width = 874
      Height = 32
      DataSource = dtsOrder
      Align = alTop
      TabOrder = 0
      ExplicitTop = 56
      ExplicitWidth = 622
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 55
      Width = 874
      Height = 293
      Align = alClient
      DataSource = dtsOrder
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object StatusBarPedidos: TStatusBar
      Left = 0
      Top = 348
      Width = 874
      Height = 19
      Panels = <
        item
          Width = 200
        end
        item
          Width = 150
        end
        item
          Width = 50
        end>
      ExplicitLeft = 440
      ExplicitTop = 176
      ExplicitWidth = 0
    end
  end
  object PanelCliente: TPanel
    Left = 0
    Top = 51
    Width = 874
    Height = 222
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 872
      Height = 23
      Align = alTop
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 56
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 24
      Width = 872
      Height = 40
      DataSource = dtCustomer
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 41
      ExplicitWidth = 622
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 64
      Width = 872
      Height = 138
      Align = alClient
      DataSource = dtCustomer
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object StatusBarCliente: TStatusBar
      Left = 1
      Top = 202
      Width = 872
      Height = 19
      Panels = <
        item
          Width = 200
        end
        item
          Width = 150
        end
        item
          Width = 50
        end>
      ExplicitTop = 107
      ExplicitWidth = 620
    end
  end
  object dtCustomer: TDataSource
    DataSet = dmdGrupoSimples.memCustomer
    OnDataChange = dtCustomerDataChange
    Left = 352
    Top = 128
  end
  object dtsOrder: TDataSource
    DataSet = dmdGrupoSimples.memOrder
    OnDataChange = dtsOrderDataChange
    Left = 384
    Top = 280
  end
  object PopupMenuExport: TPopupMenu
    Left = 656
    Top = 88
    object PDF1: TMenuItem
      Caption = 'PDF'
      OnClick = PDF1Click
    end
    object PDF2: TMenuItem
      Caption = 'XLSX'
      OnClick = PDF2Click
    end
  end
end
