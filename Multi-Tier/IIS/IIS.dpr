library IIS;

{$R *.dres}

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Data.DBXCommon,
  Datasnap.DSSession,
  SM.Geral in '..\Server\SM.Geral.pas' {smGeral: TDSServerModule},
  WebModuleUnit in '..\Server\WebModuleUnit.pas' {WebModule1: TWebModule},
  Data.Validacao in '..\RegraNegocio\Data.Validacao.pas' {dmdValidacao: TDataModule},
  Data.Cliente in '..\RegraNegocio\Data.Cliente.pas' {dmdCliente: TDataModule},
  Classes.Tipos in '..\RegraNegocio\Classes.Tipos.pas',
  SM.Threads in '..\Server\SM.Threads.pas' {smThreads: TDSServerModule},
  SM.Arquivos in '..\Server\SM.Arquivos.pas' {smArquivos: TDSServerModule},
  SM.BlockChain in '..\Server\SM.BlockChain.pas' {smBlockChain: TDSServerModule},
  Pkg.Json.DTO in '..\RegraNegocio\Pkg.Json.DTO.pas',
  Classes.BlockChain in '..\RegraNegocio\Classes.BlockChain.pas',
  Classes.BlockIntern in '..\RegraNegocio\Classes.BlockIntern.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TISAPIApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
