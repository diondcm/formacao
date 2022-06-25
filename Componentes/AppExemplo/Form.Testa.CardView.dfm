object frmTestaCardView: TfrmTestaCardView
  Left = 0
  Top = 0
  Caption = 'Testa Card View'
  ClientHeight = 648
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 945
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object ButtonCriaCard: TButton
      Left = 1
      Top = 1
      Width = 184
      Height = 39
      Align = alLeft
      Caption = 'Testa Card View'
      TabOrder = 0
      OnClick = ButtonCriaCardClick
    end
    object Button2: TButton
      Left = 321
      Top = 1
      Width = 168
      Height = 39
      Align = alLeft
      Caption = 'Altera Propor'#231#227'o'
      TabOrder = 1
      OnClick = Button2Click
    end
    object SpinEditProporcao: TSpinEdit
      AlignWithMargins = True
      Left = 492
      Top = 6
      Width = 45
      Height = 29
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 4
    end
    object ButtonCarregaLista: TButton
      Left = 185
      Top = 1
      Width = 136
      Height = 39
      Align = alLeft
      Caption = 'Carrega Lista'
      TabOrder = 3
      OnClick = ButtonCarregaListaClick
    end
  end
  object PanelMensagem: TPanel
    Left = 0
    Top = 47
    Width = 951
    Height = 601
    Align = alClient
    Caption = 'Aqui fica em runtime o CardViewer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
