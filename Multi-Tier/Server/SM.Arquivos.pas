unit SM.Arquivos;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, System.Generics.Collections, System.SyncObjs,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, Classes.Tipos, Data.DBXPlatform,
  System.NetEncoding;

type
  TsmArquivos = class(TDSServerModule)
  private
    class var
      FCache: TDictionary<string, string>;
      FCriticaSec: TCriticalSection;
    class procedure AddArquivoCache(nomeArq, conteudo: string);
  public
    function GetArquivo(nomeArquivo: string; out size: Int64): TStream;
    function SetFile(nomeArquivo: string; arq: TStream): Int64;

    function GetAtualizaArquivo(nomeArquivo: string; hashClient: string): Boolean;

    procedure GetArquivoGenerico(nomeArquivo: string);


    class constructor Create;
    class destructor Destroy;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmArquivos }

class procedure TsmArquivos.AddArquivoCache(nomeArq, conteudo: string);
begin
  FCriticaSec.Enter;
  try
    if conteudo = '' then
    begin
      if FCache.ContainsKey(nomeArq) then
      begin
        FCache.Remove(nomeArq);
      end;
    end else begin
      if not FCache.ContainsKey(nomeArq) then
      begin
        FCache.Add(nomeArq, conteudo);
      end;
    end;
  finally
    FCriticaSec.Leave;
  end;
end;

class constructor TsmArquivos.Create;
begin
  FCache := TDictionary<string, string>.Create;
  FCriticaSec := TCriticalSection.Create;
end;

class destructor TsmArquivos.Destroy;
begin
  FCache.Free;
  FCriticaSec.Free;
end;

function TsmArquivos.GetArquivo(nomeArquivo: string; out size: Int64): TStream;
begin
  Result := nil;

  if FCache.ContainsKey(nomeArquivo) then
  begin
    Result := TStringStream.Create(FCache[nomeArquivo]);
    size := Result.Size;
  end else begin
    if nomeArquivo = LOGO_CLIENTE then
    begin
      var stm: TStringStream := TStringStream.Create;
      stm.LoadFromFile('logo-Aqua.bmp'); // 'logo-Aqua.png');

      AddArquivoCache(nomeArquivo, stm.DataString);

      size := stm.Size;
      Result := stm;
    end;

    if nomeArquivo = EXE_SERVER then
    begin
      var stm: TStringStream := TStringStream.Create;
      stm.LoadFromFile('server.zip');

      AddArquivoCache(nomeArquivo, stm.DataString);

      size := stm.Size;
      Result := stm;
    end;
  end;
end;

procedure TsmArquivos.GetArquivoGenerico(nomeArquivo: string);
begin
  if nomeArquivo = LOGO_CLIENTE then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromFile('logo-Aqua.bmp');
    GetInvocationMetadata.ResponseContentType := 'image/bmp';
    GetInvocationMetadata.ResponseContent := stm.DataString;
    stm.Free;
  end;

  if nomeArquivo = EXE_SERVER then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromFile('server.zip');
    GetInvocationMetadata.ResponseContentType := 'application/zip';
    GetInvocationMetadata.ResponseContent := stm.DataString;
    stm.Free;
  end;

  if nomeArquivo = EXE_SERVER_BASE64 then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromFile('server.zip');
    GetInvocationMetadata.ResponseContentType := 'application/json';
    GetInvocationMetadata.ResponseContent := TNetEncoding.Base64String.Encode(stm.DataString);
    stm.Free;
  end;
end;

function TsmArquivos.GetAtualizaArquivo(nomeArquivo,
  hashClient: string): Boolean;
begin
  if nomeArquivo = EXE_SERVER then
  begin
    var hashServer: string := THashArquivo.GetFileHash('server.zip');
    Result := CompareStr(hashServer, hashClient) <> 0;

//    if CompareStr(hashServer, hashClient) = 0 then
//    begin
//      // iguais
//    end else begin
//      // difs
//    end;
  end;
end;

function TsmArquivos.SetFile(nomeArquivo: string; arq: TStream): Int64;
begin
  Result := 0;

  if nomeArquivo = LOGO_NOVO then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromStream(arq); // upload
    Result := stm.Size;

    if Result > 0 then
    begin
      stm.SaveToFile('logo_' + IntToStr(TThread.GetTickCount64) + '.png');
      AddArquivoCache(LOGO_NOVO, stm.DataString);
    end;

    stm.Free;
  end;
end;

end.

