unit Form.Panel.Message;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPanelMessage = class(TForm)
    PanelControles: TPanel;
    PanelExemplo: TPanel;
    RadioButtonMover: TRadioButton;
    RadioButtonResize: TRadioButton;
    procedure PanelExemploMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPanelMessage: TfrmPanelMessage;

implementation

{$R *.dfm}

procedure TfrmPanelMessage.PanelExemploMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  if RadioButtonMover.Checked then
    PostMessage(PanelExemplo.Handle, WM_SYSCOMMAND, $F012, 0);
  if RadioButtonResize.Checked then
    PostMessage(PanelExemplo.Handle, WM_SYSCOMMAND, $F005, 0);
  ///  $F001 - Left
  ///  $F002 - Right
  ///  $F003 - Top
  ///  $F004 - TopLeft
  ///  $F005 - TopRight
  ///  ..$F007
end;

end.
