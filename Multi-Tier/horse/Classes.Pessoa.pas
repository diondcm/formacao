unit Classes.Pessoa;

interface

uses
  System.Generics.Collections;

type
  TPessoa = class
  private
    FNome: string;
    FCPF: string;
    FID: Integer;
    FDataNascimento: Int64;
    FSaldo: Currency;
    FSexo: string;
  public
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property ID: Integer read FID write FID;
    property DataNascimento: Int64 read FDataNascimento write FDataNascimento;
    property Saldo: Currency read FSaldo write FSaldo;
    property Sexo: string read FSexo write FSexo;
  end;

  TListaPessoas = class(TObjectList<TPessoa>)
  end;

implementation

end.
