program ServerMultiTier;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Principal.Server in 'Form.Principal.Server.pas' {frmPrincipalServer},
  SM.Geral in 'SM.Geral.pas' {smGeral: TDSServerModule},
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule},
  Data.Validacao in '..\RegraNegocio\Data.Validacao.pas' {dmdValidacao: TDataModule},
  Data.Cliente in '..\RegraNegocio\Data.Cliente.pas' {dmdCliente: TDataModule},
  Classes.Tipos in '..\RegraNegocio\Classes.Tipos.pas',
  SM.Threads in 'SM.Threads.pas' {smThreads: TDSServerModule},
  SM.Arquivos in 'SM.Arquivos.pas' {smArquivos: TDSServerModule},
  SM.BlockChain in 'SM.BlockChain.pas' {smBlockChain: TDSServerModule},
  Pkg.Json.DTO in '..\RegraNegocio\Pkg.Json.DTO.pas',
  Classes.BlockChain in '..\RegraNegocio\Classes.BlockChain.pas',
  Classes.BlockIntern in '..\RegraNegocio\Classes.BlockIntern.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalServer, frmPrincipalServer);
  Application.Run;
end.
