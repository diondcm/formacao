unit Main.Form;

interface

uses Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, System.SysUtils, System.Hash, System.NetEncoding, Classes.Pessoa, System.JSON, REST.Json, System.StrUtils, System.DateUtils;
type
  TFrmVCL = class(TForm)
    btnStop: TBitBtn;
    btnStart: TBitBtn;
    Label1: TLabel;
    edtPort: TEdit;
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Status;
    procedure Start;
    procedure Stop;
  end;

var
  FrmVCL: TFrmVCL;

implementation

uses Horse;

{$R *.dfm}

procedure TFrmVCL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if THorse.IsRunning then
    Stop;
end;

procedure TFrmVCL.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TFrmVCL.FormShow(Sender: TObject);
begin
  btnStart.Click;
end;

procedure TFrmVCL.Start;
begin
  THorse.Get('ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Get('GetHash',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var str: string := Req.Body;
      Res.Send(THashSHA2.GetHashString(str));
    end);

  THorse.Get('GetBase64',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var str: string := Req.Body;
      Res.Send(TNetEncoding.Base64String.Encode(str));
    end);

// 100.000
  THorse.Get('GetPessoa/:qtd',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)

        function MakeRandomString(const ALength: Integer;
                                  const ACharSequence: String = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'): String;
        var
          C1, sequence_length: Integer;
        begin
          sequence_length := Length(ACharSequence);
          SetLength(result, ALength);

          for C1 := 1 to ALength do
            result[C1] := ACharSequence[Random(sequence_length) + 1];
        end;

        function GeraNome: string;
        begin
          Result := MakeRandomString(10);// + ' ' + MakeRandomString(8);
        end;

      function GeraCPF(const Ponto: Boolean): string;
      var
        n1, n2, n3, n4, n5, n6, n7, n8, n9, d1, d2: LongInt;
      begin
        n1 := Trunc(Random(10));
        n2 := Trunc(Random(10));
        n3 := Trunc(Random(10));
        n4 := Trunc(Random(10));
        n5 := Trunc(Random(10));
        n6 := Trunc(Random(10));
        n7 := Trunc(Random(10));
        n8 := Trunc(Random(10));
        n9 := Trunc(Random(10));
        d1 := (n9 * 2) + (n8 * 3) + (n7 * 4) + (n6 *  5) + (n5 * 6) + (n4 * 7) + (n3 * 8) + (n2 * 9) + (n1 * 10);
        d1 := 11 - (d1 mod 11);
        if (d1 >= 10) then d1 := 0;
        d2 := (d1 * 2) + (n9 * 3) + (n8 * 4) + (n7 *  5) + (n6 *  6) + (n5 * 7) + (n4 * 8) + (n3 * 9) + (n2 * 10) + (n1 * 11);
        d2 := 11 - (d2 mod 11);
        if (d2>=10) then d2 := 0;

        Result := IntToStr(n1) + IntToStr(n2) + IntToStr(n3) + IntToStr(n4) + IntToStr(n5) + IntToStr(n6) +
                  IntToStr(n7) + IntToStr(n8) + IntToStr(n9) + IntToStr(d1) + IntToStr(d2);

        if Ponto then
          Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' + Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2);

      end;

    begin
      var countLoop: Integer := StrToIntDef(Req.Params['qtd'], 100);
      var ano: Integer := YearOf(Now);

      var lst: TListaPessoas := TListaPessoas.Create;
      for var i: Integer := 0 to countLoop - 1 do
      begin
        var pe: TPessoa := TPessoa.Create;
        var id: Int64;

        QueryPerformanceCounter(id);
        Randomize;

        pe.Nome := GeraNome;
        pe.CPF := GeraCPF(False);
        pe.DataNascimento := DateTimeToUnix(EncodeDate(ano - (18 + Random(70 - 18)), 1 + Random(11), 1 + Random(27)));
        pe.ID := Abs(id);
        pe.Saldo := 200*Random(20) + Random(999) + Random(99)/10;
        pe.Sexo := IfThen((Random(10) mod 2) = 0, 'IF', 'F');
        if pe.Sexo <> 'F' then
           pe.Sexo := IfThen((Random(10) mod 2) = 0, 'N', 'M');

        lst.Add(pe);
      end;

      Res.Send(TJson.ObjectToJsonString(lst, [joIndentCaseLower]));
      lst.Free;
    end);


  THorse.Listen(StrToInt(edtPort.Text));
end;

procedure TFrmVCL.Status;
begin
  btnStop.Enabled := THorse.IsRunning;
  btnStart.Enabled := not THorse.IsRunning;
  edtPort.Enabled := not THorse.IsRunning;
end;

procedure TFrmVCL.Stop;
begin
  THorse.StopListen;
end;

procedure TFrmVCL.btnStartClick(Sender: TObject);
begin
  Start;
  Status;
end;

procedure TFrmVCL.btnStopClick(Sender: TObject);
begin
  Stop;
  Status;
end;

end.
