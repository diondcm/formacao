unit Classes.Resposta;

interface

type
  TResposta = class
  private
    FSucesso: Boolean;
    FRegistrosAfetados: Integer;
    FErro: string;
    FMsg: string;
  public
    property Sucesso: Boolean read FSucesso write FSucesso;
    property RegistrosAfetados: Integer read FRegistrosAfetados write FRegistrosAfetados;
    property Erro: string read FErro write FErro;
    property Msg: string read FMsg write FMsg;
  end;

implementation

end.
