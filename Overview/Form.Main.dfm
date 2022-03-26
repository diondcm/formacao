object frmPrincipal: TfrmPrincipal
  Left = 1142
  Top = 455
  Caption = 'Apresenta'#231#227'o'
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
  object PanelCabecalho: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 94
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 39
      Width = 28
      Height = 15
      Caption = 'Texto'
    end
    object ButtonHash: TButton
      Left = 480
      Top = 25
      Width = 113
      Height = 45
      Caption = 'Gerar Hash'
      TabOrder = 0
      OnClick = ButtonHashClick
    end
    object EditTexto: TEdit
      Left = 64
      Top = 36
      Width = 393
      Height = 23
      TabOrder = 1
      OnKeyDown = EditTextoKeyDown
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 103
    Width = 616
    Height = 327
    Align = alClient
    TabOrder = 1
  end
end
