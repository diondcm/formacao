unit SM.Geral;

interface

uses System.SysUtils, System.Classes, System.Json, REST.Json, System.DateUtils,
    DataSnap.DSProviderDataModuleAdapter, Data.DBXPlatform,
    Datasnap.DSServer, Datasnap.DSAuth, Data.Validacao, Data.Cliente,
  Classes.Tipos;

type
  TsmGeral = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;


    function ValidaCPF(cpf: string): string;
    function VerificaCPFClienteNaBase(cpf: string): string;


    function GetDataAtual: string;

    function GetDataAtualISO8601: string;

    function GetDataAtualEpoch: string;

    function GetDataAtualDelphi: TDateTime;

    function GetDataAtualNaoUsar: string;

    ///  Validações gerais:
    ///  CPF, CNPJ
    ///
    ///   Configurações
    ///  Moeda: Real Dolar
    ///
    ///
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TsmGeral.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TsmGeral.GetDataAtualNaoUsar: string;
begin
  FormatSettings.ShortDateFormat := 'MM/DD/YYYY';
  Result := DateTimeToStr(Now);
end;

function TsmGeral.GetDataAtual: string;
begin
  var dt: TDataRetorno := TDataRetorno.Create;

  dt.ExemploISO8601 := DateToISO8601(Now);
  dt.ExemploUnix := DateTimeToUnix(Now);
  dt.Data := Now;


  GetInvocationMetadata.ResponseContent := Tjson.ObjectToJsonString(dt, [joIndentCaseLower, joDateFormatISO8601]); // joDateFormatUnix
  GetInvocationMetadata.ResponseContentType := 'application/json';

  dt.Free;
end;

function TsmGeral.GetDataAtualDelphi: TDateTime;
begin
  FormatSettings.ShortDateFormat := 'MM/DD/YYYY';
  Result := Now;
end;

function TsmGeral.GetDataAtualEpoch: string;
begin
  Result := IntToStr(DateTimeToUnix(Date))
end;

function TsmGeral.GetDataAtualISO8601: string;
begin
  FormatSettings.ShortDateFormat := 'MM/DD/YYYY';
  Result := DateToISO8601(Now, False)
end;

function TsmGeral.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TsmGeral.ValidaCPF(cpf: string): string;
begin
//  var dmd: TdmdValidacao := TdmdValidacao.Create(nil);
//  Result := dmd.ValidaCPF2(cpf);
//  dmd.free;

  Sleep(10*1000); // 10 s
  Result := TdmdValidacao.ValidaCPF(cpf);
end;

function TsmGeral.VerificaCPFClienteNaBase(cpf: string): string;
begin
  Sleep(20*1000); // 20 s

  var dmd: TdmdCliente := TdmdCliente.Create(nil);
  Result := dmd.VerificaCPFNaBase(cpf);
  dmd.free;
end;

end.

