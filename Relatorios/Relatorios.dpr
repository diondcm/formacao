program Relatorios;

uses
  Vcl.Forms,
  Form.Lista.Simples in 'Form.Lista.Simples.pas' {frmListaSimples},
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Grupo.Simples in 'Form.Grupo.Simples.pas' {frmGrupoSimples},
  Data.Grupo.Simples in 'Data.Grupo.Simples.pas' {dmdGrupoSimples: TDataModule},
  Form.Funcionalidades in 'Form.Funcionalidades.pas' {frmFuncionalidades},
  Data.Funcionalidades in 'Data.Funcionalidades.pas' {dmdFuncionalidades: TDataModule},
  Form.Master.Detail.Detail in 'Form.Master.Detail.Detail.pas' {frmMasterDetailDetail},
  Data.ReportMasterDetailDetail in 'Data.ReportMasterDetailDetail.pas' {dmdReportMasterDetailDetail: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmListaSimples, frmListaSimples);
  Application.CreateForm(TfrmGrupoSimples, frmGrupoSimples);
  Application.CreateForm(TdmdGrupoSimples, dmdGrupoSimples);
  Application.CreateForm(TfrmFuncionalidades, frmFuncionalidades);
  Application.CreateForm(TdmdFuncionalidades, dmdFuncionalidades);
  Application.CreateForm(TfrmMasterDetailDetail, frmMasterDetailDetail);
  Application.CreateForm(TdmdReportMasterDetailDetail, dmdReportMasterDetailDetail);
  Application.Run;
end.
