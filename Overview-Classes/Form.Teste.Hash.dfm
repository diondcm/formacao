object frmTesteHash: TfrmTesteHash
  Left = 0
  Top = 0
  Caption = 'Teste Hash'
  ClientHeight = 685
  ClientWidth = 991
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 985
    Height = 262
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 983
      Height = 15
      Align = alTop
      Caption = 'Texto'
      ExplicitWidth = 28
    end
    object MemoTexto: TMemo
      AlignWithMargins = True
      Left = 11
      Top = 26
      Width = 963
      Height = 225
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      TabOrder = 0
      OnChange = MemoTextoChange
      ExplicitLeft = 400
      ExplicitTop = 88
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 271
    Width = 985
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 416
    ExplicitTop = 344
    ExplicitWidth = 185
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 40
      Height = 39
      Align = alLeft
      Caption = 'Hash: '
      Layout = tlCenter
    end
    object EditHash: TEdit
      AlignWithMargins = True
      Left = 44
      Top = 4
      Width = 405
      Height = 33
      Align = alLeft
      TabOrder = 0
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 318
    Width = 985
    Height = 364
    Align = alClient
    Lines.Strings = (
      'MemoLog')
    TabOrder = 2
    ExplicitLeft = 416
    ExplicitTop = 320
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
