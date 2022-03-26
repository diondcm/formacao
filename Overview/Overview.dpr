program Overview;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {frmPrincipal},
  Classes.Hash in 'Classes.Hash.pas',
  Form.HashVLC in 'Form.HashVLC.pas' {frmHashVCL},
  Form.Cadastro in 'Form.Cadastro.pas' {frmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
