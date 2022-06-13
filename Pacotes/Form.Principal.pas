unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Classes.Hash,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

  { DLL }
  function DLLGeraHash(texto: PChar): PChar; stdcall;
  procedure ExibeFormHash;
  function GetTodayHash: PChar; stdcall;

  { PKG }
  function pkgGeraHash(texto: PChar): PChar;

type
  TfrmPrincipal = class(TForm)
    PanelControles: TPanel;
    ButtonGeraHash: TButton;
    MemoLog: TMemo;
    Panel1: TPanel;
    ButtonDLLEstatico: TButton;
    ButtonDLLDinamico: TButton;
    PanelPacote: TPanel;
    ButtonPacoteEstatico: TButton;
    ButtonPacoteDinamico: TButton;
    FDConnection1: TFDConnection;
    procedure ButtonGeraHashClick(Sender: TObject);
    procedure ButtonDLLEstaticoClick(Sender: TObject);
    procedure ButtonDLLDinamicoClick(Sender: TObject);
    procedure ButtonPacoteDinamicoClick(Sender: TObject);
    procedure ButtonPacoteEstaticoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function DLLGeraHash; external 'HashGen.dll' name 'DLLGeraHash'; // delayed; // Win32 somente. Win64 nope!
procedure ExibeFormHash; external 'HashGen.dll' name 'ExibeFormHash'; // delayed;
function GetTodayHash; external 'HashGen.dll' name 'GetTodayHash'; // delayed;

function pkgGeraHash; external 'C:\Users\Public\Documents\Embarcadero\Studio\22.0\Bpl\PkgHashGen.bpl' name 'pkgGeraHash'; // delayed; // Win32 somente. Win64 nope!


procedure TfrmPrincipal.ButtonDLLDinamicoClick(Sender: TObject);
type
  TDLLGeraHashMethod = function(texto: PChar): PChar; stdcall;
  TDLLExibeHashMethod = procedure;
  TDLLTodayHashMethod = function: PChar; stdcall;
begin
  var hdll: HMODULE := LoadLibrary('HashGen.dll');

  if hdll = 0 then
  begin
    raise Exception.Create('Não foi possível carregar a DLL: "HashGen.dll"');
  end;

  try
    var mth: TDLLGeraHashMethod := GetProcAddress(hdll, 'DLLGeraHash');
    MemoLog.Lines.Add('DLL Dinâmico: ' + string(mth(PChar('Teste'))));

    var exibe: TDLLExibeHashMethod := GetProcAddress(hdll, 'ExibeFormHash');
    exibe();

    var today: TDLLTodayHashMethod := GetProcAddress(hdll, 'GetTodayHash');
    MemoLog.Lines.Insert(0, 'Today1: ' + today());
    MemoLog.Lines.Insert(0, 'Today2: ' + today());

  finally
    FreeLibrary(hdll);
  end;
end;

procedure TfrmPrincipal.ButtonDLLEstaticoClick(Sender: TObject);
begin
  MemoLog.Lines.Add('DLL Estático: ' + string(DLLGeraHash(PChar('Teste'))));
  ExibeFormHash;
  MemoLog.Lines.Insert(0, 'Today: ' + GetTodayHash());
end;

procedure TfrmPrincipal.ButtonGeraHashClick(Sender: TObject);
begin
//  MemoLog.Lines.Add(GerarHash('Teste'));
  MemoLog.Lines.Add('Uses Local: ' + TMyHash.GeraHash('Teste'));
end;

procedure TfrmPrincipal.ButtonPacoteDinamicoClick(Sender: TObject);
type
//  TPKGGeraHashMethod = function(texto: string): string;
  TPKGGeraHashMethod = function(texto: PCHar): PChar;
  TPKGExibeHashMethod = procedure;
  TPKGExibeDadosMethod = procedure(conn: TFDConnection);
begin
  var hpkg: HMODULE := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\22.0\Bpl\PkgHashGen.bpl');

  if hpkg = 0 then
  begin
    raise Exception.Create('Não foi possível carregar a Pacote: "PkgHashGen.bpl"');
  end;

  try
    var mth: TPKGGeraHashMethod := GetProcAddress(hpkg, 'pkgGeraHash');
    MemoLog.Lines.Add('Pkg Dinâmico: ' + string(mth('Teste')));

//    var proc: TPKGExibeHashMethod := GetProcAddress(hpkg, 'ExibeFormHash');
//    proc();

    var procDados: TPKGExibeDadosMethod := GetProcAddress(hpkg, 'ExibeDados');
    procDados(FDConnection1);

  finally
    UnloadPackage(hpkg);
  end;
end;

procedure TfrmPrincipal.ButtonPacoteEstaticoClick(Sender: TObject);
begin
  MemoLog.Lines.Add('PKG Estático: ' + string(pkgGeraHash(PChar('Teste'))));
end;

end.
