unit Form.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmBase = class(TForm)
    StatusBarContato: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// remover
//var
//  frmBase: TfrmBase;

implementation

{$R *.dfm}

end.
