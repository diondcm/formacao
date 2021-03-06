unit Classes.Tipos;

interface

uses
  System.DateUtils, System.Hash, System.Classes, System.SysUtils;

const
  RETORNO_OK = 'OK'; // ''
  LOGO_CLIENTE = 'LOGO_CLIENTE';
  EXE_SERVER = 'EXE_SERVER';
  EXE_SERVER_BASE64 = EXE_SERVER + '_BASE64';
  LOGO_NOVO = 'LOGO_NOVO';

type
  THashArquivo = class
  public
    class function GetFileHash(nomeArquivo: string): string;
  end;


  TDataRetorno = class
  private
    FExemploISO8601: string;
    FExemploUnix: Int64;
    FData: TDateTime;
    function GetAsUnix: Int64;
    function GetAsISO8601: string;
  public
    property ExemploISO8601: string read FExemploISO8601 write FExemploISO8601;
    property ExemploUnix: Int64 read FExemploUnix write FExemploUnix;

    property Data: TDateTime read FData write FData;
    property AsUnix: Int64 read GetAsUnix;
    property AsISO8601: string read GetAsISO8601;
  end;

implementation

{ TDataRetorno }

function TDataRetorno.GetAsISO8601: string;
begin
  Result := DateToISO8601(FData);
end;

function TDataRetorno.GetAsUnix: Int64;
begin
  Result := DateTimeToUnix(FData);
end;

{ THashArquivo }

class function THashArquivo.GetFileHash(nomeArquivo: string): string;
begin
  var stm: TFileStream := TFileStream.Create(nomeArquivo, fmOpenRead);
  Result := THashSHA1.GetHashString(stm);
  stm.Free;
end;

end.
