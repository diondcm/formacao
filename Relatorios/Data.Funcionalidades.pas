unit Data.Funcionalidades;

interface

uses
  System.SysUtils, System.Classes, frxClass, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, frxDBSet, frxBarcode;

type
  TdmdFuncionalidades = class(TDataModule)
    frxReportMultiPages: TfrxReport;
    memCustomer: TFDMemTable;
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
    frxDBCustomer: TfrxDBDataset;
    frxReportEtiqueta: TfrxReport;
    frxReportQrCode: TfrxReport;
    frxReportSubReport: TfrxReport;
    frxReportCodigo: TfrxReport;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdFuncionalidades: TdmdFuncionalidades;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
