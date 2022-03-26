unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Buttons, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Aes1: TMenuItem;
    GerarHash1: TMenuItem;
    FlowPanel1: TFlowPanel;
    BitBtnHash: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ActionManager1: TActionManager;
    ActionGerarHash: TAction;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    GerarHash2: TMenuItem;
    ActionCadastro: TAction;
    procedure BitBtn1Click(Sender: TObject);
    procedure ActionGerarHashExecute(Sender: TObject);
    procedure ActionCadastroExecute(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Form.HashVLC, Form.Cadastro;

{ TfrmPrincipal }

procedure TfrmPrincipal.ActionCadastroExecute(Sender: TObject);
begin
  frmCadastro := TfrmCadastro.Create(Application);
  frmCadastro.ShowModal;
  frmCadastro.Free;
end;

procedure TfrmPrincipal.ActionGerarHashExecute(Sender: TObject);
begin
//  frmHashVCL := TfrmHashVCL.Create(Application); // Mesma coisa
  Application.CreateForm(TfrmHashVCL, frmHashVCL);
  frmHashVCL.ShowModal;
  frmHashVCL.Free;
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  ActionGerarHash.Enabled := not ActionGerarHash.Enabled;
end;

end.
