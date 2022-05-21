program MultiCamadaClientServer;

uses
  Vcl.Forms,
  Form.Dados.Pessoa in 'Form.Dados.Pessoa.pas' {frmDadosPessoa},
  Data.Pessoa in 'Data.Pessoa.pas' {dmdPessoa: TDataModule},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Data.Pessoa.DataSnap in 'Data.Pessoa.DataSnap.pas' {dmdPessoaDataSnap: TDataModule},
  Form.Dados.Pessoa.DataSnap in 'Form.Dados.Pessoa.DataSnap.pas' {frmDadosPessoaDataSnap},
  Form.Principal.Cliente in 'Form.Principal.Cliente.pas' {frmPrincipalCliente},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule1: TDataModule},
  Classes.Pessoa in 'Classes.Pessoa.pas',
  Classes.Resposta in 'Classes.Resposta.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdPessoa, dmdPessoa);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TdmdPessoaDataSnap, dmdPessoaDataSnap);
  Application.CreateForm(TfrmPrincipalCliente, frmPrincipalCliente);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
