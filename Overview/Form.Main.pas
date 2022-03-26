unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Hash, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    PanelCabecalho: TPanel;
    ButtonHash: TButton;
    Label1: TLabel;
    EditTexto: TEdit;
    MemoLog: TMemo;
    procedure ButtonHashClick(Sender: TObject);
    procedure EditTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
//    Moveu para Classes.Hash
//    function GeraHash(pTexto: string): string; // Shift + Ctrl + C
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Classes.Hash;

{ TfrmPrincipal }

procedure TfrmPrincipal.ButtonHashClick(Sender: TObject);
begin
  MemoLog.Lines.Add(TGeradorHash.GeraHash(EditTexto.Text));
end;

procedure TfrmPrincipal.EditTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonHashClick(Sender);
  end;
end;

end.
