inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produtos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  inherited PanelNavigator: TPanel
    inherited ButtonImagemTemp: TBitBtn
      ImageIndex = 1
      Images = dmdImagens.ImageListBase
    end
  end
  inherited PageControl: TPageControl
    inherited TabPesquisa: TTabSheet
      inherited DBGridDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_DESEJADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_CADASTRO'
            Visible = True
          end>
      end
    end
    inherited TabCadastro: TTabSheet
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 24
        Top = 72
        Width = 81
        Height = 15
        Caption = 'Pre'#231'o Desejado'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 24
        Top = 120
        Width = 41
        Height = 15
        Caption = 'Modelo'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 24
        Top = 168
        Width = 74
        Height = 15
        Caption = 'Data Cadastro'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 24
        Top = 40
        Width = 200
        Height = 23
        DataField = 'DESCRICAO'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 88
        Width = 121
        Height = 23
        DataField = 'PRECO_DESEJADO'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 136
        Width = 150
        Height = 23
        DataField = 'MODELO'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 24
        Top = 184
        Width = 200
        Height = 23
        Color = cl3DLight
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
end
