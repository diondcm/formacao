unit Form.Classes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  { Meta classe = Classe Abstrata }
  TAnimal = class
  private
    FNome: string;
    FID: Int64;
    FRaca: string;
  public
    procedure Nadar; virtual; abstract;
    property Nome: string read FNome write FNome;
    property Raca: string read FRaca write FRaca;
    property ID: Int64 read FID write FID;
  end;

  TMamifero = class(TAnimal)
  private
    FMesesAmamentacao: Integer;
  public
    procedure Correr; virtual;
    property MesesAmamentacao: Integer read FMesesAmamentacao write FMesesAmamentacao;
  end;

  TGato = class(TMamifero)
  private
    FTipoPelo: string;
  public
    procedure Nadar; override;
    property TipoPelo: string read FTipoPelo write FTipoPelo;
  end;

  TCachorro = class(TMamifero)
  private
    FColeira: Boolean;
  public
    procedure Latir;
    procedure Nadar; override;
    procedure Correr; override;
    property Coleira: Boolean read FColeira write FColeira;
  end;

  TPeixe = class(TAnimal)
  private
    FTipoRacao: Integer;
    FDeveFicarSo: Boolean;
  public
    property TipoRacao: Integer read FTipoRacao write FTipoRacao;
    property DeveFicarSo: Boolean read FDeveFicarSo write FDeveFicarSo;
  end;

  TfrmCalsses = class(TForm)
    ButtonCachorro: TButton;
    ButtonGato: TButton;
    Memo1: TMemo;
    procedure ButtonCachorroClick(Sender: TObject);
    procedure ButtonGatoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalsses: TfrmCalsses;

implementation

{$R *.dfm}

{ TCachorro }

procedure TCachorro.Correr;
begin
  ShowMessage('Correr');
end;

procedure TCachorro.Latir;
begin
  ShowMessage('Latir');
end;

procedure TCachorro.Nadar;
begin
  ShowMessage('Cachorro: Nada');
end;

procedure TfrmCalsses.ButtonCachorroClick(Sender: TObject);
begin
  var cao: TCachorro := TCachorro.Create;
  cao.ID := GetTickCount;
  cao.Latir;
  cao.Correr;
  cao.Free;
end;

{ TGato }

procedure TGato.Nadar;
begin
  ShowMessage(ClassName + ' nada');
end;

procedure TfrmCalsses.ButtonGatoClick(Sender: TObject);
begin
  var g: TGato := TGato.Create;
  g.ID := GetTickCount;
  g.Nadar;
  g.Correr;
  g.Free;
end;

{ TMamifero }

procedure TMamifero.Correr;
begin
  // Não faz nada!
end;

end.
