unit Classes.Acao;

interface

uses
  System.Classes, System.SysUtils, System.DateUtils, System.StrUtils, System.Generics.Collections, System.Diagnostics;

type
  TAbrev = string[6];
  TAbreviatura = type TAbrev;

  TValor = class
  strict private
    FValor: Currency;
    FData: TDateTime;
  private
    procedure SetValor(const Value: Currency);
  public
    constructor Create(AData: TDateTime; AValor: Currency);
    property Valor: Currency read FValor write SetValor;
    property Data: TDateTime read FData write FData;
  end;

  TListaValores = class(TObjectList<TValor>);

  TAcao = class
  strict private
    FNome: string;
    FAbreviatura: TAbreviatura;
    FValores: TListaValores;
  strict protected
    procedure LimpaValores; virtual;
  public
    constructor Create; overload;
    constructor Create(ANome: string; AAbreviatura: TAbreviatura); overload;

    destructor Destroy; override;

    property Nome: string read FNome write FNome;
    property Abreviatura: TAbreviatura read FAbreviatura write FAbreviatura;
    property Valores: TListaValores read FValores write FValores;
  end;

  TListaAcoes = class(TObjectDictionary<TAbreviatura, TAcao>)
  strict private
    FErros: TStringList;
    FInfos: TStringList;
  private
    function GetErros: string;
    function GetInfos: string;
  public
    constructor Create; // reintroduce; para constructor com virtuais(herança)
    destructor Destroy; override;
    procedure Limpar;
    procedure CarregaArquivo(arq: string);
    procedure Add(linha: string); overload;
    property Erros: string read GetErros;
    property Infos: string read GetInfos;
  end;

implementation

{ TAcao }

constructor TAcao.Create;
begin
  FValores := TListaValores.Create;
end;

constructor TAcao.Create(ANome: string; AAbreviatura: TAbreviatura);
begin
  Create;
  FNome := ANome;
  FAbreviatura := AAbreviatura;
end;

destructor TAcao.Destroy;
begin
  FValores.Free;
end;

procedure TAcao.LimpaValores;
begin
  FValores.Clear;
end;

{ TListaAcoes }

procedure TListaAcoes.Add(linha: string);
begin
  try
    var abrev: TAbreviatura := TAbreviatura(Trim(Copy(linha, 13, 12)));
    var nome: string := Trim(Copy(linha, 28, 12));

  //  var data: string := Trim(Copy(linha, 3, 8));
    var ano: string := Trim(Copy(linha, 3, 4));
    var mes: string := Trim(Copy(linha, 7, 2));
    var dia: string := Trim(Copy(linha, 9, 2));
    var dataIni: TDateTime := EncodeDate(StrToInt(ano), StrToInt(mes), StrToInt(dia));

    var cents: string := Trim(Copy(linha, 68, 2));
    var dec: string := Trim(Copy(linha, 57, 11));
    var preco: Currency := StrToFloat(dec) + (StrToFloat(cents)/100);

    if Self.ContainsKey(abrev) then
    begin
      Self[abrev].Valores.Add(TValor.Create(dataIni, preco));
    end else begin
      Self.Add(abrev, TAcao.Create(nome, abrev));
      Self[abrev].Valores.Add(TValor.Create(dataIni, preco));
    end;
  except
    FErros.Add(linha);
  end;
end;

procedure TListaAcoes.CarregaArquivo(arq: string);
var arqTXT: TextFile;
var linha: string;
begin
  // https://en.delphipraxis.net/topic/4802-queryperformancecounter-precision/
  // https://docs.microsoft.com/en-us/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter

  // https://docwiki.embarcadero.com/Libraries/Sydney/en/System.Diagnostics.TStopwatch
  // https://docwiki.embarcadero.com/Libraries/Sydney/en/System.Classes.TThread.GetTickCount
  var tempoSeg: TDateTime;
  var tempoInicio: TDateTime := Now;

  Limpar;

  if not FileExists(arq) then
  begin
    raise Exception.Create('Arquivo: "' + arq + '" não encontrado');
  end;

  AssignFile(arqTXT, arq);
  try
    Reset(arqTXT);

    var tam: Integer := FileSize(arqTXT);
    if tam = 0 then
    begin
      raise Exception.Create('Arquivo: "' + arq + '" vazio');
    end;

    while not Eof(arqTXT) do
    begin
      ReadLn(arqTXT, linha);
      Add(linha);
    end;
  finally
    CloseFile(arqTXT);
  end;

//  var stl: TStringList := TStringList.Create;
//  stl.LoadFromFile(arq);
//
//  if stl.Count = 0 then
//  begin
//    stl.Free;
//    raise Exception.Create('Arquivo: "' + arq + '" vazio');
//  end;
//
//  for var linha: string in stl do
//  begin
//    Add(linha);
//  end;
//
//  stl.Free;

  tempoSeg := IncMilliSecond(0, MilliSecondsBetween(Now, tempoInicio));

  FInfos.Add(FormatFloat('0.,', Self.Count) + ' registros importados');
  FInfos.Add(FormatFloat('0.,', FErros.Count) + ' erros encontrados');
  FInfos.Add(FormatDateTime('hh:mm:ss', tempoSeg) + ' tempo');

end;

constructor TListaAcoes.Create;
begin
  inherited Create([doOwnsValues]);
  FErros := TStringList.Create;
  FInfos := TStringList.Create;
end;

destructor TListaAcoes.Destroy;
begin
  FErros.Free;
  FInfos.Free;
  inherited;
end;

function TListaAcoes.GetErros: string;
begin
  Result := FErros.Text;
end;

function TListaAcoes.GetInfos: string;
begin
  Result := FInfos.Text;
end;

procedure TListaAcoes.Limpar;
begin
  FErros.Clear;
  FInfos.Clear;
  Self.Clear;
end;

{ TValor }

constructor TValor.Create(AData: TDateTime; AValor: Currency);
begin
  SetValor(AValor);
  FData := AData;
end;

procedure TValor.SetValor(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Valor: "' + FloatToStr(Value) + '" não pode ser inferior a zero');

  FValor := Value;
end;

end.
