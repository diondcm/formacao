unit Form.Funcionalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Funcionalidades;

type
  TfrmFuncionalidades = class(TForm)
    PanelControles: TPanel;
    ButtonMultiPages: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionalidades: TfrmFuncionalidades;

implementation

{$R *.dfm}

end.
