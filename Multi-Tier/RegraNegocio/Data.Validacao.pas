unit Data.Validacao;

interface

uses
  System.SysUtils, System.Classes, Classes.Tipos;

type
  TdmdValidacao = class(TDataModule)
  private
    { Private declarations }
  public
    class function ValidaCPF(cpf: string): string;

    function ValidaCPF2(cpf: string): string;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdValidacao }

class function TdmdValidacao.ValidaCPF(cpf: string): string;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then
  begin
    Exit('CPF com tamanho inválido');
  end;

  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-ésimo caractere do CPF em um número
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then Exit(RETORNO_OK)
    else Exit('Digito verificador inválido');
  except
    on E: Exception do
    begin
      Exit(E.Message);
    end;
  end;
end;

function TdmdValidacao.ValidaCPF2(cpf: string): string;
begin

end;

end.
