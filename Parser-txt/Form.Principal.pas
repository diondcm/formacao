unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classes.Acao, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.Types;

type
  TfrmPrincipal = class(TForm)
    PanelControles: TPanel;
    ButtonCarregar: TButton;
    MemoLog: TMemo;
    procedure ButtonCarregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonCarregarClick(Sender: TObject);
//const
//  LINHA_TESTE = '012018010202PETR4       010PETROBRAS   PN           R$  000000000161900000000016550000000001619000000000164200000000016550000000001653000000000165540660000000000033461800000000054962814900000000000000009999123100000010000000000000BR' +
//    'PETRACNPR6186';
begin
  ButtonCarregar.Enabled := False;
  try
    var lstAcao: TListaAcoes := TListaAcoes.Create;

    lstAcao.CarregaArquivo('C:\Desenv\Aqua\Exemplo-Formacao\Parser-txt\Win32\Debug\cotacao.txt');
//    lstAcao.CarregaArquivo('C:\Desenv\Aqua\Exemplo-Formacao\Parser-txt\Win32\Debug\COTAHIST_A2021.TXT');

//    lstAcao.Infos := '';

    MemoLog.Text := lstAcao.Infos;
    MemoLog.Lines.Add('');
    MemoLog.Lines.Add(lstAcao.Erros);

    lstAcao.Free;
  finally
    ButtonCarregar.Enabled := True;
  end;
end;

end.
