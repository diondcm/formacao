unit Form.Teste.Hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Hash;

type
  TfrmTesteHash = class(TForm)
    Panel1: TPanel;
    MemoTexto: TMemo;
    Label1: TLabel;
    Panel2: TPanel;
    EditHash: TEdit;
    Label2: TLabel;
    MemoLog: TMemo;
    procedure MemoTextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteHash: TfrmTesteHash;

implementation

{$R *.dfm}

procedure TfrmTesteHash.MemoTextoChange(Sender: TObject);
begin
  EditHash.Text := THashMD5.GetHashString(MemoTexto.Text);
end;

end.
