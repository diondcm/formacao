program DBFiremonkey;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Firemonkey in 'Form.Principal.Firemonkey.pas' {frmPrincipal},
  Form.Produto in 'Form.Produto.pas' {frmProduto},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TdmdProduto, dmdProduto);
  Application.Run;
end.
