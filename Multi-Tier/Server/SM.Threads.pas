unit SM.Threads;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, WinApi.Windows, System.SyncObjs,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, Data.DBXPlatform,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

// Connection Deff
// https://docwiki.embarcadero.com/CodeExamples/Sydney/en/FireDAC.ConnectionDefs_Sample

type
  TsmThreads = class(TDSServerModule)
    FDConnection: TFDConnection;
    qryValidaCPF: TFDQuery;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }

    FStl: TStringList;
  class var
    FQtd: Integer;
  public
    function GetThread: string;
    function GetThread2: string;
    function GetThread3: string;

    function GetLista: string;

    function GetListaComErro: string;

    function ValidaCPFThread: string;
    function GetQtdValidacao: string;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmThreads }

procedure TsmThreads.DSServerModuleCreate(Sender: TObject);
begin
  FStl := TStringList.Create;
end;

procedure TsmThreads.DSServerModuleDestroy(Sender: TObject);
begin
  FStl.Free;
end;

function TsmThreads.GetLista: string;
begin
  Result := FStl.Text;
  GetInvocationMetadata.ResponseContent := Result;
  GetInvocationMetadata.ResponseContentType := 'application/json';
end;

function TsmThreads.GetListaComErro: string;
begin
  Result := FStl.Text;
  GetInvocationMetadata.ResponseContent := Result;
  GetInvocationMetadata.ResponseContentType := 'application/json';
  FStl.Free;
end;

function TsmThreads.GetQtdValidacao: string;
begin
  Result := 'Qtd: ' + IntToStr(FQtd);

  GetInvocationMetadata.ResponseContent := Result;
  GetInvocationMetadata.ResponseContentType := 'application/json';
end;

function TsmThreads.GetThread: string;
begin
  {
    CreateAnnonimousThread(
      TsmThreads.Create()
        GetThread

  }
  FStl.Add('GetThread');


  Inc(FQtd);

  Result := 'C:' + IntToStr(TThread.CurrentThread.ThreadID) + ' M:' + IntToStr(MainThreadID) + sLineBreak + 'Qtd: ' + IntToStr(FQtd);

  GetInvocationMetadata.ResponseContent := Result;
  GetInvocationMetadata.ResponseContentType := 'application/json';
end;

function TsmThreads.GetThread2: string;
begin
  FStl.Add('GetThread2');
  Inc(FQtd);

  Result := GetThread + sLineBreak + ' 2';

  GetInvocationMetadata.ResponseContent := Result;
  GetInvocationMetadata.ResponseContentType := 'application/json';
end;

function TsmThreads.GetThread3: string;
begin
  FStl.Add('GetThread3');
  Inc(FQtd);

  Result := GetThread2 + sLineBreak + ' 3';

  GetInvocationMetadata.ResponseContent := Result;
  GetInvocationMetadata.ResponseContentType := 'application/json';
end;

function TsmThreads.ValidaCPFThread: string;
begin
  InterlockedIncrement(FQtd);

  qryValidaCPF.Close;
  qryValidaCPF.ParamByName('cpf').AsString := '';
  qryValidaCPF.Open;

  if qryValidaCPF.IsEmpty then
  begin
    Result := '';
  end else begin
    Result := 'CPF já utilizado para cliente: ' + qryValidaCPF.FieldByName('ID').AsString + ' ' + qryValidaCPF.FieldByName('nome').AsString;
  end;

  qryValidaCPF.Close;
end;

end.

