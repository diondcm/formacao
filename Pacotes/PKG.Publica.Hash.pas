unit PKG.Publica.Hash;

interface

uses FireDAC.Comp.Client, Classes.Hash, Form.Visualiza.Hash, Form.Visualiza.Dados;

//  function pkgGeraHash(texto: string): string;
  function pkgGeraHash(texto: PChar): PChar;

  procedure ExibeFormHash;

  procedure ExibeDados(conn: TFDConnection);

exports
  pkgGeraHash name 'pkgGeraHash',
  ExibeFormHash,
  ExibeDados name 'ExibeDados';

implementation

procedure ExibeDados(conn: TFDConnection);
begin
  TfrmVisualizaDados.ExibeDados(conn);
end;

function pkgGeraHash(texto: PChar): PChar;
begin
  Result := PChar(GerarHash(string(texto)));
end;

procedure ExibeFormHash;
begin
  TfrmVisualizaHash.ExibeHashModal;
end;

end.
