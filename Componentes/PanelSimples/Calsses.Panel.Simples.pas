unit Calsses.Panel.Simples;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls;

type
  TPanelSemCaption = class(TCustomPanel)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Color;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Formacao2022', [TPanelSemCaption]);
end;

{ TPanelSemCaption }

constructor TPanelSemCaption.Create(AOwner: TComponent);
begin
  inherited;
  ShowCaption := False;
  BevelOuter := bvNone;
end;

end.
