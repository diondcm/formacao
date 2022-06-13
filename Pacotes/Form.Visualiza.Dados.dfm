object frmVisualizaDados: TfrmVisualizaDados
  Left = 0
  Top = 0
  Caption = 'Dados'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 616
    Height = 427
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      'select * from pedido')
    Left = 304
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 304
    Top = 224
  end
end
