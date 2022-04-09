unit Form.Produto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.Controls, FMX.TabControl, FMX.Layouts, Fmx.Bind.Navigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Rtti, FMX.Grid.Style, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.Produto,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Objects, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Generics.Collections, FMX.Edit, Classe.QrCode;

type
  TCacheProduto = class
  private
    FImage: TMemoryStream;
    FQrCode: TMemoryStream;
  public
    destructor Destroy; override;
    constructor Create;
    property Image: TMemoryStream read FImage write FImage;
    property QrCode: TMemoryStream read FQrCode write FQrCode;
  end;

  TfrmProduto = class(TForm)
    BindNavigator1: TBindNavigator;
    TabControlProduto: TTabControl;
    TabPesquisa: TTabItem;
    TabCadastro: TTabItem;
    TabQrCode: TTabItem;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    dtsProduto: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ImageProduto: TImage;
    Splitter1: TSplitter;
    LabelTotal: TLabel;
    LabelURLImagem: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    NetHTTPClient1: TNetHTTPClient;
    Layout1: TLayout;
    Label1: TLabel;
    EditTitulo: TEdit;
    Layout2: TLayout;
    Label2: TLabel;
    EditPreco: TEdit;
    Layout3: TLayout;
    Label3: TLabel;
    EditDescricao: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    ImageQrCode: TImage;
    procedure FormShow(Sender: TObject);
    procedure dtsProdutoDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
{$REGION 'Vars da tela'}
    FCacheImagens: TDictionary<string, TCacheProduto>;
    FJaInicializou: Boolean;
{$ENDREGION}
{$REGION 'Imagem do Produto'}
    procedure CarregarImagemProduto;
    procedure CarregarQrCode;
{$ENDREGION}
  public
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.fmx}

procedure TfrmProduto.CarregarImagemProduto;
begin
//  TThread.NameThreadForDebugging('Principal');
  if dmdProduto.qryProduto.IsEmpty or (dmdProduto.qryProdutoURL_IMAGEM.AsString = '') then
  begin
    Exit;
  end;

  if (not FCacheImagens.ContainsKey(dmdProduto.qryProdutoURL_IMAGEM.AsString)) or
    (FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FImage.Size = 0) then
  begin
{$REGION 'Thread download imagem'}
    dmdProduto.qryImagens.Close;
    dmdProduto.qryImagens.ParamByName('ID_PRODUTO').AsInteger := dmdProduto.qryProdutoID.AsInteger;
    dmdProduto.qryImagens.Open;
    dmdProduto.qryImagens.FetchBlobs;

    if dmdProduto.qryImagens.IsEmpty or (dmdProduto.qryImagensIMAGEM.BlobSize = 0) then
    begin
      var urlImagem: string := dmdProduto.qryProdutoURL_IMAGEM.AsString;
      var idProduto: Integer := dmdProduto.qryProdutoID.AsInteger;

      //Aqui é main thread
      TThread.CreateAnonymousThread(
        procedure
        begin
          TThread.NameThreadForDebugging('Anonymous');

          //Aqui é thread local
          //  var lBytes: TBytesStream := TBytesStream.Create;
            var memImg: TMemoryStream := TMemoryStream.Create;

          //  IdHTTP1.Get(dmdProduto.qryProdutoURL_IMAGEM.AsString, lBytes);
            var netClient: TNetHTTPClient := TNetHTTPClient.Create(nil);

            netClient.Get(urlImagem, memImg);
            memImg.Position := 0;

            TThread.Synchronize(nil,
              procedure
              begin
                if dmdProduto.qryImagens.Locate('ID_PRODUTO', idProduto) then
                begin
                  dmdProduto.qryImagens.Edit;
                end else begin
                  dmdProduto.qryImagens.Append;
                  dmdProduto.qryImagensID_PRODUTO.AsInteger := idProduto;
                end;

                dmdProduto.qryImagensIMAGEM.LoadFromStream(memImg);
                dmdProduto.qryImagens.Post;

                if not FCacheImagens.ContainsKey(dmdProduto.qryProdutoURL_IMAGEM.AsString) then
                begin
                  FCacheImagens.Add(dmdProduto.qryProdutoURL_IMAGEM.AsString, TCacheProduto.Create);
                end;

                dmdProduto.qryImagensIMAGEM.SaveToStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FImage);

                ImageProduto.Bitmap.LoadFromStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FImage);
              end);

            //Aqui é thread Local
            netClient.Free;

          //  lBytes.Free; // Movido para o Destroy
    //        lmem.Free;
        end).Start;
    end else begin
      if not FCacheImagens.ContainsKey(dmdProduto.qryProdutoURL_IMAGEM.AsString) then
      begin
        FCacheImagens.Add(dmdProduto.qryProdutoURL_IMAGEM.AsString, TCacheProduto.Create);
      end;
      dmdProduto.qryImagensIMAGEM.SaveToStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FImage);
      ImageProduto.Bitmap.LoadFromStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FImage);
    end;
{$ENDREGION}
  end else begin
    ImageProduto.Bitmap.LoadFromStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FImage);
  end;
end;

procedure TfrmProduto.CarregarQrCode;
begin
  if dmdProduto.qryProduto.IsEmpty or (dmdProduto.qryProdutoURL_IMAGEM.AsString = '') then
  begin
    Exit;
  end;

{$REGION 'Carrega Imagem'}
  if (not FCacheImagens.ContainsKey(dmdProduto.qryProdutoURL_IMAGEM.AsString)) or
    (FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FQrCode.Size = 0) then
  begin
    dmdProduto.qryImagens.Close;
    dmdProduto.qryImagens.ParamByName('ID_PRODUTO').AsInteger := dmdProduto.qryProdutoID.AsInteger;
    dmdProduto.qryImagens.Open;
    dmdProduto.qryImagens.FetchBlobs;

    if dmdProduto.qryImagens.IsEmpty or (dmdProduto.qryImagensQR_CODE.BlobSize = 0) then
    begin
      var data: string := dmdProduto.qryProdutoURL_IMAGEM.AsString;
      var stm: TMemoryStream := TMemoryStream.Create;
      TQrCode.Gerar(data, stm);
      stm.Position := 0;

      if dmdProduto.qryImagens.IsEmpty then
      begin
        dmdProduto.qryImagens.Append;
        dmdProduto.qryImagensID_PRODUTO.AsInteger := dmdProduto.qryProdutoID.AsInteger;
      end else begin
        dmdProduto.qryImagens.Edit;
      end;

      dmdProduto.qryImagensQR_CODE.LoadFromStream(stm);
      dmdProduto.qryImagens.Post;

      stm.Free;
    end;

    if not FCacheImagens.ContainsKey(dmdProduto.qryProdutoURL_IMAGEM.AsString) then
    begin
      FCacheImagens.Add(dmdProduto.qryProdutoURL_IMAGEM.AsString, TCacheProduto.Create);
    end;

    dmdProduto.qryImagensQR_CODE.SaveToStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FQrCode);
  end;
{$ENDREGION}

  ImageQrCode.Bitmap.LoadFromStream(FCacheImagens[dmdProduto.qryProdutoURL_IMAGEM.AsString].FQrCode);
end;

procedure TfrmProduto.dtsProdutoDataChange(Sender: TObject; Field: TField);
begin
  LabelTotal.Text := FormatFloat('0.,', dmdProduto.qryProduto.RecNo) + ' de ' + FormatFloat('0.,', dmdProduto.qryProduto.RecordCount);

  CarregarImagemProduto;
  CarregarQrCode;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  FCacheImagens := TDictionary<string, TCacheProduto>.Create;
end;

procedure TfrmProduto.FormDestroy(Sender: TObject);
begin
  for var cache: TCacheProduto in FCacheImagens.Values do
  begin
    cache.Free;
  end;

  FCacheImagens.Free;
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  TabControlProduto.ActiveTab := TabPesquisa;

  ///  Atenção: Form pode executar mais de uma vez!
  ///  e.g.:
  ///  FStrings := TStringList.Create; // poderia ser resolvido com if Assigned(FStrings)
  ///  Mas a melhor prática para criação é o OnCreate
  ///  Neste caso podemos ter memoryLeak pois mais de um FString pode ser criado

  if not FJaInicializou then
  begin
    dmdProduto.qryProduto.Close;
    dmdProduto.qryProduto.Open;

    dmdProduto.CarregaProdutos;

    FJaInicializou := True;
  end;
end;

{ TCacheProduto }

constructor TCacheProduto.Create;
begin
  FImage := TMemoryStream.Create;
  FQrCode := TMemoryStream.Create;
end;

destructor TCacheProduto.Destroy;
begin
  FImage.Free;
  FQrCode.Free;
end;

end.
