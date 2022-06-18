object frmPanelMessage: TfrmPanelMessage
  Left = 0
  Top = 0
  Caption = 'Panel Message'
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
    Height = 41
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    object RadioButtonMover: TRadioButton
      Left = 24
      Top = 13
      Width = 113
      Height = 17
      Caption = 'Mover?'
      TabOrder = 0
    end
    object RadioButtonResize: TRadioButton
      Left = 112
      Top = 13
      Width = 113
      Height = 17
      Caption = 'Resize?'
      TabOrder = 1
    end
  end
  object PanelExemplo: TPanel
    Left = 208
    Top = 160
    Width = 185
    Height = 41
    Caption = 'Panel Exemplo'
    TabOrder = 1
    OnMouseDown = PanelExemploMouseDown
  end
end
