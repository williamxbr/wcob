unit uLayMemRecibo;

interface

uses DB, Classes, DBClient, StdCtrls;

Type

 TMemRecibo = class(TClientDataSet)
 private
  procedure CriarCampos;
  function GetNUMERO: Integer;
  function GetDOCUMENTO: string;
  function GetDEVEDOR: string;
  function GetCNPJ_DEVEDOR: string;
  function GetBANCO: Integer;
  function GetPERIODO: string;
  function GetEH_INTEGRAL: Boolean;
  function GetPARCELA: string;
  function GetVALOR_EXTENSO: string;
  function GetVALOR: Double;
  function GetOBSERVACAO: string;
  function GetVALOR_PRINCIPAL: Double;
  function GetVALOR_DIVIDA: Double;
  function GetENCARGOS: Double;
  function GetMULTA: Double;
  function GetHONORARIOS: Double;
  function GetTOTAL_RECEBIDO: Double;
  function GetDATA_PAGAMENTO: TDateTime;
  function GetCREDOR: string;
  function GetVENCIMENTO: TDateTime;
  function GetTIPO_DOCUMENTO: string;
  procedure SetNUMERO(const Value: Integer);
  procedure SetDOCUMENTO(const Value: string);
  procedure SetDEVEDOR(const Value: string);
  procedure SetCNPJ_DEVEDOR(const Value: string);
  procedure SetBANCO(const Value: Integer);
  procedure SetPERIODO(const Value: string);
  procedure SetEH_INTEGRAL(const Value: Boolean);
  procedure SetPARCELA(const Value: string);
  procedure SetVALOR_EXTENSO(const Value: string);
  procedure SetVALOR(const Value: Double);
  procedure SetOBSERVACAO(const Value: string);
  procedure SetVALOR_PRINCIPAL(const Value: Double);
  procedure SetVALOR_DIVIDA(const Value: Double);
  procedure SetENCARGOS(const Value: Double);
  procedure SetMULTA(const Value: Double);
  procedure SetHONORARIOS(const Value: Double);
  procedure SetTOTAL_RECEBIDO(const Value: Double);
  procedure SetDATA_PAGAMENTO(const Value: TDateTime);
  procedure SetCREDOR(const Value: string);
  procedure SetVENCIMENTO(const Value: TDateTime);
  procedure SetTIPO_DOCUMENTO(const Value: string);
 public
  constructor Create(AOwner: TComponent); override;
  property NUMERO: Integer read GetNUMERO write SetNUMERO;
  property DOCUMENTO: string read GetDOCUMENTO write SetDOCUMENTO;
  property DEVEDOR: string read GetDEVEDOR write SetDEVEDOR;
  property CNPJ_DEVEDOR: string read GetCNPJ_DEVEDOR write SetCNPJ_DEVEDOR;
  property BANCO: Integer read GetBANCO write SetBANCO;
  property PERIODO: string read GetPERIODO write SetPERIODO;
  property EH_INTEGRAL: Boolean read GetEH_INTEGRAL write SetEH_INTEGRAL;
  property PARCELA: string read GetPARCELA write SetPARCELA;
  property VALOR_EXTENSO: string read GetVALOR_EXTENSO write SetVALOR_EXTENSO;
  property VALOR: Double read GetVALOR write SetVALOR;
  property OBSERVACAO: string read GetOBSERVACAO write SetOBSERVACAO;
  property VALOR_PRINCIPAL: Double read GetVALOR_PRINCIPAL write
      SetVALOR_PRINCIPAL;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
  property ENCARGOS: Double read GetENCARGOS write SetENCARGOS;
  property MULTA: Double read GetMULTA write SetMULTA;
  property HONORARIOS: Double read GetHONORARIOS write SetHONORARIOS;
  property TOTAL_RECEBIDO: Double read GetTOTAL_RECEBIDO write SetTOTAL_RECEBIDO;
  property DATA_PAGAMENTO: TDateTime read GetDATA_PAGAMENTO write
      SetDATA_PAGAMENTO;
  property CREDOR: string read GetCREDOR write SetCREDOR;
  property VENCIMENTO: TDateTime read GetVENCIMENTO write SetVENCIMENTO;
  property TIPO_DOCUMENTO: string read GetTIPO_DOCUMENTO write SetTIPO_DOCUMENTO;
 end;

implementation

resourcestring
   FLD_NUMERO          = 'NUMERO';
   FLD_DOCUMENTO       = 'DOCUMENTO';
   FLD_DEVEDOR         = 'DEVEDOR';
   FLD_CREDOR          = 'CREDOR';
   FLD_CNPJ_DEVEDOR    = 'CNPJ_DEVEDOR';
   FLD_BANCO           = 'BANCO';
   FLD_PERIODO         = 'PERIODO';
   FLD_EH_INTEGRAL     = 'EH_INTEGRAL';
   FLD_PARCELA         = 'PARCELA';
   FLD_VALOR_EXTENSO   = 'VALOR_EXTENSO';
   FLD_VALOR           = 'VALOR';
   FLD_OBSERVACAO      = 'OBSERVACAO';
   FLD_VALOR_PRINCIPAL = 'VALOR_PRINCIPAL';
   FLD_VALOR_DIVIDA    = 'VALOR_DIVIDA';
   FLD_ENCARGOS        = 'ENCARGOS';
   FLD_MULTA           = 'MULTA';
   FLD_HONORARIOS      = 'HONORARIOS';
   FLD_TOTAL_RECEBIDO  = 'TOTAL_RECEBIDO';
   FLD_DATA_PAGAMENTO  = 'DATA_PAGAMENTO';
   FLD_VENCIMENTO      = 'VENCIMENTO';
   FLD_TIPO_DOCUMENTO  = 'TIPO_DOCUMENTO';


constructor TMemRecibo.Create(AOwner: TComponent);
begin
 Name := 'cdsRecibo';
 inherited;
 CriarCampos;
end;

procedure TMemRecibo.CriarCampos;
begin
  StoreDefs := True;
  With FieldDefs do
  Begin
    Add(FLD_NUMERO          , ftInteger);
    Add(FLD_DOCUMENTO       , ftString,10);
    Add(FLD_DEVEDOR         , ftString,60);
    Add(FLD_CREDOR          , ftString,60);
    Add(FLD_CNPJ_DEVEDOR    , ftString,20);
    Add(FLD_BANCO           , ftString,10);
    Add(FLD_PERIODO         , ftString,255);
    Add(FLD_EH_INTEGRAL     , ftBoolean);
    Add(FLD_PARCELA         , ftString,5);
    Add(FLD_VALOR_EXTENSO   , ftString,255);
    Add(FLD_VALOR           , ftFloat);
    Add(FLD_OBSERVACAO      , ftMemo);
    Add(FLD_VALOR_PRINCIPAL , ftFloat);
    Add(FLD_VALOR_DIVIDA    , ftFloat);
    Add(FLD_ENCARGOS        , ftFloat);
    Add(FLD_MULTA           , ftFloat);
    Add(FLD_HONORARIOS      , ftFloat);
    Add(FLD_TOTAL_RECEBIDO  , ftFloat);
    Add(FLD_DATA_PAGAMENTO  , ftDate);
    Add(FLD_VENCIMENTO      , ftDate);
    Add(FLD_TIPO_DOCUMENTO  , ftString,10);
  End;
  CreateDataSet;
  StoreDefs := False;
  Active    := True;
end;

function TMemRecibo.GetNUMERO: Integer;
begin
  Result := FieldByName(FLD_NUMERO).AsInteger;
end;

function TMemRecibo.GetDOCUMENTO: string;
begin
  Result := FieldByName(FLD_DOCUMENTO).AsString;
end;

function TMemRecibo.GetDEVEDOR: string;
begin
  Result := FieldByName(FLD_DEVEDOR).AsString;
end;

function TMemRecibo.GetCNPJ_DEVEDOR: string;
begin
  Result := FieldByName(FLD_CNPJ_DEVEDOR).AsString;
end;

function TMemRecibo.GetBANCO: Integer;
begin
  Result := FieldByName(FLD_BANCO).AsInteger;
end;

function TMemRecibo.GetPERIODO: string;
begin
  Result := FieldByName(FLD_PERIODO).AsString;
end;

function TMemRecibo.GetEH_INTEGRAL: Boolean;
begin
  Result := FieldByName(FLD_EH_INTEGRAL).AsBoolean;
end;

function TMemRecibo.GetPARCELA: string;
begin
  Result := FieldByName(FLD_PARCELA).AsString;
end;

function TMemRecibo.GetVALOR_EXTENSO: string;
begin
  Result := FieldByName(FLD_VALOR_EXTENSO).AsString;
end;

function TMemRecibo.GetVALOR: Double;
begin
  Result := FieldByName(FLD_VALOR).AsFloat;
end;

function TMemRecibo.GetOBSERVACAO: string;
begin
  Result := FieldByName(FLD_OBSERVACAO).AsString;
end;

function TMemRecibo.GetVALOR_PRINCIPAL: Double;
begin
  Result := FieldByName(FLD_VALOR_PRINCIPAL).AsFloat;
end;

function TMemRecibo.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(FLD_VALOR_DIVIDA).AsFloat;
end;

function TMemRecibo.GetENCARGOS: Double;
begin
  Result := FieldByName(FLD_ENCARGOS).AsFloat;
end;

function TMemRecibo.GetMULTA: Double;
begin
  Result := FieldByName(FLD_MULTA).AsFloat;
end;

function TMemRecibo.GetHONORARIOS: Double;
begin
  Result := FieldByName(FLD_HONORARIOS).AsFloat;
end;

function TMemRecibo.GetTOTAL_RECEBIDO: Double;
begin
  Result := FieldByName(FLD_TOTAL_RECEBIDO).AsFloat;
end;

function TMemRecibo.GetDATA_PAGAMENTO: TDateTime;
begin
  Result := FieldByName(FLD_DATA_PAGAMENTO).AsFloat;
end;

function TMemRecibo.GetCREDOR: string;
begin
  Result := FieldByName(FLD_CREDOR).AsString;
end;

function TMemRecibo.GetVENCIMENTO: TDateTime;
begin
  Result := FieldByName(FLD_VENCIMENTO).AsFloat;
end;

function TMemRecibo.GetTIPO_DOCUMENTO: string;
begin
  Result := FieldByName(FLD_TIPO_DOCUMENTO).AsString;
end;

procedure TMemRecibo.SetNUMERO(const Value: Integer);
begin
  FieldByName(FLD_NUMERO).AsInteger := Value;
end;

procedure TMemRecibo.SetDOCUMENTO(const Value: string);
begin
  FieldByName(FLD_DOCUMENTO).AsString := Value;
end;

procedure TMemRecibo.SetDEVEDOR(const Value: string);
begin
  FieldByName(FLD_DEVEDOR).AsString := Value;
end;

procedure TMemRecibo.SetCNPJ_DEVEDOR(const Value: string);
begin
  FieldByName(FLD_CNPJ_DEVEDOR).AsString := Value;
end;

procedure TMemRecibo.SetBANCO(const Value: Integer);
begin
  FieldByName(FLD_BANCO).AsInteger := Value;
end;

procedure TMemRecibo.SetPERIODO(const Value: string);
begin
  FieldByName(FLD_PERIODO).AsString := Value;
end;

procedure TMemRecibo.SetEH_INTEGRAL(const Value: Boolean);
begin
  FieldByName(FLD_EH_INTEGRAL).AsBoolean := Value;
end;

procedure TMemRecibo.SetPARCELA(const Value: string);
begin
  FieldByName(FLD_PARCELA).AsString := Value;
end;

procedure TMemRecibo.SetVALOR_EXTENSO(const Value: string);
begin
  FieldByName(FLD_VALOR_EXTENSO).AsString := Value;
end;

procedure TMemRecibo.SetVALOR(const Value: Double);
begin
  FieldByName(FLD_VALOR).AsFloat := Value;
end;

procedure TMemRecibo.SetOBSERVACAO(const Value: string);
begin
  FieldByName(FLD_OBSERVACAO).AsString := Value;
end;

procedure TMemRecibo.SetVALOR_PRINCIPAL(const Value: Double);
begin
  FieldByName(FLD_VALOR_PRINCIPAL).AsFloat := Value;
end;

procedure TMemRecibo.SetVALOR_DIVIDA(const Value: Double);
begin
  FieldByName(FLD_VALOR_DIVIDA).AsFloat := Value;
end;

procedure TMemRecibo.SetENCARGOS(const Value: Double);
begin
  FieldByName(FLD_ENCARGOS).AsFloat := Value;
end;

procedure TMemRecibo.SetMULTA(const Value: Double);
begin
  FieldByName(FLD_MULTA).AsFloat := Value;
end;

procedure TMemRecibo.SetHONORARIOS(const Value: Double);
begin
  FieldByName(FLD_HONORARIOS).AsFloat := Value;
end;

procedure TMemRecibo.SetTOTAL_RECEBIDO(const Value: Double);
begin
  FieldByName(FLD_TOTAL_RECEBIDO).AsFloat := Value;
end;

procedure TMemRecibo.SetDATA_PAGAMENTO(const Value: TDateTime);
begin
  FieldByName(FLD_DATA_PAGAMENTO).AsDateTime := Value;
end;

procedure TMemRecibo.SetCREDOR(const Value: string);
begin
  FieldByName(FLD_CREDOR).AsString := Value;
end;

procedure TMemRecibo.SetVENCIMENTO(const Value: TDateTime);
begin
  FieldByName(FLD_VENCIMENTO).AsDateTime := Value;
end;

procedure TMemRecibo.SetTIPO_DOCUMENTO(const Value: string);
begin
  FieldByName(FLD_TIPO_DOCUMENTO).AsString := Value;
end;


end.
