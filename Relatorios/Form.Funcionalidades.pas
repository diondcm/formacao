unit Form.Funcionalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Funcionalidades;

const
 ARQ_REL_MULTIPAGES = 'C:\Desenv\Aqua\Exemplo-Formacao\Relatorios\reports\Multi-Pages.fr3';

type
  TfrmFuncionalidades = class(TForm)
    PanelControles: TPanel;
    ButtonMultiPages: TButton;
    ButtonMultiPagesStream: TButton;
    ButtonQrCode: TButton;
    ButtonSubReport: TButton;
    Memo1: TMemo;
    ButtonCodigo: TButton;
    PanelNovosControles: TPanel;
    ButtonHeranca: TButton;
    procedure ButtonMultiPagesClick(Sender: TObject);
    procedure ButtonMultiPagesStreamClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonQrCodeClick(Sender: TObject);
    procedure ButtonSubReportClick(Sender: TObject);
    procedure ButtonCodigoClick(Sender: TObject);
    procedure ButtonHerancaClick(Sender: TObject);
  private
    FStmRelatorio: TFileStream;
  public
    { Public declarations }
  end;

var
  frmFuncionalidades: TfrmFuncionalidades;

implementation

{$R *.dfm}

procedure TfrmFuncionalidades.ButtonCodigoClick(Sender: TObject);
begin
  dmdFuncionalidades.frxReportCodigo.ShowReport;
end;

procedure TfrmFuncionalidades.ButtonHerancaClick(Sender: TObject);
begin
  dmdFuncionalidades.frxReport2.ShowReport;
end;

procedure TfrmFuncionalidades.ButtonMultiPagesClick(Sender: TObject);
begin
  dmdFuncionalidades.frxReportMultiPages.LoadFromFile(ARQ_REL_MULTIPAGES);
  dmdFuncionalidades.frxReportMultiPages.ShowReport;
end;

procedure TfrmFuncionalidades.ButtonMultiPagesStreamClick(Sender: TObject);
begin
  if not Assigned(FStmRelatorio) then
  begin
    FStmRelatorio := TFileStream.Create(ARQ_REL_MULTIPAGES, fmOpenRead);
  end;

  FStmRelatorio.Position := 0;

  dmdFuncionalidades.frxReportMultiPages.LoadFromStream(FStmRelatorio);
  dmdFuncionalidades.frxReportMultiPages.ShowReport;
end;

procedure TfrmFuncionalidades.ButtonQrCodeClick(Sender: TObject);
begin
  dmdFuncionalidades.frxReportEtiqueta.ShowReport;
  dmdFuncionalidades.frxReportQrCode.ShowReport;
end;

procedure TfrmFuncionalidades.ButtonSubReportClick(Sender: TObject);
begin
  dmdFuncionalidades.frxReportSubReport.ShowReport;
end;

procedure TfrmFuncionalidades.FormDestroy(Sender: TObject);
begin
  FStmRelatorio.Free;
end;

end.
