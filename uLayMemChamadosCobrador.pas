unit uLayMemChamadosCobrador;

interface

uses DB, Classes, DBClient, StdCtrls;

Type

 TMemChamadosCobrador = class(TClientDataSet)
 private
  procedure CriarCampos;
  function GetTELEFONE: string;
  function GetNOME_CREDOR: string;
  function GetNOME_DEVEDOR: string;
  function GetIDCHAMADO: Integer;
  function GetHISTORICO: string;
  function GetIDCOBRANCA: Integer;
  function GetTEMPO: Integer;
  function GetVALOR_DIVIDA: Double;
  function GetTEMPO_INICIO: TDateTime;
  function GetTEMPO_FINAL: TDateTime;
  function GetTIPO: string;
  procedure SetTELEFONE(const Value: string);
  procedure SetNOME_CREDOR(const Value: string);
  procedure SetNOME_DEVEDOR(const Value: string);
  procedure SetIDCHAMADO(const Value: Integer);
  procedure SetHISTORICO(const Value: string);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetTEMPO(const Value: Integer);
  procedure SetVALOR_DIVIDA(const Value: Double);
  procedure SetTEMPO_INICIO(const Value: TDateTime);
  procedure SetTEMPO_FINAL(const Value: TDateTime);
  procedure SetTIPO(const Value: string);
 public
  constructor Create(AOwner: TComponent); override;
  property TELEFONE: string read GetTELEFONE write SetTELEFONE;
  property NOME_CREDOR: string read GetNOME_CREDOR write SetNOME_CREDOR;
  property NOME_DEVEDOR: string read GetNOME_DEVEDOR write SetNOME_DEVEDOR;
  property IDCHAMADO: Integer read GetIDCHAMADO write SetIDCHAMADO;
  property HISTORICO: string read GetHISTORICO write SetHISTORICO;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property TEMPO: Integer read GetTEMPO write SetTEMPO;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
  property TEMPO_INICIO: TDateTime read GetTEMPO_INICIO write SetTEMPO_INICIO;
  property TEMPO_FINAL: TDateTime read GetTEMPO_FINAL write SetTEMPO_FINAL;
  property TIPO: string read GetTIPO write SetTIPO;
 end;

implementation

resourcestring
   FLD_IDCHAMADO    = 'IDCHAMADO';
   FLD_NOME_CREDOR  = 'NOME_CREDOR';
   FLD_NOME_DEVEDOR = 'NOME_DEVEDOR';
   FLD_IDCOBRANCA   = 'IDCOBRANCA';
   FLD_VALOR_DIVIDA = 'VALOR_DIVIDA';
   FLD_TIPO         = 'TIPO';
   FLD_INICIO       = 'INICIO';
   FLD_FINAL        = 'FINAL';
   FLD_TEMPO        = 'TEMPO';
   FLD_HISTORICO    = 'HISTORICO';
   FLD_TELEFONE     = 'TELEFONE';



constructor TMemChamadosCobrador.Create(AOwner: TComponent);
begin
 Name := 'cdsChamadosCobrador';
 inherited;
 CriarCampos;
end;

procedure TMemChamadosCobrador.CriarCampos;
begin
  StoreDefs := True;
  With FieldDefs do
  Begin
    Add(FLD_IDCHAMADO       , ftInteger,0,True);
    Add(FLD_NOME_CREDOR     , ftString,30);
    Add(FLD_NOME_DEVEDOR    , ftString,60);
    Add(FLD_IDCOBRANCA      , ftInteger);
    Add(FLD_VALOR_DIVIDA    , ftFloat);
    Add(FLD_TIPO            , ftString,15);
    Add(FLD_INICIO          , ftDateTime);
    Add(FLD_FINAL           , ftDateTime);
    Add(FLD_TEMPO           , ftInteger);
    Add(FLD_HISTORICO       , ftString,255);
    Add(FLD_TELEFONE        , ftString,15);
  End;
  CreateDataSet;
  StoreDefs := False;
  Active    := True;
end;

function TMemChamadosCobrador.GetTELEFONE: string;
begin
  Result := FieldByName(FLD_TELEFONE).AsString;
end;

function TMemChamadosCobrador.GetNOME_CREDOR: string;
begin
  Result := FieldByName(FLD_NOME_CREDOR).AsString;
end;

function TMemChamadosCobrador.GetNOME_DEVEDOR: string;
begin
  Result := FieldByName(FLD_NOME_DEVEDOR).AsString;
end;

function TMemChamadosCobrador.GetIDCHAMADO: Integer;
begin
  Result := FieldByName(FLD_IDCHAMADO).AsInteger;
end;

function TMemChamadosCobrador.GetHISTORICO: string;
begin
  Result := FieldByName(FLD_HISTORICO).AsString;
end;

function TMemChamadosCobrador.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(FLD_IDCOBRANCA).AsInteger;
end;

function TMemChamadosCobrador.GetTEMPO: Integer;
begin
  Result := FieldByName(FLD_TEMPO).AsInteger;
end;

function TMemChamadosCobrador.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(FLD_VALOR_DIVIDA).AsFloat;
end;

function TMemChamadosCobrador.GetTEMPO_INICIO: TDateTime;
begin
  Result := FieldByName(FLD_INICIO).AsFloat;
end;

function TMemChamadosCobrador.GetTEMPO_FINAL: TDateTime;
begin
  Result := FieldByName(FLD_FINAL).AsFloat;
end;

function TMemChamadosCobrador.GetTIPO: string;
begin
  Result := FieldByName(FLD_TIPO).AsString;
end;

procedure TMemChamadosCobrador.SetTELEFONE(const Value: string);
begin
  FieldByName(FLD_TELEFONE).AsString := Value;
end;

procedure TMemChamadosCobrador.SetNOME_CREDOR(const Value: string);
begin
  FieldByName(FLD_NOME_CREDOR).AsString := Value;
end;

procedure TMemChamadosCobrador.SetNOME_DEVEDOR(const Value: string);
begin
  FieldByName(FLD_NOME_DEVEDOR).AsString := Value;
end;

procedure TMemChamadosCobrador.SetIDCHAMADO(const Value: Integer);
begin
  FieldByName(FLD_IDCHAMADO).AsInteger := Value;
end;

procedure TMemChamadosCobrador.SetHISTORICO(const Value: string);
begin
  FieldByName(FLD_HISTORICO).AsString := Value;
end;

procedure TMemChamadosCobrador.SetIDCOBRANCA(const Value: Integer);
begin
  FieldByName(FLD_IDCOBRANCA).AsInteger := Value;
end;

procedure TMemChamadosCobrador.SetTEMPO(const Value: Integer);
begin
  FieldByName(FLD_TEMPO).AsInteger := Value;
end;

procedure TMemChamadosCobrador.SetVALOR_DIVIDA(const Value: Double);
begin
  FieldByName(FLD_VALOR_DIVIDA).AsFloat := Value;
end;

procedure TMemChamadosCobrador.SetTEMPO_INICIO(const Value: TDateTime);
begin
  FieldByName(FLD_INICIO).AsDateTime := Value;
end;

procedure TMemChamadosCobrador.SetTEMPO_FINAL(const Value: TDateTime);
begin
  FieldByName(FLD_FINAL).AsDateTime := Value;
end;

procedure TMemChamadosCobrador.SetTIPO(const Value: string);
begin
  FieldByName(FLD_TIPO).AsString := Value;
end;


end.
