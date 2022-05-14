unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB,
  Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Data.Pedido,
  Form.Cadastro.Item;

type
  TfrmCadPedidos = class(TfrmBaseCadastro)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    dtsItens: TDataSource;
    Panel1: TPanel;
    StatusBarItens: TStatusBar;
    DBGridItens: TDBGrid;
    PanelCadItemPedido: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    StatusBarItensCadastro: TStatusBar;
    Panel3: TPanel;
    ShapeAddItem: TShape;
    LabelAddItem: TLabel;
    ShapeEditItem: TShape;
    LabelEditItem: TLabel;
    Shape1: TShape;
    LabelDeleteItem: TLabel;
    Label7: TLabel;
    LookupCliente: TDBLookupComboBox;
    dtsCliente: TDataSource;
    TimerContador: TTimer;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
    procedure dtsItensDataChange(Sender: TObject; Field: TField);
    procedure dtsDadosDataChange(Sender: TObject; Field: TField);
    procedure LabelAddItemClick(Sender: TObject);
    procedure LabelEditItemClick(Sender: TObject);
    procedure LabelDeleteItemClick(Sender: TObject);
    procedure TimerContadorTimer(Sender: TObject);
  private
    FQtdDataChange: Integer;
    FDmdPedido: TdmdPedido;
  public
    { Public declarations }
  end;

var
  frmCadPedidos: TfrmCadPedidos;

implementation

{$R *.dfm}

procedure TfrmCadPedidos.dtsDadosDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  Inc(FQtdDataChange);

//  FDmdPedido.qryItens.Close;
//  FDmdPedido.qryItens.ParamByName('IDPEDIDO').AsInteger := FDmdPedido.qryDadosIDPEDIDO.AsInteger;
//  FDmdPedido.qryItens.Open;
end;

procedure TfrmCadPedidos.dtsItensDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  StatusBarItens.Panels[1].Text := 'Item ' + FormatFloat('0.,', dtsItens.DataSet.RecNo) + ' de ' + FormatFloat('0.,', dtsItens.DataSet.RecordCount);
  StatusBarItensCadastro.Panels[1].Text := 'Item ' + FormatFloat('0.,', dtsItens.DataSet.RecNo) + ' de ' + FormatFloat('0.,', dtsItens.DataSet.RecordCount);
end;

procedure TfrmCadPedidos.FormCreate(Sender: TObject);
begin
  FDmdPedido := TdmdPedido.Create(Self);
  dtsDados.DataSet := FDmdPedido.qryDados;
  dtsItens.DataSet := FDmdPedido.qryItens;
  dtsCliente.DataSet := FDmdPedido.qryCliente;
end;

procedure TfrmCadPedidos.LabelAddItemClick(Sender: TObject);
begin
  if FDmdPedido.qryDados.IsEmpty then
  begin
//    TMensagem.Aviso('')
    ShowMessage('Você deve primeiramente salvar o pedido');
    Exit;
  end;

  TfrmCadastroItem.CadastraItem(FDmdPedido.qryDadosCODIGO.AsInteger, FDmdPedido.qryItens, FDmdPedido.qryProduto);

//  FDmdPedido.qryItens.Append;
//  var frmItem: TfrmCadastroItem := TfrmCadastroItem.Create(nil);
//  try
//    frmItem.ConfiguraPedido(FDmdPedido.qryDadosCODIGO.AsInteger, FDmdPedido.qryItens);
//    if frmItem.ShowModal = mrOk then
//    begin
//      FDmdPedido.qryItens.Post;
//    end else begin
//      FDmdPedido.qryItens.Cancel;
//    end;
//  finally
//    frmItem.Free;
//  end;
end;

procedure TfrmCadPedidos.LabelDeleteItemClick(Sender: TObject);
begin
  if not FDmdPedido.qryItens.IsEmpty then
  begin
    FDmdPedido.qryItens.Delete;
  end;
end;

procedure TfrmCadPedidos.LabelEditItemClick(Sender: TObject);
begin
  if FDmdPedido.qryDados.IsEmpty then
  begin
//    TMensagem.Aviso('')
    ShowMessage('Você deve primeiramente salvar o pedido');
    Exit;
  end;

  TfrmCadastroItem.EditaItem(FDmdPedido.qryDadosCODIGO.AsInteger, FDmdPedido.qryItens, FDmdPedido.qryProduto);
end;

procedure TfrmCadPedidos.TimerContadorTimer(Sender: TObject);
begin
  inherited;
  Caption := 'Change: ' + FormatFloat('0.,', FQtdDataChange) + ' After: ' + FormatFloat('0.,', FDmdPedido.FQtdAfteScroll)
end;

procedure TfrmCadPedidos.TimerOpenTimer(Sender: TObject);
begin
  inherited;
//  FDmdPedido.qryItens.ParamByName('IDPEDIDO').AsInteger := FDmdPedido.qryDadosIDPEDIDO.AsInteger;
//  FDmdPedido.qryItens.Open;
end;

end.
