unit Form.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Form.Classes,
  Form.Generico, Form.Referencia, Form.Testes, Vcl.ComCtrls, Form.Login,
  Form.Instancia, Form.StackEHeap, Form.Teste.Hash;

type
  TfrmMenu = class(TForm)
    FlowPanel1: TFlowPanel;
    ButtonClasses: TButton;
    ButtonGenerics: TButton;
    ButtonReferencia: TButton;
    ButtonTestes: TButton;
    ButtonInstancia: TButton;
    ButtonStackEHeap: TButton;
    StatusBarContato: TStatusBar;
    TimerLogin: TTimer;
    ButtonHash: TButton;
    procedure ButtonClassesClick(Sender: TObject);
    procedure ButtonGenericsClick(Sender: TObject);
    procedure ButtonReferenciaClick(Sender: TObject);
    procedure ButtonTestesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
    procedure ButtonInstanciaClick(Sender: TObject);
    procedure ButtonStackEHeapClick(Sender: TObject);
    procedure ButtonHashClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreFormModal(pClasse: TFormClass);
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.ButtonGenericsClick(Sender: TObject);
begin
  AbreFormModal(TfrmGenerico);
end;

procedure TfrmMenu.ButtonHashClick(Sender: TObject);
begin
  AbreFormModal(TfrmTesteHash);
end;

procedure TfrmMenu.ButtonTestesClick(Sender: TObject);
begin
  AbreFormModal(TfrmTestes);
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
//  TimerLogin.Enabled := True;
end;

procedure TfrmMenu.TimerLoginTimer(Sender: TObject);
begin
  TimerLogin.Enabled := False;

  Application.CreateForm(TfrmLogin, frmLogin);
  if not (frmLogin.ShowModal = mrOk) then
  begin
    // Evitar usar o Halt
//    try
//      Halt;
//    finally
//      ShowMessage('Será que executa?');
//    end;

//    try
//      Application.Terminate;
//    finally
//      ShowMessage('Será que executa? - Terminate');
//      MessageBox(0, 'Será que executa? - Terminate', 'Teste', MB_OK);
//    end;

//    Application.MainForm.Close;
//    // Nesse caso:
//    frmMenu.Close;
  end;
end;

procedure TfrmMenu.ButtonReferenciaClick(Sender: TObject);
begin
  AbreFormModal(TfrmReferencia);
end;

procedure TfrmMenu.ButtonStackEHeapClick(Sender: TObject);
begin
//  frmStackEHeap.ShowModal;

  AbreFormModal(TfrmStackEHeap);
end;

procedure TfrmMenu.AbreFormModal(pClasse: TFormClass);
begin
  // Valido controle de acesso

  var frm: TForm := pClasse.Create(Application);
  frm.ShowModal;
  frm.Free;
end;

procedure TfrmMenu.ButtonInstanciaClick(Sender: TObject);
begin
  AbreFormModal(TfrmInstancia);
end;

procedure TfrmMenu.ButtonClassesClick(Sender: TObject);
begin
  AbreFormModal(TfrmClasses);
//  frmClasses := TfrmClasses.Create(Application);
//  frmClasses.ShowModal;
//  frmClasses.Free;
end;

end.
