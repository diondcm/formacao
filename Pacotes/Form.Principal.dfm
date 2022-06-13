object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pacotes'
  ClientHeight = 553
  ClientWidth = 863
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
    Width = 857
    Height = 54
    Align = alTop
    TabOrder = 0
    object ButtonGeraHash: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 125
      Height = 46
      Align = alLeft
      Caption = 'Gerar Hash Local'
      TabOrder = 0
      OnClick = ButtonGeraHashClick
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 135
      Top = 4
      Width = 250
      Height = 46
      Align = alLeft
      TabOrder = 1
      object ButtonDLLEstatico: TButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 117
        Height = 38
        Align = alLeft
        Caption = 'DLL Est'#225'tico'
        TabOrder = 0
        OnClick = ButtonDLLEstaticoClick
        ExplicitLeft = -41
      end
      object ButtonDLLDinamico: TButton
        AlignWithMargins = True
        Left = 127
        Top = 4
        Width = 117
        Height = 38
        Align = alLeft
        Caption = 'DLL Din'#226'mico'
        TabOrder = 1
        OnClick = ButtonDLLDinamicoClick
        ExplicitLeft = 12
        ExplicitTop = 8
      end
    end
    object PanelPacote: TPanel
      AlignWithMargins = True
      Left = 391
      Top = 4
      Width = 250
      Height = 46
      Align = alLeft
      TabOrder = 2
      object ButtonPacoteEstatico: TButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 117
        Height = 38
        Align = alLeft
        Caption = 'Pacote Est'#225'tico'
        TabOrder = 0
        OnClick = ButtonPacoteEstaticoClick
        ExplicitLeft = -41
        ExplicitTop = 12
      end
      object ButtonPacoteDinamico: TButton
        AlignWithMargins = True
        Left = 127
        Top = 4
        Width = 117
        Height = 38
        Align = alLeft
        Caption = 'Pacote Din'#226'mico'
        TabOrder = 1
        OnClick = ButtonPacoteDinamicoClick
        ExplicitLeft = 12
        ExplicitTop = 8
      end
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 857
    Height = 487
    Align = alClient
    Color = clMenuHighlight
    TabOrder = 1
    ExplicitLeft = 352
    ExplicitTop = 256
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\Exemplo-Formacao\Cadastro\Win32\Debug\te' +
        'steCadastro.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 88
  end
end
