unit Form.Master.Detail.Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.ReportMasterDetailDetail,
  Vcl.StdCtrls;

type
  TfrmMasterDetailDetail = class(TForm)
    ButtonMasterDetailDetail: TButton;
    procedure ButtonMasterDetailDetailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetailDetail: TfrmMasterDetailDetail;

implementation

{$R *.dfm}

procedure TfrmMasterDetailDetail.ButtonMasterDetailDetailClick(Sender: TObject);
begin
  dmdReportMasterDetailDetail.frxReportMDD.ShowReport;
end;

end.
