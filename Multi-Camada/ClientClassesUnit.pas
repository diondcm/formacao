// 
// Created by the DataSnap proxy generator.
// 21/05/2022 15:44:16
// 

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classes.Pessoa, System.Generics.Collections, Data.DBXJSONReflect;

type

  IDSRestCachedTList<TPessoa> = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  TSMPessoaClient = class(TDSAdminRestClient)
  private
    FFDConnectionAfterConnectCommand: TDSRestCommand;
    FFDConnectionBeforeConnectCommand: TDSRestCommand;
    FGetPessoaCommand: TDSRestCommand;
    FPostPessoaCommand: TDSRestCommand;
    FupdatePostPessoaCommand: TDSRestCommand;
    FPutPessoaCommand: TDSRestCommand;
    FacceptPutPessoaCommand: TDSRestCommand;
    FDeletePessoaCommand: TDSRestCommand;
    FcancelDeletePessoaCommand: TDSRestCommand;
    FNativoPostPessoaCommand: TDSRestCommand;
    FNativoGetPessoaCommand: TDSRestCommand;
    FNativoGetPessoaCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure FDConnectionBeforeConnect(Sender: TObject);
    function GetPessoa(params: string; const ARequestFilter: string = ''): string;
    function PostPessoa(strpessoa: string; const ARequestFilter: string = ''): string;
    function updatePostPessoa(strpessoa: string; const ARequestFilter: string = ''): string;
    function PutPessoa(strpessoa: string; const ARequestFilter: string = ''): string;
    function acceptPutPessoa(strpessoa: string; const ARequestFilter: string = ''): string;
    function DeletePessoa(id: Integer; const ARequestFilter: string = ''): string;
    function cancelDeletePessoa(id: Integer; const ARequestFilter: string = ''): string;
    function NativoPostPessoa(pessoa: TPessoa; const ARequestFilter: string = ''): string;
    function NativoGetPessoa(params: string; const ARequestFilter: string = ''): TList<Classes.Pessoa.TPessoa>;
    function NativoGetPessoa_Cache(params: string; const ARequestFilter: string = ''): IDSRestCachedTList<Classes.Pessoa.TPessoa>;
  end;

  IDSRestCachedTList<TPessoa> = interface(IDSRestCachedObject<TList<Classes.Pessoa.TPessoa>>)
  end;

  TDSRestCachedTList<TPessoa> = class(TDSRestCachedObject<TList<Classes.Pessoa.TPessoa>>, IDSRestCachedTList<Classes.Pessoa.TPessoa>, IDSRestCachedCommand)
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_FDConnectionAfterConnect: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSMPessoa_FDConnectionBeforeConnect: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSMPessoa_GetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'params'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_PostPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'strpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_updatePostPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'strpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_PutPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'strpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_acceptPutPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'strpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_DeletePessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'id'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_cancelDeletePessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'id'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_NativoPostPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pessoa'; Direction: 1; DBXType: 37; TypeName: 'TPessoa'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPessoa_NativoGetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'params'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TList<Classes.Pessoa.TPessoa>')
  );

  TSMPessoa_NativoGetPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'params'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

procedure TSMPessoaClient.FDConnectionAfterConnect(Sender: TObject);
begin
  if FFDConnectionAfterConnectCommand = nil then
  begin
    FFDConnectionAfterConnectCommand := FConnection.CreateCommand;
    FFDConnectionAfterConnectCommand.RequestType := 'POST';
    FFDConnectionAfterConnectCommand.Text := 'TSMPessoa."FDConnectionAfterConnect"';
    FFDConnectionAfterConnectCommand.Prepare(TSMPessoa_FDConnectionAfterConnect);
  end;
  if not Assigned(Sender) then
    FFDConnectionAfterConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDConnectionAfterConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnectionAfterConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnectionAfterConnectCommand.Execute;
end;

procedure TSMPessoaClient.FDConnectionBeforeConnect(Sender: TObject);
begin
  if FFDConnectionBeforeConnectCommand = nil then
  begin
    FFDConnectionBeforeConnectCommand := FConnection.CreateCommand;
    FFDConnectionBeforeConnectCommand.RequestType := 'POST';
    FFDConnectionBeforeConnectCommand.Text := 'TSMPessoa."FDConnectionBeforeConnect"';
    FFDConnectionBeforeConnectCommand.Prepare(TSMPessoa_FDConnectionBeforeConnect);
  end;
  if not Assigned(Sender) then
    FFDConnectionBeforeConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDConnectionBeforeConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnectionBeforeConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnectionBeforeConnectCommand.Execute;
end;

function TSMPessoaClient.GetPessoa(params: string; const ARequestFilter: string): string;
begin
  if FGetPessoaCommand = nil then
  begin
    FGetPessoaCommand := FConnection.CreateCommand;
    FGetPessoaCommand.RequestType := 'GET';
    FGetPessoaCommand.Text := 'TSMPessoa.GetPessoa';
    FGetPessoaCommand.Prepare(TSMPessoa_GetPessoa);
  end;
  FGetPessoaCommand.Parameters[0].Value.SetWideString(params);
  FGetPessoaCommand.Execute(ARequestFilter);
  Result := FGetPessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.PostPessoa(strpessoa: string; const ARequestFilter: string): string;
begin
  if FPostPessoaCommand = nil then
  begin
    FPostPessoaCommand := FConnection.CreateCommand;
    FPostPessoaCommand.RequestType := 'GET';
    FPostPessoaCommand.Text := 'TSMPessoa.PostPessoa';
    FPostPessoaCommand.Prepare(TSMPessoa_PostPessoa);
  end;
  FPostPessoaCommand.Parameters[0].Value.SetWideString(strpessoa);
  FPostPessoaCommand.Execute(ARequestFilter);
  Result := FPostPessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.updatePostPessoa(strpessoa: string; const ARequestFilter: string): string;
begin
  if FupdatePostPessoaCommand = nil then
  begin
    FupdatePostPessoaCommand := FConnection.CreateCommand;
    FupdatePostPessoaCommand.RequestType := 'GET';
    FupdatePostPessoaCommand.Text := 'TSMPessoa.updatePostPessoa';
    FupdatePostPessoaCommand.Prepare(TSMPessoa_updatePostPessoa);
  end;
  FupdatePostPessoaCommand.Parameters[0].Value.SetWideString(strpessoa);
  FupdatePostPessoaCommand.Execute(ARequestFilter);
  Result := FupdatePostPessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.PutPessoa(strpessoa: string; const ARequestFilter: string): string;
begin
  if FPutPessoaCommand = nil then
  begin
    FPutPessoaCommand := FConnection.CreateCommand;
    FPutPessoaCommand.RequestType := 'GET';
    FPutPessoaCommand.Text := 'TSMPessoa.PutPessoa';
    FPutPessoaCommand.Prepare(TSMPessoa_PutPessoa);
  end;
  FPutPessoaCommand.Parameters[0].Value.SetWideString(strpessoa);
  FPutPessoaCommand.Execute(ARequestFilter);
  Result := FPutPessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.acceptPutPessoa(strpessoa: string; const ARequestFilter: string): string;
begin
  if FacceptPutPessoaCommand = nil then
  begin
    FacceptPutPessoaCommand := FConnection.CreateCommand;
    FacceptPutPessoaCommand.RequestType := 'GET';
    FacceptPutPessoaCommand.Text := 'TSMPessoa.acceptPutPessoa';
    FacceptPutPessoaCommand.Prepare(TSMPessoa_acceptPutPessoa);
  end;
  FacceptPutPessoaCommand.Parameters[0].Value.SetWideString(strpessoa);
  FacceptPutPessoaCommand.Execute(ARequestFilter);
  Result := FacceptPutPessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.DeletePessoa(id: Integer; const ARequestFilter: string): string;
begin
  if FDeletePessoaCommand = nil then
  begin
    FDeletePessoaCommand := FConnection.CreateCommand;
    FDeletePessoaCommand.RequestType := 'GET';
    FDeletePessoaCommand.Text := 'TSMPessoa.DeletePessoa';
    FDeletePessoaCommand.Prepare(TSMPessoa_DeletePessoa);
  end;
  FDeletePessoaCommand.Parameters[0].Value.SetInt32(id);
  FDeletePessoaCommand.Execute(ARequestFilter);
  Result := FDeletePessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.cancelDeletePessoa(id: Integer; const ARequestFilter: string): string;
begin
  if FcancelDeletePessoaCommand = nil then
  begin
    FcancelDeletePessoaCommand := FConnection.CreateCommand;
    FcancelDeletePessoaCommand.RequestType := 'GET';
    FcancelDeletePessoaCommand.Text := 'TSMPessoa.cancelDeletePessoa';
    FcancelDeletePessoaCommand.Prepare(TSMPessoa_cancelDeletePessoa);
  end;
  FcancelDeletePessoaCommand.Parameters[0].Value.SetInt32(id);
  FcancelDeletePessoaCommand.Execute(ARequestFilter);
  Result := FcancelDeletePessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.NativoPostPessoa(pessoa: TPessoa; const ARequestFilter: string): string;
begin
  if FNativoPostPessoaCommand = nil then
  begin
    FNativoPostPessoaCommand := FConnection.CreateCommand;
    FNativoPostPessoaCommand.RequestType := 'POST';
    FNativoPostPessoaCommand.Text := 'TSMPessoa."NativoPostPessoa"';
    FNativoPostPessoaCommand.Prepare(TSMPessoa_NativoPostPessoa);
  end;
  if not Assigned(pessoa) then
    FNativoPostPessoaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FNativoPostPessoaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FNativoPostPessoaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pessoa), True);
      if FInstanceOwner then
        pessoa.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FNativoPostPessoaCommand.Execute(ARequestFilter);
  Result := FNativoPostPessoaCommand.Parameters[1].Value.GetWideString;
end;

function TSMPessoaClient.NativoGetPessoa(params: string; const ARequestFilter: string): TList<Classes.Pessoa.TPessoa>;
begin
  if FNativoGetPessoaCommand = nil then
  begin
    FNativoGetPessoaCommand := FConnection.CreateCommand;
    FNativoGetPessoaCommand.RequestType := 'GET';
    FNativoGetPessoaCommand.Text := 'TSMPessoa.NativoGetPessoa';
    FNativoGetPessoaCommand.Prepare(TSMPessoa_NativoGetPessoa);
  end;
  FNativoGetPessoaCommand.Parameters[0].Value.SetWideString(params);
  FNativoGetPessoaCommand.Execute(ARequestFilter);
  if not FNativoGetPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FNativoGetPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TList<Classes.Pessoa.TPessoa>(FUnMarshal.UnMarshal(FNativoGetPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FNativoGetPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMPessoaClient.NativoGetPessoa_Cache(params: string; const ARequestFilter: string): IDSRestCachedTList<Classes.Pessoa.TPessoa>;
begin
  if FNativoGetPessoaCommand_Cache = nil then
  begin
    FNativoGetPessoaCommand_Cache := FConnection.CreateCommand;
    FNativoGetPessoaCommand_Cache.RequestType := 'GET';
    FNativoGetPessoaCommand_Cache.Text := 'TSMPessoa.NativoGetPessoa';
    FNativoGetPessoaCommand_Cache.Prepare(TSMPessoa_NativoGetPessoa_Cache);
  end;
  FNativoGetPessoaCommand_Cache.Parameters[0].Value.SetWideString(params);
  FNativoGetPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTList<Classes.Pessoa.TPessoa>.Create(FNativoGetPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TSMPessoaClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMPessoaClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMPessoaClient.Destroy;
begin
  FFDConnectionAfterConnectCommand.DisposeOf;
  FFDConnectionBeforeConnectCommand.DisposeOf;
  FGetPessoaCommand.DisposeOf;
  FPostPessoaCommand.DisposeOf;
  FupdatePostPessoaCommand.DisposeOf;
  FPutPessoaCommand.DisposeOf;
  FacceptPutPessoaCommand.DisposeOf;
  FDeletePessoaCommand.DisposeOf;
  FcancelDeletePessoaCommand.DisposeOf;
  FNativoPostPessoaCommand.DisposeOf;
  FNativoGetPessoaCommand.DisposeOf;
  FNativoGetPessoaCommand_Cache.DisposeOf;
  inherited;
end;

end.
