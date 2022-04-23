inherited frmGenerico: TfrmGenerico
  Caption = 'Generics'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 62
    Align = alTop
    TabOrder = 0
    object ColorBox1: TColorBox
      Left = 16
      Top = 20
      Width = 145
      Height = 22
      TabOrder = 0
    end
    object EditNomeCor: TEdit
      Left = 176
      Top = 20
      Width = 161
      Height = 23
      TabOrder = 1
      TextHint = 'Informe o nome da cor'
      OnKeyDown = EditNomeCorKeyDown
    end
    object ButtonInsereCor: TButton
      AlignWithMargins = True
      Left = 496
      Top = 4
      Width = 116
      Height = 54
      Align = alRight
      Caption = 'Insere'
      TabOrder = 2
      OnClick = ButtonInsereCorClick
    end
    object Button1: TButton
      Left = 392
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object ListBoxCores: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 121
    Height = 340
    Align = alLeft
    ItemHeight = 15
    TabOrder = 1
    OnClick = ListBoxCoresClick
  end
  object PanelCor: TPanel
    AlignWithMargins = True
    Left = 130
    Top = 71
    Width = 489
    Height = 340
    Align = alClient
    ParentBackground = False
    TabOrder = 2
  end
  object TimerTeste: TTimer
    Enabled = False
    OnTimer = TimerTesteTimer
    Left = 520
    Top = 272
  end
end
