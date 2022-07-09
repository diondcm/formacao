object frmFuncionalidades: TfrmFuncionalidades
  Left = 0
  Top = 0
  Caption = 'Funcionalidades Fast'
  ClientHeight = 505
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 806
    Height = 62
    Align = alTop
    TabOrder = 0
    object ButtonMultiPages: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 141
      Height = 54
      Align = alLeft
      Caption = 'Multi-pages'
      TabOrder = 0
      OnClick = ButtonMultiPagesClick
    end
    object ButtonMultiPagesStream: TButton
      AlignWithMargins = True
      Left = 151
      Top = 4
      Width = 141
      Height = 54
      Align = alLeft
      Caption = 'Multi-pages - Stream'
      TabOrder = 1
      OnClick = ButtonMultiPagesStreamClick
    end
    object ButtonQrCode: TButton
      AlignWithMargins = True
      Left = 298
      Top = 4
      Width = 141
      Height = 54
      Align = alLeft
      Caption = 'Etiquetas/QR Code'
      TabOrder = 2
      OnClick = ButtonQrCodeClick
    end
    object ButtonSubReport: TButton
      AlignWithMargins = True
      Left = 445
      Top = 4
      Width = 141
      Height = 54
      Align = alLeft
      Caption = 'Sub-Report'
      TabOrder = 3
      OnClick = ButtonSubReportClick
    end
    object ButtonCodigo: TButton
      AlignWithMargins = True
      Left = 592
      Top = 4
      Width = 141
      Height = 54
      Align = alLeft
      Caption = 'Codigo'
      TabOrder = 4
      OnClick = ButtonCodigoClick
      ExplicitLeft = 677
    end
  end
  object Memo1: TMemo
    Left = 3
    Top = 312
    Width = 292
    Height = 173
    Color = clScrollBar
    Lines.Strings = (
      'Possibilidade  de converter relat'#243'rios do Rave e do '
      'Report Builder.'
      'Por meio dos uses:'
      'ConverterRR2FR - converte de Rave para Fast'
      'ConverterRB2FR - converte de ReportBuilder para '
      'Fast'
      ''
      'lReport := TfrxReport.Create(Self);'
      'lReport.LoadFromFile(Arquivo Rave ou RB);'
      'lReport.SaveToFile(Rel em FR);'
      '')
    TabOrder = 1
  end
  object PanelNovosControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 806
    Height = 58
    Align = alTop
    TabOrder = 2
    object ButtonHeranca: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 141
      Height = 50
      Align = alLeft
      Caption = 'Heran'#231'a'
      TabOrder = 0
      OnClick = ButtonHerancaClick
      ExplicitTop = 0
      ExplicitHeight = 42
    end
  end
end
