unit SM.BlockChain;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, System.Generics.Collections,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, REST.Types, System.SyncObjs,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.DBXPlatform,
  Classes.BlockChain, System.JSON, REST.Json, Classes.BlockIntern;

const
  BLOCK_BASE = '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103';
  URL_BASE = 'https://blockchain.info/rawblock/';
  URL_BLOCK_BASE = URL_BASE + BLOCK_BASE;

type
  TsmBlockChain = class(TDSServerModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    class var
      FCache: TDictionary<string, string>;
      FCriticaSec: TCriticalSection;
    class procedure AddCacheBlock(block, conteudo: string);
    function GetCotacaoBlockWS(block: string): string;
    function GetBlock(block: string): string;
  public
    procedure GetCotacaoGeral(block: string);

    function GetBlockChain(block: string): TBlockChain;

    function GetBlockIntern(block: string): TBlockIntern;

    function GetListBlock(block: string): TListaBlock;

    class constructor Create;
    class destructor Destroy;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmBlockChain }

class procedure TsmBlockChain.AddCacheBlock(block, conteudo: string);
begin
  FCriticaSec.Enter;
  try
    if not FCache.ContainsKey(block) then
    begin
      FCache.Add(block, conteudo);
    end;
  finally
    FCriticaSec.Leave;
  end;
end;

class constructor TsmBlockChain.Create;
begin
  FCache := TDictionary<string, string>.Create;
  FCriticaSec := TCriticalSection.Create;
end;

class destructor TsmBlockChain.Destroy;
begin
  FCache.Free;
  FCriticaSec.Free;
end;

function TsmBlockChain.GetBlock(block: string): string;
begin
  if FCache.ContainsKey(block) then
  begin
    Result := FCache[block];
  end else begin
    Result := GetCotacaoBlockWS(block);
  end;
end;

function TsmBlockChain.GetBlockChain(block: string): TBlockChain;
begin
  var jsonStr: string := GetBlock(block);
  Result := TJson.JsonToObject<TBlockChain>(jsonStr);
end;

function TsmBlockChain.GetBlockIntern(block: string): TBlockIntern;
begin
  var blk: TBlockChain := GetBlockChain(block);

  Result := TBlockIntern.Create;
  Result.Hash := blk.Hash;
  Result.Size := blk.Size;
  Result.Weight := blk.Weight;
  Result.Ver := blk.Ver;

  if blk.NextBlock.Count > 0 then
    Result.ProximoBlock := blk.NextBlock.First;

end;

function TsmBlockChain.GetCotacaoBlockWS(block: string): string;
begin
  RESTClient1.BaseURL := URL_BASE + block;
  RESTRequest1.Execute;
  Result := RESTResponse1.Content;

  AddCacheBlock(block, RESTResponse1.Content);
end;

procedure TsmBlockChain.GetCotacaoGeral(block: string);
begin
  if block = '' then
    block := BLOCK_BASE;
  Sleep(15000);

  GetInvocationMetadata.ResponseContentType := 'application/json';
  GetInvocationMetadata.ResponseContent := GetBlock(block);
end;

function TsmBlockChain.GetListBlock(block: string): TListaBlock;
begin
  Result := TListaBlock.Create;
  var bi: TBlockIntern;
  var proxBlock: string := block;

  var count: Integer := 0;
  while count < 3 do
  begin
    var blk: TBlockChain := GetBlockChain(proxBlock);

    bi := TBlockIntern.Create;
    bi.Hash := blk.Hash;
    bi.Size := blk.Size;
    bi.Weight := blk.Weight;
    bi.Ver := blk.Ver;

    if blk.NextBlock.Count > 0 then
    begin
      bi.ProximoBlock := blk.NextBlock.First;
      proxBlock := bi.ProximoBlock;
    end else begin
      proxBlock := block;
    end;

    Result.Add(bi);
    Inc(count);
  end;
end;

end.

