unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, System.DateUtils,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle,
  REST.Types, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TdmdProduto = class(TDataModule)
    qryProduto: TFDQuery;
    FDConnection: TFDConnection;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    memWSProduto: TFDMemTable;
    memWSProdutotitle: TStringField;
    memWSProdutoprice: TCurrencyField;
    memWSProdutodescription: TStringField;
    memWSProdutoimage: TStringField;
    qryProdutoID: TFDAutoIncField;
    qryProdutoTITULO: TWideStringField;
    qryProdutoPRECO: TLargeintField;
    qryProdutoDESCRICAO: TWideStringField;
    qryProdutoURL_IMAGEM: TWideStringField;
    qryImagens: TFDQuery;
    qryImagensID_PRODUTO: TIntegerField;
    qryImagensIMAGEM: TBlobField;
    qryImagensQR_CODE: TBlobField;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FUltimaAtualizaçãoñ: TDateTime;
  public
    procedure CarregaProdutos;
  end;

var
  dmdProduto: TdmdProduto;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmdProduto.CarregaProdutos;
begin
  if DayOf(FUltimaAtualizaçãoñ) = DayOf(Now) then
  begin
    Exit;
  end;

//  if not qryProduto.Active then
//  begin
//    qryProduto.Open;
//  end;
  qryProduto.Open; // Open já valida de já está aberta, não precisa o IF
  qryProduto.FetchAll; // traz todos os dados do banco

  if (qryProduto.RecordCount > 5 { Apenas para exemplo, usar constantes ou parâmetros })  then
  begin
    Exit;
  end;

  RESTRequest1.Execute;

  memWSProduto.First;
  while not memWSProduto.Eof do
  begin
    qryProduto.Append; // Insert é mais lento por mover os registros adjacentes
    // TITULO, PRECO, DESCRICAO, URL_IMAGEM
    qryProduto.FieldByName('TITULO').AsString := memWSProdutotitle.AsString;
    qryProduto.FieldByName('PRECO').AsCurrency := memWSProdutoprice.AsCurrency;
    qryProduto.FieldByName('DESCRICAO').AsString := memWSProdutodescription.AsString;
    qryProduto.FieldByName('URL_IMAGEM').AsString := memWSProdutoimage.AsString;
    qryProduto.Post;

    memWSProduto.Next;
  end;

  qryProduto.First;
  memWSProduto.Close;
end;

procedure TdmdProduto.DataModuleCreate(Sender: TObject);
begin
  FUltimaAtualizaçãoñ := IncDay(Now, -1); // Ilustração
end;

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

  FDConnection.ExecSQL('CREATE TABLE IF NOT EXISTS PRODUTO_IMAGEM (' +
                        'ID_PRODUTO  INTEGER PRIMARY KEY,' +
                        'IMAGEM      BLOB,' +
                        'QR_CODE     BLOB)');
end;

procedure TdmdProduto.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Database := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ERP-Local.db';
end;

end.
