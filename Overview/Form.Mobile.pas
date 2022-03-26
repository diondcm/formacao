unit Form.Mobile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    EditTexto: TEdit;
    ButtonGerarHash: TButton;
    MemoLog: TMemo;
    procedure EditTextoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ButtonGerarHashClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Classes.Hash;

procedure TForm1.ButtonGerarHashClick(Sender: TObject);
begin
  MemoLog.Lines.Add(TGeradorHash.GeraHash(EditTexto.Text));
end;

procedure TForm1.EditTextoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    ButtonGerarHashClick(Sender);
  end;
end;

end.
