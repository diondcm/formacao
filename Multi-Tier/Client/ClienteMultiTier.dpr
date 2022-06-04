program ClienteMultiTier;

uses
  Vcl.Forms,
  Form.Principal.Cliente in 'Form.Principal.Cliente.pas' {frmPrincipalCliente},
  Data.Validacao.Client in 'Data.Validacao.Client.pas' {dmdValidacaoClient: TDataModule},
  Classes.Tipos in '..\RegraNegocio\Classes.Tipos.pas',
  Data.Geral.Client in 'Data.Geral.Client.pas' {dmdGeralClient: TDataModule},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule1: TDataModule},
  Classes.BlockChain in '..\RegraNegocio\Classes.BlockChain.pas',
  Pkg.Json.DTO in '..\RegraNegocio\Pkg.Json.DTO.pas',
  Classes.BlockIntern in '..\RegraNegocio\Classes.BlockIntern.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TfrmPrincipalCliente, frmPrincipalCliente);
  Application.CreateForm(TdmdValidacaoClient, dmdValidacaoClient);
  Application.CreateForm(TdmdGeralClient, dmdGeralClient);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
