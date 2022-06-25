program AppExemplo;

uses
  Vcl.Forms,
  Form.Principal.Exemplo in 'Form.Principal.Exemplo.pas' {frmPrincipalExemplo},
  Form.Testa.CardView in 'Form.Testa.CardView.pas' {frmTestaCardView},
  Classes.Card.Viewer in '..\CardView\Classes.Card.Viewer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestaCardView, frmTestaCardView);
  Application.CreateForm(TfrmPrincipalExemplo, frmPrincipalExemplo);
  Application.Run;
end.
