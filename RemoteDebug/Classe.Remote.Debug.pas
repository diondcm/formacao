unit Classe.Remote.Debug;

interface

uses
  System.SysUtils, SYstem.Classes, System.Types, WinApi.ShellAPI,
  WinApi.Windows, WinApi.TlHelp32;

type
  TRemoteDebug = class
  public const
    BCCIDE = 'bccide';
    BORDBK270 = 'bordbk270';
    BORDBK270N = 'bordbk270N';
    DCC32270 =  'dcc32270';
    RMTDBG270 =  'rmtdbg270';
  private
    class procedure KillTask(pNomeProcesso: string);
  public
    //class constructor create;
    class procedure Inicializar;
    class procedure Finalizar;
  end;

implementation

{ TRemoteDebug }

class procedure TRemoteDebug.KillTask(pNomeProcesso: string);
type
  TFuncProcess = reference to function (pID: Cardinal): Boolean;
var
  lFunc: TFuncProcess;
  lCloseProc: Boolean;

  procedure LoopProcess(pFuncValidacao: TFuncProcess);
  var
    lSnapShot: Cardinal;
    lProcessEntry: TProcessEntry32;
    lCountLoop: Integer;
    lContinueLoop: Boolean;
  begin
    lSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    try
      lCountLoop := 0;
      lCloseProc := True;
      lProcessEntry.dwSize := SizeOf(lProcessEntry);
      lContinueLoop := Process32First(lSnapShot, lProcessEntry);
      while (lContinueLoop) and (lCloseProc) and (lCountLoop < 100010) do
      begin
        Inc(lCountLoop);
        if (CompareStr(UpperCase(ExtractFileName(lProcessEntry.szExeFile)), UpperCase(pNomeProcesso)) = 0) or
         (CompareStr(UpperCase(lProcessEntry.szExeFile), UpperCase(pNomeProcesso)) = 0) then
        begin
          lCloseProc := pFuncValidacao(lProcessEntry.th32ProcessID);
        end;
        lContinueLoop := Process32Next(lSnapShot, lProcessEntry)
      end;
      if lCountLoop > 100000 then
      begin
        raise Exception.Create('Count Loop excedido');
      end;
    finally
      CloseHandle(lSnapShot);
    end;
  end;
  procedure WaitProcessTerminate;
  var
    lCounterLoop: Integer;
    lFouded: Boolean;
    lFunc: TFuncProcess;
  begin
    lCounterLoop := 0;
    lFunc :=
        function(pID: Cardinal): Boolean
        begin
          lFouded := True;
          Result := True;
        end;
    repeat
      lFouded := False;
      Inc(lCounterLoop);
      Sleep(50); // 40 * 50 >> 2.000 ms
      LoopProcess(lFunc);
    until ((not lFouded) and (lCounterLoop < 40));
  end;
begin
  try
    lFunc :=
      function (pID: Cardinal): Boolean
      begin
        // colocar outras funções de interação com processos
        Result :=
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), pID), 0);
      end;
    lCloseProc := False;
    LoopProcess(lFunc);
    if lCloseProc then
    begin
      WaitProcessTerminate;
    end;
  except
    //
  end;
end;

{
class constructor TRemoteDebug.create;
begin
  Inicializar;
end;
}

class procedure TRemoteDebug.Finalizar;
begin
  KillTask(RMTDBG270 + '.exe');
  DeleteFile(BCCIDE + '.dll');
  DeleteFile(BORDBK270 + '.dll');
  DeleteFile(BORDBK270N + '.dll');
  DeleteFile(DCC32270 + '.dll');
  DeleteFile(RMTDBG270 + '.exe');
end;

class procedure TRemoteDebug.Inicializar;
  procedure ExtrairResource(PFileName, pExtensao: string);
  var
    lRes: TResourceStream;
  begin
    if not FileExists(PFileName + '.'+pExtensao) then
    begin
      lRes := TResourceStream.Create(HInstance, PFileName, RT_RCDATA);
      try
        lRes.Position := 0;
        lRes.SaveToFile(PFileName + '.'+pExtensao);
      finally
        lRes.Free;
      end;
    end;
  end;
begin
  ExtrairResource(BCCIDE, 'dll');
  ExtrairResource(BORDBK270, 'dll');
  ExtrairResource(BORDBK270N, 'dll');
  ExtrairResource(DCC32270, 'dll');
  ExtrairResource(RMTDBG270, 'exe');
  ShellExecute(0,nil,RMTDBG270 + '.exe',nil,nil,SW_SHOWNORMAL);
end;

initialization
  TRemoteDebug.Inicializar;
finalization
  TRemoteDebug.Finalizar;

end.
