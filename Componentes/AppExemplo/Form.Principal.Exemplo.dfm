object frmPrincipalExemplo: TfrmPrincipalExemplo
  Left = 0
  Top = 0
  Caption = 'Exemplo Componentes'
  ClientHeight = 433
  ClientWidth = 622
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
  object PanelSemCaption1: TPanelSemCaption
    Left = 400
    Top = 112
    Width = 185
    Height = 41
  end
  object Panel1: TPanel
    Left = 400
    Top = 176
    Width = 185
    Height = 41
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
  end
  object DatePicker1: TDatePicker
    Left = 24
    Top = 24
    Date = 44730.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 91
    Width = 186
    Height = 23
    Date = 44730.000000000000000000
    Time = 0.428591296295053300
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 296
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 256
    Width = 320
    Height = 34
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBDateTimePiker1: TDBDateTimePiker
    Left = 24
    Top = 130
    Width = 186
    Height = 23
    Date = 44741.000000000000000000
    Time = 0.464428912040602900
    TabOrder = 6
    DataField = 'cadastro'
    DataSource = DataSource1
  end
  object DBDatePicker1: TDBDatePicker
    Left = 24
    Top = 176
    Width = 150
    Height = 32
    DataField = 'cadastro'
    DataSource = DataSource1
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 496
    Top = 40
    object FDMemTable1cadastro: TDateField
      FieldName = 'cadastro'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 336
    Top = 32
  end
end
