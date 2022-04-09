object frmCalsses: TfrmCalsses
  Left = 0
  Top = 0
  Caption = 'Classes'
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
  object ButtonCachorro: TButton
    Left = 32
    Top = 24
    Width = 179
    Height = 89
    Caption = 'Cachorro'
    TabOrder = 0
    OnClick = ButtonCachorroClick
  end
  object ButtonGato: TButton
    Left = 232
    Top = 24
    Width = 179
    Height = 89
    Caption = 'Gato'
    TabOrder = 1
    OnClick = ButtonGatoClick
  end
  object Memo1: TMemo
    Left = 232
    Top = 200
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
