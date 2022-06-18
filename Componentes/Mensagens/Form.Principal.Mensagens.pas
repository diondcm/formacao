unit Form.Principal.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Form.Panel.Message, System.Generics.Collections;

const
  WM_BASE = WM_APP + WM_USER;
  WM_AVISO = WM_BASE + 1;
  WM_ATUALIZACAO = WM_BASE + 2;

type
  TfrmPrincipalMensagens = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CheckBoxAtivar: TCheckBox;
    ListBoxClasses: TListBox;
    FlowPanel1: TFlowPanel;
    TimerBusca: TTimer;
    PanelParent: TPanel;
    ButtonPanelMessage: TButton;
    ButtonClose: TButton;
    ButtonShake: TButton;
    ButtonSendText: TButton;
    ButtonClick: TButton;
    Panel5: TPanel;
    Label1: TLabel;
    StaticText1: TStaticText;
    DBGrid1: TDBGrid;
    EditSendText: TEdit;
    ButtonSetParent: TButton;
    ButtonAviso: TButton;
    ButtonSendAviso: TButton;
    ButtonPostAviso: TButton;
    ButtonPerformAviso: TButton;
    Button1: TButton;
    Edit1: TEdit;
    procedure ButtonCloseClick(Sender: TObject);
    procedure CheckBoxAtivarClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure ButtonPanelMessageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonShakeClick(Sender: TObject);
    procedure ButtonSendTextClick(Sender: TObject);
    procedure ButtonClickClick(Sender: TObject);
    procedure ButtonSetParentClick(Sender: TObject);
    procedure ButtonAvisoClick(Sender: TObject);
    procedure ButtonSendAvisoClick(Sender: TObject);
    procedure ButtonPostAvisoClick(Sender: TObject);
    procedure ButtonPerformAvisoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FListaJanelas: TDictionary<string, HWND>;
    function GetWinHandle: HWND;
    function Aviso(p1, p2: NativeUint): NativeUint;
  public
    procedure WMAviso(var Message: TMessage); message WM_AVISO;
  end;

var
  frmPrincipalMensagens: TfrmPrincipalMensagens;
  OldWndProc: TFarProc;

implementation

{$R *.dfm}

function HookWndProc(HWD: HWND; msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT stdcall;
begin
  if msg = WM_KEYDOWN then
  begin
    SetWindowText(frmPrincipalMensagens.EditSendText.Handle, PChar('Tecla: ' + Chr(wParam)));
  end;
  Result := CallWindowProc(OldWndProc, HWD, msg, wParam, lParam);
end;

function TfrmPrincipalMensagens.Aviso(p1, p2: NativeUint): NativeUint;
begin
  ShowMessage('Aviso!' + sLineBreak + 'p1: ' + IntToStr(p1) + sLineBreak + 'p2: '+ IntToStr(p2));
  Result := p1 + p2 + 5000;
end;

procedure TfrmPrincipalMensagens.Button1Click(Sender: TObject);
begin
  OldWndProc := TFarProc(GetWindowLongPtr(GetWinHandle, GWL_WNDPROC));
  SetWindowLongPtr(GetWinHandle, GWL_WNDPROC, LongInt(@HookWndProc));
  Caption := TimeToStr(Now) +  ' Ok!';
end;

procedure TfrmPrincipalMensagens.ButtonAvisoClick(Sender: TObject);
begin
  Caption := TimeToStr(Now) + ' ' + IntToStr(Aviso(1, 1));
end;

procedure TfrmPrincipalMensagens.ButtonClickClick(Sender: TObject);
begin
  SendMessage(GetWinHandle, WM_LBUTTONDOWN, 0, 0);
  Sleep(100);
  SendMessage(GetWinHandle, WM_LBUTTONUP, 0, 0);
end;

procedure TfrmPrincipalMensagens.ButtonCloseClick(Sender: TObject);
begin
  SendMessage(GetWinHandle, WM_CLOSE, 0, 0);
end;

procedure TfrmPrincipalMensagens.ButtonPanelMessageClick(Sender: TObject);
begin
  frmPanelMessage.Show;
end;

procedure TfrmPrincipalMensagens.ButtonPerformAvisoClick(Sender: TObject);
begin
  var val: Integer := 1000 + Random(4000);
  var resultado: NativeUInt := Perform(WM_AVISO, val, 512);
  Caption := TimeToStr(Now) + ' ' + resultado.ToString;
end;

procedure TfrmPrincipalMensagens.ButtonPostAvisoClick(Sender: TObject);
begin
  var val: Integer := 1000 + Random(4000);
  var resultado: LongBool := PostMessage(Self.Handle, WM_AVISO, val, 512);
  Caption := TimeToStr(Now) + ' ' + resultado.ToString;
end;

procedure TfrmPrincipalMensagens.ButtonSendAvisoClick(Sender: TObject);
begin
  var val: Integer := 1000 + Random(4000);
  var resultado: NativeUInt := SendMessage(Self.Handle, WM_AVISO, val, 512);
  Caption := TimeToStr(Now) + ' ' + resultado.ToString;
end;

procedure TfrmPrincipalMensagens.ButtonSendTextClick(Sender: TObject);
begin
  SetWindowText(GetWinHandle, EditSendText.Text);
end;

procedure TfrmPrincipalMensagens.ButtonSetParentClick(Sender: TObject);
begin
  Winapi.Windows.SetParent(GetWinHandle, PanelParent.Handle);
end;

procedure TfrmPrincipalMensagens.ButtonShakeClick(Sender: TObject);

  procedure WindowShake(hwd: HWND);
  const
    MAXDELTA = 4;
    SHAKETIMES = 200;
  var
    originalRect: TRect;
    dstRect: TRect;
    deltaX: Integer;
    deltaY: Integer;
    dx, dy: Integer;
  begin
    GetWindowRect(hwd, originalRect);
    dstRect := originalRect;

    Randomize;
    for var cnt: Integer := 0 to SHAKETIMES do
    begin
      Sleep(1);
      deltaX := Round(Random(MAXDELTA));
      deltaY := Round(Random(MAXDELTA));

      dx:= Round(1 + Random(2));
      if dx = 2 then dx := -1;

      dy := Round(1 + Random(2));
      if dy = 2 then dy := -1;

      OffsetRect(dstRect, dx * deltaX, dy * deltaY);
      MoveWindow(hwd, dstRect.Left, dstRect.Top, dstRect.Right - dstRect.Left, dstRect.Bottom - dstRect.Top, True);
    end;

    MoveWindow(hwd, originalRect.Left, originalRect.Top, originalRect.Right - originalRect.Left, originalRect.Bottom - originalRect.Top, True);
  end;

begin
  WindowShake(GetWinHandle);
end;

procedure TfrmPrincipalMensagens.CheckBoxAtivarClick(Sender: TObject);
begin
  TimerBusca.Enabled := CheckBoxAtivar.Checked;
end;

procedure TfrmPrincipalMensagens.FormCreate(Sender: TObject);
begin
  FListaJanelas := TDictionary<string, HWND>.Create;
end;

procedure TfrmPrincipalMensagens.FormDestroy(Sender: TObject);
begin
  FListaJanelas.Free;
end;

function TfrmPrincipalMensagens.GetWinHandle: HWND;
begin
  Result := 0;
  if ListBoxClasses.ItemIndex > -1 then
  begin
    if FListaJanelas.ContainsKey(ListBoxClasses.Items[ListBoxClasses.ItemIndex]) then
    begin
      Result := FListaJanelas[ListBoxClasses.Items[ListBoxClasses.ItemIndex]];
    end;
  end;
end;

procedure TfrmPrincipalMensagens.TimerBuscaTimer(Sender: TObject);
var
  point: TPoint;
  winHandle: HWND;
  arrCaption: array [0..255] of Char;
begin
  GetCursorPos(point);
  winHandle := WindowFromPoint(point);

  GetWindowText(winHandle, @arrCaption, Length(arrCaption));
  var winCaption: string := string(arrCaption);

  GetClassName(winHandle, @arrCaption, Length(arrCaption));
  var winClass: string := string(arrCaption);

  var nomeJanela: string := winClass + ' - ' + winCaption;

  if ListBoxClasses.Items.IndexOf(nomeJanela) = -1 then
    ListBoxClasses.Items.Add(nomeJanela);

  if not FListaJanelas.ContainsKey(nomeJanela) then
  begin
    FListaJanelas.Add(nomeJanela, winHandle);
  end;
end;

procedure TfrmPrincipalMensagens.WMAviso(var Message: TMessage);
begin
  Message.Result := Aviso(Message.WParam, Message.LParam);
end;

end.
