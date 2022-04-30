unit Form.Seleciona.Color;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TOnTrocaCor = TProc<TColor>;// >> reference to procedure (Arg1: TColor);
  TOnConfirma = TProc;

  TfrmSelecionaColor = class(TForm)
    ColorListBox: TColorListBox;
    PanelControles: TPanel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    procedure ColorListBoxClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FFinalizouSelecao: Boolean;

    FOnTrocaCor: TOnTrocaCor;
    FOnConfirma: TOnConfirma;
    FOnCancela: TProc;
    procedure DoCancela;
  public
//    property Memo: TMemo read FMemo write FMemo;
    property OnTrocaCor: TOnTrocaCor read FOnTrocaCor write FOnTrocaCor;
    property OnConfirma: TOnConfirma read FOnConfirma write FOnConfirma;
    property OnCancela: TProc read FOnCancela write FOnCancela;
  end;

//var
//  frmSelecionaColor: TfrmSelecionaColor;

implementation

{$R *.dfm}

//uses Form.StackEHeap;

procedure TfrmSelecionaColor.ButtonCancelClick(Sender: TObject);
begin
  FFinalizouSelecao := True;
  DoCancela;
  Close;
end;

procedure TfrmSelecionaColor.ButtonOkClick(Sender: TObject);
begin
  FFinalizouSelecao := True;
  if Assigned(FOnConfirma) then
  begin
    FOnConfirma();
  end;
  Close;
end;

procedure TfrmSelecionaColor.ColorListBoxClick(Sender: TObject);
begin
  if Assigned(FOnTrocaCor) then
  begin
    FOnTrocaCor(ColorListBox.Selected);
  end;

// aplica cor no memo
//  frmStackEHeap.MemoLog.Color := ColorListBox.Selected;
//  frmStackEHeap.MemoLog.Refresh;
//  Application.ProcessMessages;
end;

procedure TfrmSelecionaColor.DoCancela;
begin
  if Assigned(FOnCancela) then
  begin
    FOnCancela();
  end;
end;

procedure TfrmSelecionaColor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not FFinalizouSelecao then
  begin
    DoCancela;
  end;
end;

end.
