unit Form.StackEHeap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Form.Seleciona.Color;

type
  TValoresHeap = class
    s: string; // H
    data: TDate; // H(PF)

    car: Cardinal; // S
    b: Boolean; // S
    i: Integer; // S
    c: array [0..9] of Char; // S

    o: TObject;
    f: TForm;
    f2: TForm;
  end;

  TfrmStackEHeap = class(TForm)
    PanelControles: TPanel;
    ButtonStack: TButton;
    ButtonHeap: TButton;
    MemoLog: TMemo;
    ButtonInline: TButton;
    ButtonVarLocal: TButton;
    ButtonAlteraVarLocal: TButton;
    ButtonRecursivo: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ButtonParametros: TButton;
    ButtonParametroConst: TButton;
    ButtonParametroVar: TButton;
    ButtonResult: TButton;
    procedure ButtonStackClick(Sender: TObject);
    procedure ButtonHeapClick(Sender: TObject);
    procedure ButtonInlineClick(Sender: TObject);
    procedure ButtonVarLocalClick(Sender: TObject);
    procedure ButtonAlteraVarLocalClick(Sender: TObject);
    procedure MemoLogDblClick(Sender: TObject);
    procedure ButtonRecursivoClick(Sender: TObject);
    procedure ButtonParametrosClick(Sender: TObject);
    procedure ButtonParametroConstClick(Sender: TObject);
    procedure ButtonParametroVarClick(Sender: TObject);
    procedure ButtonResultClick(Sender: TObject);
  private
    Fi: Integer;
//    FVarInteger: ^Integer;
    FVarInteger: PInteger;
    procedure ProcExecutaNovamente(limite: Integer);

    { Parametros }
    procedure ParametroNormal(i: Integer; s: string; b: Boolean; d: TDate; f: Currency; o: TObject);
    procedure ParametroConst(const i: Integer; const s: string; const b: Boolean; const d: TDate; const f: Currency; const o: TObject);
    procedure ParametroVar(var i: Integer; var s: string; var b: Boolean; var d: TDate; var f: Currency; var o: TObject);
//    procedure ParametroVar(out i: Integer; out s: string; out b: Boolean; out d: TDate; out f: Currency; out o: TObject);

    procedure ParametroComDefault({ const, var } i: Integer = 55);
    procedure ParametroIndefinido(const B);
    procedure ParametroIndefinidoVar(var B);

    function ParametroRetorno: Boolean;
//    function ParametroRetorno(var b: Boolean; var OutraSaida: string): Boolean;
//    function ParametroCriaObj: TComponent;
    class procedure TesteSelf;
  public
    { Public declarations }
  end;

//var
//  frmStackEHeap: TfrmStackEHeap;

implementation

{$R *.dfm}

procedure TfrmStackEHeap.ButtonInlineClick(Sender: TObject);
// Stack ou Heap ???
var
  c: array [0..9] of Char; // S
begin
//  Tag := Integer(ButtonStack);

  var s: string; // H
  var data: TDate; // H(PF)

  var car: Cardinal; // S
  var b: Boolean; // S
  var i: Integer; // S
  var j: Integer; // S

  var o: TObject;
  var f: TForm;
  var f2: TForm;

  for j := 0 to 100 do
  begin
    Application.ProcessMessages;
    Sleep(1);
  end;

  s := Caption + ' Teste';

//  if i + car = 5 then
//  begin
//    b := False;
//  end;

//  f.Caption := '';
//
//  Caption := s;
//  Caption := DateToStr(data);

  if not Assigned(o) then
    o := TObject.Create;

  if not Assigned(f) then
    f := TForm.Create(nil);

  f2 := f;

  MemoLog.Lines.Add('Valores InLine');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i)); // '$' + IntToHex(Integer(i)) + ' - ' +
  MemoLog.Lines.Add(Format('$%p', [@data]) + ' Size: ' + IntToStr(Sizeof(data)) + ' data: ' + DateToStr(data));
  MemoLog.Lines.Add(Format('$%p', [@car]) + ' Size: ' + IntToStr(Sizeof(car)) + ' car: ' + IntToStr(car));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' i: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@c]) + ' Size: ' + IntToStr(Sizeof(c)) + ' c: ' + String(c));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o))); //o.ClassName);
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + '$' + IntToHex(NativeInt(f))); // f.ClassName
  MemoLog.Lines.Add(Format('$%p', [@f2]) + ' Size: ' + IntToStr(Sizeof(f2)) + ' f2: ' + '$' + IntToHex(NativeInt(f2))); // f.ClassName

  f2.Free;
//  f.Free; // Gera Invalid pointer
end;

procedure TfrmStackEHeap.ButtonParametroConstClick(Sender: TObject);
var
  i: Integer;
  s: string;
  b: Boolean;
  d: TDate;
  f: Currency;
  o: TObject;
begin
  i := 978;
  b := True;
  s := 'Valor';
  d := Now;
  f := 3.14;
  o := Sender;
//  o := TComponent.Create(Self);

  MemoLog.Lines.Add('Valores Antes');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add(Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

  MemoLog.Lines.Add('');

  ParametroConst(i, s, b, d, f, o);

  MemoLog.Lines.Add('');

  MemoLog.Lines.Add('Valores Depois');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add(Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' i: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

//  TComponent(o).Tag := GetTickCount;   // Gera os erros de AV
//  TComponent(o).InsertComponent(TComponent.Create(nil));
end;

procedure TfrmStackEHeap.ButtonParametrosClick(Sender: TObject);
var
  i: Integer;
  s: string;
  b: Boolean;
  d: TDate;
  f: Currency;
  o: TObject;
begin
  i := 978;
  b := True;
  s := 'Valor';
  d := Now;
  f := 3.14;
  o := Sender;

  MemoLog.Lines.Add('Valores Antes');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add(Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

  MemoLog.Lines.Add('');

  ParametroNormal(i, s, b, d, f, o);

  MemoLog.Lines.Add('');

  MemoLog.Lines.Add('Valores Depois');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add(Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' i: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));
end;

procedure TfrmStackEHeap.ButtonParametroVarClick(Sender: TObject);
var
  i: Integer;// Cardinal;
  s: string;
  b: Boolean;
  d: TDate;
  f: Currency; // Double;
  o: TObject;
begin
  i := 978;
  b := True;
  s := 'Valor';
  d := Now;
  f := 3.14;
  o := Sender;

  MemoLog.Lines.Add('Valores Antes');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add(Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

  MemoLog.Lines.Add('');

  ParametroVar(i, s, b, d, f, o);

  MemoLog.Lines.Add('');

  MemoLog.Lines.Add('Valores Depois');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add(Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' i: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));
end;

procedure TfrmStackEHeap.ButtonVarLocalClick(Sender: TObject);
var
  iLocal: Integer;
begin
//  FVarInteger := @Fi;

  iLocal := 45;

  begin
    var novoInt: Integer := 89;
    FVarInteger := @novoInt;
  end;
//  novoInt := 9;
  ButtonStackClick(Sender);

  begin
    var novoOutroInt: Integer := 7;
    var novoOutroInt2: Integer := 5;
  end;

  FVarInteger^ := 12;

  FVarInteger := @iLocal;
  FVarInteger^ := 12;
end;

procedure TfrmStackEHeap.ButtonResultClick(Sender: TObject); //  Self: TfrmStackEHeap
begin
//  Self

  ParametroComDefault;

  if ParametroRetorno then
    ShowMessage('True');

//  ParametroRetorno;
//
////  ParametroIndefinidoVar(b);
////  if b then
//
//  if ParametroRetorno then
//    ShowMessage('True');
//
//  var i: Integer;
//  if TryStrToInt(Caption, i) then
//  begin
//    //
//  end else begin
//
//  end;
end;

procedure TfrmStackEHeap.ButtonAlteraVarLocalClick(Sender: TObject);
begin
  FVarInteger^ := GetTickCount;
end;

procedure TfrmStackEHeap.ButtonRecursivoClick(Sender: TObject);
begin
  ProcExecutaNovamente(5000);
end;

procedure TfrmStackEHeap.ButtonHeapClick(Sender: TObject);
var
  valoresHeap: TValoresHeap;
begin
  valoresHeap := TValoresHeap.Create;

  valoresHeap.s := Caption;

  MemoLog.Lines.Add('Valores Heap');
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.i]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.i)) + ' i: ' + IntToStr(valoresHeap.i)); // '$' + IntToHex(Integer(i)) + ' - ' +
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.data]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.data)) + ' data: ' + DateToStr(valoresHeap.data));
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.car]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.car)) + ' car: ' + IntToStr(valoresHeap.car));
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.b]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.b)) + ' i: ' + BoolToStr(valoresHeap.b, True));
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.s]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.s)) + ' s: ' + valoresHeap.s + '$' + IntToHex(NativeInt(valoresHeap.s)));
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.c]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.c)) + ' c: ' + String(valoresHeap.c));
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.o]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.o)) + ' o: ' + '$' + IntToHex(NativeInt(valoresHeap.o))); //o.ClassName);
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.f]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.f)) + ' f: ' + '$' + IntToHex(NativeInt(valoresHeap.f))); // f.ClassName
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap.f2]) + ' Size: ' + IntToStr(Sizeof(valoresHeap.f2)) + ' f2: ' + '$' + IntToHex(NativeInt(valoresHeap.f2))); // f.ClassName
  MemoLog.Lines.Add(Format('$%p', [@valoresHeap]) + ' Size: ' + IntToStr(Sizeof(valoresHeap)) + ' VH: ' + '$' + IntToHex(NativeInt(valoresHeap))); // f.ClassName

  valoresHeap.Free;
end;

procedure TfrmStackEHeap.ButtonStackClick(Sender: TObject);
// Stack ou Heap ???
var
  s: string; // H
  data: TDate; // H(PF)

  car: Cardinal; // S
  b: Boolean; // S
  i: Integer; // S
  j: Integer; // S
  c: array [0..9] of Char; // S

  o: TObject;
  f: TForm;
  f2: TForm;
begin
//  Tag := Integer(ButtonStack);

  for j := 0 to 100 do
  begin
    Application.ProcessMessages;
    Sleep(1);
  end;

//  if i + car = 5 then
//  begin
//    b := False;
//  end;

//  f.Caption := '';
//
//  Caption := s;
//  Caption := DateToStr(data);

  if not Assigned(o) then
    o := TObject.Create;

  if not Assigned(f) then
    f := TForm.Create(nil);

  f2 := f;

  s := Caption;

  MemoLog.Lines.Add('Valores Stack');
  MemoLog.Lines.Add(Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i)); // '$' + IntToHex(Integer(i)) + ' - ' +
  MemoLog.Lines.Add(Format('$%p', [@data]) + ' Size: ' + IntToStr(Sizeof(data)) + ' data: ' + DateToStr(data));
  MemoLog.Lines.Add(Format('$%p', [@car]) + ' Size: ' + IntToStr(Sizeof(car)) + ' car: ' + IntToStr(car));
  MemoLog.Lines.Add(Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' i: ' + BoolToStr(b, True));
  MemoLog.Lines.Add(Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add(Format('$%p', [@c]) + ' Size: ' + IntToStr(Sizeof(c)) + ' c: ' + String(c));
  MemoLog.Lines.Add(Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o))); //o.ClassName);
  MemoLog.Lines.Add(Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + '$' + IntToHex(NativeInt(f))); // f.ClassName
  MemoLog.Lines.Add(Format('$%p', [@f2]) + ' Size: ' + IntToStr(Sizeof(f2)) + ' f2: ' + '$' + IntToHex(NativeInt(f2))); // f.ClassName

  f2.Free;
//  f.Free; // Gera Invalid pointer
end;

procedure TfrmStackEHeap.MemoLogDblClick(Sender: TObject);
var
  frmCor: TfrmSelecionaColor;
  varProc: TOnTrocaCor;
begin
  varProc :=
    procedure(corSelecionada: TColor)
    begin
      MemoLog.Color := corSelecionada;
    end;

  var corAnterior: TColor := MemoLog.Color;
  frmCor := TfrmSelecionaColor.Create(Self);
  try
//    frmCor.Memo := MemoLog;
    frmCor.OnTrocaCor := varProc;
    frmCor.OnConfirma :=
      procedure
      begin
        // Cor já aplicada no OnClick
      end;

    frmCor.OnCancela :=
      procedure
      begin
        MemoLog.Color := corAnterior;
      end;

//    frmCor.ShowModal;
    frmCor.Show;
//    MemoLog.Color := frmCor.ColorListBox.Selected;
  finally
//    frmCor.Free;
  end;
end;

procedure TfrmStackEHeap.ParametroComDefault(i: Integer);
begin
  MemoLog.Lines.Add(i.ToString);
end;

procedure TfrmStackEHeap.ParametroConst(const i: Integer; const s: string;
  const b: Boolean; const d: TDate; const f: Currency; const o: TObject);
begin
  MemoLog.Lines.Add(' Parametro Const - Entrada');
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

//  FreeAndNil(o);

//  o.Free;


//  i := 56;
//  s := 'Teste';
//  b := False;
//  d := 0;
//  f := -5;
//  o := nil;

//  MemoLog.Lines.Add('');
//
//  MemoLog.Lines.Add(' Parametro Normal - Saída');
//  MemoLog.Lines.Add('>>  ' + Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
//  MemoLog.Lines.Add('>>  ' + Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
//  MemoLog.Lines.Add('>>  ' + Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
//  MemoLog.Lines.Add('>>  ' + Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
//  MemoLog.Lines.Add('>>  ' + Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
//  MemoLog.Lines.Add('>>  ' + Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));
end;

procedure TfrmStackEHeap.ParametroIndefinido(const B);
begin
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@B]) + ' Size: ' + IntToStr(Sizeof(B)) + ' i: ' + IntToStr(Integer(B)));
end;

procedure TfrmStackEHeap.ParametroIndefinidoVar(var B);
begin
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@B]) + ' Size: ' + IntToStr(Sizeof(B)) + ' i: ' + IntToStr(Integer(B)));
end;

procedure TfrmStackEHeap.ParametroNormal(i: Integer; s: string; b: Boolean;
  d: TDate; f: Currency; o: TObject);
begin
  MemoLog.Lines.Add(' Parametro Normal - Entrada');
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

  i := 56;
  s := 'Teste';
  b := False;
  d := 0;
  f := -5;
  o := nil;

  MemoLog.Lines.Add('');

  MemoLog.Lines.Add(' Parametro Normal - Saída');
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));
end;

function TfrmStackEHeap.ParametroRetorno: Boolean; // (var Result: Boolean);
begin
  MemoLog.Lines.Add(' ' + Format('$%p', [@Result]) + ' Size: ' + IntToStr(Sizeof(Result)) + ' b: ' + BoolToStr(Result, True));
  Result := True;
end;

procedure TfrmStackEHeap.ParametroVar(var i: Integer; var s: string;
  var b: Boolean; var d: TDate; var f: Currency; var o: TObject);
begin
  MemoLog.Lines.Add(' Parametro Var - Entrada');
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));

  i := 56;
  s := 'Teste';
  b := False;
  d := 0;
  f := -5;
  o := nil;

  MemoLog.Lines.Add('');

  MemoLog.Lines.Add(' Parametro Var - Saída');
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@i]) + ' Size: ' + IntToStr(Sizeof(i)) + ' i: ' + IntToStr(i));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@d]) + ' Size: ' + IntToStr(Sizeof(d)) + ' data: ' + DateToStr(d));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@f]) + ' Size: ' + IntToStr(Sizeof(f)) + ' f: ' + FormatFloat('0.,00', f));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@b]) + ' Size: ' + IntToStr(Sizeof(b)) + ' b: ' + BoolToStr(b, True));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@s]) + ' Size: ' + IntToStr(Sizeof(s)) + ' s: ' + s + ' $' + IntToHex(NativeInt(s)));
  MemoLog.Lines.Add('>>  ' + Format('$%p', [@o]) + ' Size: ' + IntToStr(Sizeof(o)) + ' o: ' + '$' + IntToHex(NativeInt(o)));
end;

procedure TfrmStackEHeap.ProcExecutaNovamente;
//type
//  TMinhaFuncDLL = procedure(pInt: Integer); stdcall;// pascal
begin
  if limite > 0 then
    ProcExecutaNovamente(limite - 1); // Recursiva

//  asm
//    mov edx, 1;
//  end;
end;

class procedure TfrmStackEHeap.TesteSelf;
begin

end;

end.
