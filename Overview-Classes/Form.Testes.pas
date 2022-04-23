unit Form.Testes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classes.Mensagem,
  Vcl.ExtCtrls, System.Generics.Collections, Form.Base, Vcl.ComCtrls, System.StrUtils, System.Math, System.DateUtils;

type
  TPessoa = class(TObject)
  private
    FEmail: string;
    FTelefonePrincipal: string;
    FDataCadastro: TDateTime;
    FLimiteCredito: Currency;
    FSaldo: Currency;
  public
    function ToString: string; override;

    property Email: string read FEmail write FEmail;
    property TelefonePrincipal: string read FTelefonePrincipal write FTelefonePrincipal;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    property LimiteCredito: Currency read FLimiteCredito write FLimiteCredito;
    property Saldo: Currency read FSaldo write FSaldo;
  end;

  TPessoaFisica = class(TPessoa)
  private
    FNome: string;
    FCPF: string;
  public
    function ToString: string; override;

    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    FNomeFantasia: string;
    FRazaoSocial: string;
    FCNPJ: string;
  public
    function ToString: string; override;

    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property CNPJ: string read FCNPJ write FCNPJ;
  end;

  TfrmTestes = class(TfrmBase)
    PanelBotoes: TPanel;
    ButtonArr: TButton;
    ButtonExcept: TButton;
    ButtonPessoaFisica: TButton;
    Panel1: TPanel;
    MemoInfos: TMemo;
    PanelLista: TPanel;
    ButtonLista: TButton;
    ButtonPessoaJuridica: TButton;
    ButtonRemovePessoa: TButton;
    ButtonTypes: TButton;
    procedure ButtonArrClick(Sender: TObject);
    procedure ButtonExceptClick(Sender: TObject);
    procedure ButtonPessoaFisicaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonListaClick(Sender: TObject);
    procedure ButtonPessoaJuridicaClick(Sender: TObject);
    procedure ButtonRemovePessoaClick(Sender: TObject);
    procedure ButtonTypesClick(Sender: TObject);
  private
//    FPessoas: TList<TPessoa>;
    FPessoas: TObjectList<TPessoa>;
    procedure Teste;
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}

procedure TfrmTestes.ButtonRemovePessoaClick(Sender: TObject);
begin
//  FPessoas.First.Free;
//  var ref: TPessoa := FPessoas.First;
  FPessoas.Delete(0);
//  ref.Free;
end;

procedure TfrmTestes.ButtonTypesClick(Sender: TObject);
type
  TTipoEndereco = (Default, Casa, Predio, {tmptend}Navio);
  TTipoResidencia = (DefaultResidencia = 20, Propria, Alugada);

  TResidencias = set of TTipoResidencia;

var
  ltipoEnd: TTipoEndereco;
  res: TResidencias;

  lproc: TProc;
begin
//  ltipoEnd := Predio;
//  ltipoEnd := TTipoEndereco.Navio;
//
//  res := [TTipoResidencia.DefaultResidencia, TTipoResidencia.Alugada];
//
//  if TTipoResidencia.DefaultResidencia in res then
//  begin
//
//  end;

//  var str: string;
//  for var i: Integer := 1 to Length(Caption) do
//  begin
//    str := str + '-' + Caption[i];
//  end;
//
//  ShowMessage(str);

//  Self.Font.Style

//  case ltipoEnd of
//    Default: ;
//    Casa: ;
//    Predio: ;
//    Navio: ;
//  end;

  lproc :=
    procedure
    begin
      Self.Caption := TimeToStr(Now) + ' - ' + IntToStr(Ord(TTipoResidencia.DefaultResidencia)) + ' - ' + IfThen((DayOf(Now) div 2 = 0), 'Dia Par', 'Dia Impar');
    end;

  lproc();
  Teste;
  Teste();
end;

procedure TfrmTestes.ButtonArrClick(Sender: TObject);
type
  TRetornoArray = packed array [0..4] of Integer;

var
  larr: array [0..9] of string;

  larrVelho: array of string;
  larrVelho2: array [0..0] of string;
  larrNovo: TArray<string>;

  larr2Dim: array [0..9] of array [0..9] of array [0..9] of Integer;

//  function GetArray(p: array [0..4] of Integer): {array [0..4] of }Integer;
  function GetArray(p: TRetornoArray): TRetornoArray;
  begin

  end;

begin
  larr2Dim[0][4][2] := GetTickCount;

//  larr[14] := 'Teste';

//  TList<String>.Sort;
//
//  for var str: string in larrVelho do
//  begin
//    if str = 'XX' then
//      // Achou!
//  end;

//  SetLength(larrVelho2, 2);
  SetLength(larrVelho, 2);
  SetLength(larrNovo, 2);
//  Length(larrVelho) = XX

  larr[0] := 'Teste';
  larrVelho2[0] := 'Novo';
end;

procedure TfrmTestes.ButtonExceptClick(Sender: TObject);
begin
  try
    raise EDivByZero.Create('Error Message');

  except
    on E: EAbort do
       raise;
    on E: Exception do
      TMensagem.Erro('Arquivo inválido');
//      ShowMessage('Erro: ' + E.ClassName + ' ' + E.Message);
  end;
end;

procedure TfrmTestes.ButtonPessoaFisicaClick(Sender: TObject);
begin
  var pf: TPessoaFisica := TPessoaFisica.Create;
  pf.Email := 'fisica@teste.com';
  pf.DataCadastro := Now;
  pf.Saldo := 0;
  pf.LimiteCredito := 300;

  pf.CPF := '000.111.222-85';
  pf.Nome := 'Testes Primeirus';

  FPessoas.Add(pf);

//  pf.Free;
end;

procedure TfrmTestes.ButtonPessoaJuridicaClick(Sender: TObject);
begin
  var pj: TPessoaJuridica := TPessoaJuridica.Create;
  pj.Email := 'juridica@teste.com'; // Shift + Ctrl + J
  pj.DataCadastro := Now;
  pj.Saldo := 0;
  pj.LimiteCredito := 700;

  pj.CNPJ := '42.868.648/0001-24';
  pj.RazaoSocial := 'Comercial Testes';
  pj.NomeFantasia := 'Loja Testes';

  FPessoas.Add(pj);
end;

procedure TfrmTestes.ButtonListaClick(Sender: TObject);
begin
  MemoInfos.Clear;
  for var pes: TPessoa in FPessoas do
  begin
//    MemoInfos.Lines.Insert(0, '[[Pessoa]]');
//    MemoInfos.Lines.Insert(0, 'Email: ' + pes.Email);
//    MemoInfos.Lines.Insert(0, 'Cadastro: ' + TimeToStr(pes.DataCadastro));
//    MemoInfos.Lines.Insert(0, 'Limite: ' + FormatFloat('0.,00', pes.LimiteCredito));
//    MemoInfos.Lines.Insert(0, 'Saldo: ' + FormatFloat('0.,00', pes.Saldo));
//    MemoInfos.Lines.Insert(0, '');

    MemoInfos.Lines.Insert(0, pes.ToString + sLineBreak);
  end;
end;

procedure TfrmTestes.FormCreate(Sender: TObject);
begin
  FPessoas := TObjectList<TPessoa>.Create; //(False);
end;

procedure TfrmTestes.FormDestroy(Sender: TObject);
begin
//  Poderiamos manualmente liberar
//  for var pes: TPessoa in FPessoas do
//  begin
////    pes := nil;
//    pes.Free;
//  end;

  FPessoas.Free;
end;

procedure TfrmTestes.Teste;
begin

end;

{ TPessoa }

function TPessoa.ToString: string;
begin
//  inherited; >> Sem sentido, executamos sem ancestral

//  Result := '[[Pessoa]]';
  Result := Result + sLineBreak + 'Email: ' + Email;
  Result := Result + sLineBreak + 'Cadastro: ' + TimeToStr(DataCadastro);
  Result := Result + sLineBreak + 'Limite: ' + FormatFloat('0.,00', LimiteCredito);
  Result := Result + sLineBreak + 'Saldo: ' + FormatFloat('0.,00', Saldo);
end;

{ TPessoaFisica }

function TPessoaFisica.ToString: string;
begin
  Result := '[[Pessoa Fisica]]' + inherited;
  Result := Result + sLineBreak + 'CPF: ' + CPF;
  Result := Result + sLineBreak + 'Nome: ' + Nome;
end;

{ TPessoaJuridica }

function TPessoaJuridica.ToString: string;
begin
  Result := '[[Pessoa Juridica]]' + inherited;
  Result := Result + sLineBreak + 'CNPJ: ' + CNPJ;
  Result := Result + sLineBreak + 'RazaoSocial: ' + RazaoSocial;
  Result := Result + sLineBreak + 'NomeFantasia: ' + NomeFantasia;
end;

end.
