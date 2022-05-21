unit Form.Principal.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipalCliente = class(TForm)
    ButtonClientServer: TButton;
    ButtonDataSnap: TButton;
    procedure ButtonClientServerClick(Sender: TObject);
    procedure ButtonDataSnapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalCliente: TfrmPrincipalCliente;

implementation

{$R *.dfm}

uses Form.Dados.Pessoa, Form.Dados.Pessoa.DataSnap;

procedure TfrmPrincipalCliente.ButtonClientServerClick(Sender: TObject);
begin
  Application.CreateForm(TfrmDadosPessoa, frmDadosPessoa);
  frmDadosPessoa.Show;
end;

procedure TfrmPrincipalCliente.ButtonDataSnapClick(Sender: TObject);
begin
  Application.CreateForm(TfrmDadosPessoaDataSnap, frmDadosPessoaDataSnap);
  frmDadosPessoaDataSnap.Show;
end;

end.
