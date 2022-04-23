unit Form.Classes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Form.Base, Vcl.ExtCtrls;

type
  { Meta classe = Classe Abstrata }
  TAnimal = class//(TObject)
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
    procedure Correr; override;
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

  TfrmClasses = class(TfrmBase)
    ButtonCachorro: TButton;
    ButtonGato: TButton;
    Memo1: TMemo;
    ButtonPassear: TButton;
    Button1: TButton;
    FDQuery1: TFDQuery;
    FDQuery1Nome: TStringField;
    FDQuery1ID: TIntegerField;
    FDQuery1Imagem: TBlobField;
    procedure ButtonCachorroClick(Sender: TObject);
    procedure ButtonGatoClick(Sender: TObject);
    procedure ButtonPassearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClasses: TfrmClasses;

implementation

{$R *.dfm}

{ TCachorro }

procedure TCachorro.Correr;
begin
  ShowMessage(ClassName + ' corre');
end;

procedure TCachorro.Latir;
begin
  ShowMessage('Latir');
end;

procedure TCachorro.Nadar;
begin
  ShowMessage('Cachorro: Nada');
end;

procedure TfrmClasses.Button1Click(Sender: TObject);
begin
  ShowMessage(Sender.ClassName);


//  Caption :=  Memo1.Lines.Text;
//  ShowMessage(Memo1.Lines.ClassName)
end;

procedure TfrmClasses.ButtonCachorroClick(Sender: TObject);
begin
  var cao: TCachorro := TCachorro.Create;
  cao.ID := GetTickCount;
  cao.Latir;
  cao.Correr;
  cao.Free;
end;

{ TGato }

procedure TGato.Correr;
begin
//  inherited;
  ShowMessage(ClassName + ' Corre!');
end;

procedure TGato.Nadar;
begin
  ShowMessage(ClassName + ' nada');
end;

procedure TfrmClasses.ButtonGatoClick(Sender: TObject);
begin
  var g: TGato := TGato.Create;
  g.ID := GetTickCount;
  g.Nadar;
  g.Correr;
  g.Free;
end;

procedure TfrmClasses.ButtonPassearClick(Sender: TObject);
begin
  var listaAnimais: TList<TMamifero> := TList<TMamifero>.Create;

  var g: TGato := TGato.Create;
  g.ID := 4455;
  g.Nome := 'Pure';
  listaAnimais.Add(g);
  
  var g2: TGato := TGato.Create;
  g2.ID := 5544;
  g2.Nome := 'Molho';
  listaAnimais.Add(g2);

  var c: TCachorro := TCachorro.Create;
  c.ID := 1133;
  c.Nome := 'Cebola';
  listaAnimais.Add(c);
  
  var c2: TCachorro := TCachorro.Create;
  c2.ID := 3311;
  c2.Nome := 'Tomate';
  listaAnimais.Add(c);
  
//  listaAnimais.Add(g); // Representa trazer os dados da origem: DB, WS, Arquivo TXT

  for var animal: TMamifero in listaAnimais do
  begin
    animal.correr;
//    if animal.ClassName = 'TGato' then
    if animal is TGato then
      ShowMessage(Animal.nome);
  end;

  {
  g.Free;
  g2.Free;

  c.Free;
  c2.Free;
  }

  listaAnimais.Free;
end;

{ TMamifero }

procedure TMamifero.Correr;
begin
  // Não faz nada!
end;

end.
