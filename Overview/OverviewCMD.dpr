program OverviewCMD;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classes.Hash in 'Classes.Hash.pas';

var
  texto: string;
begin
  try
    Writeln('Informe o texto: ');
    Readln(texto);
    Writeln('');
    Writeln('Hash');
    Writeln(TGeradorHash.GeraHash(texto));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
