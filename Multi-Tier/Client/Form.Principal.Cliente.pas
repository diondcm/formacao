unit Form.Principal.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Data.Validacao.Client, System.DateUtils, Data.Geral.Client;

type
  TfrmPrincipalCliente = class(TForm)
    PageControl: TPageControl;
    TabValidacao: TTabSheet;
    PanelCliente: TPanel;
    Label1: TLabel;
    EditCPF: TEdit;
    ButtonValidaCPF: TButton;
    LabelResultado: TLabel;
    StatusBar: TStatusBar;
    TimerStatusServer: TTimer;
    CheckBoxAtivaTimer: TCheckBox;
    PanelRequest: TPanel;
    MemoLog: TMemo;
    EditQtdThreads: TEdit;
    ButtonChamaThreads: TButton;
    procedure ButtonValidaCPFClick(Sender: TObject);
    procedure EditCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerStatusServerTimer(Sender: TObject);
    procedure CheckBoxAtivaTimerClick(Sender: TObject);
    procedure ButtonChamaThreadsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalCliente: TfrmPrincipalCliente;

implementation

{$R *.dfm}

procedure TfrmPrincipalCliente.ButtonChamaThreadsClick(Sender: TObject);
begin
  var qtd: Integer := StrToIntDef(EditQtdThreads.Text, 1);

  var dtInicio: TDateTime := IncSecond(Now, 2);

  for var i: Integer := 0 to qtd -1 do
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        try
        var IdHTTP: TIdHTTP := TIdHTTP.Create(nil);
        var stm: TStringStream := TStringStream.Create;
        try
          Sleep(MilliSecondsBetween(Now, dtInicio));

          IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmThreads/ValidaCPFThread', stm);
//          IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmThreads/GetThread3', stm);

          var retorno: string := stm.DataString;
          TThread.Synchronize(nil,
            procedure
            begin
              MemoLog.Lines.Add(retorno);
            end);

        finally
          IdHTTP.Free;
          stm.Free;
        end;
        except
          // silencia threads
        end;
      end).Start;
  end;
end;

procedure TfrmPrincipalCliente.ButtonValidaCPFClick(Sender: TObject);
begin
  LabelResultado.Caption := dmdValidacaoClient.ValidaCPF(EditCPF.Text);
end;

procedure TfrmPrincipalCliente.CheckBoxAtivaTimerClick(Sender: TObject);
begin
  TimerStatusServer.Enabled := CheckBoxAtivaTimer.Checked;
end;

procedure TfrmPrincipalCliente.EditCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonValidaCPF.Click;
  end;
end;

procedure TfrmPrincipalCliente.TimerStatusServerTimer(Sender: TObject);
begin
  // hora e versao do server
  StatusBar.Panels[0].Text := dmdGeralClient.GetDataAtual;
end;

end.
