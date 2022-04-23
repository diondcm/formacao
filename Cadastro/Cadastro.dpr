program Cadastro;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base in 'Form.Base.pas' {frmBase},
  Data.Base in 'Data.Base.pas' {dmdBase: TDataModule},
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.Run;
end.
