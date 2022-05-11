unit Form.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Data.Imagens, Data.Cliente;

type
  TfrmCadastroCliente = class(TfrmBaseCadastro)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FDataCliente: TdmdCliente; // Shift + Ctrl + D ==> Declara field
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  Action := TCloseAction.caFree;
end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  FDataCliente := TdmdCliente.Create(Self);
end;

procedure TfrmCadastroCliente.FormDestroy(Sender: TObject);
begin
  inherited;
   MessageBox(0, 'Free', '', MB_OK);
end;

end.
