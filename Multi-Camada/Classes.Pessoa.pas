unit Classes.Pessoa;

interface

uses
  System.Generics.Collections;

type
  TPessoa = class
  private
    FID: Integer;
    FNome: string;
    FCPF: string;
    FDataNascimento: TDateTime;
    FSaldo: Currency;
    FDataCadastro: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Saldo: Currency read FSaldo write FSaldo;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
  end;

  TListaPessoa = TList<TPessoa>;

implementation

end.
