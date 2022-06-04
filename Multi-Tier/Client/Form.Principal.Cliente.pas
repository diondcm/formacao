unit Form.Principal.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Data.Validacao.Client, System.DateUtils, Data.Geral.Client, ClientModuleUnit,
  Classes.Tipos, System.Hash, Classes.BlockChain, System.JSON, REST.Json,
  Classes.BlockIntern;

type
  TfrmPrincipalCliente = class(TForm)
    PageControl: TPageControl;
    TabValidacao: TTabSheet;
    PanelCliente: TPanel;
    Label1: TLabel;
    EditCPF: TEdit;
    ButtonValidaCPF: TButton;
    LabelResultado: TLabel;
    StatusBar: TStatusBar;
    TimerStatusServer: TTimer;
    CheckBoxAtivaTimer: TCheckBox;
    PanelRequest: TPanel;
    MemoLog: TMemo;
    EditQtdThreads: TEdit;
    ButtonChamaThreads: TButton;
    TabArquivos: TTabSheet;
    Image1: TImage;
    ButtonDownloadImagem: TButton;
    Button2: TButton;
    ButtonDownloadBinario: TButton;
    MemoArquivos: TMemo;
    OpenDialogUpload: TOpenDialog;
    TabBlockChain: TTabSheet;
    MemoDados: TMemo;
    Panel1: TPanel;
    ButtonGetBlock: TButton;
    EditBlock: TEdit;
    MemoJson: TMemo;
    Splitter1: TSplitter;
    ButtonGetBlockIntern: TButton;
    ButtonListaBlock: TButton;
    procedure ButtonValidaCPFClick(Sender: TObject);
    procedure EditCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerStatusServerTimer(Sender: TObject);
    procedure CheckBoxAtivaTimerClick(Sender: TObject);
    procedure ButtonChamaThreadsClick(Sender: TObject);
    procedure ButtonDownloadImagemClick(Sender: TObject);
    procedure ButtonDownloadBinarioClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonGetBlockClick(Sender: TObject);
    procedure ButtonGetBlockInternClick(Sender: TObject);
    procedure ButtonListaBlockClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalCliente: TfrmPrincipalCliente;

implementation

{$R *.dfm}

procedure TfrmPrincipalCliente.ButtonDownloadImagemClick(Sender: TObject);
var
  size: Int64;
  stm: TStringStream;
  stmBase: TStream;
begin
  stm := TStringStream.Create;
  stmBase := ClientModule1.smArquivosClient.GetArquivo(LOGO_CLIENTE, size);
  stm.LoadFromStream(stmBase);

  stm.SaveToFile('logo-local.bmp');

  Image1.Picture.LoadFromFile('logo-local.bmp');

  stm.Free;
end;

procedure TfrmPrincipalCliente.ButtonGetBlockClick(Sender: TObject);
begin
  var block: TBlockChain := ClientModule1.smBlockChainClient.GetBlockChain(EditBlock.Text);

//  for var subBlock: TBlockChain in listaBlock{ TList<TBlockChain> >> Array: TBLockChain } do

  MemoDados.Lines.Add('Hash: ' + block.Hash);
  MemoDados.Lines.Add('Size: ' + block.Size.ToString);
  MemoDados.Lines.Add('Weight: ' + block.Weight.ToString);
  MemoDados.Lines.Add('Ver: ' + block.Ver.ToString);
  for var nextBlock: string in block.NextBlock do
  begin
    MemoDados.Lines.Add('Próximo Block: ' + nextBlock);
  end;

  MemoJson.Text := TJson.ObjectToJsonString(block);

  block.Free;
end;

procedure TfrmPrincipalCliente.ButtonGetBlockInternClick(Sender: TObject);
begin
  var block: TBlockIntern := ClientModule1.smBlockChainClient.GetBlockIntern(EditBlock.Text);
  MemoDados.Lines.Add('Hash: ' + block.Hash);
  MemoDados.Lines.Add('Size: ' + block.Size.ToString);
  MemoDados.Lines.Add('Weight: ' + block.Weight.ToString);
  MemoDados.Lines.Add('Ver: ' + block.Ver.ToString);
  MemoDados.Lines.Add('Próximo Block: ' + block.ProximoBlock);

  MemoJson.Text := TJson.ObjectToJsonString(block);

  block.Free;
end;

procedure TfrmPrincipalCliente.ButtonListaBlockClick(Sender: TObject);
begin
  var lstblock: TListaBlock := ClientModule1.smBlockChainClient.GetListBlock(EditBlock.Text);

//  for var i: Integer := 0  in Length(lstblock.ToArray) -1 do
//    var block: TBlockIntern := lstblock.ToArray[i];
  for var block: TBlockIntern in lstblock do
  begin
    MemoDados.Lines.Add('Hash: ' + block.Hash);
    MemoDados.Lines.Add('Size: ' + block.Size.ToString);
    MemoDados.Lines.Add('Weight: ' + block.Weight.ToString);
    MemoDados.Lines.Add('Ver: ' + block.Ver.ToString);
    MemoDados.Lines.Add('Próximo Block: ' + block.ProximoBlock);

    MemoJson.Lines.Add('-----------------------------');
    MemoJson.Lines.Add(TJson.ObjectToJsonString(block));
  end;
  lstblock.Free;
end;

procedure TfrmPrincipalCliente.Button2Click(Sender: TObject);
begin
  if OpenDialogUpload.Execute then
  begin
    var stm: TFileStream := TFileStream.Create(OpenDialogUpload.FileName, fmOpenRead);
    try
      ClientModule1.smArquivosClient.SetFile(LOGO_NOVO, stm);
    finally
      stm.Free;
    end;
  end;
end;

procedure TfrmPrincipalCliente.ButtonDownloadBinarioClick(Sender: TObject);
var
  size: Int64;
  stm: TStringStream;
  stmBase: TStream;
  nomeArquivo: string;
  hashLocal: string;
begin
  nomeArquivo := 'server.zip';
  stm := TStringStream.Create;
  try
    hashLocal := THashArquivo.GetFileHash(nomeArquivo);

    // if hashLocal = GetFileHash // Regra no client
    if (hashLocal = '') or ClientModule1.smArquivosClient.GetAtualizaArquivo(EXE_SERVER, hashLocal) then // Regra no server
    begin
      stmBase := ClientModule1.smArquivosClient.GetArquivo(EXE_SERVER, size);
      stm.LoadFromStream(stmBase);

      stm.SaveToFile(nomeArquivo);

      MemoArquivos.Lines.Add('Arq: ' + nomeArquivo);
      MemoArquivos.Lines.Add('Size: ' + FormatFloat('0.,', stm.Size));
    end else begin
      MemoArquivos.Lines.Add('Arquivo já atualizado');
    end;
  finally
    stm.Free;
  end;
end;

procedure TfrmPrincipalCliente.ButtonChamaThreadsClick(Sender: TObject);
begin
  var qtd: Integer := StrToIntDef(EditQtdThreads.Text, 1);

  var dtInicio: TDateTime := IncSecond(Now, 2);

  for var i: Integer := 0 to qtd -1 do
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        try
        var IdHTTP: TIdHTTP := TIdHTTP.Create(nil);
        var stm: TStringStream := TStringStream.Create;
        try
          Sleep(MilliSecondsBetween(Now, dtInicio));

          IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmThreads/ValidaCPFThread', stm);
//          IdHTTP.Get('http://localhost:8080/datasnap/rest/TsmThreads/GetThread3', stm);

          var retorno: string := stm.DataString;
          TThread.Synchronize(nil,
            procedure
            begin
              MemoLog.Lines.Add(retorno);
            end);

        finally
          IdHTTP.Free;
          stm.Free;
        end;
        except
          // silencia threads
        end;
      end).Start;
  end;
end;

procedure TfrmPrincipalCliente.ButtonValidaCPFClick(Sender: TObject);
begin
  LabelResultado.Caption := dmdValidacaoClient.ValidaCPF(EditCPF.Text);
end;

procedure TfrmPrincipalCliente.CheckBoxAtivaTimerClick(Sender: TObject);
begin
  TimerStatusServer.Enabled := CheckBoxAtivaTimer.Checked;
end;

procedure TfrmPrincipalCliente.EditCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonValidaCPF.Click;
  end;
end;

procedure TfrmPrincipalCliente.TimerStatusServerTimer(Sender: TObject);
begin
  // hora e versao do server
  StatusBar.Panels[0].Text := dmdGeralClient.GetDataAtual;
end;

end.
