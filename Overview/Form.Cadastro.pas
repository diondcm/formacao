unit Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TPessoa = class
  private
    FNome: string;
    FCodigo: Integer;
    FCPF: string;
    FAtivo: Boolean;
  public
    property Nome: string read FNome write FNome;
    property Codigo: Integer read FCodigo write FCodigo;
    property CPF: string read FCPF write FCPF;
    property Ativo: Boolean read FAtivo write FAtivo;
  end;

  TfrmCadastro = class(TForm)
    PanelControles: TPanel;
    PanelOpcoes: TPanel;
    PanelDados: TPanel;
    Button1: TButton;
    Button5: TButton;
    Label1: TLabel;
    EditCodigo: TEdit;
    Label2: TLabel;
    EditNome: TEdit;
    Label3: TLabel;
    EditCPF: TEdit;
    CheckBoxAtivo: TCheckBox;
    BitBtnSair: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TelaParaObj; // Shift + Ctrl + E >> para renomear
    procedure ObjParaTela;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

{ TfrmCadastro }

procedure TfrmCadastro.Button1Click(Sender: TObject);
begin
  ObjParaTela;
end;

procedure TfrmCadastro.Button5Click(Sender: TObject);
begin
  TelaParaObj;
end;

procedure TfrmCadastro.ObjParaTela;
begin
  var obj: TPessoa := TPessoa.Create;
  obj.Nome := 'Primirus testes';
  obj.Codigo := 2;
  obj.CPF := '00011122285';
  obj.Ativo := True;

  EditCodigo.Text := obj.Codigo.ToString;
  EditNome.Text := obj.Nome;
  EditCPF.Text := obj.CPF;
  CheckBoxAtivo.Checked := obj.Ativo;

  obj.Free;
end;

procedure TfrmCadastro.TelaParaObj;
begin
  var obj: TPessoa := TPessoa.Create;

  obj.Codigo := StrToInt(EditCodigo.Text);
  obj.Nome := EditNome.Text;
  obj.CPF := EditCPF.Text;
  obj.Ativo := CheckBoxAtivo.Checked;

  // Num sistema real, teriamos alguma serealização(DB, JSON, XML, TXT)

  obj.Free;
end;

end.
