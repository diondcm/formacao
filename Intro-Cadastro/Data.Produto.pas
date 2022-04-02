unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle;

type
  TdmdProduto = class(TDataModule)
    qryProduto: TFDQuery;
    FDConnection: TFDConnection;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdProduto: TdmdProduto;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmdProduto.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL('CREATE TABLE IF NOT EXISTS CLIENTES ' +
   ' (ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
   '  NOME STRING(200), ' +
   '  DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');


  FDConnection.ExecSQL('CREATE TABLE IF NOT EXISTS PRODUTOS (' +
                        'ID         INTEGER PRIMARY KEY AUTOINCREMENT,' +
                        'TITULO     STRING (200),' +
                        'PRECO      DECIMAL,' +
                        'DESCRICAO  STRING (500),' +
                        'URL_IMAGEM STRING (300) )');
end;

procedure TdmdProduto.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Database := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ERP-Local.db';
end;

end.
