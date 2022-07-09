unit Data.ReportMasterDetailDetail;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdReportMasterDetailDetail = class(TDataModule)
    frxReportMDD: TfrxReport;
    memCustomer: TFDMemTable;
    dtsCustomer: TDataSource;
    frxDBCustomer: TfrxDBDataset;
    memOrder: TFDMemTable;
    dtsOrder: TDataSource;
    frxDBOrder: TfrxDBDataset;
    memItems: TFDMemTable;
    dtsItems: TDataSource;
    frxDBItems: TfrxDBDataset;
    memParts: TFDMemTable;
    dtsParts: TDataSource;
    frxDBParts: TfrxDBDataset;
    memVendors: TFDMemTable;
    dtsVendors: TDataSource;
    frxDBVendors: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdReportMasterDetailDetail: TdmdReportMasterDetailDetail;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
