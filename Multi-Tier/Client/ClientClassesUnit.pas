//
// Created by the DataSnap proxy generator.
// 04/06/2022 14:55:38
//

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classes.BlockChain, Classes.BlockIntern, Data.DBXJSONReflect;

type

  IDSRestCachedTListaBlock = interface;
  IDSRestCachedTBlockIntern = interface;
  IDSRestCachedTBlockChain = interface;

  TsmGeralClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FValidaCPFCommand: TDSRestCommand;
    FVerificaCPFClienteNaBaseCommand: TDSRestCommand;
    FGetDataAtualCommand: TDSRestCommand;
    FGetDataAtualISO8601Command: TDSRestCommand;
    FGetDataAtualEpochCommand: TDSRestCommand;
    FGetDataAtualDelphiCommand: TDSRestCommand;
    FGetDataAtualNaoUsarCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function ValidaCPF(cpf: string; const ARequestFilter: string = ''): string;
    function VerificaCPFClienteNaBase(cpf: string; const ARequestFilter: string = ''): string;
    function GetDataAtual(const ARequestFilter: string = ''): string;
    function GetDataAtualISO8601(const ARequestFilter: string = ''): string;
    function GetDataAtualEpoch(const ARequestFilter: string = ''): string;
    function GetDataAtualDelphi(const ARequestFilter: string = ''): TDateTime;
    function GetDataAtualNaoUsar(const ARequestFilter: string = ''): string;
  end;

  TsmThreadsClient = class(TDSAdminRestClient)
  private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FDSServerModuleDestroyCommand: TDSRestCommand;
    FGetThreadCommand: TDSRestCommand;
    FGetThread2Command: TDSRestCommand;
    FGetThread3Command: TDSRestCommand;
    FGetListaCommand: TDSRestCommand;
    FGetListaComErroCommand: TDSRestCommand;
    FValidaCPFThreadCommand: TDSRestCommand;
    FGetQtdValidacaoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function GetThread(const ARequestFilter: string = ''): string;
    function GetThread2(const ARequestFilter: string = ''): string;
    function GetThread3(const ARequestFilter: string = ''): string;
    function GetLista(const ARequestFilter: string = ''): string;
    function GetListaComErro(const ARequestFilter: string = ''): string;
    function ValidaCPFThread(const ARequestFilter: string = ''): string;
    function GetQtdValidacao(const ARequestFilter: string = ''): string;
  end;

  TsmArquivosClient = class(TDSAdminRestClient)
  private
    FGetArquivoCommand: TDSRestCommand;
    FGetArquivoCommand_Cache: TDSRestCommand;
    FSetFileCommand: TDSRestCommand;
    FGetAtualizaArquivoCommand: TDSRestCommand;
    FGetArquivoGenericoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetArquivo(nomeArquivo: string; out size: Int64; const ARequestFilter: string = ''): TStream;
    function GetArquivo_Cache(nomeArquivo: string; out size: Int64; const ARequestFilter: string = ''): IDSRestCachedStream;
    function SetFile(nomeArquivo: string; arq: TStream; const ARequestFilter: string = ''): Int64;
    function GetAtualizaArquivo(nomeArquivo: string; hashClient: string; const ARequestFilter: string = ''): Boolean;
    procedure GetArquivoGenerico(nomeArquivo: string);
  end;

  TsmBlockChainClient = class(TDSAdminRestClient)
  private
    FGetCotacaoGeralCommand: TDSRestCommand;
    FGetBlockChainCommand: TDSRestCommand;
    FGetBlockChainCommand_Cache: TDSRestCommand;
    FGetBlockInternCommand: TDSRestCommand;
    FGetBlockInternCommand_Cache: TDSRestCommand;
    FGetListBlockCommand: TDSRestCommand;
    FGetListBlockCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure GetCotacaoGeral(block: string);
    function GetBlockChain(block: string; const ARequestFilter: string = ''): TBlockChain;
    function GetBlockChain_Cache(block: string; const ARequestFilter: string = ''): IDSRestCachedTBlockChain;
    function GetBlockIntern(block: string; const ARequestFilter: string = ''): TBlockIntern;
    function GetBlockIntern_Cache(block: string; const ARequestFilter: string = ''): IDSRestCachedTBlockIntern;
    function GetListBlock(block: string; const ARequestFilter: string = ''): TListaBlock;
    function GetListBlock_Cache(block: string; const ARequestFilter: string = ''): IDSRestCachedTListaBlock;
  end;

  IDSRestCachedTListaBlock = interface(IDSRestCachedObject<TListaBlock>)
  end;

  TDSRestCachedTListaBlock = class(TDSRestCachedObject<TListaBlock>, IDSRestCachedTListaBlock, IDSRestCachedCommand)
  end;
  IDSRestCachedTBlockIntern = interface(IDSRestCachedObject<TBlockIntern>)
  end;

  TDSRestCachedTBlockIntern = class(TDSRestCachedObject<TBlockIntern>, IDSRestCachedTBlockIntern, IDSRestCachedCommand)
  end;
  IDSRestCachedTBlockChain = interface(IDSRestCachedObject<TBlockChain>)
  end;

  TDSRestCachedTBlockChain = class(TDSRestCachedObject<TBlockChain>, IDSRestCachedTBlockChain, IDSRestCachedCommand)
  end;

const
  TsmGeral_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_ValidaCPF: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'cpf'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_VerificaCPFClienteNaBase: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'cpf'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_GetDataAtual: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_GetDataAtualISO8601: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_GetDataAtualEpoch: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmGeral_GetDataAtualDelphi: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 11; TypeName: 'TDateTime')
  );

  TsmGeral_GetDataAtualNaoUsar: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_DSServerModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TsmThreads_DSServerModuleDestroy: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TsmThreads_GetThread: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_GetThread2: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_GetThread3: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_GetLista: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_GetListaComErro: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_ValidaCPFThread: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmThreads_GetQtdValidacao: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmArquivos_GetArquivo: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'nomeArquivo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'size'; Direction: 2; DBXType: 18; TypeName: 'Int64'),
    (Name: ''; Direction: 4; DBXType: 33; TypeName: 'TStream')
  );

  TsmArquivos_GetArquivo_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'nomeArquivo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'size'; Direction: 2; DBXType: 18; TypeName: 'Int64'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmArquivos_SetFile: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'nomeArquivo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'arq'; Direction: 1; DBXType: 33; TypeName: 'TStream'),
    (Name: ''; Direction: 4; DBXType: 18; TypeName: 'Int64')
  );

  TsmArquivos_GetAtualizaArquivo: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'nomeArquivo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'hashClient'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TsmArquivos_GetArquivoGenerico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'nomeArquivo'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TsmBlockChain_GetCotacaoGeral: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TsmBlockChain_GetBlockChain: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TBlockChain')
  );

  TsmBlockChain_GetBlockChain_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmBlockChain_GetBlockIntern: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TBlockIntern')
  );

  TsmBlockChain_GetBlockIntern_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmBlockChain_GetListBlock: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TListaBlock')
  );

  TsmBlockChain_GetListBlock_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'block'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TsmGeralClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TsmGeral.EchoString';
    FEchoStringCommand.Prepare(TsmGeral_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TsmGeralClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TsmGeral.ReverseString';
    FReverseStringCommand.Prepare(TsmGeral_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TsmGeralClient.ValidaCPF(cpf: string; const ARequestFilter: string): string;
begin
  if FValidaCPFCommand = nil then
  begin
    FValidaCPFCommand := FConnection.CreateCommand;
    FValidaCPFCommand.RequestType := 'GET';
    FValidaCPFCommand.Text := 'TsmGeral.ValidaCPF';
    FValidaCPFCommand.Prepare(TsmGeral_ValidaCPF);
  end;
  FValidaCPFCommand.Parameters[0].Value.SetWideString(cpf);
  FValidaCPFCommand.Execute(ARequestFilter);
  Result := FValidaCPFCommand.Parameters[1].Value.GetWideString;
end;

function TsmGeralClient.VerificaCPFClienteNaBase(cpf: string; const ARequestFilter: string): string;
begin
  if FVerificaCPFClienteNaBaseCommand = nil then
  begin
    FVerificaCPFClienteNaBaseCommand := FConnection.CreateCommand;
    FVerificaCPFClienteNaBaseCommand.RequestType := 'GET';
    FVerificaCPFClienteNaBaseCommand.Text := 'TsmGeral.VerificaCPFClienteNaBase';
    FVerificaCPFClienteNaBaseCommand.Prepare(TsmGeral_VerificaCPFClienteNaBase);
  end;
  FVerificaCPFClienteNaBaseCommand.Parameters[0].Value.SetWideString(cpf);
  FVerificaCPFClienteNaBaseCommand.Execute(ARequestFilter);
  Result := FVerificaCPFClienteNaBaseCommand.Parameters[1].Value.GetWideString;
end;

function TsmGeralClient.GetDataAtual(const ARequestFilter: string): string;
begin
  if FGetDataAtualCommand = nil then
  begin
    FGetDataAtualCommand := FConnection.CreateCommand;
    FGetDataAtualCommand.RequestType := 'GET';
    FGetDataAtualCommand.Text := 'TsmGeral.GetDataAtual';
    FGetDataAtualCommand.Prepare(TsmGeral_GetDataAtual);
  end;
  FGetDataAtualCommand.Execute(ARequestFilter);
  Result := FGetDataAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmGeralClient.GetDataAtualISO8601(const ARequestFilter: string): string;
begin
  if FGetDataAtualISO8601Command = nil then
  begin
    FGetDataAtualISO8601Command := FConnection.CreateCommand;
    FGetDataAtualISO8601Command.RequestType := 'GET';
    FGetDataAtualISO8601Command.Text := 'TsmGeral.GetDataAtualISO8601';
    FGetDataAtualISO8601Command.Prepare(TsmGeral_GetDataAtualISO8601);
  end;
  FGetDataAtualISO8601Command.Execute(ARequestFilter);
  Result := FGetDataAtualISO8601Command.Parameters[0].Value.GetWideString;
end;

function TsmGeralClient.GetDataAtualEpoch(const ARequestFilter: string): string;
begin
  if FGetDataAtualEpochCommand = nil then
  begin
    FGetDataAtualEpochCommand := FConnection.CreateCommand;
    FGetDataAtualEpochCommand.RequestType := 'GET';
    FGetDataAtualEpochCommand.Text := 'TsmGeral.GetDataAtualEpoch';
    FGetDataAtualEpochCommand.Prepare(TsmGeral_GetDataAtualEpoch);
  end;
  FGetDataAtualEpochCommand.Execute(ARequestFilter);
  Result := FGetDataAtualEpochCommand.Parameters[0].Value.GetWideString;
end;

function TsmGeralClient.GetDataAtualDelphi(const ARequestFilter: string): TDateTime;
begin
  if FGetDataAtualDelphiCommand = nil then
  begin
    FGetDataAtualDelphiCommand := FConnection.CreateCommand;
    FGetDataAtualDelphiCommand.RequestType := 'GET';
    FGetDataAtualDelphiCommand.Text := 'TsmGeral.GetDataAtualDelphi';
    FGetDataAtualDelphiCommand.Prepare(TsmGeral_GetDataAtualDelphi);
  end;
  FGetDataAtualDelphiCommand.Execute(ARequestFilter);
  Result := FGetDataAtualDelphiCommand.Parameters[0].Value.AsDateTime;
end;

function TsmGeralClient.GetDataAtualNaoUsar(const ARequestFilter: string): string;
begin
  if FGetDataAtualNaoUsarCommand = nil then
  begin
    FGetDataAtualNaoUsarCommand := FConnection.CreateCommand;
    FGetDataAtualNaoUsarCommand.RequestType := 'GET';
    FGetDataAtualNaoUsarCommand.Text := 'TsmGeral.GetDataAtualNaoUsar';
    FGetDataAtualNaoUsarCommand.Prepare(TsmGeral_GetDataAtualNaoUsar);
  end;
  FGetDataAtualNaoUsarCommand.Execute(ARequestFilter);
  Result := FGetDataAtualNaoUsarCommand.Parameters[0].Value.GetWideString;
end;

constructor TsmGeralClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmGeralClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmGeralClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FValidaCPFCommand.DisposeOf;
  FVerificaCPFClienteNaBaseCommand.DisposeOf;
  FGetDataAtualCommand.DisposeOf;
  FGetDataAtualISO8601Command.DisposeOf;
  FGetDataAtualEpochCommand.DisposeOf;
  FGetDataAtualDelphiCommand.DisposeOf;
  FGetDataAtualNaoUsarCommand.DisposeOf;
  inherited;
end;

procedure TsmThreadsClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FConnection.CreateCommand;
    FDSServerModuleCreateCommand.RequestType := 'POST';
    FDSServerModuleCreateCommand.Text := 'TsmThreads."DSServerModuleCreate"';
    FDSServerModuleCreateCommand.Prepare(TsmThreads_DSServerModuleCreate);
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.Execute;
end;

procedure TsmThreadsClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FConnection.CreateCommand;
    FDSServerModuleDestroyCommand.RequestType := 'POST';
    FDSServerModuleDestroyCommand.Text := 'TsmThreads."DSServerModuleDestroy"';
    FDSServerModuleDestroyCommand.Prepare(TsmThreads_DSServerModuleDestroy);
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleDestroyCommand.Execute;
end;

function TsmThreadsClient.GetThread(const ARequestFilter: string): string;
begin
  if FGetThreadCommand = nil then
  begin
    FGetThreadCommand := FConnection.CreateCommand;
    FGetThreadCommand.RequestType := 'GET';
    FGetThreadCommand.Text := 'TsmThreads.GetThread';
    FGetThreadCommand.Prepare(TsmThreads_GetThread);
  end;
  FGetThreadCommand.Execute(ARequestFilter);
  Result := FGetThreadCommand.Parameters[0].Value.GetWideString;
end;

function TsmThreadsClient.GetThread2(const ARequestFilter: string): string;
begin
  if FGetThread2Command = nil then
  begin
    FGetThread2Command := FConnection.CreateCommand;
    FGetThread2Command.RequestType := 'GET';
    FGetThread2Command.Text := 'TsmThreads.GetThread2';
    FGetThread2Command.Prepare(TsmThreads_GetThread2);
  end;
  FGetThread2Command.Execute(ARequestFilter);
  Result := FGetThread2Command.Parameters[0].Value.GetWideString;
end;

function TsmThreadsClient.GetThread3(const ARequestFilter: string): string;
begin
  if FGetThread3Command = nil then
  begin
    FGetThread3Command := FConnection.CreateCommand;
    FGetThread3Command.RequestType := 'GET';
    FGetThread3Command.Text := 'TsmThreads.GetThread3';
    FGetThread3Command.Prepare(TsmThreads_GetThread3);
  end;
  FGetThread3Command.Execute(ARequestFilter);
  Result := FGetThread3Command.Parameters[0].Value.GetWideString;
end;

function TsmThreadsClient.GetLista(const ARequestFilter: string): string;
begin
  if FGetListaCommand = nil then
  begin
    FGetListaCommand := FConnection.CreateCommand;
    FGetListaCommand.RequestType := 'GET';
    FGetListaCommand.Text := 'TsmThreads.GetLista';
    FGetListaCommand.Prepare(TsmThreads_GetLista);
  end;
  FGetListaCommand.Execute(ARequestFilter);
  Result := FGetListaCommand.Parameters[0].Value.GetWideString;
end;

function TsmThreadsClient.GetListaComErro(const ARequestFilter: string): string;
begin
  if FGetListaComErroCommand = nil then
  begin
    FGetListaComErroCommand := FConnection.CreateCommand;
    FGetListaComErroCommand.RequestType := 'GET';
    FGetListaComErroCommand.Text := 'TsmThreads.GetListaComErro';
    FGetListaComErroCommand.Prepare(TsmThreads_GetListaComErro);
  end;
  FGetListaComErroCommand.Execute(ARequestFilter);
  Result := FGetListaComErroCommand.Parameters[0].Value.GetWideString;
end;

function TsmThreadsClient.ValidaCPFThread(const ARequestFilter: string): string;
begin
  if FValidaCPFThreadCommand = nil then
  begin
    FValidaCPFThreadCommand := FConnection.CreateCommand;
    FValidaCPFThreadCommand.RequestType := 'GET';
    FValidaCPFThreadCommand.Text := 'TsmThreads.ValidaCPFThread';
    FValidaCPFThreadCommand.Prepare(TsmThreads_ValidaCPFThread);
  end;
  FValidaCPFThreadCommand.Execute(ARequestFilter);
  Result := FValidaCPFThreadCommand.Parameters[0].Value.GetWideString;
end;

function TsmThreadsClient.GetQtdValidacao(const ARequestFilter: string): string;
begin
  if FGetQtdValidacaoCommand = nil then
  begin
    FGetQtdValidacaoCommand := FConnection.CreateCommand;
    FGetQtdValidacaoCommand.RequestType := 'GET';
    FGetQtdValidacaoCommand.Text := 'TsmThreads.GetQtdValidacao';
    FGetQtdValidacaoCommand.Prepare(TsmThreads_GetQtdValidacao);
  end;
  FGetQtdValidacaoCommand.Execute(ARequestFilter);
  Result := FGetQtdValidacaoCommand.Parameters[0].Value.GetWideString;
end;

constructor TsmThreadsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmThreadsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmThreadsClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FDSServerModuleDestroyCommand.DisposeOf;
  FGetThreadCommand.DisposeOf;
  FGetThread2Command.DisposeOf;
  FGetThread3Command.DisposeOf;
  FGetListaCommand.DisposeOf;
  FGetListaComErroCommand.DisposeOf;
  FValidaCPFThreadCommand.DisposeOf;
  FGetQtdValidacaoCommand.DisposeOf;
  inherited;
end;

function TsmArquivosClient.GetArquivo(nomeArquivo: string; out size: Int64; const ARequestFilter: string): TStream;
begin
  if FGetArquivoCommand = nil then
  begin
    FGetArquivoCommand := FConnection.CreateCommand;
    FGetArquivoCommand.RequestType := 'GET';
    FGetArquivoCommand.Text := 'TsmArquivos.GetArquivo';
    FGetArquivoCommand.Prepare(TsmArquivos_GetArquivo);
  end;
  FGetArquivoCommand.Parameters[0].Value.SetWideString(nomeArquivo);
  FGetArquivoCommand.Execute(ARequestFilter);
  size := FGetArquivoCommand.Parameters[1].Value.GetInt64;
  Result := FGetArquivoCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;

function TsmArquivosClient.GetArquivo_Cache(nomeArquivo: string; out size: Int64; const ARequestFilter: string): IDSRestCachedStream;
begin
  if FGetArquivoCommand_Cache = nil then
  begin
    FGetArquivoCommand_Cache := FConnection.CreateCommand;
    FGetArquivoCommand_Cache.RequestType := 'GET';
    FGetArquivoCommand_Cache.Text := 'TsmArquivos.GetArquivo';
    FGetArquivoCommand_Cache.Prepare(TsmArquivos_GetArquivo_Cache);
  end;
  FGetArquivoCommand_Cache.Parameters[0].Value.SetWideString(nomeArquivo);
  FGetArquivoCommand_Cache.ExecuteCache(ARequestFilter);
  size := FGetArquivoCommand_Cache.Parameters[1].Value.GetInt64;
  Result := TDSRestCachedStream.Create(FGetArquivoCommand_Cache.Parameters[2].Value.GetString);
end;

function TsmArquivosClient.SetFile(nomeArquivo: string; arq: TStream; const ARequestFilter: string): Int64;
begin
  if FSetFileCommand = nil then
  begin
    FSetFileCommand := FConnection.CreateCommand;
    FSetFileCommand.RequestType := 'POST';
    FSetFileCommand.Text := 'TsmArquivos."SetFile"';
    FSetFileCommand.Prepare(TsmArquivos_SetFile);
  end;
  FSetFileCommand.Parameters[0].Value.SetWideString(nomeArquivo);
  FSetFileCommand.Parameters[1].Value.SetStream(arq, FInstanceOwner);
  FSetFileCommand.Execute(ARequestFilter);
  Result := FSetFileCommand.Parameters[2].Value.GetInt64;
end;

function TsmArquivosClient.GetAtualizaArquivo(nomeArquivo: string; hashClient: string; const ARequestFilter: string): Boolean;
begin
  if FGetAtualizaArquivoCommand = nil then
  begin
    FGetAtualizaArquivoCommand := FConnection.CreateCommand;
    FGetAtualizaArquivoCommand.RequestType := 'GET';
    FGetAtualizaArquivoCommand.Text := 'TsmArquivos.GetAtualizaArquivo';
    FGetAtualizaArquivoCommand.Prepare(TsmArquivos_GetAtualizaArquivo);
  end;
  FGetAtualizaArquivoCommand.Parameters[0].Value.SetWideString(nomeArquivo);
  FGetAtualizaArquivoCommand.Parameters[1].Value.SetWideString(hashClient);
  FGetAtualizaArquivoCommand.Execute(ARequestFilter);
  Result := FGetAtualizaArquivoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmArquivosClient.GetArquivoGenerico(nomeArquivo: string);
begin
  if FGetArquivoGenericoCommand = nil then
  begin
    FGetArquivoGenericoCommand := FConnection.CreateCommand;
    FGetArquivoGenericoCommand.RequestType := 'GET';
    FGetArquivoGenericoCommand.Text := 'TsmArquivos.GetArquivoGenerico';
    FGetArquivoGenericoCommand.Prepare(TsmArquivos_GetArquivoGenerico);
  end;
  FGetArquivoGenericoCommand.Parameters[0].Value.SetWideString(nomeArquivo);
  FGetArquivoGenericoCommand.Execute;
end;

constructor TsmArquivosClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmArquivosClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmArquivosClient.Destroy;
begin
  FGetArquivoCommand.DisposeOf;
  FGetArquivoCommand_Cache.DisposeOf;
  FSetFileCommand.DisposeOf;
  FGetAtualizaArquivoCommand.DisposeOf;
  FGetArquivoGenericoCommand.DisposeOf;
  inherited;
end;

procedure TsmBlockChainClient.GetCotacaoGeral(block: string);
begin
  if FGetCotacaoGeralCommand = nil then
  begin
    FGetCotacaoGeralCommand := FConnection.CreateCommand;
    FGetCotacaoGeralCommand.RequestType := 'GET';
    FGetCotacaoGeralCommand.Text := 'TsmBlockChain.GetCotacaoGeral';
    FGetCotacaoGeralCommand.Prepare(TsmBlockChain_GetCotacaoGeral);
  end;
  FGetCotacaoGeralCommand.Parameters[0].Value.SetWideString(block);
  FGetCotacaoGeralCommand.Execute;
end;

function TsmBlockChainClient.GetBlockChain(block: string; const ARequestFilter: string): TBlockChain;
begin
  if FGetBlockChainCommand = nil then
  begin
    FGetBlockChainCommand := FConnection.CreateCommand;
    FGetBlockChainCommand.RequestType := 'GET';
    FGetBlockChainCommand.Text := 'TsmBlockChain.GetBlockChain';
    FGetBlockChainCommand.Prepare(TsmBlockChain_GetBlockChain);
  end;
  FGetBlockChainCommand.Parameters[0].Value.SetWideString(block);
  FGetBlockChainCommand.Execute(ARequestFilter);
  if not FGetBlockChainCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetBlockChainCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TBlockChain(FUnMarshal.UnMarshal(FGetBlockChainCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetBlockChainCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmBlockChainClient.GetBlockChain_Cache(block: string; const ARequestFilter: string): IDSRestCachedTBlockChain;
begin
  if FGetBlockChainCommand_Cache = nil then
  begin
    FGetBlockChainCommand_Cache := FConnection.CreateCommand;
    FGetBlockChainCommand_Cache.RequestType := 'GET';
    FGetBlockChainCommand_Cache.Text := 'TsmBlockChain.GetBlockChain';
    FGetBlockChainCommand_Cache.Prepare(TsmBlockChain_GetBlockChain_Cache);
  end;
  FGetBlockChainCommand_Cache.Parameters[0].Value.SetWideString(block);
  FGetBlockChainCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTBlockChain.Create(FGetBlockChainCommand_Cache.Parameters[1].Value.GetString);
end;

function TsmBlockChainClient.GetBlockIntern(block: string; const ARequestFilter: string): TBlockIntern;
begin
  if FGetBlockInternCommand = nil then
  begin
    FGetBlockInternCommand := FConnection.CreateCommand;
    FGetBlockInternCommand.RequestType := 'GET';
    FGetBlockInternCommand.Text := 'TsmBlockChain.GetBlockIntern';
    FGetBlockInternCommand.Prepare(TsmBlockChain_GetBlockIntern);
  end;
  FGetBlockInternCommand.Parameters[0].Value.SetWideString(block);
  FGetBlockInternCommand.Execute(ARequestFilter);
  if not FGetBlockInternCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetBlockInternCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TBlockIntern(FUnMarshal.UnMarshal(FGetBlockInternCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetBlockInternCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmBlockChainClient.GetBlockIntern_Cache(block: string; const ARequestFilter: string): IDSRestCachedTBlockIntern;
begin
  if FGetBlockInternCommand_Cache = nil then
  begin
    FGetBlockInternCommand_Cache := FConnection.CreateCommand;
    FGetBlockInternCommand_Cache.RequestType := 'GET';
    FGetBlockInternCommand_Cache.Text := 'TsmBlockChain.GetBlockIntern';
    FGetBlockInternCommand_Cache.Prepare(TsmBlockChain_GetBlockIntern_Cache);
  end;
  FGetBlockInternCommand_Cache.Parameters[0].Value.SetWideString(block);
  FGetBlockInternCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTBlockIntern.Create(FGetBlockInternCommand_Cache.Parameters[1].Value.GetString);
end;

function TsmBlockChainClient.GetListBlock(block: string; const ARequestFilter: string): TListaBlock;
begin
  if FGetListBlockCommand = nil then
  begin
    FGetListBlockCommand := FConnection.CreateCommand;
    FGetListBlockCommand.RequestType := 'GET';
    FGetListBlockCommand.Text := 'TsmBlockChain.GetListBlock';
    FGetListBlockCommand.Prepare(TsmBlockChain_GetListBlock);
  end;
  FGetListBlockCommand.Parameters[0].Value.SetWideString(block);
  FGetListBlockCommand.Execute(ARequestFilter);
  if not FGetListBlockCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListBlockCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TListaBlock(FUnMarshal.UnMarshal(FGetListBlockCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListBlockCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmBlockChainClient.GetListBlock_Cache(block: string; const ARequestFilter: string): IDSRestCachedTListaBlock;
begin
  if FGetListBlockCommand_Cache = nil then
  begin
    FGetListBlockCommand_Cache := FConnection.CreateCommand;
    FGetListBlockCommand_Cache.RequestType := 'GET';
    FGetListBlockCommand_Cache.Text := 'TsmBlockChain.GetListBlock';
    FGetListBlockCommand_Cache.Prepare(TsmBlockChain_GetListBlock_Cache);
  end;
  FGetListBlockCommand_Cache.Parameters[0].Value.SetWideString(block);
  FGetListBlockCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTListaBlock.Create(FGetListBlockCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TsmBlockChainClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmBlockChainClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmBlockChainClient.Destroy;
begin
  FGetCotacaoGeralCommand.DisposeOf;
  FGetBlockChainCommand.DisposeOf;
  FGetBlockChainCommand_Cache.DisposeOf;
  FGetBlockInternCommand.DisposeOf;
  FGetBlockInternCommand_Cache.DisposeOf;
  FGetListBlockCommand.DisposeOf;
  FGetListBlockCommand_Cache.DisposeOf;
  inherited;
end;

end.

