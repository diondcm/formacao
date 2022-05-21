unit Form.Dados.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Data.Pessoa, Vcl.StdCtrls, FireDAC.Comp.DataSet;

type
  TfrmDadosPessoa = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    TimerOpen: TTimer;
    dtsPessoa: TDataSource;
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    dtsCache: TDataSource;
    Panel2: TPanel;
    RadioButtonFiltroPadrao: TRadioButton;
    RadioButtonFiltroSomenteAlterados: TRadioButton;
    RadioButtonFiltroSomenteExcluidos: TRadioButton;
    ButtonCopiarDelta: TButton;
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RadioButtonFiltroPadraoClick(Sender: TObject);
    procedure ButtonCopiarDeltaClick(Sender: TObject);
    procedure RadioButtonFiltroSomenteAlteradosClick(Sender: TObject);
    procedure RadioButtonFiltroSomenteExcluidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosPessoa: TfrmDadosPessoa;

implementation

{$R *.dfm}

procedure TfrmDadosPessoa.ButtonCopiarDeltaClick(Sender: TObject);
begin
  dmdPessoa.CopiaDelta;
end;

procedure TfrmDadosPessoa.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbCancelUpdates, nbApplyUpdates: TimerOpen.Enabled := True;
  end;
end;

procedure TfrmDadosPessoa.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmDadosPessoa.RadioButtonFiltroPadraoClick(Sender: TObject);
begin
//  Colocar o uses: FireDAC.Comp.DataSet
//  TFDUpdateRecordTypes = set of (rtModified, rtInserted, rtDeleted,
//    rtUnmodified, rtHasErrors);

  dmdPessoa.qryPessoa.FilterChanges := [rtModified, rtInserted,
    rtUnmodified];
end;

procedure TfrmDadosPessoa.RadioButtonFiltroSomenteAlteradosClick(
  Sender: TObject);
begin
  dmdPessoa.qryPessoa.FilterChanges := [rtModified];
end;

procedure TfrmDadosPessoa.RadioButtonFiltroSomenteExcluidosClick(
  Sender: TObject);
begin
  dmdPessoa.qryPessoa.FilterChanges := [rtDeleted];
end;

procedure TfrmDadosPessoa.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  dmdPessoa.qryPessoa.Close;
  dmdPessoa.qryPessoa.Open;
end;

end.
