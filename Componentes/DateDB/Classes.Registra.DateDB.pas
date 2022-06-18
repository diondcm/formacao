unit Classes.Registra.DateDB;

interface

uses
  System.SysUtils, System.Classes, Classes.DateDB;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Formacao2022', [TDBDateTimePiker, TDBDatePicker]);
end;

end.
