unit Form.Lista.Simples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, frxGradient,
  frxExportBaseDialog, frxExportPDF, frxExportHTML, frxExportXML, frxExportXLS,
  frxExportXLSX, frxExportCSV;

type
  TfrxPDFExport2 = class(TfrxPDFExport)
  end;

  TfrmListaSimples = class(TForm)
    frxReportListaBioLife: TfrxReport;
    memBioLife: TFDMemTable;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    PanelControles: TPanel;
    ButtonRelSimples: TButton;
    dtsBioLife: TDataSource;
    frxDBBioLife: TfrxDBDataset;
    frxReportImagensBioLife: TfrxReport;
    ButtonRelImagens: TButton;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxCSVExport1: TfrxCSVExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxXMLExport1: TfrxXMLExport;
    frxHTMLExport1: TfrxHTMLExport;
    DBRichEdit1: TDBRichEdit;
    DBImage1: TDBImage;
    LabelFiltros: TLabel;
    procedure ButtonRelSimplesClick(Sender: TObject);
    procedure ButtonRelImagensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaSimples: TfrmListaSimples;

implementation

{$R *.dfm}

procedure TfrmListaSimples.ButtonRelImagensClick(Sender: TObject);
begin
  frxReportImagensBioLife.ShowReport;
end;

procedure TfrmListaSimples.ButtonRelSimplesClick(Sender: TObject);
begin
  frxReportListaBioLife.ShowReport;
//   frxReportListaBioLife.Print; // Imprime direto
end;

end.
