unit Data.Base;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TdmdBase = class(TDataModule)
    qryDados: TFDQuery;
    sqlDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
