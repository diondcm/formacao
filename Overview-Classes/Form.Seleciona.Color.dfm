object frmSelecionaColor: TfrmSelecionaColor
  Left = 0
  Top = 0
  Caption = 'Selecione a Cor'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object ColorListBox: TColorListBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 380
    Align = alClient
    TabOrder = 0
    OnClick = ColorListBoxClick
    ExplicitLeft = 184
    ExplicitTop = 48
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 389
    Width = 616
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    object ButtonOk: TBitBtn
      AlignWithMargins = True
      Left = 422
      Top = 4
      Width = 92
      Height = 33
      Align = alRight
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = ButtonOkClick
      ExplicitLeft = 360
      ExplicitTop = 0
    end
    object ButtonCancel: TBitBtn
      AlignWithMargins = True
      Left = 520
      Top = 4
      Width = 92
      Height = 33
      Align = alRight
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
  end
end
