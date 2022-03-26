unit Classes.Hash;

interface

uses
  System.SysUtils, System.Hash;
  // Shift  + Ctrl + A

type
  TGeradorHash = class
    class function GeraHash(pTexto: string): string; // Shift + Ctrl + C
  end;

///    Evitar funções soltas
///    function GeraHash(pTexto: string): string;

implementation

{ TGeradorHash }

class function TGeradorHash.GeraHash(pTexto: string): string;
begin
  Result:= THashSHA1.GetHashString(pTexto);
//  Result:= THashMD5.GetHashString(pTexto);
end;

end.
