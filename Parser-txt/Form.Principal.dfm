object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Parser TXT'
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
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 54
    Align = alTop
    TabOrder = 0
    object ButtonCarregar: TButton
      AlignWithMargins = True
      Left = 512
      Top = 4
      Width = 100
      Height = 46
      Align = alRight
      Caption = 'Carregar'
      TabOrder = 0
      OnClick = ButtonCarregarClick
      ExplicitHeight = 33
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 616
    Height = 367
    Align = alClient
    Color = clMenu
    TabOrder = 1
    ExplicitLeft = 128
    ExplicitTop = 160
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
