object frmVisualizaHash: TfrmVisualizaHash
  Left = 0
  Top = 0
  Caption = 'Visualiza Hash'
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    object EditHash: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 8
      Width = 608
      Height = 25
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alClient
      TabOrder = 0
      OnChange = EditHashChange
      ExplicitLeft = 248
      ExplicitWidth = 121
      ExplicitHeight = 23
    end
  end
  object MemoHash: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 616
    Height = 380
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
