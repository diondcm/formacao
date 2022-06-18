unit Classes.DateDB;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ComCtrls, Data.DB, Vcl.DBCtrls, System.Variants, Vcl.WinXPickers;

type
  TDBDateTimePiker = class(TDateTimePicker)
  private
    FMudouOnChange: Boolean;
    FDataLink: TFieldDataLink;
    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);

    procedure DoDataChange(Sender: TObject);
    procedure DoUpdateData(Sender: TObject);
    procedure DoChangeValue(Sender: TObject);
  protected
    function IsValidDataLink: Boolean; virtual;
    procedure CheckValidDate(Date: TDate); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

  TDBDatePicker = class(TCustomDatePicker)
  private
    FDataLink: TFieldDataLink;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);

    procedure DoDataChange(Sender: TObject);
    procedure DoUpdateData(Sender: TObject);
    procedure DoChangeValue(Sender: TObject);
  protected
    function IsValidDataLink: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;


implementation

{ TDBDateTimePiker }

procedure TDBDateTimePiker.CheckValidDate(Date: TDate);
begin
  if not ((csReading in ComponentState) or (csLoading in ComponentState)) and (not FMudouOnChange) then
  begin
    FMudouOnChange := False;
  end;
end;

constructor TDBDateTimePiker.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;

  FDataLink.OnDataChange := DoDataChange;
  FDataLink.OnUpdateData := DoUpdateData;

  OnChange := DoChangeValue;
end;

destructor TDBDateTimePiker.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

procedure TDBDateTimePiker.DoChangeValue(Sender: TObject);
begin
  if not FDataLink.Editing then
  begin
    FDataLink.Edit;
  end;

  FDataLink.Modified;
  FDataLink.UpdateRecord;
end;

procedure TDBDateTimePiker.DoDataChange(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    if (FDataLink.Field.IsNull or VarIsEmpty(FDataLink.Field.Value)) then
    begin
      Date := Now;
    end else begin
      Date := FDataLink.Field.AsDateTime;
    end;
  end;
end;

procedure TDBDateTimePiker.DoUpdateData(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

function TDBDateTimePiker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBDateTimePiker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBDateTimePiker.IsValidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TDBDateTimePiker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBDateTimePiker.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

{ TDBDatePicker }

constructor TDBDatePicker.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;

  FDataLink.OnDataChange := DoDataChange;
  FDataLink.OnUpdateData := DoUpdateData;
  OnChange := DoChangeValue;
end;

destructor TDBDatePicker.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

procedure TDBDatePicker.DoChangeValue(Sender: TObject);
begin
//  if (csDesigning in Self.ComponentState) then
//  begin
//    ShowMessage('Valor alterado em runtime!');
//  end;

  if not FDataLink.Editing then
  begin
    FDataLink.Edit;
  end;

  FDataLink.Modified;
  FDataLink.UpdateRecord;
end;

procedure TDBDatePicker.DoDataChange(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    if (FDataLink.Field.IsNull or VarIsEmpty(FDataLink.Field.Value)) then
    begin
      Date := Now;
    end else begin
      Date := FDataLink.Field.AsDateTime;
    end;
  end;
end;

procedure TDBDatePicker.DoUpdateData(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

function TDBDatePicker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBDatePicker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBDatePicker.IsValidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TDBDatePicker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBDatePicker.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

end.
