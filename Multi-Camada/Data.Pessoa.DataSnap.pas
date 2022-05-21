unit Data.Pessoa.DataSnap;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ClientModuleUnit,
  System.JSON, REST.Json, Classes.Pessoa, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Dialogs, Classes.Resposta;

const
  URL_SERVER = {$IFDEF DEBUG} 'http://localhost:8080/datasnap/rest/' {$ELSE} 'http://producao.aqua/datasnap/rest/' {$ENDIF};
  URL_ENTIDADE = 'TSMPessoa/';
  URL_GET_PESSOA = URL_SERVER + URL_ENTIDADE + 'GetPessoa/';
  URL_POST_PESSOA = URL_SERVER + URL_ENTIDADE + 'PostPessoa/';
  URL_DELETE_PESSOA = URL_SERVER + URL_ENTIDADE + 'DeletePessoa/';

type
  TdmdPessoaDataSnap = class(TDataModule)
    qryPessoa: TFDQuery;
    qryPessoaID: TFDAutoIncField;
    qryPessoaNOME: TWideStringField;
    qryPessoaCPF: TWideStringField;
    qryPessoaDATA_NASCIMENTO: TDateTimeField;
    qryPessoaSALDO: TFloatField;
    qryPessoaDATA_CADASTRO: TDateTimeField;
    memDelta: TFDMemTable;
    memPessoaLocal: TFDMemTable;
    memPessoaLocalNOME: TWideStringField;
    memPessoaLocalCPF: TWideStringField;
    memPessoaLocalDATA_NASCIMENTO: TDateTimeField;
    memPessoaLocalSALDO: TFloatField;
    memPessoaLocalDATA_CADASTRO: TDateTimeField;
    memPessoaLocalID: TIntegerField;
    IdHTTP1: TIdHTTP;
    memPessoaREST: TFDMemTable;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    DateTimeField2: TDateTimeField;
    procedure memPessoaLocalBeforePost(DataSet: TDataSet);
    procedure memPessoaRESTBeforeDelete(DataSet: TDataSet);
    procedure memPessoaRESTBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FEnviar: Boolean;
  public
    procedure CopiaDelta;

    procedure CarregaDadosDataSnapPadrao;
    procedure EnviaDadosDataSnapPadrao;

    function CarregaDadosREST: string;
  end;

var
  dmdPessoaDataSnap: TdmdPessoaDataSnap;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdPessoa }

procedure TdmdPessoaDataSnap.CarregaDadosDataSnapPadrao;
begin
  FEnviar := False;
  var list: TListaPessoa := ClientModule1.SMPessoaClient.NativoGetPessoa('');
  memPessoaLocal.Close;
  memPessoaLocal.Open;
  for var pes: TPessoa in list do
  begin
    memPessoaLocal.Append;
    memPessoaLocal.FieldByName('ID').AsInteger := pes.ID;
    memPessoaLocal.FieldByName('NOME').AsString := pes.Nome;
    memPessoaLocal.FieldByName('CPF').AsString := pes.CPF;
    memPessoaLocal.FieldByName('DATA_NASCIMENTO').AsDateTime := pes.DataNascimento;
    memPessoaLocal.FieldByName('SALDO').AsCurrency := pes.Saldo;
    memPessoaLocal.FieldByName('DATA_CADASTRO').AsDateTime := pes.DataCadastro;
    memPessoaLocal.Post;
  end;

  memPessoaLocal.First;
  FEnviar := True;
end;

function TdmdPessoaDataSnap.CarregaDadosREST: string;
begin
  memPessoaREST.Close;
  memPessoaREST.Open;
  FEnviar := False;

  var stm: TStringStream := TStringStream.Create;
  IdHTTP1.Get(URL_GET_PESSOA, stm);

  Result := stm.DataString;

  var list: TListaPessoa := TJson.JsonToObject<TListaPessoa>(stm.DataString);

  for var pes: TPessoa in list do
  begin
    memPessoaREST.Append;
    memPessoaREST.FieldByName('ID').AsInteger := pes.ID;
    memPessoaREST.FieldByName('NOME').AsString := pes.Nome;
    memPessoaREST.FieldByName('CPF').AsString := pes.CPF;
    memPessoaREST.FieldByName('DATA_NASCIMENTO').AsDateTime := pes.DataNascimento;
    memPessoaREST.FieldByName('SALDO').AsCurrency := pes.Saldo;
    memPessoaREST.FieldByName('DATA_CADASTRO').AsDateTime := pes.DataCadastro;
    memPessoaREST.Post;
  end;

  list.Free;
  stm.Free;
  FEnviar := True;
end;

procedure TdmdPessoaDataSnap.CopiaDelta;
begin
  memDelta.Close;

  if not qryPessoa.IsEmpty then
    memDelta.Data := qryPessoa.Delta
  else if not memPessoaLocal.IsEmpty then
    memDelta.Data := memPessoaLocal.Delta;

  memDelta.StatusFilter := [rtModified, rtInserted, rtDeleted, rtUnmodified, rtHasErrors];
end;

procedure TdmdPessoaDataSnap.EnviaDadosDataSnapPadrao;
begin
  { Envio em lote }
  memDelta.Close;
  memDelta.Data := memPessoaLocal.Delta;

  if not memDelta.IsEmpty then
  begin
    memDelta.First;
    while not memDelta.Eof do
    begin
      var p: TPessoa := TPessoa.Create;

      p.ID := memDelta.FieldByName('ID').AsInteger;
      p.Nome := memDelta.FieldByName('NOME').AsString;
      p.CPF := memDelta.FieldByName('CPF').AsString;
      p.DataNascimento := memDelta.FieldByName('DATA_NASCIMENTO').AsDateTime;
      p.Saldo := memDelta.FieldByName('SALDO').AsCurrency;
      p.DataCadastro := memDelta.FieldByName('DATA_CADASTRO').AsDateTime;

      ClientModule1.SMPessoaClient.NativoPostPessoa(p);

      memDelta.Next;
    end;
  end;
end;

procedure TdmdPessoaDataSnap.memPessoaLocalBeforePost(DataSet: TDataSet);
begin
  { Envio por alteração }
  if FEnviar then
  begin
    var p: TPessoa := TPessoa.Create;

    p.ID := memPessoaLocal.FieldByName('ID').AsInteger;
    p.Nome := memPessoaLocal.FieldByName('NOME').AsString;
    p.CPF := memPessoaLocal.FieldByName('CPF').AsString;
    p.DataNascimento := memPessoaLocal.FieldByName('DATA_NASCIMENTO').AsDateTime;
    p.Saldo := memPessoaLocal.FieldByName('SALDO').AsCurrency;
    p.DataCadastro := memPessoaLocal.FieldByName('DATA_CADASTRO').AsDateTime;

    ClientModule1.SMPessoaClient.NativoPostPessoa(p);
  end;
end;

procedure TdmdPessoaDataSnap.memPessoaRESTBeforeDelete(DataSet: TDataSet);
begin
  var stm: TStringStream := TStringStream.Create;
  try
    IdHTTP1.Delete(URL_DELETE_PESSOA + memPessoaREST.FieldByName('ID').AsString, stm);

    var r: TResposta := TJson.JsonToObject<TResposta>(stm.DataString);
    if not r.Sucesso then
    begin
      ShowMessage(r.Msg + sLineBreak + r.Erro);
    end;
    r.Free;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao excluir no servidor: ' + e.Message);
    end;
  end;
  stm.Free;
end;

procedure TdmdPessoaDataSnap.memPessoaRESTBeforePost(DataSet: TDataSet);
begin
//  case memPessoaREST.State of
//    dsEdit: ;
//    dsInsert: ;
//  end;

  if not FEnviar then
  begin
    Exit;
  end;

  var p: TPessoa := TPessoa.Create;

  p.ID := memPessoaREST.FieldByName('ID').AsInteger;
  p.Nome := memPessoaREST.FieldByName('NOME').AsString;
  p.CPF := memPessoaREST.FieldByName('CPF').AsString;
  p.DataNascimento := memPessoaREST.FieldByName('DATA_NASCIMENTO').AsDateTime;
  p.Saldo := memPessoaREST.FieldByName('SALDO').AsCurrency;
  p.DataCadastro := memPessoaREST.FieldByName('DATA_CADASTRO').AsDateTime;

  var stm: TStringStream := TStringStream.Create;
  try
    IdHTTP1.Post(URL_POST_PESSOA + TJson.ObjectToJsonString(p), nil, stm, nil);

    var r: TResposta := TJson.JsonToObject<TResposta>(stm.DataString);
    if not r.Sucesso then
    begin
      ShowMessage(r.Msg + sLineBreak + r.Erro);
    end;
    r.Free;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao excluir no servidor: ' + e.Message);
    end;
  end;

  stm.Free;
end;

end.
