program ClienteMultiTier;

uses
  Vcl.Forms,
  Form.Principal.Cliente in 'Form.Principal.Cliente.pas' {frmPrincipalCliente},
  Data.Validacao.Client in 'Data.Validacao.Client.pas' {dmdValidacaoClient: TDataModule},
  Classes.Tipos in '..\RegraNegocio\Classes.Tipos.pas',
  Data.Geral.Client in 'Data.Geral.Client.pas' {dmdGeralClient: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TfrmPrincipalCliente, frmPrincipalCliente);
  Application.CreateForm(TdmdValidacaoClient, dmdValidacaoClient);
  Application.CreateForm(TdmdGeralClient, dmdGeralClient);
  Application.Run;
end.
