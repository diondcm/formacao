unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, Data.Base, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Connection;

type
  TdmdCliente = class(TdmdBase)
    qryDadosIDCLIENTE: TFDAutoIncField;
    qryDadosCODIGO: TIntegerField;
    qryDadosNOME: TStringField;
    qryDadosDATA_CADASTRO: TSQLTimeStampField;
    qryDadosSALDO_DISPONIVEL: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  dmdCliente: TdmdCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdCliente.DataModuleCreate(Sender: TObject);
{var
  Estado: string;
  Saldo: Currency;}
begin
{ exemplo sql no fonte

  qryDados.SQL.Clear;

//  qryDados.SQL.Text := 'select IDCLIENTE, CODIGO, NOME, DATA_CADASTRO, SALDO_DISPONIVEL from cliente';

  qryDados.SQL.Add('select IDCLIENTE, CODIGO, NOME, DATA_CADASTRO, SALDO_DISPONIVEL');
  qryDados.SQL.Add('from cliente');
  qryDados.SQL.Add('where 1 = 1 ');

  if Estado = 'SP' then
    qryDados.SQL.Add('and estado = ''São Paulo'' ');




  qryDados.SQL.Add('and ((saldo = 0) or (saldo > 200))');



  if Saldo = 0 then
    qryDados.SQL.Add('and saldo = 0');

  if Saldo > 200 then
    qryDados.SQL.Add('and saldo > 200');
}
end;

end.
