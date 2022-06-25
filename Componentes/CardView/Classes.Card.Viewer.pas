unit Classes.Card.Viewer;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Graphics,
  Vcl.Dialogs, System.IOUtils, System.Types, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  System.Generics.Collections;


type
  TSentidoMovimento = (Direita, Esquerda);

  TCardViewer = class(TCustomPanel)
  public const
    PROPORCAO_IMAGEM_PADRAO = 8;
    MARGEM_DEFAULT = 20;
    INTERVALO_SEGUNDOS_DEFAULT = 5;
  private
    FProporcaoPrincipal: Integer;
    FTimer: TTimer;
    FImagemPrincipal: TImage;
    FImagemDireita: TImage;
    FImagemEsquerda: TImage;
    FMargemHorizontal: Integer;
    FMargemVertical: Integer;
    FSobre: string;
    FListaImagens: TObjectList<TPicture>;
    FSentidoMovimento: TSentidoMovimento;
    procedure ConfiguraVisualImagens;
    procedure SelecionaImagemEsquerda;
    procedure SelecionaImagemDireita;
    procedure SetProporcaoPrincipal(const Value: Integer);
    procedure IncImageIndex(Img: TImage);
    procedure DecImageIndex(Img: TImage);
    procedure AtualizaImagensPorIndex;
    procedure DoTimer(Sender: TObject);
    function GetApresentacao: Boolean;
    procedure SetApresentacao(const Value: Boolean);
    function GetIntervalo: Cardinal;
    procedure SetIntervalo(const Value: Cardinal);
  protected
    procedure Resize; override;
    procedure DoImagemClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CarregaImagens(dir: string = '');
    property ListaImagens: TObjectList<TPicture> read FListaImagens;
  published
    property ProporcaoPrincipal: Integer read FProporcaoPrincipal write SetProporcaoPrincipal default PROPORCAO_IMAGEM_PADRAO;
    property MargemHorizontal: Integer read FMargemHorizontal write FMargemHorizontal default MARGEM_DEFAULT;
    property MargemVertical: Integer read FMargemVertical write FMargemVertical default MARGEM_DEFAULT;
    property Apresentacao: Boolean read GetApresentacao write SetApresentacao default False;
    property Intervalo: Cardinal read GetIntervalo write SetIntervalo default INTERVALO_SEGUNDOS_DEFAULT;
    property Sobre: string read FSobre; // write SetSobre; Removido para não armazenar valor
    property SentidoMovimento: TSentidoMovimento read FSentidoMovimento write FSentidoMovimento default TSentidoMovimento.Direita;
  end;


implementation

{ TCardViewer }

procedure TCardViewer.AtualizaImagensPorIndex;
begin
  FImagemEsquerda.Picture.Assign(FListaImagens.Items[FImagemEsquerda.Tag]);
  FImagemPrincipal.Picture.Assign(FListaImagens.Items[FImagemPrincipal.Tag]);
  FImagemDireita.Picture.Assign(FListaImagens.Items[FImagemDireita.Tag]);
end;

procedure TCardViewer.CarregaImagens(dir: string);
begin
  if (csDesigning in Self.ComponentState) then
  begin
    Exit;
  end;

  if dir <> '' then
  begin
    FListaImagens.Clear;

    var arqs: TStringDynArray := TDirectory.GetFiles(dir); // '*.jpg'
    for var arq: string in arqs do
    begin
      if (ExtractFileExt(arq) = '.jpg')
        or (ExtractFileExt(arq) = '.bmp')
        or (ExtractFileExt(arq) = '.png') then
      begin
        var pic: TPicture := TPicture.Create;
        pic.LoadFromFile(arq);
        FListaImagens.Add(pic);
      end;
    end;
  end;

  for var localPic: TPicture in FListaImagens do
  begin
    if FListaImagens.IndexOf(localPic) = 0 then
    begin
      FImagemEsquerda.Picture.Assign(localPic);
      FImagemEsquerda.Tag := 0;
    end;

    if FListaImagens.IndexOf(localPic) = 1 then
    begin
      FImagemPrincipal.Picture.Assign(localPic);
      FImagemPrincipal.Tag := 1;
    end;

    if FListaImagens.IndexOf(localPic) = 2 then
    begin
      FImagemDireita.Picture.Assign(localPic);
      FImagemDireita.Tag := 2;
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

  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := INTERVALO_SEGUNDOS_DEFAULT * 1000;
  FTimer.OnTimer := DoTimer;

  ConfiguraVisualImagens;
  CarregaImagens;
end;

procedure TCardViewer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Caption := '';
  ShowCaption := False;
end;

procedure TCardViewer.DecImageIndex(Img: TImage);
begin
  Img.Tag := Img.Tag - 1;
  if Img.Tag < 0 then
  begin
    Img.Tag := FListaImagens.Count -1;
  end;
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

procedure TCardViewer.DoTimer(Sender: TObject);
begin
  case FSentidoMovimento of
    Direita: SelecionaImagemDireita;
    Esquerda: SelecionaImagemEsquerda;
  end;
end;

function TCardViewer.GetApresentacao: Boolean;
begin
  Result := FTimer.Enabled;
end;

function TCardViewer.GetIntervalo: Cardinal;
begin
  Result := FTimer.Interval div 1000;
end;

procedure TCardViewer.IncImageIndex(Img: TImage);
begin
  Img.Tag := Img.Tag + 1;
  if Img.Tag > (FListaImagens.Count - 1) then
  begin
    Img.Tag := 0;
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

  IncImageIndex(FImagemDireita);
  IncImageIndex(FImagemPrincipal);
  IncImageIndex(FImagemEsquerda);

  AtualizaImagensPorIndex;
end;

procedure TCardViewer.SelecionaImagemEsquerda;
begin
  if FImagemEsquerda.Picture.Height = 0 then
  begin
    Exit;  // Sem Imagem
  end;

  DecImageIndex(FImagemDireita);
  DecImageIndex(FImagemPrincipal);
  DecImageIndex(FImagemEsquerda);

  AtualizaImagensPorIndex;
end;

procedure TCardViewer.SetApresentacao(const Value: Boolean);
begin
  FTimer.Enabled := Value;
end;

procedure TCardViewer.SetIntervalo(const Value: Cardinal);
begin
  FTimer.Interval := Value * 1000;
end;

procedure TCardViewer.SetProporcaoPrincipal(const Value: Integer);
begin
  FProporcaoPrincipal := Value;
  Resize;
end;

end.
