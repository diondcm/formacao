unit Data.Grupo.Simples;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.Graphics,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, frxClass, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, frxDBSet, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.DApt, frxChart,
  frxExportXLSX, frxExportBaseDialog, frxExportPDF;

type
  TdmdGrupoSimples = class(TDataModule)
    memCustomer: TFDMemTable;
    memOrder: TFDMemTable;
    frxReportGrupoSimples: TfrxReport;
    memCustomerCustNo: TFloatField;
    memCustomerCompany: TStringField;
    memCustomerAddr1: TStringField;
    memCustomerAddr2: TStringField;
    memCustomerCity: TStringField;
    memCustomerState: TStringField;
    memCustomerZip: TStringField;
    memCustomerCountry: TStringField;
    memCustomerPhone: TStringField;
    memCustomerFAX: TStringField;
    memCustomerTaxRate: TFloatField;
    memCustomerContact: TStringField;
    memCustomerLastInvoiceDate: TDateTimeField;
    memOrderOrderNo: TFloatField;
    memOrderCustNo: TFloatField;
    memOrderSaleDate: TDateTimeField;
    memOrderShipDate: TDateTimeField;
    memOrderEmpNo: TIntegerField;
    memOrderShipToContact: TStringField;
    memOrderShipToAddr1: TStringField;
    memOrderShipToAddr2: TStringField;
    memOrderShipToCity: TStringField;
    memOrderShipToState: TStringField;
    memOrderShipToZip: TStringField;
    memOrderShipToCountry: TStringField;
    memOrderShipToPhone: TStringField;
    memOrderShipVIA: TStringField;
    memOrderPO: TStringField;
    memOrderTerms: TStringField;
    memOrderPaymentMethod: TStringField;
    memOrderItemsTotal: TCurrencyField;
    memOrderTaxRate: TFloatField;
    memOrderFreight: TCurrencyField;
    memOrderAmountPaid: TCurrencyField;
    dtsMasterCustormer: TDataSource;
    frxDBCustomer: TfrxDBDataset;
    frxDBOrder: TfrxDBDataset;
    frxReportGroupUmDataSet: TfrxReport;
    memOrderIndexado: TFDMemTable;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    CurrencyField1: TCurrencyField;
    FloatField3: TFloatField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    frxDBOrderIndex: TfrxDBDataset;
    frxReportGraficos: TfrxReport;
    FDConnection1: TFDConnection;
    qryTotalCountry: TFDQuery;
    frxDBTotalCountry: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSXExport1: TfrxXLSXExport;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure frxReportGroupUmDataSetBeforePrint(Sender: TfrxReportComponent);
  private
    FTitulo: string;
    FColor: TColor;
    { Private declarations }
  public
    property Titulo: string read FTitulo write FTitulo;
    property Color: TColor read FColor write FColor;
  end;

var
  dmdGrupoSimples: TdmdGrupoSimples;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdGrupoSimples.FDConnection1BeforeConnect(Sender: TObject);
begin
  FDConnection1.Params.Database := ExtractFilePath(ParamStr(0)) + 'relatorios.db';
end;

procedure TdmdGrupoSimples.frxReportGroupUmDataSetBeforePrint(
  Sender: TfrxReportComponent);
begin
  if LowerCase(Sender.Name) = 'MemoHeader'.ToLower then
  begin
    TfrxMemoView(Sender).Text := FTitulo;
    TfrxMemoView(Sender).Color := FColor;
  end;
end;

end.
