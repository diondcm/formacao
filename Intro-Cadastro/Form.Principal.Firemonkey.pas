unit Form.Principal.Firemonkey;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    ButtonProduto: TButton;
    GlowEffect1: TGlowEffect;
    procedure ButtonProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Form.Produto;

procedure TfrmPrincipal.ButtonProdutoClick(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(Self);
  frmProduto.ShowModal;
  frmProduto.Free;
end;

end.
