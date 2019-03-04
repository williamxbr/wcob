unit uLayConsultaClienteResumo;

interface

uses DB, Classes, DBClient;

Type

 TConsultoClienteResumo = class(TClientDataSet)
 private
  procedure CriarCampos;
  function GetABERTO: Double;
  function GetACIONADAS: Integer;
  function GetACORDO: Double;
  function GetCARTEIRA: Double;
  function GetCODIGO_CREDOR: Integer;
  function GetENCERRADAS: Double;
  function GetNAO_ACIONADAS: Integer;
  function GetNOME_CREDOR: string;
  function GetQUITADOS: Double;
  function GetVENCIDAS: Double;
  procedure SetABERTO(const Value: Double);
  procedure SetACIONADAS(const Value: Integer);
  procedure SetACORDO(const Value: Double);
  procedure SetCARTEIRA(const Value: Double);
  procedure SetCODIGO_CREDOR(const Value: Integer);
  procedure SetENCERRADAS(const Value: Double);
  procedure SetNAO_ACIONADAS(const Value: Integer);
  procedure SetNOME_CREDOR(const Value: string);
  procedure SetQUITADOS(const Value: Double);
  procedure SetVENCIDAS(const Value: Double);
 public
  constructor Create(AOwner: TComponent); override;
  property ABERTO: Double read GetABERTO write SetABERTO;
  property ACIONADAS: Integer read GetACIONADAS write SetACIONADAS;
  property ACORDO: Double read GetACORDO write SetACORDO;
  property CARTEIRA: Double read GetCARTEIRA write SetCARTEIRA;
  property CODIGO_CREDOR: Integer read GetCODIGO_CREDOR write SetCODIGO_CREDOR;
  property ENCERRADAS: Double read GetENCERRADAS write SetENCERRADAS;
  property NAO_ACIONADAS: Integer read GetNAO_ACIONADAS write SetNAO_ACIONADAS;
  property NOME_CREDOR: string read GetNOME_CREDOR write SetNOME_CREDOR;
  property QUITADOS: Double read GetQUITADOS write SetQUITADOS;
  property VENCIDAS: Double read GetVENCIDAS write SetVENCIDAS;
 end;

implementation

resourcestring
 FLD_NAO_ACIONADAS = 'NAO_ACIONADAS';
 FLD_ACIONADAS = 'ACIONADAS';
 FLD_ENCERRADAS = 'ENCERRADAS';
 FLD_VENCIDAS = 'VENCIDAS';
 FLD_QUITADOS = 'QUITADOS';
 FLD_ACORDO = 'ACORDO';
 FLD_ABERTO = 'ABERTO';
 FLD_CARTEIRA = 'CARTEIRA';
 FLD_NOME_CREDOR = 'NOME_CREDOR';
 FLD_CODIGO_CREDOR = 'CODIGO_CREDOR';

constructor TConsultoClienteResumo.Create(AOwner: TComponent);
begin
 inherited;
 CriarCampos;
end;

procedure TConsultoClienteResumo.CriarCampos;
begin
  StoreDefs := True;
  With FieldDefs do
  Begin
    Add(FLD_CODIGO_CREDOR , ftInteger);
    Add(FLD_NOME_CREDOR   , ftString  , 60);
    Add(FLD_CARTEIRA      , ftCurrency);
    Add(FLD_ABERTO        , ftCurrency);
    Add(FLD_ACORDO        , ftCurrency);
    Add(FLD_QUITADOS      , ftCurrency);
    Add(FLD_VENCIDAS      , ftCurrency);
    Add(FLD_ENCERRADAS    , ftCurrency);
    Add(FLD_ACIONADAS     , ftInteger);
    Add(FLD_NAO_ACIONADAS , ftInteger);
  End;
  CreateDataSet;
  StoreDefs := False;
  Active    := True;
end;

function TConsultoClienteResumo.GetABERTO: Double;
begin
  Result := FieldByName(FLD_ABERTO).AsFloat;
end;

function TConsultoClienteResumo.GetACIONADAS: Integer;
begin
  Result := FieldByName(FLD_ACIONADAS).AsInteger;
end;

function TConsultoClienteResumo.GetACORDO: Double;
begin
  Result := FieldByName(FLD_ACORDO).AsFloat;
end;

function TConsultoClienteResumo.GetCARTEIRA: Double;
begin
  Result := FieldByName(FLD_CARTEIRA).AsFloat;
end;

function TConsultoClienteResumo.GetCODIGO_CREDOR: Integer;
begin
  Result := FieldByName(FLD_CODIGO_CREDOR).AsInteger;
end;

function TConsultoClienteResumo.GetENCERRADAS: Double;
begin
  Result := FieldByName(FLD_ENCERRADAS).AsFloat;
end;

function TConsultoClienteResumo.GetNAO_ACIONADAS: Integer;
begin
  Result := FieldByName(FLD_NAO_ACIONADAS).AsInteger;
end;

function TConsultoClienteResumo.GetNOME_CREDOR: string;
begin
  Result := FieldByName(FLD_NOME_CREDOR).AsString;
end;

function TConsultoClienteResumo.GetQUITADOS: Double;
begin
  Result := FieldByName(FLD_QUITADOS).AsFloat;
end;

function TConsultoClienteResumo.GetVENCIDAS: Double;
begin
  Result := FieldByName(FLD_VENCIDAS).AsFloat;
end;

procedure TConsultoClienteResumo.SetABERTO(const Value: Double);
begin
  FieldByName(FLD_ABERTO).AsFloat := Value;
end;

procedure TConsultoClienteResumo.SetACIONADAS(const Value: Integer);
begin
  FieldByName(FLD_ACIONADAS).AsInteger := Value;
end;

procedure TConsultoClienteResumo.SetACORDO(const Value: Double);
begin
  FieldByName(FLD_ACORDO).AsFloat := Value;
end;

procedure TConsultoClienteResumo.SetCARTEIRA(const Value: Double);
begin
  FieldByName(FLD_CARTEIRA).AsFloat := Value;
end;

procedure TConsultoClienteResumo.SetCODIGO_CREDOR(const Value: Integer);
begin
  FieldByName(FLD_CODIGO_CREDOR).AsInteger := Value;
end;

procedure TConsultoClienteResumo.SetENCERRADAS(const Value: Double);
begin
  FieldByName(FLD_ENCERRADAS).AsFloat := Value;
end;

procedure TConsultoClienteResumo.SetNAO_ACIONADAS(const Value: Integer);
begin
  FieldByName(FLD_NAO_ACIONADAS).AsInteger := Value;
end;

procedure TConsultoClienteResumo.SetNOME_CREDOR(const Value: string);
begin
  FieldByName(FLD_NOME_CREDOR).AsString := Value;
end;

procedure TConsultoClienteResumo.SetQUITADOS(const Value: Double);
begin
  FieldByName(FLD_QUITADOS).AsFloat := Value;
end;

procedure TConsultoClienteResumo.SetVENCIDAS(const Value: Double);
begin
  FieldByName(FLD_VENCIDAS).AsFloat := Value;
end;


end.
