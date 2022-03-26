program Overview;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {frmPrincipal},
  Classes.Hash in 'Classes.Hash.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
