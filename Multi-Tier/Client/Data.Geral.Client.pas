unit Data.Geral.Client;

interface

uses
  System.SysUtils, System.Classes, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.JSON,  REST.Json, Classes.Tipos;

type
// {"result":"28/05/2022 11:38:47"}
  TResultado = class
  private
    Fresult: TArray<string>;
  public
    property result: TArray<string> read Fresult write Fresult;
  end;

  TdmdGeralClient = class(TDataModule)
    IdHTTP: TIdHTTP;
  private
    { Private declarations }
  public
    function GetDataAtual: string;
  end;

var
  dmdGeralClient: TdmdGeralClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdGeralClient }

function TdmdGeralClient.GetDataAtual: string;
begin
  var stm: TStringStream := TStringStream.Create;
  try
    IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmGeral/GetDataAtual', stm);

//    var res: TResultado := TJson.JsonToObject<TResultado>(stm.DataString);

//    if Length(res.result) > 0 then
//    begin
//      Result := FormatDateTime('ddd, dd/MM "de" yyyy, hh:mm', StrToDateTime(res.result[0]));
//    end;

    var res: TDataRetorno := TJson.JsonToObject<TDataRetorno>(stm.DataString);
    Result := FormatDateTime('ddd, dd/MM "de" yyyy, hh:mm', res.Data);

    res.Free;
  finally
    stm.Free;
  end;
end;

end.
