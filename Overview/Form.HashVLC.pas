unit Form.HashVLC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmHashVCL = class(TForm)
    PanelCabecalho: TPanel;
    Label1: TLabel;
    ButtonHash: TButton;
    EditTexto: TEdit;
    MemoLog: TMemo;
    procedure ButtonHashClick(Sender: TObject);
    procedure EditTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
//    Moveu para Classes.Hash
//    function GeraHash(pTexto: string): string; // Shift + Ctrl + C
  end;

var
  frmHashVCL: TfrmHashVCL;

implementation

{$R *.dfm}

uses Classes.Hash;

procedure TfrmHashVCL.ButtonHashClick(Sender: TObject);
begin
  MemoLog.Lines.Add(TGeradorHash.GeraHash(EditTexto.Text));
end;

procedure TfrmHashVCL.EditTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonHashClick(Sender);
  end;
end;

end.
