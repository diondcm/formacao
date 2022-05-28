unit Data.Validacao.Client;

interface

uses
  System.SysUtils, System.Classes, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Classes.Tipos;

type
  TdmdValidacaoClient = class(TDataModule)
    IdHTTP: TIdHTTP;
  private
    { Private declarations }
  public
    { Public declarations }

    function ValidaCPF(cpf: string): string;
  end;

var
  dmdValidacaoClient: TdmdValidacaoClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdValidacaoClient }

function TdmdValidacaoClient.ValidaCPF(cpf: string): string;
begin
  var stm: TStringStream := TStringStream.Create;
  IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmGeral/ValidaCPF/' + cpf, stm);
  Result := stm.DataString;
  if Result = RETORNO_OK then
  begin
    stm.Clear;
    IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmGeral/VerificaCPFClienteNaBase/' + cpf, stm);
    Result := stm.DataString;
  end;

  stm.Free;
end;

end.
