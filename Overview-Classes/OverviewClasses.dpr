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
  Form.Login in 'Form.Login.pas' {frmLogin},
  Form.Instancia in 'Form.Instancia.pas' {frmInstancia},
  Form.StackEHeap in 'Form.StackEHeap.pas' {frmStackEHeap},
  Form.Seleciona.Color in 'Form.Seleciona.Color.pas' {frmSelecionaColor};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
