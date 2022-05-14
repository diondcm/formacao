program Cadastro;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base in 'Form.Base.pas' {frmBase},
  Data.Base in 'Data.Base.pas' {dmdBase: TDataModule},
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Form.Base.Cadastro in 'Form.Base.Cadastro.pas' {frmBaseCadastro},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadastroCliente},
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadastroProduto},
  Data.Imagens in 'Data.Imagens.pas' {dmdImagens: TDataModule},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Data.Pedido in 'Data.Pedido.pas' {dmdPedido: TDataModule},
  Form.Cadastro.Pedido in 'Form.Cadastro.Pedido.pas' {frmCadPedidos},
  Form.Cadastro.Item in 'Form.Cadastro.Item.pas' {frmCadastroItem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdImagens, dmdImagens);
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
