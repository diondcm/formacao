unit Data.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TdmdConexao = class(TDataModule)
    FDConnection: TFDConnection;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdConexao: TdmdConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdConexao.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
   'CREATE TABLE IF NOT EXISTS PESSOA  (' +
   'ID              INTEGER      PRIMARY KEY AUTOINCREMENT,' +
   'NOME            STRING (200),' +
   'CPF             STRING (11),' +
   'DATA_NASCIMENTO DATETIME,' +
   'SALDO           DOUBLE       DEFAULT (0),' +
   'DATA_CADASTRO   DATETIME     DEFAULT (CURRENT_TIMESTAMP)' +
   ')');
end;

procedure TdmdConexao.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Database := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'dados.db';
end;

end.
