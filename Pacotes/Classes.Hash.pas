unit Classes.Hash;

interface

uses
  System.SysUtils, System.Hash;

type
  TMyHash = class
    class function GeraHash(texto: string): string;
  end;

  function GerarHash(texto: string): string;

implementation

function GerarHash(texto: string): string;
begin
  Result := THashSHA2.GetHashString(texto);
end;

{ TMyHash }

class function TMyHash.GeraHash(texto: string): string;
begin
  Result := GerarHash(texto);
end;

end.
