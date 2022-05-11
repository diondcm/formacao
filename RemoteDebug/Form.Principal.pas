unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Zip, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1Zip: TButton;
    ButtonExtract: TButton;
    ButtonClassHelper: TButton;
    ButtonTesteRemoteDebug: TButton;
    procedure Button1ZipClick(Sender: TObject);
    procedure ButtonExtractClick(Sender: TObject);
    procedure ButtonClassHelperClick(Sender: TObject);
    procedure ButtonTesteRemoteDebugClick(Sender: TObject);
  private
    { Private declarations }
  public
    const BASE_PATH = 'C:\Users\Gustavo Mena Barreto\OneDrive\Área de Trabalho\RemoteDebugTreinamento\ArqRemoteDebug\';
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Classe.Helper.ZipFile;

procedure TForm1.Button1ZipClick(Sender: TObject);
//var
//  lZip: TZipFile;
begin
{  lZip := TZipFile.Create;
  lZip.Open(BASE_PATH + 'ArquivoRemoteDebug.zip',zmWrite);

  lzip.Add(BASE_PATH+ 'bccide.dll');
  lzip.Add(BASE_PATH+ 'bordbk270.dll');
  lzip.Add(BASE_PATH+ 'bordbk270N.dll');
  lzip.Add(BASE_PATH+ 'comp32x.dll');
  lzip.Add(BASE_PATH+ 'dcc32270.dll');
  lzip.Add(BASE_PATH+ 'rmtdbg270.exe');

  lZip.Close;

  lzip.Free;
}

  TZipFile.ZiparArquivos(BASE_PATH + 'TesteExtracao.zip',
    [BASE_PATH+ 'bccide.dll',
    BASE_PATH+ 'bordbk270.dll',
    BASE_PATH+ 'bordbk270N.dll',
    BASE_PATH+ 'comp32x.dll',
    BASE_PATH+ 'dcc32270.dll',
    BASE_PATH+ 'rmtdbg270.exe'])
end;

procedure TForm1.ButtonClassHelperClick(Sender: TObject);
var
  TesteInteger: Integer;
begin
  TesteInteger := 10;

  ShowMessage(IntToStr(TesteInteger));
  ShowMessage(TesteInteger.ToString);
end;

procedure TForm1.ButtonExtractClick(Sender: TObject);
//var
//  lZip: TZipFile;
begin
//  lZip := TZipFile.Create;
//  lZip.Open(BASE_PATH + 'ArquivoRemoteDebug.zip',zmRead);
//  lZip.ExtractAll(BASE_PATH+'teste\');

//  lZip.Free;

  TZipFile.ExtrairArquivos(BASE_PATH + 'TesteExtracao.zip',True);
end;

procedure TForm1.ButtonTesteRemoteDebugClick(Sender: TObject);
var
  lVal: Integer;
begin
  lVal:= Random(10000);
  var lVal2: Integer := Random(100);
  var Resultado: Integer := lVal - lVal2;

  Caption := Resultado.ToString;
end;

end.
