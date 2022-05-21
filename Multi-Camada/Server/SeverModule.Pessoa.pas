unit SeverModule.Pessoa;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  System.Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  Classes.Pessoa, System.JSON, REST.Json, Data.DBXPlatform, Classes.Resposta;

const
  APPLICATION_JSON = 'application/json';

type
  TSMPessoa = class(TDSServerModule)
    qryPessoa: TFDQuery;
    qryPessoaID: TFDAutoIncField;
    qryPessoaNOME: TWideStringField;
    qryPessoaCPF: TWideStringField;
    qryPessoaDATA_NASCIMENTO: TDateTimeField;
    qryPessoaSALDO: TFloatField;
    qryPessoaDATA_CADASTRO: TDateTimeField;
    FDConnection: TFDConnection;
    qryUpdatePessoa: TFDQuery;
    qryInsertPessoa: TFDQuery;
    qryDeletePessoa: TFDQuery;
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    procedure ConfiguraResposta(succ: Boolean; erro, msg: string);
  public
    function GetPessoa(params: string): string;
    function PostPessoa(strpessoa: string): string;
    function updatePostPessoa(strpessoa: string): string;
    function PutPessoa(strpessoa: string): string;
    function acceptPutPessoa(strpessoa: string): string;
    function DeletePessoa(id: Integer): string;
    function cancelDeletePessoa(id: Integer): string;

    function NativoPostPessoa(pessoa: TPessoa): string;
    function NativoGetPessoa(params: string): TListaPessoa;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMPessoa }

function TSMPessoa.acceptPutPessoa(strpessoa: string): string;
begin
  Result := PutPessoa(strpessoa);
end;

function TSMPessoa.cancelDeletePessoa(id: Integer): string;
begin
  Result := DeletePessoa(id);
end;

procedure TSMPessoa.ConfiguraResposta(succ: Boolean; erro, msg: string);
begin
  var r: TResposta := TResposta.Create;
  r.Sucesso := succ;
  r.Erro := erro;
  r.Msg := msg;

  GetInvocationMetadata.ResponseContent := TJson.ObjectToJsonString(r);
  GetInvocationMetadata.ResponseContentType := APPLICATION_JSON;
end;

function TSMPessoa.DeletePessoa(id: Integer): string;
begin
  /// Mover para Classe ou Unit de negocio
    // Validar se CPF já está na base

    // Validar campos obrigatorios

    // Validar data nascimento < data atual

    // Validar saldo informado
  ///

  try
    if id > 0 then
    begin // Deleta um registro
      qryDeletePessoa.ParamByName('ID').AsInteger := id;
      qryDeletePessoa.ExecSQL;

      if qryDeletePessoa.RowsAffected > 0 then
      begin
        ConfiguraResposta(True, '', 'Registro ID: ' + id.ToString + ' deletado com sucesso');
      end else begin
        ConfiguraResposta(False, '', 'Registro ID: ' + id.ToString + ' NÃO excluído');
      end;
    end;
  except
    on E: Exception do
    begin
      ConfiguraResposta(False, E.Message, 'Erro ao excluir registro');
    end;
  end;
end;

procedure TSMPessoa.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
   'CREATE TABLE IF NOT EXISTS PESSOA  (' +
   'ID              INTEGER      PRIMARY KEY AUTOINCREMENT,' +
   'NOME            STRING (200),' +
   'CPF             STRING (11),' +
   'DATA_NASCIMENTO DATETIME,' +
   'SALDO           DOUBLE       DEFAULT (0),' +
   'DATA_CADASTRO   DATETIME     DEFAULT (CURRENT_TIMESTAMP)' +
   ')');
end;

procedure TSMPessoa.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Database := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'dados.db';
end;

function TSMPessoa.GetPessoa(params: string): string;
begin
  try
    var list: TListaPessoa := TListaPessoa.Create;

    // Buscar do banco(SQLite)
    qryPessoa.Close;
    qryPessoa.Open;
    qryPessoa.FetchAll; // Traz todos registros do DB

    while not qryPessoa.Eof do
    begin
    // Transformar em objetos(ORMs, Classes da Web, implementar na mão)
      var p: TPessoa := TPessoa.Create;
      p.ID := qryPessoaID.AsInteger;
      p.Nome := qryPessoaNOME.AsString;
      p.CPF := qryPessoaCPF.AsString;
      p.DataNascimento := qryPessoaDATA_NASCIMENTO.AsDateTime;
      p.Saldo := qryPessoaSALDO.AsCurrency;
      p.DataCadastro := qryPessoaDATA_CADASTRO.AsDateTime;

      list.Add(p);

      qryPessoa.Next;
    end;

  //  Result:= TJson.ObjectToJsonString(list); //  list.ToArray
    GetInvocationMetadata.ResponseContent := TJson.ObjectToJsonString(list);
    GetInvocationMetadata.ResponseContentType := 'application/json';

    qryPessoa.Close;
  except
    on E: Exception do
    begin
      var r: TResposta := TResposta.Create;
      r.Sucesso := False;
      r.Erro := e.Message;
      r.Msg := 'Erro ao buscar registros';

      GetInvocationMetadata.ResponseContent := TJson.ObjectToJsonString(r);
      GetInvocationMetadata.ResponseContentType := APPLICATION_JSON;
    end;
  end;
end;

function TSMPessoa.NativoGetPessoa(params: string): TListaPessoa;
begin
  Result := TListaPessoa.Create;

  // Buscar do banco(SQLite)
  qryPessoa.Close;
  qryPessoa.Open;
  qryPessoa.FetchAll; // Traz todos registros do DB

  while not qryPessoa.Eof do
  begin
  // Transformar em objetos(ORMs, Classes da Web, implementar na mão)
    var p: TPessoa := TPessoa.Create;
    p.ID := qryPessoaID.AsInteger;
    p.Nome := qryPessoaNOME.AsString;
    p.CPF := qryPessoaCPF.AsString;
    p.DataNascimento := qryPessoaDATA_NASCIMENTO.AsDateTime;
    p.Saldo := qryPessoaSALDO.AsCurrency;
    p.DataCadastro := qryPessoaDATA_CADASTRO.AsDateTime;

    Result.Add(p);

    qryPessoa.Next;
  end;

  qryPessoa.Close;
end;

function TSMPessoa.NativoPostPessoa(pessoa: TPessoa): string;
begin
  // Problema no parser
end;

function TSMPessoa.PostPessoa(strpessoa: string): string;
begin
  /// Mover para Classe ou Unit de negocio
    // Validar se CPF já está na base

    // Validar campos obrigatorios

    // Validar data nascimento < data atual

    // Validar saldo informado
  ///

  try
    var p: TPessoa := TJson.JsonToObject<TPessoa>(strpessoa);

    if p.ID > 0 then
    begin // Altera um registro
      qryUpdatePessoa.ParamByName('NOME').AsString := p.Nome;
      qryUpdatePessoa.ParamByName('CPF').AsString := p.CPF;
      qryUpdatePessoa.ParamByName('DATA_NASCIMENTO').AsDate := p.DataNascimento;
      qryUpdatePessoa.ParamByName('SALDO').AsCurrency := p.Saldo;
      qryUpdatePessoa.ParamByName('ID').AsInteger := p.ID;

      qryUpdatePessoa.ExecSQL;

      if qryUpdatePessoa.RowsAffected > 0 then
      begin
        ConfiguraResposta(True, '', 'Registro ID: ' + p.ID.ToString + ' alterado com sucesso');
      end else begin
        ConfiguraResposta(False, '', 'Registro NÃO salvo');
      end;
    end else begin // Cadastra um registro
      qryInsertPessoa.ParamByName('NOME').AsString := p.Nome;
      qryInsertPessoa.ParamByName('CPF').AsString := p.CPF;
      qryInsertPessoa.ParamByName('DATA_NASCIMENTO').AsDate := p.DataNascimento;
      qryInsertPessoa.ParamByName('SALDO').AsCurrency := p.Saldo;

      qryInsertPessoa.ExecSQL;

      if qryInsertPessoa.RowsAffected > 0 then
      begin
        ConfiguraResposta(True, '', 'Registro salvo com sucesso');
      end else begin
        ConfiguraResposta(False, '', 'Registro NÃO salvo');
      end;
    end;

  except
    on E: Exception do
    begin
      ConfiguraResposta(False, e.Message, 'Erro ao alterar registros');
    end;
  end;
end;

function TSMPessoa.PutPessoa(strpessoa: string): string;
begin
  Result := PostPessoa(strpessoa);
end;

function TSMPessoa.updatePostPessoa(strpessoa: string): string;
begin
  Result := PostPessoa(strpessoa);
end;

end.

