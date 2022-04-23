inherited frmReferencia: TfrmReferencia
  Caption = 'Refer'#234'ncia'
  ClientHeight = 531
  ClientWidth = 770
  OnCreate = FormCreate
  ExplicitWidth = 788
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 15
  inherited StatusBarContato: TStatusBar
    Top = 512
    Width = 770
  end
  object Button1: TButton
    Left = 32
    Top = 40
    Width = 195
    Height = 113
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBoxCria: TCheckBox
    Left = 32
    Top = 17
    Width = 97
    Height = 17
    Caption = 'Cria Obj'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 54
    Top = 328
    Width = 173
    Height = 57
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 448
    Top = 328
    Width = 314
    Height = 195
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button3: TButton
    Left = 54
    Top = 400
    Width = 173
    Height = 57
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 233
    Top = 359
    Width = 184
    Height = 58
    Caption = 'Button4'
    TabOrder = 5
    OnClick = Button4Click
  end
  object EditLoop: TEdit
    Left = 233
    Top = 330
    Width = 121
    Height = 23
    TabOrder = 6
    TextHint = 'Qtd Loops'
  end
end
