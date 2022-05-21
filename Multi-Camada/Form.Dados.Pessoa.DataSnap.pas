unit Form.Dados.Pessoa.DataSnap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  Data.Pessoa.DataSnap, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TfrmDadosPessoaDataSnap = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    dtsPessoa: TDataSource;
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    dtsCache: TDataSource;
    Panel3: TPanel;
    ButtonCarregaDefaultDataSnap: TButton;
    ButtonEnvioDefault: TButton;
    ButtonCarregaDadosREST: TButton;
    MemoLog: TMemo;
    Splitter2: TSplitter;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RadioButtonFiltroPadraoClick(Sender: TObject);
    procedure RadioButtonFiltroSomenteAlteradosClick(Sender: TObject);
    procedure RadioButtonFiltroSomenteExcluidosClick(Sender: TObject);
    procedure ButtonCarregaDefaultDataSnapClick(Sender: TObject);
    procedure ButtonEnvioDefaultClick(Sender: TObject);
    procedure ButtonCarregaDadosRESTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosPessoaDataSnap: TfrmDadosPessoaDataSnap;

implementation

{$R *.dfm}

uses Data.Pessoa;

procedure TfrmDadosPessoaDataSnap.ButtonCarregaDadosRESTClick(Sender: TObject);
begin
  MemoLog.Visible := True;
  dtsPessoa.DataSet := dmdPessoaDataSnap.memPessoaREST;
  MemoLog.Text := dmdPessoaDataSnap.CarregaDadosREST;
end;

procedure TfrmDadosPessoaDataSnap.ButtonCarregaDefaultDataSnapClick(
  Sender: TObject);
begin
  dtsPessoa.DataSet := dmdPessoaDataSnap.memPessoaLocal;
  dmdPessoaDataSnap.CarregaDadosDataSnapPadrao;
end;

procedure TfrmDadosPessoaDataSnap.ButtonEnvioDefaultClick(Sender: TObject);
begin
  dmdPessoaDataSnap.EnviaDadosDataSnapPadrao;
end;

procedure TfrmDadosPessoaDataSnap.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
//  case Button of
//    nbCancelUpdates, nbApplyUpdates: TimerOpen.Enabled := True;
//  end;
end;

procedure TfrmDadosPessoaDataSnap.RadioButtonFiltroPadraoClick(Sender: TObject);
begin
//  Colocar o uses: FireDAC.Comp.DataSet
//  TFDUpdateRecordTypes = set of (rtModified, rtInserted, rtDeleted,
//    rtUnmodified, rtHasErrors);

//  dmdPessoa.qryPessoa.FilterChanges := [rtModified, rtInserted,
//    rtUnmodified];
end;

procedure TfrmDadosPessoaDataSnap.RadioButtonFiltroSomenteAlteradosClick(
  Sender: TObject);
begin
//  dmdPessoa.qryPessoa.FilterChanges := [rtModified];
end;

procedure TfrmDadosPessoaDataSnap.RadioButtonFiltroSomenteExcluidosClick(
  Sender: TObject);
begin
//  dmdPessoa.qryPessoa.FilterChanges := [rtDeleted];
end;

end.
