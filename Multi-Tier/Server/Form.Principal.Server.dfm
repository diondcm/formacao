object frmPrincipalServer: TfrmPrincipalServer
  Left = 271
  Top = 114
  Caption = 'Server Multi Tier'
  ClientHeight = 418
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object ButtonStart: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 24
    Top = 112
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 184
    Width = 738
    Height = 226
    Lines.Strings = (
      'Para Deploy no IIS:'
      
        'https://docwiki.embarcadero.com/RADStudio/Sydney/en/Tutorial:_Da' +
        'taSnap_Application_Using_an_ISAPI_DLL_Server')
    TabOrder = 4
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 288
    Top = 24
  end
end
