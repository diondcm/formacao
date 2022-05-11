unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    MemoJson: TMemo;
    Button1: TButton;
    MemoResultado: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    dsAPI: TDataSource;
    FDMemTable1block_hash: TWideStringField;
    FDMemTable1block_height: TFloatField;
    FDMemTable1block_index: TFloatField;
    FDMemTable1hash: TWideStringField;
    FDMemTable1addresses: TWideStringField;
    FDMemTable1total: TFloatField;
    FDMemTable1fees: TFloatField;
    FDMemTable1size: TFloatField;
    FDMemTable1vsize: TFloatField;
    FDMemTable1preference: TWideStringField;
    FDMemTable1confirmed: TDateTimeField;
    FDMemTable1received: TDateTimeField;
    FDMemTable1ver: TFloatField;
    FDMemTable1double_spend: TBooleanField;
    FDMemTable1vin_sz: TFloatField;
    FDMemTable1vout_sz: TFloatField;
    FDMemTable1confirmations: TFloatField;
    FDMemTable1confidence: TFloatField;
    FDMemTable1inputs: TWideStringField;
    FDMemTable1outputs: TWideStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON, Rest.Json, RootUnit;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Objeto: TJSonObject;
  ObjetoArray: TJSONArray;
  I: Integer;
begin
  //Leitura JSON
  Objeto := TJSONObject.ParseJSONValue(MemoJson.Lines.Text) as TJSONObject;

//  ShowMessage('Maneira 1-'+Objeto.Get('block_hash').ToString);
//  ShowMessage('Maneira 2-'+Objeto.GetValue('block_hash').ToString);

  ObjetoArray := Objeto.Get('inputs').JsonValue as TJSONArray;

  for I := 0 to ObjetoArray.Size - 1 do
  begin
    MemoResultado.Lines.Add(
      ObjetoArray.Get(I).ToString+':'+ ObjetoArray.Get(I).Value);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Objeto: TJSONObject;
  ObjetoArray: TJSONArray;
  ObjetoInputs: TJSONObject;
begin
  //Escrita
  Objeto := TJSONObject.Create;
  ObjetoArray := TJSONArray.Create;

  Objeto.AddPair('block_hash','12345');
  Objeto.AddPair('inputs',ObjetoArray);

  ObjetoInputs :=  TJSONObject.Create;
  ObjetoInputs.AddPair('prev_hash','76366272');
  ObjetoInputs.AddPair('script','1');

  ObjetoArray.Add(ObjetoInputs);

  ObjetoInputs :=  TJSONObject.Create;
  ObjetoInputs.AddPair('prev_hash','987723');
  ObjetoInputs.AddPair('script','2');

  ObjetoArray.Add(ObjetoInputs);

  MemoResultado.Lines.Text := Objeto.ToString;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TesteJson: TRoot;
  Inputs: TInputs;
begin
  // Site para mapeat Classe JSON
  //https://jsontodelphi.com/
  //Leitura
  TesteJson := TJson.JsonToObject<TRoot>(MemoJson.Lines.Text);

//  Showmessage('Block_Hash-'+TesteJson.BlockHash);

  for Inputs in TesteJson.Inputs  do
  begin
    MemoResultado.Lines.Add('Prev_Hash'+Inputs.PrevHash);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  TesteJson: TRoot;
  Inputs: TInputs;
  I: Integer;
  lVal: Integer;
begin
  // Site para mapear Classe JSON
  //https://jsontodelphi.com/
  TesteJson := TRoot.Create;
  TesteJson.BlockHash := '12345';

  for I := 0 to 2 do
  begin
    lVal := Random(100);
    Inputs := TInputs.Create;
    Inputs.PrevHash := '9876733';
    Inputs.Age := lVal;

    TesteJson.Inputs.Add(Inputs);
  end;

  MemoResultado.Lines.Text :=
    TJson.ObjectToJsonString(TesteJson,[joIgnoreEmptyStrings]);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  RESTRequest1.Execute;
  RESTResponseDataSetAdapter1.Active := True;
end;

end.
