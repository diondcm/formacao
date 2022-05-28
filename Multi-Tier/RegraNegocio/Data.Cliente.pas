unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Classes.Tipos;

type
  TdmdCliente = class(TDataModule)
    FDConnection: TFDConnection;
    qryValidaCPF: TFDQuery;
  private
    { Private declarations }
  public
    function VerificaCPFNaBase(cpf: string): string;

    class function VerificaCPFNaBase2(cpf: string): string;
  end;

//var
//  dmdCliente: TdmdCliente;

//  function VerificaCPFNaBaseSemClasse(cpf: string): string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//function VerificaCPFNaBaseSemClasse(cpf: string): string;
//begin
//  var conn: TFDConnection := TFDConnection.Create(nil);
//  var qry: TFDQuery := TFDQuery.Create(nil);
//
//  conn.Params.Database := 'C:\Desenv\Aqua\Exemplo-Formacao\Multi-Camada\Win32\Debug\dados.db';
//  qry.Connection := conn;
//
//  qry.SQL.Text := 'select id, nome from pessoa where cpf = :cpf';
//
//  qry.Close;
//  qry.ParamByName('cpf').AsString := cpf;
//  qry.Open;
//
//  if qry.IsEmpty then
//  begin
//    Result := RETORNO_OK;
//  end else begin
//    Result := 'CPF já utilizado para cliente: ' + qry.FieldByName('ID').AsString + ' ' + qry.FieldByName('nome').AsString;
//  end;
//
//  qry.Close;
//
//  qry.Free;
//  conn.Free;
//end;

{ TdmdCliente }

function TdmdCliente.VerificaCPFNaBase(cpf: string): string;
begin
  qryValidaCPF.Close;
  qryValidaCPF.ParamByName('cpf').AsString := cpf;
  qryValidaCPF.Open;

  if qryValidaCPF.IsEmpty then
  begin
    Result := RETORNO_OK;
  end else begin
    Result := 'CPF já utilizado para cliente: ' + qryValidaCPF.FieldByName('ID').AsString + ' ' + qryValidaCPF.FieldByName('nome').AsString;
  end;

  qryValidaCPF.Close;
end;

class function TdmdCliente.VerificaCPFNaBase2(cpf: string): string;
begin
  var conn: TFDConnection := TFDConnection.Create(nil);
  var qry: TFDQuery := TFDQuery.Create(nil);

  conn.Params.Database := 'C:\Desenv\Aqua\Exemplo-Formacao\Multi-Camada\Win32\Debug\dados.db';
  qry.Connection := conn;

  qry.SQL.Text := 'select id, nome from pessoa where cpf = :cpf';

  qry.Close;
  qry.ParamByName('cpf').AsString := cpf;
  qry.Open;

  if qry.IsEmpty then
  begin
    Result := RETORNO_OK;
  end else begin
    Result := 'CPF já utilizado para cliente: ' + qry.FieldByName('ID').AsString + ' ' + qry.FieldByName('nome').AsString;
  end;

  qry.Close;

  qry.Free;
  conn.Free;
end;

end.
