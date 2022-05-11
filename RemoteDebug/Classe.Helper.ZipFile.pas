unit Classe.Helper.ZipFile;

interface

uses
 System.Classes, System.Zip, System.SysUtils;

type
  TZipFileHelper = class helper for TZipFile
  private
  public
    class procedure ZiparArquivos(pArquivoZip: string; PListaArq: TArray<string>);
    class procedure ExtrairArquivos(pArquivoZip: string; pCriaPasta: Boolean = False);
  end;

implementation

{ TZipFileHelper }

class procedure TZipFileHelper.ExtrairArquivos(pArquivoZip: string;
  pCriaPasta: Boolean);
var
  lZip: TZipFile;
  lOutPutDir: string;
begin
  if FileExists(pArquivoZip) then
  begin
    lZip := TZipFile.Create;
    lZip.Open(pArquivoZip, zmRead);

    lOutPutDir := IncludeTrailingPathDelimiter(ExtractFilePath(pArquivoZip));
    if pCriaPasta then
    begin
      lOutPutDir :=
        IncludeTrailingPathDelimiter(lOutPutDir + ChangeFileExt(ExtractFileName(pArquivoZip),''));

      ForceDirectories(lOutPutDir);
    end;

    lZip.ExtractAll(lOutPutDir);

    lZip.Free;
  end;
end;

class procedure TZipFileHelper.ZiparArquivos(pArquivoZip: string;
  PListaArq: TArray<string>);
var
  lZip: TZipFile;
  lArq: string;
begin
  DeleteFile(pArquivoZip);

  lZip := TZipFile.Create;
  try
    lZip.Open(pArquivoZip, zmWrite);

    for lArq in PListaArq do
    begin
      lZip.Add(lArq);
    end;

  finally
    lZip.Free;
  end;

end;

end.
