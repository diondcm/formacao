program OverviewClasses;

uses
  Vcl.Forms,
  Form.Classes in 'Form.Classes.pas' {frmCalsses};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalsses, frmCalsses);
  Application.Run;
end.
