unit Form.Visualiza.Hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Classes.Hash;

type
  TfrmVisualizaHash = class(TForm)
    Panel1: TPanel;
    MemoHash: TMemo;
    EditHash: TEdit;
    procedure EditHashChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibeHashModal;
  end;

//var
//  frmVisualizaHash: TfrmVisualizaHash;

implementation

{$R *.dfm}

procedure TfrmVisualizaHash.EditHashChange(Sender: TObject);
begin
  MemoHash.Lines.Insert(0, GerarHash(EditHash.Text));
end;

class procedure TfrmVisualizaHash.ExibeHashModal;
begin
  var frm: TfrmVisualizaHash := TfrmVisualizaHash.Create(nil);
  frm.ShowModal;
  frm.Free;
end;

end.
