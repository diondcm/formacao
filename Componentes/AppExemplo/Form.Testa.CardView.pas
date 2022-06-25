unit Form.Testa.CardView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Classes.Card.Viewer, Vcl.Samples.Spin, Vcl.ComCtrls,
  System.Generics.Collections;

type
  TfrmTestaCardView = class(TForm)
    Panel1: TPanel;
    ButtonCriaCard: TButton;
    Button2: TButton;
    SpinEditProporcao: TSpinEdit;
    PanelMensagem: TPanel;
    ButtonCarregaLista: TButton;
    CheckBoxApresentacao: TCheckBox;
    SpinEditIntervalo: TSpinEdit;
    RadioButtonParaDireita: TRadioButton;
    RadioButtonParaEsquerda: TRadioButton;
    procedure ButtonCriaCardClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonCarregaListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxApresentacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCardView: TCardViewer;
  end;

var
  frmTestaCardView: TfrmTestaCardView;

implementation

{$R *.dfm}

procedure TfrmTestaCardView.ButtonCriaCardClick(Sender: TObject);
begin
//  Prop Default:
//  var stl: TStringList := TStringList.Create;
//  stl[1];
//  stl.Strings[1];

  PanelMensagem.Visible := False;

  FCardView := TCardViewer.Create(Self);
  FCardView.Parent := Self;
  FCardView.Align := alClient;
  FCardView.AlignWithMargins := True;
end;

procedure TfrmTestaCardView.CheckBoxApresentacaoClick(Sender: TObject);
begin
  if RadioButtonParaDireita.Checked then
  begin
    FCardView.SentidoMovimento := TSentidoMovimento.Direita;
  end;
  if RadioButtonParaEsquerda.Checked then
  begin
    FCardView.SentidoMovimento := TSentidoMovimento.Esquerda;
  end;

  FCardView.Intervalo := SpinEditIntervalo.Value;
  FCardView.Apresentacao := CheckBoxApresentacao.Checked;
end;

procedure TfrmTestaCardView.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmTestaCardView.Button2Click(Sender: TObject);
begin
  if FCardView.ProporcaoPrincipal = FCardView.PROPORCAO_IMAGEM_PADRAO then
  begin
    FCardView.ProporcaoPrincipal := SpinEditProporcao.Value;
  end else begin
    FCardView.ProporcaoPrincipal := FCardView.PROPORCAO_IMAGEM_PADRAO;
  end;
end;

procedure TfrmTestaCardView.ButtonCarregaListaClick(Sender: TObject);
begin
  ButtonCriaCard.Click;

//  for var i: Integer := 1 to 9 do
//  begin
//    var pic: TPicture := TPicture.Create;
//    pic.LoadFromFile('C:\Users\Dion Mai\Pictures\Saved Pictures\I' + IntToStr(i) + '.jpg');
//    FCardView.ListaImagens.Add(pic);
//  end;

  FCardView.CarregaImagens('C:\Users\Dion Mai\Pictures\Testes');
end;

end.
