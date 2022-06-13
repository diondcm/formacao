unit Form.Visualiza.Dados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmVisualizaDados = class(TForm)
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibeDados(conn: TFDConnection);
  end;

implementation

{$R *.dfm}

class procedure TfrmVisualizaDados.ExibeDados(conn: TFDConnection);
begin
  var frm: TfrmVisualizaDados := TfrmVisualizaDados.Create(nil);
  frm.FDQuery1.Connection := conn;

  frm.ShowModal;

  frm.Free;
end;

procedure TfrmVisualizaDados.FormShow(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Open;
end;

end.
