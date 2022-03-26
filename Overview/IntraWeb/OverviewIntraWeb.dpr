program OverviewIntraWeb;

uses
  Forms,
  IWStart,
  UTF8ContentParser,
  FormWeb.Hash in 'FormWeb.Hash.pas' {IWFormIntra: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Classes.Hash in '..\Classes.Hash.pas';

{$R *.res}

begin
  TIWStart.Execute(True);
end.
