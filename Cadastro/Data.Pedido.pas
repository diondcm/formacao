unit Data.Pedido;

interface

uses
  System.SysUtils, System.Classes, Data.Base, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Connection;

type
  TdmdPedido = class(TdmdBase)
    qryDadosIDPEDIDO: TFDAutoIncField;
    qryDadosIDCLIENTE: TIntegerField;
    qryDadosDATA_CADASTRO: TDateTimeField;
    qryDadosVALOR_TOTAL: TFloatField;
    qryDadosQTD_ITENS: TFloatField;
    qryDadosCODIGO: TIntegerField;
    qryItens: TFDQuery;
    qryItensIDITEM: TFDAutoIncField;
    qryItensIDPEDIDO: TIntegerField;
    qryItensIDPRODUTO: TIntegerField;
    qryItensQTD: TFloatField;
    qryItensVALOR_UNITARIO: TFloatField;
    qryItensVALOR_TOTAL: TFloatField;
    qryCliente: TFDQuery;
    qryDadosNOME: TStringField;
    qryProduto: TFDQuery;
    qryItensDESCRICAO: TWideStringField;
    qryItensDATA_ENTREGA: TDateTimeField;
    qryDadosCALC_VALOR_MEDIO_ITEM: TCurrencyField;
    qryDadosTOTAL_GERAL: TAggregateField;
    dtsDados: TDataSource;
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure qryItensAfterInsert(DataSet: TDataSet);
    procedure qryItensAfterEdit(DataSet: TDataSet);
    procedure qryDadosAfterOpen(DataSet: TDataSet);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure qryDadosAfterScroll(DataSet: TDataSet);
    procedure qryDadosCalcFields(DataSet: TDataSet);
  private
    procedure AtualizaClientes;
    procedure AtualizaProdutos;
  public
    FQtdAfteScroll: Integer;
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdPedido.AtualizaClientes;
begin
  qryCliente.Close;
  qryCliente.Open;
end;

procedure TdmdPedido.AtualizaProdutos;
begin
  qryProduto.Close;
  qryProduto.Open;
end;

procedure TdmdPedido.qryDadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AtualizaClientes;

  qryItens.Close;
  qryItens.Open;
end;

procedure TdmdPedido.qryDadosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Inc(FQtdAfteScroll);
//  qryItens.Close;
//  qryItens.ParamByName('IDPEDIDO').AsInteger := qryDadosIDPEDIDO.AsInteger;
//  qryItens.Open;
//  Sleep(10000); // Simula uma consulta pesada
end;

procedure TdmdPedido.qryDadosCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryDadosCALC_VALOR_MEDIO_ITEM.AsCurrency <= 0 then
  begin
    if qryDadosQTD_ITENS.AsCurrency > 0 then
    begin
      qryDadosCALC_VALOR_MEDIO_ITEM.AsCurrency := qryDadosVALOR_TOTAL.AsCurrency/qryDadosQTD_ITENS.AsCurrency;
    end;
  end;
end;

procedure TdmdPedido.qryItensAfterEdit(DataSet: TDataSet);
begin
  inherited;
  AtualizaProdutos;
end;

procedure TdmdPedido.qryItensAfterInsert(DataSet: TDataSet);
begin
  inherited;
  AtualizaProdutos;
end;

procedure TdmdPedido.qryItensAfterPost(DataSet: TDataSet);
begin
  qryItens.Refresh;
end;

procedure TdmdPedido.qryItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryItensIDPEDIDO.AsInteger := qryDadosIDPEDIDO.AsInteger;
end;

end.
