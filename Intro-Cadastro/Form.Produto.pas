unit Form.Produto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.Controls, FMX.TabControl, FMX.Layouts, Fmx.Bind.Navigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Rtti, FMX.Grid.Style, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.Produto,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmProduto = class(TForm)
    BindNavigator1: TBindNavigator;
    TabControlProduto: TTabControl;
    TabPesquisa: TTabItem;
    TabCadastro: TTabItem;
    TabQrCode: TTabItem;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    dtsProduto: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FStrings: TStringList;
    FJaInicializou: Boolean;
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.fmx}

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  ///  Atenção: Form pode executar mais de uma vez!
  ///  e.g.:
  ///  FStrings := TStringList.Create; // poderia ser resolvido com if Assigned(FStrings)
  ///  Mas a melhor prática para criação é o OnCreate
  ///  Neste caso podemos ter memoryLeak pois mais de um FString pode ser criado

  if not FJaInicializou then
  begin
    dmdProduto.qryProduto.Close;
    dmdProduto.qryProduto.Open;

    FJaInicializou := True;
  end;
end;

end.
