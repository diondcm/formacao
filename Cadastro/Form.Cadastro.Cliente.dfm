inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 464
  ClientWidth = 988
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitLeft = 2
  ExplicitTop = 2
  ExplicitWidth = 1006
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 15
  inherited PanelNavigator: TPanel
    Width = 982
    ExplicitWidth = 982
    inherited ButtonInserir: TBitBtn
      ExplicitLeft = 196
      ExplicitTop = 4
      ExplicitHeight = 54
    end
    inherited ButtonEditar: TBitBtn
      ExplicitLeft = 277
      ExplicitTop = 4
    end
    inherited ButtonCancelar: TBitBtn
      ExplicitLeft = 358
    end
    inherited ButtonSalvar: TBitBtn
      ExplicitLeft = 439
    end
    inherited ButtonDeletar: TBitBtn
      ExplicitLeft = 520
      ExplicitTop = 4
    end
    inherited ButtonPrimeiro: TBitBtn
      ExplicitLeft = 601
    end
    inherited ButtonAnterior: TBitBtn
      ExplicitLeft = 682
    end
    inherited ButtonProximo: TBitBtn
      ExplicitLeft = 763
      ExplicitTop = 4
    end
    inherited ButtonUltimo: TBitBtn
      ExplicitLeft = 844
    end
    inherited ButtonImagemTemp: TBitBtn
      ImageIndex = 0
      Images = dmdImagens.ImageListBase
      ExplicitLeft = 115
      ExplicitTop = 4
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
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 974
      ExplicitHeight = 360
    end
  end
  inherited dtsDados: TDataSource
    DataSet = dmdCliente.cdsDados
  end
end
