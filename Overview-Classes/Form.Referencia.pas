unit Form.Referencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.DateUtils;

type
  TCarro = class
  private
    FPlaca: string;
    FRenavan: string;
    FID: Integer;
  public
    property ID: Integer read FID write FID;
    property Placa: string read FPlaca write FPlaca;
    property Renavan: string read FRenavan write FRenavan;
  end;


  TfrmReferencia = class(TForm)
    Button1: TButton;
    CheckBoxCria: TCheckBox;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    EditLoop: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReferencia: TfrmReferencia;

implementation

{$R *.dfm}

procedure TfrmReferencia.Button1Click(Sender: TObject);
var
  car: TCarro;
  car2: TCarro;
begin
//  var car: TCarro := TCarro.Create;
  car := nil;

  if checkboxCria.Checked then
  begin
    car := TCarro.Create;
    car2 := TCarro.Create;
//    car2.Free;
    car2 := car; // nova referência para var(instância) carro
  end;

  if Assigned(car) then // if car <> nil then
  begin
    car.Placa := 'AAFF';
    car2.Placa := 'TTYY';
    Caption := car.Placa;

    car.ID := 2211;
    car.Free;
    car := nil;
  end;

  if Assigned(car) then // if car <> nil then
  begin
    car.Placa := 'AFAF';
    car.ID := 5544;
    Caption := car.Placa;
    car.Free;
  end;

////  car.Free; // IOP
////  var car2: TCarro := TCarro.Create;
//  car2 := TCarro.Create;
//  car2.Placa := 'BBGG';
//  car.ID := 3344;
//  car.Free;
end;

procedure TfrmReferencia.Button2Click(Sender: TObject);
begin
  var cntIni: Int64 := GetTickCount64;
  for var i: Integer := 0 to 100000 do
  begin
    try
      StrToInt('G');
    except

    end;
  end;
  Memo1.Lines.Add('Tempo exec: ' + FormatFloat('0.,', (GetTickCount64 - cntIni)))
end;

procedure TfrmReferencia.Button3Click(Sender: TObject);
begin
  var cntIni: Int64 := GetTickCount64;
  for var i: Integer := 0 to 1000000 do // 100000 do
  begin
    try
      var val: Integer;
      tryStrToInt('G', val);
    except

    end;
  end;
  Memo1.Lines.Add('Tempo exec: ' + FormatFloat('0.,', (GetTickCount64 - cntIni)));
end;

procedure TfrmReferencia.Button4Click(Sender: TObject);
begin
  var agora: TDateTime := IncSecond(Now, 2);
  var loop: Integer := StrToIntDef(EditLoop.Text, 10000);

  TThread.CreateAnonymousThread(
    procedure
    begin
//      TThread.NameThreadForDebugging('COM Except');
      Sleep(MilliSecondsBetween(agora, Now));

      var cntIni: Int64 := GetTickCount64;
      for var i: Integer := 0 to loop do
      begin
        try
          StrToInt('G');
        except

        end;
      end;
      var cntFim: Int64 := GetTickCount64;

      TThread.Synchronize(nil,
        procedure
        begin
          Memo1.Lines.Add('COM Except: ' + FormatFloat('0.,', (cntFim - cntIni)) + ' ms');
        end);
    end).Start;

  TThread.CreateAnonymousThread(
    procedure
    begin
//      TThread.NameThreadForDebugging('Sem Except');
      Sleep(MilliSecondsBetween(agora, Now));

      var cntIni: Int64 := GetTickCount64;
      for var i: Integer := 0 to loop do
      begin
        try
          var val: Integer;
          tryStrToInt('G', val);
        except

        end;
      end;
      var cntFim: Int64 := GetTickCount64;

      TThread.Synchronize(nil,
        procedure
        begin
          Memo1.Lines.Add('SEM except: ' + FormatFloat('0.,', (cntFim - cntIni)) + ' ms');
        end);
    end).Start;
end;

procedure TfrmReferencia.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutDown := True;// DebugHook > 0;  // True;
{$ENDIF}
end;

end.
