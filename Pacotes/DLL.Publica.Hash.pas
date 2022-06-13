unit DLL.Publica.Hash;

interface

uses
  System.SysUtils, Classes.Hash, Form.Visualiza.Hash;

  function DLLGeraHash(texto: PChar): PChar; stdcall;

  procedure ExibeFormHash;

  function GetTodayHash: PChar; stdcall;

var
  todayHash: string = '';

exports
  DLLGeraHash, // name 'name 'DLLGeraHash2'
  ExibeFormHash,
  GetTodayHash;

implementation

function GetTodayHash: PChar;
begin
  if todayHash = '' then
  begin
    todayHash := GerarHash(TimeToStr(Now));
  end;

  Result := PChar(todayHash);
end;

function DLLGeraHash(texto: PChar): PChar;
begin
  Result := PCHar(GerarHash(string(texto)));
end;

procedure ExibeFormHash;
begin
  TfrmVisualizaHash.ExibeHashModal;
end;

end.
