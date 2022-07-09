object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object FlowPanelControles: TFlowPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 433
    Align = alClient
    TabOrder = 0
    object ButtonListaSimples: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 176
      Height = 72
      Caption = 'Lista Simples'
      TabOrder = 0
      OnClick = ButtonListaSimplesClick
    end
    object ButtonGroup: TButton
      AlignWithMargins = True
      Left = 186
      Top = 4
      Width = 176
      Height = 72
      Caption = 'Grupos simples'
      TabOrder = 1
      OnClick = ButtonGroupClick
    end
    object ButtonFuncionalidades: TButton
      AlignWithMargins = True
      Left = 368
      Top = 4
      Width = 176
      Height = 72
      Caption = 'Funcionalidades'
      TabOrder = 2
      OnClick = ButtonFuncionalidadesClick
    end
    object ButtonMasterDetailDetail: TButton
      AlignWithMargins = True
      Left = 4
      Top = 82
      Width = 176
      Height = 72
      Caption = 'Master-Detail-Detail'
      TabOrder = 3
      OnClick = ButtonMasterDetailDetailClick
    end
  end
end
