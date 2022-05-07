unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Form.Cadastro.Cliente, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Imagens, Form.Cadastro.Produto;

type
  TfrmPrincipal = class(TForm)
    MainMenu: TMainMenu;
    ActionManager: TActionManager;
    ActionCadastroClientes: TAction;
    ActionToolBar2: TActionToolBar;
    Cadastros1: TMenuItem;
    CadastrodeClientes1: TMenuItem;
    ActionCadastroProduto: TAction;
    CadastrodeProdutos1: TMenuItem;
    procedure ActionCadastroClientesExecute(Sender: TObject);
    procedure ActionCadastroProdutoExecute(Sender: TObject);
  private
    procedure AbreFormModal(FormClass: TFormClass);
    procedure AbreFormShow(FormClass: TFormClass);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AbreFormModal(FormClass: TFormClass);
begin
  var frm: TForm := FormClass.Create(Application);
  frm.ShowModal;
  frm.Free;
end;

procedure TfrmPrincipal.AbreFormShow(FormClass: TFormClass);
begin
  var frm: TForm := FormClass.Create(Application);
  frm.Show;
end;

procedure TfrmPrincipal.ActionCadastroClientesExecute(Sender: TObject);
begin
  AbreFormModal(TfrmCadastroCliente);
end;

procedure TfrmPrincipal.ActionCadastroProdutoExecute(Sender: TObject);
begin
  AbreFormModal(TfrmCadastroProduto);
end;

end.
