unit Form.Sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    EditValor: TEdit;
  private
    { Private declarations }
  public
    class function ExibeSobre: string;
  end;


implementation

{$R *.dfm}

{ TfrmSobre }

class function TfrmSobre.ExibeSobre: string;
begin
  var frm: TfrmSobre := TfrmSobre.Create(nil);
  frm.ShowModal;
  Result := frm.EditValor.Text;
  frm.Free;
end;

end.
