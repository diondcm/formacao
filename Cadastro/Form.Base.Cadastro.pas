unit Form.Base.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmBaseCadastro = class(TfrmBase)
    PanelNavigator: TPanel;
    ButtonInserir: TBitBtn;
    ActionList: TActionList;
    ActionInserir: TDataSetInsert;
    ButtonEditar: TBitBtn;
    ActionPrimeiro: TDataSetFirst;
    ActionAnterior: TDataSetPrior;
    ActionProximo: TDataSetNext;
    ActionUltimo: TDataSetLast;
    ActionDeletar: TDataSetDelete;
    ActionEditar: TDataSetEdit;
    ActionSalvar: TDataSetPost;
    ActionCancelar: TDataSetCancel;
    ActionAtualizar: TDataSetRefresh;
    ButtonCancelar: TBitBtn;
    ButtonSalvar: TBitBtn;
    ButtonDeletar: TBitBtn;
    ButtonPrimeiro: TBitBtn;
    ButtonAnterior: TBitBtn;
    ButtonProximo: TBitBtn;
    ButtonUltimo: TBitBtn;
    PageControl: TPageControl;
    TabPesquisa: TTabSheet;
    TabCadastro: TTabSheet;
    DBGridDados: TDBGrid;
    dtsDados: TDataSource;
    ImageLogoCadastro: TImage;
    ButtonImagemTemp: TBitBtn;
    TimerOpen: TTimer;
    StatusBarPesquisa: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
    procedure dtsDadosStateChange(Sender: TObject);
    procedure DBGridDadosDblClick(Sender: TObject);
    procedure dtsDadosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.DBGridDadosDblClick(Sender: TObject);
begin
  if Assigned(dtsDados.DataSet) then
  begin
    if (dtsDados.DataSet.Active) and (not dtsDados.DataSet.IsEmpty) then
    begin
      dtsDados.DataSet.Edit;
    end;
  end;
end;

procedure TfrmBaseCadastro.dtsDadosDataChange(Sender: TObject; Field: TField);
begin
  StatusBarPesquisa.Panels[1].Text := 'Registro ' + FormatFloat('0.,', dtsDados.DataSet.RecNo) + ' de ' + FormatFloat('0.,', dtsDados.DataSet.RecordCount);
end;

procedure TfrmBaseCadastro.dtsDadosStateChange(Sender: TObject);
begin
  case dtsDados.State of
    dsBrowse: PageControl.ActivePage := TabPesquisa;

    dsInsert, dsEdit:
      PageControl.ActivePage := TabCadastro;
  end;
end;

procedure TfrmBaseCadastro.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := TabPesquisa;
  TimerOpen.Enabled := True;
end;

procedure TfrmBaseCadastro.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  if not Assigned(dtsDados.DataSet) then // Evita AV em runtime
  begin
    raise Exception.Create('Qry não informada no ' + dtsDados.Name);
  end;

  dtsDados.DataSet.Open;
end;

end.
