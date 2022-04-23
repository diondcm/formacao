unit Form.Generico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections,
  Classes.Mensagem, Form.Testes, Form.Base, Vcl.ComCtrls;

type
  TfrmGenerico = class(TfrmBase)
    PanelControles: TPanel;
    ListBoxCores: TListBox;
    PanelCor: TPanel;
    ColorBox1: TColorBox;
    EditNomeCor: TEdit;
    ButtonInsereCor: TButton;
    TimerTeste: TTimer;
    Button1: TButton;
    procedure ButtonInsereCorClick(Sender: TObject);
    procedure ListBoxCoresClick(Sender: TObject);
    procedure EditNomeCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerTesteTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FListaCores: TDictionary<string, TColor>;
  public
    { Public declarations }
    procedure Teste;
  end;

var
  frmGenerico: TfrmGenerico;

implementation

{$R *.dfm}

procedure TfrmGenerico.Button1Click(Sender: TObject);
begin
  frmTestes.Show;
end;

procedure TfrmGenerico.ButtonInsereCorClick(Sender: TObject);
//var
//  msg: TMensagem;
begin
// Muita identação:
//  if EditNomeCor.Text <> '' then
//  begin
//    if EditNomeCor.Tag <> 0 then
//      if EditNomeCor.Text <> '' then
//        if EditNomeCor.Text <> '' then
//          if EditNomeCor.Text <> '' then
//            if EditNomeCor.Text <> '' then
//  end else begin

  if EditNomeCor.Text = '' then
  begin
//    ShowMessage('Informe o nome da cor', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
//    MessageDlg(Caption + ' ' + TimeToStr(Now))

//    msg := TMensagem.Create;
//    msg.Aviso('Informe o nome da cor');
//    msg.Free;

    TMensagem.Aviso('Informe o nome da cor', True);
//    Application.MessageBox('Informe o nome da cor', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
//    Exit;
  end;

  if FListaCores.ContainsKey(EditNomeCor.Text) then
  begin
    TMensagem.Aviso('Nome da cor já informado', True);
//    Application.MessageBox('Nome da cor já informado', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
//    Exit;
  end;

  if FListaCores.ContainsValue(ColorBox1.Selected) then
  begin
    TMensagem.Aviso('Cor já cadastrada', True);
//    Application.MessageBox('Cor já cadastrada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
//    Exit;
  end;

  ListBoxCores.Items.Add(EditNomeCor.Text);
  FListaCores.Add(EditNomeCor.Text, ColorBox1.Selected);

//  ListBoxCores.Items.AddObject(EditNomeCor.Text, TObject(ColorBox1.Selected));

  // StringList com as cores
  // DataSet
  // cast em te object
end;

procedure TfrmGenerico.EditNomeCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonInsereCorClick(Sender);
  end;
end;

procedure TfrmGenerico.FormCreate(Sender: TObject);
begin
{$WARN SYMBOL_PLATFORM OFF}
  if DebugHook > 0  then
  begin
    TimerTeste.Enabled := True;
    ReportMemoryLeaksOnShutdown := True;
  end;
{$WARN SYMBOL_PLATFORM ON}

//{$IFDEF DEBUG}
//  TimerTeste.Enabled := True;
//{$ENDIF}

  FListaCores := TDictionary<string, TColor>.Create;
end;

procedure TfrmGenerico.FormDestroy(Sender: TObject);
begin
  FListaCores.Free;
end;

procedure TfrmGenerico.ListBoxCoresClick(Sender: TObject);
begin
//  PanelCor.Color := TColor(ListBoxCores.Items.Objects[ListBoxCores.ItemIndex]);
  PanelCor.Color := FListaCores[ListBoxCores.Items[ListBoxCores.ItemIndex]];
end;

procedure TfrmGenerico.Teste;
begin
  Abort;
end;

procedure TfrmGenerico.TimerTesteTimer(Sender: TObject);
begin
  TimerTeste.Enabled := False;

  ColorBox1.Selected := clNavy;
  EditNomeCor.Text := 'Em Analise';
  ButtonInsereCor.Click;

  ColorBox1.Selected := clGreen;
  EditNomeCor.Text := 'Aprovado';
  ButtonInsereCor.Click;

  ColorBox1.Selected := clBlack;
  EditNomeCor.Text := '';
end;

end.
