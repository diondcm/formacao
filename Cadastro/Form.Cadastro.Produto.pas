unit Form.Cadastro.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Imagens,
  Data.Produto, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroProduto = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    FDataProduto: TdmdProduto;
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

procedure TfrmCadastroProduto.FormCreate(Sender: TObject);
begin
  FDataProduto := TdmdProduto.Create(Self);
  dtsDados.DataSet := FDataProduto.qryDados;
end;

end.
