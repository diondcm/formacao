unit Form.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Data.Imagens, Data.Cliente, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroCliente = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
  private
    FDataCliente: TdmdCliente; // Shift + Ctrl + D ==> Declara field
  public
    { Public declarations }
  end;

//var
//  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  FDataCliente := TdmdCliente.Create(Self);

  dtsDados.DataSet := FDataCliente.qryDados;
end;

end.
