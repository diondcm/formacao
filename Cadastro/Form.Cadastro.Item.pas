unit Form.Cadastro.Item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Math, Vcl.WinXPickers,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmCadastroItem = class(TfrmBase)
    PanelPedido: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    ButtonCancelar: TBitBtn;
    ButtonSalvar: TBitBtn;
    dtsItens: TDataSource;
    LookupProduto: TDBLookupComboBox;
    dtsProduto: TDataSource;
    DatePicker1: TDatePicker;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldDate: TLinkPropertyToField;
  private
    { Private declarations }
    class function AlteraItemInterno(CodPedido: Integer; qryItens, qryProdutos: TFDQuery): Boolean;
  public
    procedure ConfiguraPedido(CodPedido: Integer; qryItens, qryProdutos: TFDQuery);

    class function CadastraItem(CodPedido: Integer; qryItens, qryProdutos: TFDQuery): Boolean;
    class function EditaItem(CodPedido: Integer; qryItens, qryProdutos: TFDQuery): Boolean;
  end;


implementation

{$R *.dfm}

{ TfrmCadastroItem }

class function TfrmCadastroItem.AlteraItemInterno(CodPedido: Integer;
  qryItens, qryProdutos: TFDQuery): Boolean;
begin
  Result := False;
  var frmItem: TfrmCadastroItem := TfrmCadastroItem.Create(nil);
  try
    frmItem.ConfiguraPedido(CodPedido, qryItens, qryProdutos);
    if frmItem.ShowModal = mrOk then
    begin
      qryItens.Post;
      Result := True;
    end else begin
      qryItens.Cancel;
    end;
  finally
    frmItem.Free;
  end;
end;

class function TfrmCadastroItem.CadastraItem(CodPedido: Integer;
  qryItens, qryProdutos: TFDQuery): Boolean;
begin
  qryItens.Append;
  Result := AlteraItemInterno(CodPedido, qryItens, qryProdutos);
end;

procedure TfrmCadastroItem.ConfiguraPedido(CodPedido: Integer; qryItens, qryProdutos: TFDQuery);
begin
  dtsItens.DataSet := qryItens;
  dtsProduto.DataSet := qryProdutos;
  BindSourceDB1.DataSet := qryItens;

  var item: Integer := IfThen(dtsItens.DataSet.State = dsInsert, dtsItens.DataSet.RecordCount + 1, dtsItens.DataSet.RecNo);
  PanelPedido.Caption := 'Item ' + FormatFloat('0.,', item) + ' do pedido número: ' + IntToStr(CodPedido);
end;

class function TfrmCadastroItem.EditaItem(CodPedido: Integer;
  qryItens, qryProdutos: TFDQuery): Boolean;
begin
  qryItens.Edit;
  Result := AlteraItemInterno(CodPedido, qryItens, qryProdutos);
end;

end.
