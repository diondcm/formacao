unit Form.Grupo.Simples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Data.Grupo.Simples, Vcl.ComCtrls,
  Vcl.Menus;

type
  TfrmGrupoSimples = class(TForm)
    PanelControles: TPanel;
    PanelPedidos: TPanel;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Label1: TLabel;
    dtCustomer: TDataSource;
    dtsOrder: TDataSource;
    PanelCliente: TPanel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    StatusBarCliente: TStatusBar;
    StatusBarPedidos: TStatusBar;
    ButtonRelatorio: TButton;
    EditRelSimplesCaption: TEdit;
    ButtonRelSimples: TButton;
    ColorBox1: TColorBox;
    ButtonTesteGrafico: TButton;
    ButtonExport: TButton;
    PopupMenuExport: TPopupMenu;
    PDF1: TMenuItem;
    PDF2: TMenuItem;
    procedure dtCustomerDataChange(Sender: TObject; Field: TField);
    procedure dtsOrderDataChange(Sender: TObject; Field: TField);
    procedure ButtonRelatorioClick(Sender: TObject);
    procedure ButtonRelSimplesClick(Sender: TObject);
    procedure ButtonTesteGraficoClick(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure PDF2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupoSimples: TfrmGrupoSimples;

implementation

{$R *.dfm}

procedure TfrmGrupoSimples.ButtonRelatorioClick(Sender: TObject);
begin
  dmdGrupoSimples.frxReportGrupoSimples.ShowReport;
end;

procedure TfrmGrupoSimples.ButtonRelSimplesClick(Sender: TObject);
begin
  dmdGrupoSimples.Color := ColorBox1.Selected;
  dmdGrupoSimples.Titulo := EditRelSimplesCaption.Text;
  dmdGrupoSimples.frxReportGroupUmDataSet.Variables['VersaoSistema'] := QuotedStr('1.1.5.0');
  dmdGrupoSimples.frxReportGroupUmDataSet.ShowReport;
end;

procedure TfrmGrupoSimples.ButtonTesteGraficoClick(Sender: TObject);
begin
  dmdGrupoSimples.frxReportGraficos.ShowReport;
end;

procedure TfrmGrupoSimples.dtCustomerDataChange(Sender: TObject; Field: TField);
begin
  StatusBarCliente.Panels[0].Text := FormatFloat('0.,', dmdGrupoSimples.memCustomer.RecordCount) + ' clientes';
end;

procedure TfrmGrupoSimples.dtsOrderDataChange(Sender: TObject; Field: TField);
begin
  StatusBarPedidos.Panels[0].Text := FormatFloat('0.,', dmdGrupoSimples.memOrder.RecordCount) + ' pedidos';
end;

procedure TfrmGrupoSimples.PDF1Click(Sender: TObject);
begin
  dmdGrupoSimples.memCustomer.DisableControls;
  dmdGrupoSimples.memOrder.DisableControls;
  try
    dmdGrupoSimples.frxReportGrupoSimples.PrepareReport;
    dmdGrupoSimples.frxReportGrupoSimples.Export(dmdGrupoSimples.frxPDFExport1);
  finally
    dmdGrupoSimples.memCustomer.First;
    dmdGrupoSimples.memCustomer.EnableControls;
    dmdGrupoSimples.memOrder.EnableControls;
  end;
end;

procedure TfrmGrupoSimples.PDF2Click(Sender: TObject);
begin
  dmdGrupoSimples.memCustomer.DisableControls;
  dmdGrupoSimples.memOrder.DisableControls;
  try
    dmdGrupoSimples.frxReportGrupoSimples.PrepareReport;
    dmdGrupoSimples.frxReportGrupoSimples.Export(dmdGrupoSimples.frxXLSXExport1);
  finally
    dmdGrupoSimples.memCustomer.First;
    dmdGrupoSimples.memCustomer.EnableControls;
    dmdGrupoSimples.memOrder.EnableControls;
  end;
end;

end.
