unit FormWeb.Hash;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompMemo, IWCompButton, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompText;

type
  TIWFormIntra = class(TIWAppForm)
    IWText1: TIWText;
    IWButton1: TIWButton;
    IWMemoLog: TIWMemo;
    IWEditTexto: TIWEdit;
    procedure IWButton1Click(Sender: TObject);
    procedure IWButton1AsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses Classes.Hash;


procedure TIWFormIntra.IWButton1AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
   IWMemoLog.Lines.Add(TGeradorHash.GeraHash(IWEditTexto.Text));
end;

procedure TIWFormIntra.IWButton1Click(Sender: TObject);
begin
//  IWMemoLog.Lines.Add(TGeradorHash.GeraHash(IWEditTexto.Text));
end;

initialization
  TIWFormIntra.SetAsMainForm;

end.
