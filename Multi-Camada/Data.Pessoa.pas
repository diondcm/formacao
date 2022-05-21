unit Data.Pessoa;

interface

uses
  System.SysUtils, System.Classes, Data.Conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdPessoa = class(TDataModule)
    qryPessoa: TFDQuery;
    qryPessoaID: TFDAutoIncField;
    qryPessoaNOME: TWideStringField;
    qryPessoaCPF: TWideStringField;
    qryPessoaDATA_NASCIMENTO: TDateTimeField;
    qryPessoaSALDO: TFloatField;
    qryPessoaDATA_CADASTRO: TDateTimeField;
    memCache: TFDMemTable;
  private
    { Private declarations }
  public
    procedure CopiaDelta;
  end;

var
  dmdPessoa: TdmdPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdPessoa }

procedure TdmdPessoa.CopiaDelta;
begin
  memCache.Close;
  memCache.Data := qryPessoa.Delta;
  memCache.StatusFilter := [rtModified, rtInserted, rtDeleted, rtUnmodified, rtHasErrors];
end;

end.
