unit ClientModuleUnit;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FsmGeralClient: TsmGeralClient;
    FsmThreadsClient: TsmThreadsClient;
    FsmArquivosClient: TsmArquivosClient;
    FsmBlockChainClient: TsmBlockChainClient;
    function GetsmGeralClient: TsmGeralClient;
    function GetsmThreadsClient: TsmThreadsClient;
    function GetsmArquivosClient: TsmArquivosClient;
    function GetsmBlockChainClient: TsmBlockChainClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property smGeralClient: TsmGeralClient read GetsmGeralClient write FsmGeralClient;
    property smThreadsClient: TsmThreadsClient read GetsmThreadsClient write FsmThreadsClient;
    property smArquivosClient: TsmArquivosClient read GetsmArquivosClient write FsmArquivosClient;
    property smBlockChainClient: TsmBlockChainClient read GetsmBlockChainClient write FsmBlockChainClient;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FsmGeralClient.Free;
  FsmThreadsClient.Free;
  FsmArquivosClient.Free;
  inherited;
end;

function TClientModule1.GetsmGeralClient: TsmGeralClient;
begin
  if FsmGeralClient = nil then
    FsmGeralClient:= TsmGeralClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmGeralClient;
end;
function TClientModule1.GetsmThreadsClient: TsmThreadsClient;
begin
  if FsmThreadsClient = nil then
    FsmThreadsClient:= TsmThreadsClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmThreadsClient;
end;
function TClientModule1.GetsmArquivosClient: TsmArquivosClient;
begin
  if FsmArquivosClient = nil then
    FsmArquivosClient:= TsmArquivosClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmArquivosClient;
end;

function TClientModule1.GetsmBlockChainClient: TsmBlockChainClient;
begin
  if FsmBlockChainClient = nil then
    FsmBlockChainClient:= TsmBlockChainClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmBlockChainClient;
end;

end.
