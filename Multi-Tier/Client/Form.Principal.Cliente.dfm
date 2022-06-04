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
    ActivePage = TabBlockChain
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
      end
    end
    object TabArquivos: TTabSheet
      Caption = 'Arquivos'
      ImageIndex = 1
      object Image1: TImage
        Left = 16
        Top = 176
        Width = 249
        Height = 353
      end
      object ButtonDownloadImagem: TButton
        Left = 16
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Imagem'
        TabOrder = 0
        OnClick = ButtonDownloadImagemClick
      end
      object Button2: TButton
        Left = 480
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Upload'
        TabOrder = 1
        OnClick = Button2Click
      end
      object ButtonDownloadBinario: TButton
        Left = 190
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Bin'#225'rio'
        TabOrder = 2
        OnClick = ButtonDownloadBinarioClick
      end
      object MemoArquivos: TMemo
        Left = 296
        Top = 176
        Width = 249
        Height = 353
        TabOrder = 3
      end
    end
    object TabBlockChain: TTabSheet
      Caption = 'BlockChain'
      ImageIndex = 2
      object Splitter1: TSplitter
        Left = 388
        Top = 47
        Height = 517
        ExplicitLeft = 432
        ExplicitTop = 232
        ExplicitHeight = 100
      end
      object MemoDados: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 382
        Height = 511
        Align = alLeft
        Lines.Strings = (
          'MemoDados')
        TabOrder = 0
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 856
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 336
        ExplicitTop = 264
        ExplicitWidth = 185
        object ButtonGetBlock: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 101
          Height = 33
          Align = alLeft
          Caption = 'Get Block'
          TabOrder = 0
          OnClick = ButtonGetBlockClick
        end
        object EditBlock: TEdit
          AlignWithMargins = True
          Left = 111
          Top = 6
          Width = 482
          Height = 29
          Margins.Top = 5
          Margins.Bottom = 5
          Align = alLeft
          TabOrder = 1
          Text = '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103'
        end
        object ButtonGetBlockIntern: TButton
          AlignWithMargins = True
          Left = 599
          Top = 4
          Width = 114
          Height = 33
          Align = alLeft
          Caption = 'Get Block Interno'
          TabOrder = 2
          OnClick = ButtonGetBlockInternClick
        end
        object ButtonListaBlock: TButton
          AlignWithMargins = True
          Left = 719
          Top = 4
          Width = 114
          Height = 33
          Align = alLeft
          Caption = 'Get Lista Block'
          TabOrder = 3
          OnClick = ButtonListaBlockClick
          ExplicitLeft = 743
          ExplicitTop = 8
        end
      end
      object MemoJson: TMemo
        AlignWithMargins = True
        Left = 394
        Top = 50
        Width = 465
        Height = 511
        Align = alClient
        Lines.Strings = (
          'MemoJson')
        TabOrder = 2
        ExplicitLeft = 608
        ExplicitTop = 248
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
  object OpenDialogUpload: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 504
    Top = 104
  end
end
