unit Classes.BlockIntern;

interface

uses
  System.Generics.Collections;

type
  TBlockIntern = class
  private
    FHash: string;
    FSize: Integer;
    FWeight: Integer;
    FVer: Integer;
    FProximoBlock: string;
  public
    property Hash: string read FHash write FHash;
    property Size: Integer read FSize write FSize;
    property Weight: Integer read FWeight write FWeight;
    property Ver: Integer read FVer write FVer;
    property ProximoBlock: string read FProximoBlock write FProximoBlock;
  end;

  TListaBlock = class(TList<TBlockIntern>)
  end;


implementation

end.
