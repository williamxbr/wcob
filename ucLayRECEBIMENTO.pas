unit ucLayRECEBIMENTO;

interface

uses classes, adodb, variants;

type

 TRECEBIMENTOIndex = (recebimentopk_Recebimento, recebimentoInd_Cobranca, recebimentoInd_IdRepasse);

 TCustomRECEBIMENTO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetRECEBIMENTO: Integer;
  function GetACORDO: Integer;
  function GetCOBRANCA: Integer;
  function GetPARCELA: Integer;
  function GetVENCIMENTO: TDateTime;
  function GetSITUACAO: Integer;
  function GetVALOR: Double;
  function GetCOMISSAO: Double;
  function GetVALOR_REPASSE: Double;
  function GetTIPODOCUMENTO: Integer;
  function GetNUMERO_DOCUMENTO: String;
  function GetPAGO: Boolean;
  function GetDATA_PAGAMENTO: TDateTime;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetOBSERVACAO: String;
  function GetCOBRADOR: Integer;
  function GetPROMESSA_PAGAMENTO: TDateTime;
  function GetPAGTO_PRE_DATADO: Boolean;
  function GetVENCIMENTO_REAL: TDateTime;
  function GetJUROS: Double;
  function GetCHEQUE_COMPENSADO: Boolean;
  function GetBANCO: Integer;
  function GetIDREPASSE: Integer;
  function GetNUMERO_BOLETO: Integer;
  procedure SetRECEBIMENTO(const Value: Integer);
  procedure SetACORDO(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetPARCELA(const Value: Integer);
  procedure SetVENCIMENTO(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Integer);
  procedure SetVALOR(const Value: Double);
  procedure SetCOMISSAO(const Value: Double);
  procedure SetVALOR_REPASSE(const Value: Double);
  procedure SetTIPODOCUMENTO(const Value: Integer);
  procedure SetNUMERO_DOCUMENTO(const Value: String);
  procedure SetPAGO(const Value: Boolean);
  procedure SetDATA_PAGAMENTO(const Value: TDateTime);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetCOBRADOR(const Value: Integer);
  procedure SetPROMESSA_PAGAMENTO(const Value: TDateTime);
  procedure SetPAGTO_PRE_DATADO(const Value: Boolean);
  procedure SetVENCIMENTO_REAL(const Value: TDateTime);
  procedure SetJUROS(const Value: Double);
  procedure SetCHEQUE_COMPENSADO(const Value: Boolean);
  procedure SetBANCO(const Value: Integer);
  procedure SetIDREPASSE(const Value: Integer);
  procedure SetNUMERO_BOLETO(const Value: Integer);
  property RECEBIMENTO: Integer read GetRECEBIMENTO write SetRECEBIMENTO;
  property ACORDO: Integer read GetACORDO write SetACORDO;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property PARCELA: Integer read GetPARCELA write SetPARCELA;
  property VENCIMENTO: TDateTime read GetVENCIMENTO write SetVENCIMENTO;
  property SITUACAO: Integer read GetSITUACAO write SetSITUACAO;
  property VALOR: Double read GetVALOR write SetVALOR;
  property COMISSAO: Double read GetCOMISSAO write SetCOMISSAO;
  property VALOR_REPASSE: Double read GetVALOR_REPASSE write SetVALOR_REPASSE;
  property TIPODOCUMENTO: Integer read GetTIPODOCUMENTO write SetTIPODOCUMENTO;
  property NUMERO_DOCUMENTO: String read GetNUMERO_DOCUMENTO write SetNUMERO_DOCUMENTO;
  property PAGO: Boolean read GetPAGO write SetPAGO;
  property DATA_PAGAMENTO: TDateTime read GetDATA_PAGAMENTO write SetDATA_PAGAMENTO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property COBRADOR: Integer read GetCOBRADOR write SetCOBRADOR;
  property PROMESSA_PAGAMENTO: TDateTime read GetPROMESSA_PAGAMENTO write SetPROMESSA_PAGAMENTO;
  property PAGTO_PRE_DATADO: Boolean read GetPAGTO_PRE_DATADO write SetPAGTO_PRE_DATADO;
  property VENCIMENTO_REAL: TDateTime read GetVENCIMENTO_REAL write SetVENCIMENTO_REAL;
  property JUROS: Double read GetJUROS write SetJUROS;
  property CHEQUE_COMPENSADO: Boolean read GetCHEQUE_COMPENSADO write SetCHEQUE_COMPENSADO;
  property BANCO: Integer read GetBANCO write SetBANCO;
  property IDREPASSE: Integer read GetIDREPASSE write SetIDREPASSE;
  property NUMERO_BOLETO: Integer read GetNUMERO_BOLETO write SetNUMERO_BOLETO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Recebimento(pRECEBIMENTO : Integer) : Boolean;
 end;

 TRECEBIMENTO = class(TCustomRECEBIMENTO)
 public
  property RECEBIMENTO;
  property ACORDO;
  property COBRANCA;
  property PARCELA;
  property VENCIMENTO;
  property SITUACAO;
  property VALOR;
  property COMISSAO;
  property VALOR_REPASSE;
  property TIPODOCUMENTO;
  property NUMERO_DOCUMENTO;
  property PAGO;
  property DATA_PAGAMENTO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property OBSERVACAO;
  property COBRADOR;
  property PROMESSA_PAGAMENTO;
  property PAGTO_PRE_DATADO;
  property VENCIMENTO_REAL;
  property JUROS;
  property CHEQUE_COMPENSADO;
  property BANCO;
  property IDREPASSE;
  property NUMERO_BOLETO;
 end;

 TCustomSimplesRECEBIMENTO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetRECEBIMENTO: Integer;
  function GetACORDO: Integer;
  function GetCOBRANCA: Integer;
  function GetPARCELA: Integer;
  function GetVENCIMENTO: TDateTime;
  function GetSITUACAO: Integer;
  function GetVALOR: Double;
  function GetCOMISSAO: Double;
  function GetVALOR_REPASSE: Double;
  function GetTIPODOCUMENTO: Integer;
  function GetNUMERO_DOCUMENTO: String;
  function GetPAGO: Boolean;
  function GetDATA_PAGAMENTO: TDateTime;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetOBSERVACAO: String;
  function GetCOBRADOR: Integer;
  function GetPROMESSA_PAGAMENTO: TDateTime;
  function GetPAGTO_PRE_DATADO: Boolean;
  function GetVENCIMENTO_REAL: TDateTime;
  function GetJUROS: Double;
  function GetCHEQUE_COMPENSADO: Boolean;
  function GetBANCO: Integer;
  function GetIDREPASSE: Integer;
  function GetNUMERO_BOLETO: Integer;
  procedure SetRECEBIMENTO(const Value: Integer);
  procedure SetACORDO(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetPARCELA(const Value: Integer);
  procedure SetVENCIMENTO(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Integer);
  procedure SetVALOR(const Value: Double);
  procedure SetCOMISSAO(const Value: Double);
  procedure SetVALOR_REPASSE(const Value: Double);
  procedure SetTIPODOCUMENTO(const Value: Integer);
  procedure SetNUMERO_DOCUMENTO(const Value: String);
  procedure SetPAGO(const Value: Boolean);
  procedure SetDATA_PAGAMENTO(const Value: TDateTime);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetCOBRADOR(const Value: Integer);
  procedure SetPROMESSA_PAGAMENTO(const Value: TDateTime);
  procedure SetPAGTO_PRE_DATADO(const Value: Boolean);
  procedure SetVENCIMENTO_REAL(const Value: TDateTime);
  procedure SetJUROS(const Value: Double);
  procedure SetCHEQUE_COMPENSADO(const Value: Boolean);
  procedure SetBANCO(const Value: Integer);
  procedure SetIDREPASSE(const Value: Integer);
  procedure SetNUMERO_BOLETO(const Value: Integer);
  property RECEBIMENTO: Integer read GetRECEBIMENTO write SetRECEBIMENTO;
  property ACORDO: Integer read GetACORDO write SetACORDO;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property PARCELA: Integer read GetPARCELA write SetPARCELA;
  property VENCIMENTO: TDateTime read GetVENCIMENTO write SetVENCIMENTO;
  property SITUACAO: Integer read GetSITUACAO write SetSITUACAO;
  property VALOR: Double read GetVALOR write SetVALOR;
  property COMISSAO: Double read GetCOMISSAO write SetCOMISSAO;
  property VALOR_REPASSE: Double read GetVALOR_REPASSE write SetVALOR_REPASSE;
  property TIPODOCUMENTO: Integer read GetTIPODOCUMENTO write SetTIPODOCUMENTO;
  property NUMERO_DOCUMENTO: String read GetNUMERO_DOCUMENTO write SetNUMERO_DOCUMENTO;
  property PAGO: Boolean read GetPAGO write SetPAGO;
  property DATA_PAGAMENTO: TDateTime read GetDATA_PAGAMENTO write SetDATA_PAGAMENTO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property COBRADOR: Integer read GetCOBRADOR write SetCOBRADOR;
  property PROMESSA_PAGAMENTO: TDateTime read GetPROMESSA_PAGAMENTO write SetPROMESSA_PAGAMENTO;
  property PAGTO_PRE_DATADO: Boolean read GetPAGTO_PRE_DATADO write SetPAGTO_PRE_DATADO;
  property VENCIMENTO_REAL: TDateTime read GetVENCIMENTO_REAL write SetVENCIMENTO_REAL;
  property JUROS: Double read GetJUROS write SetJUROS;
  property CHEQUE_COMPENSADO: Boolean read GetCHEQUE_COMPENSADO write SetCHEQUE_COMPENSADO;
  property BANCO: Integer read GetBANCO write SetBANCO;
  property IDREPASSE: Integer read GetIDREPASSE write SetIDREPASSE;
  property NUMERO_BOLETO: Integer read GetNUMERO_BOLETO write SetNUMERO_BOLETO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TRECEBIMENTOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesRECEBIMENTO = class(TCustomSimplesRECEBIMENTO)
 public
  property RECEBIMENTO;
  property ACORDO;
  property COBRANCA;
  property PARCELA;
  property VENCIMENTO;
  property SITUACAO;
  property VALOR;
  property COMISSAO;
  property VALOR_REPASSE;
  property TIPODOCUMENTO;
  property NUMERO_DOCUMENTO;
  property PAGO;
  property DATA_PAGAMENTO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property OBSERVACAO;
  property COBRADOR;
  property PROMESSA_PAGAMENTO;
  property PAGTO_PRE_DATADO;
  property VENCIMENTO_REAL;
  property JUROS;
  property CHEQUE_COMPENSADO;
  property BANCO;
  property IDREPASSE;
  property NUMERO_BOLETO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_RECEBIMENTO = 'RECEBIMENTO';
  CNT_ACORDO = 'ACORDO';
  CNT_COBRANCA = 'COBRANCA';
  CNT_PARCELA = 'PARCELA';
  CNT_VENCIMENTO = 'VENCIMENTO';
  CNT_SITUACAO = 'SITUACAO';
  CNT_VALOR = 'VALOR';
  CNT_COMISSAO = 'COMISSAO';
  CNT_VALOR_REPASSE = 'VALOR_REPASSE';
  CNT_TIPODOCUMENTO = 'TIPODOCUMENTO';
  CNT_NUMERO_DOCUMENTO = 'NUMERO_DOCUMENTO';
  CNT_PAGO = 'PAGO';
  CNT_DATA_PAGAMENTO = 'DATA_PAGAMENTO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_COBRADOR = 'COBRADOR';
  CNT_PROMESSA_PAGAMENTO = 'PROMESSA_PAGAMENTO';
  CNT_PAGTO_PRE_DATADO = 'PAGTO_PRE_DATADO';
  CNT_VENCIMENTO_REAL = 'VENCIMENTO_REAL';
  CNT_JUROS = 'JUROS';
  CNT_CHEQUE_COMPENSADO = 'CHEQUE_COMPENSADO';
  CNT_BANCO = 'BANCO';
  CNT_IDREPASSE = 'IDREPASSE';
  CNT_NUMERO_BOLETO = 'NUMERO_BOLETO';

constructor TCustomRECEBIMENTO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'RECEBIMENTO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomRECEBIMENTO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomRECEBIMENTO.DoBeforePost;
begin
 Case   Self.State of
   dsEdit : Begin
              FieldByName(CNT_USUARIO_ALTERACAO).Value := TUniqueParametros.GetParametros.Usuario;
              FieldByName(CNT_DATA_ALTERACAO).Value := Now;
            End;
   dsInsert : Begin
                FieldByName(CNT_USUARIO_INCLUSAO).Value := TUniqueParametros.GetParametros.Usuario;
                FieldByName(CNT_DATA_INCLUSAO).Value := Now;
              End;
 End;
end;

function TCustomRECEBIMENTO.GetRECEBIMENTO: Integer;
begin
  Result := FieldByName(CNT_RECEBIMENTO).AsInteger;
end;


function TCustomRECEBIMENTO.GetACORDO: Integer;
begin
  Result := FieldByName(CNT_ACORDO).AsInteger;
end;


function TCustomRECEBIMENTO.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomRECEBIMENTO.GetPARCELA: Integer;
begin
  Result := FieldByName(CNT_PARCELA).AsInteger;
end;


function TCustomRECEBIMENTO.GetVENCIMENTO: TDateTime;
begin
  Result := FieldByName(CNT_VENCIMENTO).AsDateTime;
end;


function TCustomRECEBIMENTO.GetSITUACAO: Integer;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomRECEBIMENTO.GetVALOR: Double;
begin
  Result := FieldByName(CNT_VALOR).AsFloat;
end;


function TCustomRECEBIMENTO.GetCOMISSAO: Double;
begin
  Result := FieldByName(CNT_COMISSAO).AsFloat;
end;


function TCustomRECEBIMENTO.GetVALOR_REPASSE: Double;
begin
  Result := FieldByName(CNT_VALOR_REPASSE).AsFloat;
end;


function TCustomRECEBIMENTO.GetTIPODOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_TIPODOCUMENTO).AsInteger;
end;


function TCustomRECEBIMENTO.GetNUMERO_DOCUMENTO: String;
begin
  Result := FieldByName(CNT_NUMERO_DOCUMENTO).AsString;
end;


function TCustomRECEBIMENTO.GetPAGO: Boolean;
begin
  Result := FieldByName(CNT_PAGO).AsBoolean;
end;


function TCustomRECEBIMENTO.GetDATA_PAGAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_PAGAMENTO).AsDateTime;
end;


function TCustomRECEBIMENTO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomRECEBIMENTO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomRECEBIMENTO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomRECEBIMENTO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomRECEBIMENTO.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomRECEBIMENTO.GetCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_COBRADOR).AsInteger;
end;


function TCustomRECEBIMENTO.GetPROMESSA_PAGAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_PROMESSA_PAGAMENTO).AsDateTime;
end;


function TCustomRECEBIMENTO.GetPAGTO_PRE_DATADO: Boolean;
begin
  Result := FieldByName(CNT_PAGTO_PRE_DATADO).AsBoolean;
end;


function TCustomRECEBIMENTO.GetVENCIMENTO_REAL: TDateTime;
begin
  Result := FieldByName(CNT_VENCIMENTO_REAL).AsDateTime;
end;


function TCustomRECEBIMENTO.GetJUROS: Double;
begin
  Result := FieldByName(CNT_JUROS).AsFloat;
end;


function TCustomRECEBIMENTO.GetCHEQUE_COMPENSADO: Boolean;
begin
  Result := FieldByName(CNT_CHEQUE_COMPENSADO).AsBoolean;
end;


function TCustomRECEBIMENTO.GetBANCO: Integer;
begin
  Result := FieldByName(CNT_BANCO).AsInteger;
end;


function TCustomRECEBIMENTO.GetIDREPASSE: Integer;
begin
  Result := FieldByName(CNT_IDREPASSE).AsInteger;
end;


function TCustomRECEBIMENTO.GetNUMERO_BOLETO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_BOLETO).AsInteger;
end;


procedure TCustomRECEBIMENTO.SetRECEBIMENTO(const Value: Integer);
begin
 FieldByName(CNT_RECEBIMENTO).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetACORDO(const Value: Integer);
begin
 FieldByName(CNT_ACORDO).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_COBRANCA).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetPARCELA(const Value: Integer);
begin
 FieldByName(CNT_PARCELA).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetVENCIMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_VENCIMENTO).AsDateTime := Value;
end;


procedure TCustomRECEBIMENTO.SetSITUACAO(const Value: Integer);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetVALOR(const Value: Double);
begin
 FieldByName(CNT_VALOR).AsFloat := Value;
end;


procedure TCustomRECEBIMENTO.SetCOMISSAO(const Value: Double);
begin
 FieldByName(CNT_COMISSAO).AsFloat := Value;
end;


procedure TCustomRECEBIMENTO.SetVALOR_REPASSE(const Value: Double);
begin
 FieldByName(CNT_VALOR_REPASSE).AsFloat := Value;
end;


procedure TCustomRECEBIMENTO.SetTIPODOCUMENTO(const Value: Integer);
begin
 FieldByName(CNT_TIPODOCUMENTO).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetNUMERO_DOCUMENTO(const Value: String);
begin
 FieldByName(CNT_NUMERO_DOCUMENTO).AsString := Value;
end;


procedure TCustomRECEBIMENTO.SetPAGO(const Value: Boolean);
begin
 FieldByName(CNT_PAGO).AsBoolean := Value;
end;


procedure TCustomRECEBIMENTO.SetDATA_PAGAMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_PAGAMENTO).AsDateTime := Value;
end;


procedure TCustomRECEBIMENTO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomRECEBIMENTO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomRECEBIMENTO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomRECEBIMENTO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomRECEBIMENTO.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomRECEBIMENTO.SetCOBRADOR(const Value: Integer);
begin
 FieldByName(CNT_COBRADOR).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetPROMESSA_PAGAMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_PROMESSA_PAGAMENTO).AsDateTime := Value;
end;


procedure TCustomRECEBIMENTO.SetPAGTO_PRE_DATADO(const Value: Boolean);
begin
 FieldByName(CNT_PAGTO_PRE_DATADO).AsBoolean := Value;
end;


procedure TCustomRECEBIMENTO.SetVENCIMENTO_REAL(const Value: TDateTime);
begin
 FieldByName(CNT_VENCIMENTO_REAL).AsDateTime := Value;
end;


procedure TCustomRECEBIMENTO.SetJUROS(const Value: Double);
begin
 FieldByName(CNT_JUROS).AsFloat := Value;
end;


procedure TCustomRECEBIMENTO.SetCHEQUE_COMPENSADO(const Value: Boolean);
begin
 FieldByName(CNT_CHEQUE_COMPENSADO).AsBoolean := Value;
end;


procedure TCustomRECEBIMENTO.SetBANCO(const Value: Integer);
begin
 FieldByName(CNT_BANCO).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetIDREPASSE(const Value: Integer);
begin
 FieldByName(CNT_IDREPASSE).AsInteger := Value;
end;


procedure TCustomRECEBIMENTO.SetNUMERO_BOLETO(const Value: Integer);
begin
 FieldByName(CNT_NUMERO_BOLETO).AsInteger := Value;
end;


function TCustomRECEBIMENTO.FindBypk_Recebimento(pRECEBIMENTO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'RECEBIMENTO';
  fvalue := pRECEBIMENTO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesRECEBIMENTO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesRECEBIMENTO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesRECEBIMENTO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from RECEBIMENTO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesRECEBIMENTO.GetRECEBIMENTO: Integer;
begin
  Result := FieldByName(CNT_RECEBIMENTO).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetACORDO: Integer;
begin
  Result := FieldByName(CNT_ACORDO).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetPARCELA: Integer;
begin
  Result := FieldByName(CNT_PARCELA).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetVENCIMENTO: TDateTime;
begin
  Result := FieldByName(CNT_VENCIMENTO).AsDateTime;
end;


function TCustomSimplesRECEBIMENTO.GetSITUACAO: Integer;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetVALOR: Double;
begin
  Result := FieldByName(CNT_VALOR).AsFloat;
end;


function TCustomSimplesRECEBIMENTO.GetCOMISSAO: Double;
begin
  Result := FieldByName(CNT_COMISSAO).AsFloat;
end;


function TCustomSimplesRECEBIMENTO.GetVALOR_REPASSE: Double;
begin
  Result := FieldByName(CNT_VALOR_REPASSE).AsFloat;
end;


function TCustomSimplesRECEBIMENTO.GetTIPODOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_TIPODOCUMENTO).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetNUMERO_DOCUMENTO: String;
begin
  Result := FieldByName(CNT_NUMERO_DOCUMENTO).AsString;
end;


function TCustomSimplesRECEBIMENTO.GetPAGO: Boolean;
begin
  Result := FieldByName(CNT_PAGO).AsBoolean;
end;


function TCustomSimplesRECEBIMENTO.GetDATA_PAGAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_PAGAMENTO).AsDateTime;
end;


function TCustomSimplesRECEBIMENTO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesRECEBIMENTO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesRECEBIMENTO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesRECEBIMENTO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesRECEBIMENTO.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesRECEBIMENTO.GetCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_COBRADOR).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetPROMESSA_PAGAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_PROMESSA_PAGAMENTO).AsDateTime;
end;


function TCustomSimplesRECEBIMENTO.GetPAGTO_PRE_DATADO: Boolean;
begin
  Result := FieldByName(CNT_PAGTO_PRE_DATADO).AsBoolean;
end;


function TCustomSimplesRECEBIMENTO.GetVENCIMENTO_REAL: TDateTime;
begin
  Result := FieldByName(CNT_VENCIMENTO_REAL).AsDateTime;
end;


function TCustomSimplesRECEBIMENTO.GetJUROS: Double;
begin
  Result := FieldByName(CNT_JUROS).AsFloat;
end;


function TCustomSimplesRECEBIMENTO.GetCHEQUE_COMPENSADO: Boolean;
begin
  Result := FieldByName(CNT_CHEQUE_COMPENSADO).AsBoolean;
end;


function TCustomSimplesRECEBIMENTO.GetBANCO: Integer;
begin
  Result := FieldByName(CNT_BANCO).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetIDREPASSE: Integer;
begin
  Result := FieldByName(CNT_IDREPASSE).AsInteger;
end;


function TCustomSimplesRECEBIMENTO.GetNUMERO_BOLETO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_BOLETO).AsInteger;
end;


procedure TCustomSimplesRECEBIMENTO.SetRECEBIMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_RECEBIMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetACORDO(const Value: Integer);
begin
  StrCondicao.Add(CNT_ACORDO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetPARCELA(const Value: Integer);
begin
  StrCondicao.Add(CNT_PARCELA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetVENCIMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_VENCIMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECEBIMENTO.SetSITUACAO(const Value: Integer);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetVALOR(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetCOMISSAO(const Value: Double);
begin
  StrCondicao.Add(CNT_COMISSAO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetVALOR_REPASSE(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_REPASSE+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetTIPODOCUMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_TIPODOCUMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetNUMERO_DOCUMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_NUMERO_DOCUMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetPAGO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_PAGO+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesRECEBIMENTO.SetDATA_PAGAMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_PAGAMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECEBIMENTO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECEBIMENTO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECEBIMENTO.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetCOBRADOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRADOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetPROMESSA_PAGAMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_PROMESSA_PAGAMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECEBIMENTO.SetPAGTO_PRE_DATADO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_PAGTO_PRE_DATADO+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesRECEBIMENTO.SetVENCIMENTO_REAL(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_VENCIMENTO_REAL+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECEBIMENTO.SetJUROS(const Value: Double);
begin
  StrCondicao.Add(CNT_JUROS+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetCHEQUE_COMPENSADO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_CHEQUE_COMPENSADO+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesRECEBIMENTO.SetBANCO(const Value: Integer);
begin
  StrCondicao.Add(CNT_BANCO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetIDREPASSE(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDREPASSE+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECEBIMENTO.SetNUMERO_BOLETO(const Value: Integer);
begin
  StrCondicao.Add(CNT_NUMERO_BOLETO+' = '+IntToStr(Value)); 
end;

procedure TCustomSimplesRECEBIMENTO.plMontaCondicao;
Var
  Indice : Integer;
begin
  If   Length(StrCondicao.CommaText) <> 0 Then
       For Indice := 0 To StrCondicao.Count -1 Do
       Begin
         If   Indice = 0 Then
              SQL.Add(' Where ')
         Else SQL.Add(' And ');
         SQL.Add(StrCondicao[Indice]);
       End;
  StrCondicao.Clear;
end;

procedure TCustomSimplesRECEBIMENTO.plOrdenarPor(leIndice : TRECEBIMENTOIndex );
begin
  Case leIndice Of
    recebimentopk_Recebimento : lsOrdenar := ' Order By RECEBIMENTO';
    recebimentoInd_Cobranca : lsOrdenar := ' Order By COBRANCA';
    recebimentoInd_IdRepasse : lsOrdenar := ' Order By IDREPASSE';
  End;
end;

procedure TCustomSimplesRECEBIMENTO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesRECEBIMENTO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesRECEBIMENTO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

