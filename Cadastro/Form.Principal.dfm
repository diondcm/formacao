object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 582
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object ActionToolBar2: TActionToolBar
    Left = 0
    Top = 0
    Width = 785
    Height = 50
    ActionManager = ActionManager
    Caption = 'ActionToolBar2'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 10461087
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clWhite
    ColorMap.SelectedFontColor = clWhite
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Spacing = 0
    ExplicitTop = 53
    ExplicitHeight = 30
  end
  object MainMenu: TMainMenu
    Images = dmdImagens.ImageListBase
    Left = 624
    Top = 344
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object CadastrodeClientes1: TMenuItem
        Action = ActionCadastroClientes
      end
      object CadastrodeProdutos1: TMenuItem
        Action = ActionCadastroProduto
      end
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionCadastroClientes
            ImageIndex = 0
          end
          item
            Action = ActionCadastroProduto
            ImageIndex = 1
          end>
        ActionBar = ActionToolBar2
      end>
    Images = dmdImagens.ImageListBase
    Left = 624
    Top = 264
    StyleName = 'Platform Default'
    object ActionCadastroClientes: TAction
      Caption = 'Cadastro de &Clientes'
      Hint = 'Cadastro de Clientes'
      ImageIndex = 0
      OnExecute = ActionCadastroClientesExecute
    end
    object ActionCadastroProduto: TAction
      Caption = 'Cadastro de &Produtos'
      Hint = 'Cadastro de Produto'
      ImageIndex = 1
      OnExecute = ActionCadastroProdutoExecute
    end
  end
end
