program TesteMensagens;

uses
  Vcl.Forms,
  Form.Principal.Mensagens in 'Form.Principal.Mensagens.pas' {frmPrincipalMensagens},
  Form.Panel.Message in 'Form.Panel.Message.pas' {frmPanelMessage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalMensagens, frmPrincipalMensagens);
  Application.CreateForm(TfrmPanelMessage, frmPanelMessage);
  Application.Run;
end.
