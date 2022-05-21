object frmPrincipalCliente: TfrmPrincipalCliente
  Left = 0
  Top = 0
  Caption = 'Selecione o tipo de cadastro'
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
  object ButtonClientServer: TButton
    Left = 64
    Top = 104
    Width = 217
    Height = 89
    Caption = 'Client/Server'
    TabOrder = 0
    OnClick = ButtonClientServerClick
  end
  object ButtonDataSnap: TButton
    Left = 336
    Top = 104
    Width = 217
    Height = 89
    Caption = 'DataSnap'
    TabOrder = 1
    OnClick = ButtonDataSnapClick
  end
end
