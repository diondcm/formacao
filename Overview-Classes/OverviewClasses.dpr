program OverviewClasses;

uses
  Vcl.Forms,
  Form.Classes in 'Form.Classes.pas' {frmCalsses},
  Form.Referencia in 'Form.Referencia.pas' {frmReferencia};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmReferencia, frmReferencia);
  Application.CreateForm(TfrmCalsses, frmCalsses);
  Application.Run;
end.
