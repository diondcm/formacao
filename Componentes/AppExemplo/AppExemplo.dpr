program AppExemplo;

uses
  Vcl.Forms,
  Form.Principal.Exemplo in 'Form.Principal.Exemplo.pas' {frmPrincipalExemplo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalExemplo, frmPrincipalExemplo);
  Application.Run;
end.
