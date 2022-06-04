unit Classes.BlockChain;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TInputs = class;
  TOut = class;
  TPrevOut = class;
  TSpendingOutpoints = class;

  TSpendingOutpoints = class
  private
    FN: Integer;
    [JSONName('tx_index')]
    FTxIndex: Int64;
  published
    property N: Integer read FN write FN;
    property TxIndex: Int64 read FTxIndex write FTxIndex;
  end;
  
  TOut = class(TJsonDTO)
  private
    FAddr: string;
    FN: Integer;
    FScript: string;
    [JSONName('spending_outpoints'), JSONMarshalled(False)]
    FSpendingOutpointsArray: TArray<TSpendingOutpoints>;
    [GenericListReflect]
    FSpendingOutpoints: TObjectList<TSpendingOutpoints>;
    FSpent: Boolean;
    [JSONName('tx_index')]
    FTxIndex: Int64;
    FType: Integer;
    FValue: Integer;
    function GetSpendingOutpoints: TObjectList<TSpendingOutpoints>;
  protected
    function GetAsJson: string; override;
  published
    property Addr: string read FAddr write FAddr;
    property N: Integer read FN write FN;
    property Script: string read FScript write FScript;
    property SpendingOutpoints: TObjectList<TSpendingOutpoints> read GetSpendingOutpoints;
    property Spent: Boolean read FSpent write FSpent;
    property TxIndex: Int64 read FTxIndex write FTxIndex;
    property &Type: Integer read FType write FType;
    property Value: Integer read FValue write FValue;
  public
    destructor Destroy; override;
  end;
  
  TPrevOut = class(TJsonDTO)
  private
    FAddr: string;
    FN: Integer;
    FScript: string;
    [JSONName('spending_outpoints'), JSONMarshalled(False)]
    FSpendingOutpointsArray: TArray<TSpendingOutpoints>;
    [GenericListReflect]
    FSpendingOutpoints: TObjectList<TSpendingOutpoints>;
    FSpent: Boolean;
    [JSONName('tx_index')]
    FTxIndex: Int64;
    FType: Integer;
    FValue: Integer;
    function GetSpendingOutpoints: TObjectList<TSpendingOutpoints>;
  protected
    function GetAsJson: string; override;
  published
    property Addr: string read FAddr write FAddr;
    property N: Integer read FN write FN;
    property Script: string read FScript write FScript;
    property SpendingOutpoints: TObjectList<TSpendingOutpoints> read GetSpendingOutpoints;
    property Spent: Boolean read FSpent write FSpent;
    property TxIndex: Int64 read FTxIndex write FTxIndex;
    property &Type: Integer read FType write FType;
    property Value: Integer read FValue write FValue;
  public
    destructor Destroy; override;
  end;
  
  TInputs = class
  private
    FIndex: Integer;
    [JSONName('prev_out')]
    FPrevOut: TPrevOut;
    FScript: string;
    FSequence: Int64;
    FWitness: string;
  published
    property Index: Integer read FIndex write FIndex;
    property PrevOut: TPrevOut read FPrevOut;
    property Script: string read FScript write FScript;
    property Sequence: Int64 read FSequence write FSequence;
    property Witness: string read FWitness write FWitness;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TTx = class(TJsonDTO)
  private
    [JSONName('block_height')]
    FBlockHeight: Integer;
    [JSONName('block_index')]
    FBlockIndex: Integer;
    [JSONName('double_spend')]
    FDoubleSpend: Boolean;
    FFee: Integer;
    FHash: string;
    [JSONName('inputs'), JSONMarshalled(False)]
    FInputsArray: TArray<TInputs>;
    [GenericListReflect]
    FInputs: TObjectList<TInputs>;
    [JSONName('lock_time')]
    FLockTime: Integer;
    [JSONName('out'), JSONMarshalled(False)]
    FOutArray: TArray<TOut>;
    [GenericListReflect]
    FOut: TObjectList<TOut>;
    [JSONName('relayed_by')]
    FRelayedBy: string;
    FSize: Integer;
    FTime: Integer;
    [JSONName('tx_index')]
    FTxIndex: Int64;
    FVer: Integer;
    [JSONName('vin_sz')]
    FVinSz: Integer;
    [JSONName('vout_sz')]
    FVoutSz: Integer;
    FWeight: Integer;
    function GetInputs: TObjectList<TInputs>;
    function GetOut: TObjectList<TOut>;
  protected
    function GetAsJson: string; override;
  published
    property BlockHeight: Integer read FBlockHeight write FBlockHeight;
    property BlockIndex: Integer read FBlockIndex write FBlockIndex;
    property DoubleSpend: Boolean read FDoubleSpend write FDoubleSpend;
    property Fee: Integer read FFee write FFee;
    property Hash: string read FHash write FHash;
    property Inputs: TObjectList<TInputs> read GetInputs;
    property LockTime: Integer read FLockTime write FLockTime;
    property &Out: TObjectList<TOut> read GetOut;
    property RelayedBy: string read FRelayedBy write FRelayedBy;
    property Size: Integer read FSize write FSize;
    property Time: Integer read FTime write FTime;
    property TxIndex: Int64 read FTxIndex write FTxIndex;
    property Ver: Integer read FVer write FVer;
    property VinSz: Integer read FVinSz write FVinSz;
    property VoutSz: Integer read FVoutSz write FVoutSz;
    property Weight: Integer read FWeight write FWeight;
  public
    destructor Destroy; override;
  end;
  
  TBlockChain = class(TJsonDTO)
  private
    FBits: Integer;
    [JSONName('block_index')]
    FBlockIndex: Integer;
    FFee: Integer;
    FHash: string;
    FHeight: Integer;
    [JSONName('main_chain')]
    FMainChain: Boolean;
    [JSONName('mrkl_root')]
    FMrklRoot: string;
    [JSONName('n_tx')]
    FNTx: Integer;
    [JSONName('next_block')]
    FNextBlockArray: TArray<string>;
    [JSONMarshalled(False)]
    FNextBlock: TList<string>;
    FNonce: Int64;
    [JSONName('prev_block')]
    FPrevBlock: string;
    FSize: Integer;
    FTime: Integer;
    [JSONName('tx'), JSONMarshalled(False)]
    FTxArray: TArray<TTx>;
    [GenericListReflect]
    FTx: TObjectList<TTx>;
    FVer: Integer;
    FWeight: Integer;
    function GetNextBlock: TList<string>;
    function GetTx: TObjectList<TTx>;
  protected
    function GetAsJson: string; override;
  published
    property Bits: Integer read FBits write FBits;
    property BlockIndex: Integer read FBlockIndex write FBlockIndex;
    property Fee: Integer read FFee write FFee;
    property Hash: string read FHash write FHash;
    property Height: Integer read FHeight write FHeight;
    property MainChain: Boolean read FMainChain write FMainChain;
    property MrklRoot: string read FMrklRoot write FMrklRoot;
    property NTx: Integer read FNTx write FNTx;
    property NextBlock: TList<string> read GetNextBlock;
    property Nonce: Int64 read FNonce write FNonce;
    property PrevBlock: string read FPrevBlock write FPrevBlock;
    property Size: Integer read FSize write FSize;
    property Time: Integer read FTime write FTime;
    property Tx: TObjectList<TTx> read GetTx;
    property Ver: Integer read FVer write FVer;
    property Weight: Integer read FWeight write FWeight;
  public
    destructor Destroy; override;
  end;
  
implementation

{ TOut }

destructor TOut.Destroy;
begin
  GetSpendingOutpoints.Free;
  inherited;
end;

function TOut.GetSpendingOutpoints: TObjectList<TSpendingOutpoints>;
begin
  Result := ObjectList<TSpendingOutpoints>(FSpendingOutpoints, FSpendingOutpointsArray);
end;

function TOut.GetAsJson: string;
begin
  RefreshArray<TSpendingOutpoints>(FSpendingOutpoints, FSpendingOutpointsArray);
  Result := inherited;
end;

{ TPrevOut }

destructor TPrevOut.Destroy;
begin
  GetSpendingOutpoints.Free;
  inherited;
end;

function TPrevOut.GetSpendingOutpoints: TObjectList<TSpendingOutpoints>;
begin
  Result := ObjectList<TSpendingOutpoints>(FSpendingOutpoints, FSpendingOutpointsArray);
end;

function TPrevOut.GetAsJson: string;
begin
  RefreshArray<TSpendingOutpoints>(FSpendingOutpoints, FSpendingOutpointsArray);
  Result := inherited;
end;

{ TInputs }

constructor TInputs.Create;
begin
  inherited;
  FPrevOut := TPrevOut.Create;
end;

destructor TInputs.Destroy;
begin
  FPrevOut.Free;
  inherited;
end;

{ TTx }

destructor TTx.Destroy;
begin
  GetInputs.Free;
  GetOut.Free;
  inherited;
end;

function TTx.GetInputs: TObjectList<TInputs>;
begin
  Result := ObjectList<TInputs>(FInputs, FInputsArray);
end;

function TTx.GetOut: TObjectList<TOut>;
begin
  Result := ObjectList<TOut>(FOut, FOutArray);
end;

function TTx.GetAsJson: string;
begin
  RefreshArray<TInputs>(FInputs, FInputsArray);
  RefreshArray<TOut>(FOut, FOutArray);
  Result := inherited;
end;

{ TRoot }

destructor TBlockChain.Destroy;
begin
  GetNextBlock.Free;
  GetTx.Free;
  inherited;
end;

function TBlockChain.GetNextBlock: TList<string>;
begin
  Result := List<string>(FNextBlock, FNextBlockArray);
end;

function TBlockChain.GetTx: TObjectList<TTx>;
begin
  Result := ObjectList<TTx>(FTx, FTxArray);
end;

function TBlockChain.GetAsJson: string;
begin
  RefreshArray<string>(FNextBlock, FNextBlockArray);
  RefreshArray<TTx>(FTx, FTxArray);
  Result := inherited;
end;

end.
