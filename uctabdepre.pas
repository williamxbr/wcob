unit uctabdepre;

interface

uses adodb;

type
 TCustomDEPRE = class(TADOTable)
 private
 protected
  constructor Create; override;
  function GetANO: Integer;
  function GetIDDEPRE: Integer;
  function GetINDICE: Double;
  function GetMES: Byte;
  procedure SetANO(const Value: Integer);
  procedure SetIDDEPRE(const Value: Integer);
  procedure SetINDICE(const Value: Double);
  procedure SetMES(const Value: Byte);
  property ANO: Integer read GetANO write SetANO;
  property IDDEPRE: Integer read GetIDDEPRE write SetIDDEPRE;
  property INDICE: Double read GetINDICE write SetINDICE;
  property MES: Byte read GetMES write SetMES;
 public
 end;

implementation

uses DB;

constructor TCustomDEPRE.Create;
begin
 TableName := 'DEPRE';
end;

function TCustomDEPRE.GetANO: Integer;
begin
 Result := FieldByName('ANO').AsInteger;
end;

function TCustomDEPRE.GetIDDEPRE: Integer;
begin
 Result := FieldByName('IDDEPRE').AsInteger;
end;

function TCustomDEPRE.GetINDICE: Double;
begin
 Result := FieldByName('INDICE').AsFloat;
end;

function TCustomDEPRE.GetMES: Byte;
begin
 Result := FieldByName('MES').AsInteger;
end;

procedure TCustomDEPRE.SetANO(const Value: Integer);
begin
 FieldByName('ANO').AsInteger := Value;
end;

procedure TCustomDEPRE.SetIDDEPRE(const Value: Integer);
begin
 FieldByName('IDDEPRE').AsInteger := Value;
end;

procedure TCustomDEPRE.SetINDICE(const Value: Double);
begin
 FieldByName('INDICE').AsFloat := Value;
end;

procedure TCustomDEPRE.SetMES(const Value: Byte);
begin
 FieldByName('MES').AsInteger := Value;
end;

end.
