inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 464
  ClientWidth = 988
  OnCreate = FormCreate
  ExplicitWidth = 1006
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 15
  inherited PanelNavigator: TPanel
    Width = 982
    ExplicitWidth = 982
    inherited ButtonImagemTemp: TBitBtn
      ImageIndex = 0
      Images = dmdImagens.ImageListBase
    end
  end
  inherited PageControl: TPageControl
    Width = 982
    Height = 390
    ExplicitWidth = 982
    ExplicitHeight = 390
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 974
      ExplicitHeight = 360
      inherited DBGridDados: TDBGrid
        Width = 974
        Height = 360
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
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
            FieldName = 'DATA_CADASTRO'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO_DISPONIVEL'
            Width = 79
            Visible = True
          end>
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 974
      ExplicitHeight = 360
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 58
        Width = 33
        Height = 15
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 106
        Width = 74
        Height = 15
        Caption = 'Data Cadastro'
      end
      object Label4: TLabel
        Left = 16
        Top = 154
        Width = 29
        Height = 15
        Caption = 'Saldo'
        FocusControl = DBEdit4
      end
      object DBText1: TDBText
        Left = 16
        Top = 127
        Width = 244
        Height = 15
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 26
        Width = 154
        Height = 23
        DataField = 'CODIGO'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 74
        Width = 350
        Height = 23
        DataField = 'NOME'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 170
        Width = 89
        Height = 23
        DataField = 'SALDO_DISPONIVEL'
        DataSource = dtsDados
        TabOrder = 2
      end
    end
  end
  inherited dtsDados: TDataSource
    Left = 488
  end
end
