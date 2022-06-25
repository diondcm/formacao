unit Classes.Registra.Card.Viewer;

interface

uses
  System.SysUtils, System.Classes, Classes.Card.Viewer, Classes.Editor.Sobre, DesignIntf;


  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Formacao2022', [TCardViewer]);

  RegisterPropertyEditor(TypeInfo(string), TCardViewer, 'Sobre', TShowAbout);
//  RegisterPropertyEditor(TypeInfo(string), TCardViewer, 'Hint', TShowAbout);

  RegisterComponentEditor(TCardViewer, TEditorMenu);
end;

end.
