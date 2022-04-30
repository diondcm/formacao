object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 408
    Align = alClient
    TabOrder = 0
    object ButtonClasses: TButton
      Left = 1
      Top = 1
      Width = 248
      Height = 88
      Caption = 'Classes'
      TabOrder = 0
      OnClick = ButtonClassesClick
    end
    object ButtonGenerics: TButton
      Left = 249
      Top = 1
      Width = 248
      Height = 88
      Caption = 'Generics'
      TabOrder = 1
      OnClick = ButtonGenericsClick
    end
    object ButtonReferencia: TButton
      Left = 1
      Top = 89
      Width = 248
      Height = 88
      Caption = 'Refer'#234'ncia'
      TabOrder = 2
      OnClick = ButtonReferenciaClick
    end
    object ButtonTestes: TButton
      Left = 249
      Top = 89
      Width = 248
      Height = 88
      Caption = 'Testes'
      TabOrder = 3
      OnClick = ButtonTestesClick
    end
    object ButtonInstancia: TButton
      Left = 1
      Top = 177
      Width = 248
      Height = 88
      Caption = 'Inst'#226'ncia'
      TabOrder = 4
      OnClick = ButtonInstanciaClick
    end
    object ButtonStackEHeap: TButton
      Left = 249
      Top = 177
      Width = 248
      Height = 88
      Caption = 'Stack && Heap'
      TabOrder = 5
      OnClick = ButtonStackEHeapClick
    end
  end
  object StatusBarContato: TStatusBar
    Left = 0
    Top = 414
    Width = 622
    Height = 19
    Panels = <
      item
        Text = 'Fone: 51 3022-3388'
        Width = 150
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
  end
  object TimerLogin: TTimer
    Enabled = False
    OnTimer = TimerLoginTimer
    Left = 544
    Top = 312
  end
end
