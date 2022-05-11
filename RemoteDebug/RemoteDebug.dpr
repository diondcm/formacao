program RemoteDebug;

{$R *.dres}

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {Form1},
  Classe.Helper.ZipFile in 'Classe.Helper.ZipFile.pas',
  Classe.Remote.Debug in 'Classe.Remote.Debug.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
