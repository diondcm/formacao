unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Form.Lista.Simples, Form.Grupo.Simples;

type
  TfrmPrincipal = class(TForm)
    FlowPanelControles: TFlowPanel;
    ButtonListaSimples: TButton;
    ButtonGroup: TButton;
    ButtonFuncionalidades: TButton;
    procedure ButtonListaSimplesClick(Sender: TObject);
    procedure ButtonGroupClick(Sender: TObject);
    procedure ButtonFuncionalidadesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonFuncionalidadesClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.ButtonGroupClick(Sender: TObject);
begin
  frmGrupoSimples.ShowModal;
end;

procedure TfrmPrincipal.ButtonListaSimplesClick(Sender: TObject);
begin
  frmListaSimples.ShowModal;
end;

end.
