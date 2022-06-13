program ParserTXT;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classes.Acao in 'Classes.Acao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
