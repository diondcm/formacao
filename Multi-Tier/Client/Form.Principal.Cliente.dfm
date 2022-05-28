object frmPrincipalCliente: TfrmPrincipalCliente
  Left = 0
  Top = 0
  Caption = 'Cliente Multi Tier'
  ClientHeight = 594
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 870
    Height = 594
    ActivePage = TabValidacao
    Align = alClient
    TabOrder = 0
    object TabValidacao: TTabSheet
      Caption = 'Valida'#231#227'o'
      object PanelCliente: TPanel
        Left = 0
        Top = 0
        Width = 862
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 21
          Height = 15
          Caption = 'CPF'
        end
        object LabelResultado: TLabel
          Left = 336
          Top = 22
          Width = 3
          Height = 15
        end
        object EditCPF: TEdit
          Left = 16
          Top = 29
          Width = 169
          Height = 23
          TabOrder = 0
          TextHint = 'Informe o CPF V'#225'lido '
          OnKeyDown = EditCPFKeyDown
        end
        object ButtonValidaCPF: TButton
          Left = 208
          Top = 8
          Width = 113
          Height = 45
          Caption = 'Validar'
          TabOrder = 1
          OnClick = ButtonValidaCPFClick
        end
        object CheckBoxAtivaTimer: TCheckBox
          Left = 752
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Ativa timer'
          TabOrder = 2
          OnClick = CheckBoxAtivaTimerClick
        end
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 545
        Width = 862
        Height = 19
        Panels = <
          item
            Width = 250
          end
          item
            Width = 150
          end
          item
            Width = 50
          end>
        ExplicitLeft = 432
        ExplicitTop = 272
        ExplicitWidth = 0
      end
      object PanelRequest: TPanel
        Left = 0
        Top = 97
        Width = 862
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object EditQtdThreads: TEdit
          Left = 16
          Top = 6
          Width = 145
          Height = 23
          TabOrder = 0
          TextHint = 'Qtd de Threads, Def = 1'
        end
        object ButtonChamaThreads: TButton
          Left = 208
          Top = 6
          Width = 105
          Height = 25
          Caption = 'Dispara'
          TabOrder = 1
          OnClick = ButtonChamaThreadsClick
        end
      end
      object MemoLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 156
        Width = 856
        Height = 386
        Align = alClient
        TabOrder = 3
        ExplicitLeft = 336
        ExplicitTop = 240
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
  object TimerStatusServer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerStatusServerTimer
    Left = 748
    Top = 90
  end
end
