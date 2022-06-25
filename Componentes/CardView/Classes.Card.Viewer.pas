unit Classes.Card.Viewer;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Graphics,
  Vcl.Dialogs, System.IOUtils, System.Types, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  System.Generics.Collections;


type
  TCardViewer = class(TCustomPanel)
  public const
    PROPORCAO_IMAGEM_PADRAO = 8;
    MARGEM_DEFAULT = 20;
  protected
    procedure Resize; override;
    procedure DoImagemClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FProporcaoPrincipal: Integer;
    FImagemPrincipal: TImage;
    FImagemDireita: TImage;
    FImagemEsquerda: TImage;
    FMargemHorizontal: Integer;
    FMargemVertical: Integer;
    FSobre: string;
    FListaImagens: TObjectList<TPicture>;
    procedure ConfiguraVisualImagens;
    procedure SelecionaImagemEsquerda;
    procedure SelecionaImagemDireita;
    procedure SetProporcaoPrincipal(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CarregaImagens;
    property ListaImagens: TObjectList<TPicture> read FListaImagens;
  published
    property ProporcaoPrincipal: Integer read FProporcaoPrincipal write SetProporcaoPrincipal default PROPORCAO_IMAGEM_PADRAO;
    property MargemHorizontal: Integer read FMargemHorizontal write FMargemHorizontal default MARGEM_DEFAULT;
    property MargemVertical: Integer read FMargemVertical write FMargemVertical default MARGEM_DEFAULT;
    property Sobre: string read FSobre; // write SetSobre; Removido para não armazenar valor
  end;


implementation

{ TCardViewer }

procedure TCardViewer.CarregaImagens;
var
  img: TObject;
begin
  if (csDesigning in Self.ComponentState) then
  begin
    Exit;
  end;

  if FListaImagens.Count = 0 then
  begin
    FImagemPrincipal.Picture.LoadFromFile('C:\Users\Dion Mai\Pictures\Saved Pictures\I1.jpg');
    FImagemEsquerda.Picture.LoadFromFile('C:\Users\Dion Mai\Pictures\Saved Pictures\I2.jpg');
    FImagemDireita.Picture.LoadFromFile('C:\Users\Dion Mai\Pictures\Saved Pictures\I3.jpg');
  end else begin

    for var localPic: TPicture in FListaImagens do
    begin
      if FListaImagens.IndexOf(localPic) = 0 then
        FImagemEsquerda.Picture.Assign(localPic);

      if FListaImagens.IndexOf(localPic) = 1 then
        FImagemPrincipal.Picture.Assign(localPic);

      if FListaImagens.IndexOf(localPic) = 2 then
        FImagemDireita.Picture.Assign(localPic);
    end;
  end;
end;

procedure TCardViewer.ConfiguraVisualImagens;
begin
  FImagemPrincipal.Margins.Left := (Self.Width div FProporcaoPrincipal) + FMargemHorizontal;
  FImagemPrincipal.Margins.Right := (Self.Width div FProporcaoPrincipal) + FMargemHorizontal;
  FImagemPrincipal.Margins.Top := FMargemVertical;
  FImagemPrincipal.Margins.Bottom := FMargemVertical;

  FImagemEsquerda.Left := FMargemHorizontal;
  FImagemEsquerda.Top := FImagemPrincipal.Top + (FMargemVertical * 2);
  FImagemEsquerda.Width := FImagemPrincipal.Width - (FMargemHorizontal * 2);
  FImagemEsquerda.Height := FImagemPrincipal.Height - (FMargemVertical * 4);

  FImagemDireita.Top := FImagemPrincipal.Top + (FMargemVertical * 2);
  FImagemDireita.Width := FImagemPrincipal.Width - (FMargemHorizontal * 2);
  FImagemDireita.Left := Self.Width - (FImagemDireita.Width +  FMargemHorizontal);
  FImagemDireita.Height := FImagemPrincipal.Height - (FMargemVertical * 4);
end;

constructor TCardViewer.Create(AOwner: TComponent);
begin
  inherited;
  FProporcaoPrincipal := PROPORCAO_IMAGEM_PADRAO;
  FMargemHorizontal := MARGEM_DEFAULT;
  FMargemVertical := MARGEM_DEFAULT;
  FListaImagens := TObjectList<TPicture>.Create;

  FImagemPrincipal := TImage.Create(Self);
  FImagemPrincipal.Parent := Self;
  FImagemPrincipal.Align := alClient;
  FImagemPrincipal.Stretch := True;
  FImagemPrincipal.AlignWithMargins := True;

  FImagemEsquerda := TImage.Create(Self);
  FImagemEsquerda.Parent := Self;
  FImagemEsquerda.Stretch := True;
  FImagemEsquerda.Cursor := crHandPoint;
  FImagemEsquerda.OnMouseDown := DoImagemClick;

  FImagemDireita := TImage.Create(Self);
  FImagemDireita.Parent := Self;
  FImagemDireita.Stretch := True;
  FImagemDireita.Cursor := crHandPoint;
  FImagemDireita.OnMouseDown := DoImagemClick;

  ConfiguraVisualImagens;
  CarregaImagens;
end;

destructor TCardViewer.Destroy;
begin
  FListaImagens.Free;
  inherited;
end;

procedure TCardViewer.DoImagemClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender = FImagemEsquerda then
  begin
    SelecionaImagemEsquerda;
  end;

  if Sender = FImagemDireita then
  begin
    SelecionaImagemDireita;
  end;
end;

procedure TCardViewer.Resize;
begin
  inherited;
  ConfiguraVisualImagens;
  FImagemPrincipal.BringToFront;
end;

procedure TCardViewer.SelecionaImagemDireita;
begin
  if FImagemDireita.Picture.Height = 0 then
  begin
    Exit;  // Sem Imagem
  end;

  var tempImage: TPicture := TPicture.Create;
  tempImage.Assign(FImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(FImagemDireita.Picture);
  FImagemDireita.Picture.Assign(tempImage);
  tempImage.Free;
end;

procedure TCardViewer.SelecionaImagemEsquerda;
begin
  if FImagemEsquerda.Picture.Height = 0 then
  begin
    Exit;  // Sem Imagem
  end;

  var tempImage: TPicture := TPicture.Create;
  tempImage.Assign(FImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(FImagemEsquerda.Picture);
  FImagemEsquerda.Picture.Assign(tempImage);
  tempImage.Free;
end;

procedure TCardViewer.SetProporcaoPrincipal(const Value: Integer);
begin
  FProporcaoPrincipal := Value;
  Resize;
end;

end.
