unit Form.Instancia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmInstancia = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInstancia: TfrmInstancia;

implementation

{$R *.dfm}

procedure TfrmInstancia.Button1Click(Sender: TObject);
begin
  // Report Ativado

  // Dependency Injection FrameWork
//  var frm: TfrmInstancia := TfrmInstancia.Create(nil);

//  var mem: TMemo := TMemo.Create(frm); { Application} { Self }

//  frm := nil; // Somente para interfaces
//  {
//    ...Processamento...
//  }
//  mem.Free;

//  var btn: TButton := TButton.Create(mem); { Application} { Self }

//  var stl: TStringList := TStringList.Create;
//  {
//    ...Processamento...
//  }
//  stl.Free;
end;

end.
