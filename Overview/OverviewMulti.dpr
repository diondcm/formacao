program OverviewMulti;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Mobile in 'Form.Mobile.pas' {Form1},
  Classes.Hash in 'Classes.Hash.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
