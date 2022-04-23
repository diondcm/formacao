unit Classes.Mensagem;

interface


type
  TMensagem = class
//  public = default
    class procedure Aviso(pTexto: string; pSairDaRotina: Boolean = False);
    class procedure Erro(pTexto: string);
    class procedure Informacao(pTexto: string);
    class function Confirmacao(pTexto: string): Boolean;
  end;

implementation

uses Winapi.Messages, Winapi.Windows, VCL.Forms, System.SysUtils;

{ TMensagem }

class procedure TMensagem.Aviso(pTexto: string; pSairDaRotina: Boolean);
begin
  Application.MessageBox(PChar(pTexto), 'Atenção', MB_OK + MB_ICONEXCLAMATION);

  if pSairDaRotina then
    Abort;
end;

class function TMensagem.Confirmacao(pTexto: string): Boolean;
begin
  Result := Application.MessageBox(PChar(pTexto), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES;
end;

class procedure TMensagem.Erro(pTexto: string);
begin
  // Ativar por parâmetro
  // Tirar print screen
  // Enviar por email(via Thread para suporte)

  Application.MessageBox(PChar(pTexto), 'Atenção', MB_OK + MB_ICONERROR);
end;

class procedure TMensagem.Informacao(pTexto: string);
begin
  Application.MessageBox(PChar(pTexto), 'Atenção', MB_OK + MB_ICONINFORMATION);
end;

end.
