unit Form.Principal.Exemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Calsses.Panel.Simples,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXPickers,
  Vcl.ComCtrls, Classes.DateDB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipalExemplo = class(TForm)
    PanelSemCaption1: TPanelSemCaption;
    Panel1: TPanel;
    DatePicker1: TDatePicker;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    FDMemTable1cadastro: TDateField;
    DateTimePicker1: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBDateTimePiker1: TDBDateTimePiker;
    DBDatePicker1: TDBDatePicker;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalExemplo: TfrmPrincipalExemplo;

implementation

{$R *.dfm}

procedure TfrmPrincipalExemplo.FormCreate(Sender: TObject);
begin
  FDMemTable1.Open;
end;

end.
