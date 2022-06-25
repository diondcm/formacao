unit Classes.Editor.Sobre;

interface

// Add reference: designide.dcp

{

  OTA: Open Tools API
  Exemplos: DocWiki(novo), CnPack, GeExperts, Jedi(Rx)

}

uses
  Form.Sobre, DesignEditors, DesignIntf;

type
  { Edita no Object Inspector }
  TShowAbout = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  { Edita no popup da IDE }
  TEditorMenu = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


implementation

{ TShowAbout }

procedure TShowAbout.Edit;
begin
  inherited;
  Value := TfrmSobre.ExibeSobre;
end;

function TShowAbout.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{ TEditorMenu }

procedure TEditorMenu.ExecuteVerb(Index: Integer);
begin
  inherited;
  case Index of
    0:
    begin
      TfrmSobre.ExibeSobre;
    end;
  end;
end;

function TEditorMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Sobre o CardViewer...';
  end;
end;

function TEditorMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
