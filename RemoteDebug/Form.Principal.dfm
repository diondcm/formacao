object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Remote Debug'
  ClientHeight = 324
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1Zip: TButton
    Left = 296
    Top = 56
    Width = 137
    Height = 97
    Caption = 'Zipar Arquivos'
    TabOrder = 0
    OnClick = Button1ZipClick
  end
  object ButtonExtract: TButton
    Left = 296
    Top = 159
    Width = 137
    Height = 82
    Caption = 'Extrair Arquivos'
    TabOrder = 1
    OnClick = ButtonExtractClick
  end
  object ButtonClassHelper: TButton
    Left = 48
    Top = 216
    Width = 105
    Height = 57
    Caption = 'ClassHelper'
    TabOrder = 2
    OnClick = ButtonClassHelperClick
  end
  object ButtonTesteRemoteDebug: TButton
    Left = 48
    Top = 56
    Width = 137
    Height = 65
    Caption = 'Teste Remote Debug'
    TabOrder = 3
    OnClick = ButtonTesteRemoteDebugClick
  end
end
