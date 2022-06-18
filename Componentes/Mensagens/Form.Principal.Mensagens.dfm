object frmPrincipalMensagens: TfrmPrincipalMensagens
  Left = 0
  Top = 0
  Caption = 'Teste Mensagens'
  ClientHeight = 696
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 802
    Height = 158
    Align = alTop
    TabOrder = 0
    object FlowPanel1: TFlowPanel
      Left = 1
      Top = 1
      Width = 375
      Height = 156
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 320
      ExplicitHeight = 84
      object ButtonPanelMessage: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 105
        Height = 33
        Caption = 'Panel Message'
        TabOrder = 0
        OnClick = ButtonPanelMessageClick
      end
      object ButtonClose: TButton
        AlignWithMargins = True
        Left = 114
        Top = 3
        Width = 105
        Height = 33
        Caption = 'Close'
        TabOrder = 1
        OnClick = ButtonCloseClick
      end
      object ButtonShake: TButton
        AlignWithMargins = True
        Left = 225
        Top = 3
        Width = 105
        Height = 33
        Caption = 'Shake'
        TabOrder = 2
        OnClick = ButtonShakeClick
      end
      object ButtonSendText: TButton
        AlignWithMargins = True
        Left = 3
        Top = 42
        Width = 105
        Height = 33
        Caption = 'Send Text'
        TabOrder = 3
        OnClick = ButtonSendTextClick
      end
      object ButtonClick: TButton
        AlignWithMargins = True
        Left = 114
        Top = 42
        Width = 105
        Height = 33
        Caption = 'Click'
        TabOrder = 4
        OnClick = ButtonClickClick
      end
      object ButtonSetParent: TButton
        AlignWithMargins = True
        Left = 225
        Top = 42
        Width = 105
        Height = 33
        Caption = 'Set Parent'
        TabOrder = 5
        OnClick = ButtonSetParentClick
      end
      object Button1: TButton
        AlignWithMargins = True
        Left = 3
        Top = 81
        Width = 105
        Height = 33
        Caption = 'WND PROC'
        TabOrder = 6
        OnClick = Button1Click
      end
    end
    object Panel5: TPanel
      Left = 376
      Top = 1
      Width = 425
      Height = 156
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object StaticText1: TStaticText
        Left = 16
        Top = 37
        Width = 61
        Height = 19
        Caption = 'StaticText1'
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 191
        Top = 0
        Width = 234
        Height = 156
        Align = alRight
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object EditSendText: TEdit
        Left = 16
        Top = 62
        Width = 121
        Height = 23
        TabOrder = 2
        TextHint = 'Informe o text'
      end
      object Edit1: TEdit
        Left = 16
        Top = 112
        Width = 121
        Height = 23
        TabOrder = 3
        Text = 'Edit1'
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 167
    Width = 802
    Height = 526
    Align = alClient
    TabOrder = 1
    ExplicitTop = 95
    ExplicitWidth = 616
    ExplicitHeight = 335
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 221
      Height = 518
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 327
      object CheckBoxAtivar: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 215
        Height = 17
        Align = alTop
        Caption = 'Ativar busca'
        TabOrder = 0
        OnClick = CheckBoxAtivarClick
      end
      object ListBoxClasses: TListBox
        Left = 0
        Top = 23
        Width = 221
        Height = 495
        Align = alClient
        ItemHeight = 15
        TabOrder = 1
        ExplicitHeight = 304
      end
    end
    object PanelParent: TPanel
      Left = 228
      Top = 1
      Width = 573
      Height = 524
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 216
      ExplicitTop = 144
      ExplicitWidth = 185
      ExplicitHeight = 41
      object ButtonAviso: TButton
        Left = 232
        Top = 26
        Width = 75
        Height = 25
        Caption = 'Aviso'
        TabOrder = 0
        OnClick = ButtonAvisoClick
      end
      object ButtonSendAviso: TButton
        Left = 48
        Top = 88
        Width = 97
        Height = 33
        Caption = 'Send Aviso'
        TabOrder = 1
        OnClick = ButtonSendAvisoClick
      end
      object ButtonPostAviso: TButton
        Left = 224
        Top = 88
        Width = 97
        Height = 33
        Caption = 'Post Aviso'
        TabOrder = 2
        OnClick = ButtonPostAvisoClick
      end
      object ButtonPerformAviso: TButton
        Left = 392
        Top = 88
        Width = 97
        Height = 33
        Caption = 'Perform Aviso'
        TabOrder = 3
        OnClick = ButtonPerformAvisoClick
      end
    end
  end
  object TimerBusca: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerBuscaTimer
    Left = 136
    Top = 248
  end
end
