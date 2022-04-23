program OverviewClasses;

uses
  Vcl.Forms,
  Form.Classes in 'Form.Classes.pas' {frmClasses},
  Form.Referencia in 'Form.Referencia.pas' {frmReferencia},
  Form.Generico in 'Form.Generico.pas' {frmGenerico},
  Form.Testes in 'Form.Testes.pas' {frmTestes},
  Classes.Mensagem in 'Classes.Mensagem.pas',
  Form.Menu in 'Form.Menu.pas' {frmMenu},
  Form.Base in 'Form.Base.pas' {frmBase},
  Form.Login in 'Form.Login.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
