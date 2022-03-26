object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  Caption = 'Teste de Cadastro'
  ClientHeight = 556
  ClientWidth = 424
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
    Top = 494
    Width = 418
    Height = 59
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 584
    ExplicitWidth = 823
    object BitBtnSair: TBitBtn
      AlignWithMargins = True
      Left = 291
      Top = 4
      Width = 123
      Height = 51
      Align = alRight
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 368
    end
  end
  object PanelOpcoes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 418
    Height = 70
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 823
    object Button1: TButton
      AlignWithMargins = True
      Left = 328
      Top = 16
      Width = 75
      Height = 38
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      Caption = '>'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 376
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 247
      Top = 16
      Width = 75
      Height = 38
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      Caption = '-'
      TabOrder = 1
      ExplicitLeft = 376
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 166
      Top = 16
      Width = 75
      Height = 38
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      Caption = '+'
      TabOrder = 2
      ExplicitLeft = 376
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 85
      Top = 16
      Width = 75
      Height = 38
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      Caption = '*'
      TabOrder = 3
      ExplicitLeft = 376
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object Button5: TButton
      AlignWithMargins = True
      Left = 4
      Top = 16
      Width = 75
      Height = 38
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      Caption = '<'
      TabOrder = 4
      OnClick = Button5Click
      ExplicitLeft = 376
      ExplicitTop = 24
      ExplicitHeight = 25
    end
  end
  object PanelDados: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 418
    Height = 409
    Align = alClient
    TabOrder = 2
    ExplicitLeft = -13
    ExplicitTop = 75
    ExplicitWidth = 823
    ExplicitHeight = 499
    object Label1: TLabel
      Left = 29
      Top = 11
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 29
      Top = 40
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 29
      Top = 69
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object EditCodigo: TEdit
      Left = 85
      Top = 8
      Width = 121
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object EditNome: TEdit
      Left = 85
      Top = 37
      Width = 225
      Height = 23
      TabOrder = 1
    end
    object EditCPF: TEdit
      Left = 85
      Top = 66
      Width = 169
      Height = 23
      NumbersOnly = True
      TabOrder = 2
    end
    object CheckBoxAtivo: TCheckBox
      Left = 29
      Top = 104
      Width = 97
      Height = 17
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
