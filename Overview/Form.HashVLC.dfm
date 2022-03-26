object frmHashVCL: TfrmHashVCL
  Left = 0
  Top = 0
  Caption = 'Hash na VCL'
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
      AlignWithMargins = True
      Left = 16
      Top = 4
      Width = 56
      Height = 86
      Margins.Left = 15
      Align = alLeft
      Caption = 'Texto'
      Layout = tlCenter
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 92
    end
    object ButtonHash: TButton
      AlignWithMargins = True
      Left = 487
      Top = 16
      Width = 113
      Height = 62
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 15
      Align = alRight
      Caption = 'Gerar Hash'
      TabOrder = 0
      OnClick = ButtonHashClick
      ExplicitLeft = 480
      ExplicitTop = 25
      ExplicitHeight = 45
    end
    object EditTexto: TEdit
      AlignWithMargins = True
      Left = 90
      Top = 33
      Width = 379
      Height = 28
      Margins.Left = 15
      Margins.Top = 32
      Margins.Bottom = 32
      Align = alClient
      TabOrder = 1
      OnKeyDown = EditTextoKeyDown
      ExplicitLeft = 64
      ExplicitTop = 36
      ExplicitWidth = 393
      ExplicitHeight = 23
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
