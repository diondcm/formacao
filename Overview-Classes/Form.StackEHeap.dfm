object frmStackEHeap: TfrmStackEHeap
  Left = 0
  Top = 0
  Caption = 'Stack & Heap'
  ClientHeight = 558
  ClientWidth = 812
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
    Width = 185
    Height = 552
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitHeight = 41
    object Bevel1: TBevel
      Left = 1
      Top = 142
      Width = 183
      Height = 5
      Align = alTop
      ExplicitLeft = 2
      ExplicitTop = 145
    end
    object Bevel2: TBevel
      Left = 1
      Top = 293
      Width = 183
      Height = 5
      Align = alTop
      ExplicitLeft = 2
      ExplicitTop = 256
    end
    object Bevel3: TBevel
      Left = 1
      Top = 241
      Width = 183
      Height = 5
      Align = alTop
      ExplicitLeft = 2
      ExplicitTop = 238
    end
    object ButtonStack: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Stack'
      TabOrder = 0
      OnClick = ButtonStackClick
    end
    object ButtonHeap: TButton
      AlignWithMargins = True
      Left = 4
      Top = 51
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Heap'
      TabOrder = 1
      OnClick = ButtonHeapClick
      ExplicitTop = 55
    end
    object ButtonInline: TButton
      AlignWithMargins = True
      Left = 4
      Top = 98
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'In line'
      TabOrder = 2
      OnClick = ButtonInlineClick
      ExplicitTop = 111
    end
    object ButtonVarLocal: TButton
      AlignWithMargins = True
      Left = 4
      Top = 197
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Var Local'
      TabOrder = 3
      OnClick = ButtonVarLocalClick
      ExplicitTop = 334
    end
    object ButtonAlteraVarLocal: TButton
      AlignWithMargins = True
      Left = 4
      Top = 150
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Altera var local'
      TabOrder = 4
      OnClick = ButtonAlteraVarLocalClick
      ExplicitTop = 287
    end
    object ButtonRecursivo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 249
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Recursivo'
      TabOrder = 5
      OnClick = ButtonRecursivoClick
      ExplicitTop = 384
    end
    object ButtonParametros: TButton
      AlignWithMargins = True
      Left = 4
      Top = 301
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Par'#226'metros Normal'
      TabOrder = 6
      OnClick = ButtonParametrosClick
      ExplicitLeft = 0
      ExplicitTop = 385
    end
    object ButtonParametroConst: TButton
      AlignWithMargins = True
      Left = 4
      Top = 348
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Par'#226'metro Const'
      TabOrder = 7
      OnClick = ButtonParametroConstClick
    end
    object ButtonParametroVar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 395
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Par'#226'metro Var/Out'
      TabOrder = 8
      OnClick = ButtonParametroVarClick
    end
    object ButtonResult: TButton
      AlignWithMargins = True
      Left = 4
      Top = 442
      Width = 177
      Height = 41
      Align = alTop
      Caption = 'Result'
      TabOrder = 9
      OnClick = ButtonResultClick
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 615
    Height = 552
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 1
    OnDblClick = MemoLogDblClick
    ExplicitLeft = 232
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
