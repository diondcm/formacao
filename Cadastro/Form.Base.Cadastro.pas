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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
