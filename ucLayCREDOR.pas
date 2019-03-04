unit ucLayCREDOR;

interface

uses classes, adodb, variants;

type

 TCREDORIndex = (credorInd_Cnpj_Cpf, credorpk_Codigo_Credor, credorInd_Nome_Credor, credorInd_Razao_Social);

 TCustomCREDOR = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetCODIGO_CREDOR: Integer;
  function GetNOME_CREDOR: String;
  function GetTIPO_CREDOR: Word;
  function GetCNPJ_CPF: String;
  function GetRAZAO_SOCIAL: String;
  function GetDATA_CADASTRO: String;
  function GetENDERECO: String;
  function GetNUMERO: String;
  function GetCOMPLEMENTO: String;
  function GetBAIRRO: String;
  function GetCIDADE: String;
  function GetESTADO: String;
  function GetCEP: String;
  function GetOBSERVACAO: String;
  function GetTELEFONE01: String;
  function GetTELEFONE02: String;
  function GetTELEFONE03: String;
  function GetFAX: String;
  function GetSITE: String;
  function GetEMAIL01: String;
  function GetEMAIL02: String;
  function GetEMAIL03: String;
  function GetCONTATO01: String;
  function GetCONTATO02: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetDDD1: String;
  function GetDDD2: String;
  function GetDDD3: String;
  function GetMULTA: Double;
  function GetDESCONTO_MINIMO: Double;
  function GetDESCONTO_MAXIMO: Double;
  function GetPERCENTUAL_ATRASO: Double;
  function GetAPLICAR_DADOS_FINANCEIROS: Boolean;
  function GetGERAR_BOLETOS: Boolean;
  procedure SetCODIGO_CREDOR(const Value: Integer);
  procedure SetNOME_CREDOR(const Value: String);
  procedure SetTIPO_CREDOR(const Value: Word);
  procedure SetCNPJ_CPF(const Value: String);
  procedure SetRAZAO_SOCIAL(const Value: String);
  procedure SetDATA_CADASTRO(const Value: String);
  procedure SetENDERECO(const Value: String);
  procedure SetNUMERO(const Value: String);
  procedure SetCOMPLEMENTO(const Value: String);
  procedure SetBAIRRO(const Value: String);
  procedure SetCIDADE(const Value: String);
  procedure SetESTADO(const Value: String);
  procedure SetCEP(const Value: String);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetTELEFONE01(const Value: String);
  procedure SetTELEFONE02(const Value: String);
  procedure SetTELEFONE03(const Value: String);
  procedure SetFAX(const Value: String);
  procedure SetSITE(const Value: String);
  procedure SetEMAIL01(const Value: String);
  procedure SetEMAIL02(const Value: String);
  procedure SetEMAIL03(const Value: String);
  procedure SetCONTATO01(const Value: String);
  procedure SetCONTATO02(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetDDD1(const Value: String);
  procedure SetDDD2(const Value: String);
  procedure SetDDD3(const Value: String);
  procedure SetMULTA(const Value: Double);
  procedure SetDESCONTO_MINIMO(const Value: Double);
  procedure SetDESCONTO_MAXIMO(const Value: Double);
  procedure SetPERCENTUAL_ATRASO(const Value: Double);
  procedure SetAPLICAR_DADOS_FINANCEIROS(const Value: Boolean);
  procedure SetGERAR_BOLETOS(const Value: Boolean);
  property CODIGO_CREDOR: Integer read GetCODIGO_CREDOR write SetCODIGO_CREDOR;
  property NOME_CREDOR: String read GetNOME_CREDOR write SetNOME_CREDOR;
  property TIPO_CREDOR: Word read GetTIPO_CREDOR write SetTIPO_CREDOR;
  property CNPJ_CPF: String read GetCNPJ_CPF write SetCNPJ_CPF;
  property RAZAO_SOCIAL: String read GetRAZAO_SOCIAL write SetRAZAO_SOCIAL;
  property DATA_CADASTRO: String read GetDATA_CADASTRO write SetDATA_CADASTRO;
  property ENDERECO: String read GetENDERECO write SetENDERECO;
  property NUMERO: String read GetNUMERO write SetNUMERO;
  property COMPLEMENTO: String read GetCOMPLEMENTO write SetCOMPLEMENTO;
  property BAIRRO: String read GetBAIRRO write SetBAIRRO;
  property CIDADE: String read GetCIDADE write SetCIDADE;
  property ESTADO: String read GetESTADO write SetESTADO;
  property CEP: String read GetCEP write SetCEP;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property TELEFONE01: String read GetTELEFONE01 write SetTELEFONE01;
  property TELEFONE02: String read GetTELEFONE02 write SetTELEFONE02;
  property TELEFONE03: String read GetTELEFONE03 write SetTELEFONE03;
  property FAX: String read GetFAX write SetFAX;
  property SITE: String read GetSITE write SetSITE;
  property EMAIL01: String read GetEMAIL01 write SetEMAIL01;
  property EMAIL02: String read GetEMAIL02 write SetEMAIL02;
  property EMAIL03: String read GetEMAIL03 write SetEMAIL03;
  property CONTATO01: String read GetCONTATO01 write SetCONTATO01;
  property CONTATO02: String read GetCONTATO02 write SetCONTATO02;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property DDD1: String read GetDDD1 write SetDDD1;
  property DDD2: String read GetDDD2 write SetDDD2;
  property DDD3: String read GetDDD3 write SetDDD3;
  property MULTA: Double read GetMULTA write SetMULTA;
  property DESCONTO_MINIMO: Double read GetDESCONTO_MINIMO write SetDESCONTO_MINIMO;
  property DESCONTO_MAXIMO: Double read GetDESCONTO_MAXIMO write SetDESCONTO_MAXIMO;
  property PERCENTUAL_ATRASO: Double read GetPERCENTUAL_ATRASO write SetPERCENTUAL_ATRASO;
  property APLICAR_DADOS_FINANCEIROS: Boolean read GetAPLICAR_DADOS_FINANCEIROS write SetAPLICAR_DADOS_FINANCEIROS;
  property GERAR_BOLETOS: Boolean read GetGERAR_BOLETOS write SetGERAR_BOLETOS;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Cnpj_Cpf(pCNPJ_CPF : String) : Boolean;
  function FindBypk_Codigo_Credor(pCODIGO_CREDOR : Integer) : Boolean;
 end;

 TCREDOR = class(TCustomCREDOR)
 public
  property CODIGO_CREDOR;
  property NOME_CREDOR;
  property TIPO_CREDOR;
  property CNPJ_CPF;
  property RAZAO_SOCIAL;
  property DATA_CADASTRO;
  property ENDERECO;
  property NUMERO;
  property COMPLEMENTO;
  property BAIRRO;
  property CIDADE;
  property ESTADO;
  property CEP;
  property OBSERVACAO;
  property TELEFONE01;
  property TELEFONE02;
  property TELEFONE03;
  property FAX;
  property SITE;
  property EMAIL01;
  property EMAIL02;
  property EMAIL03;
  property CONTATO01;
  property CONTATO02;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property DDD1;
  property DDD2;
  property DDD3;
  property MULTA;
  property DESCONTO_MINIMO;
  property DESCONTO_MAXIMO;
  property PERCENTUAL_ATRASO;
  property APLICAR_DADOS_FINANCEIROS;
  property GERAR_BOLETOS;
 end;

 TCustomSimplesCREDOR = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetCODIGO_CREDOR: Integer;
  function GetNOME_CREDOR: String;
  function GetTIPO_CREDOR: Word;
  function GetCNPJ_CPF: String;
  function GetRAZAO_SOCIAL: String;
  function GetDATA_CADASTRO: String;
  function GetENDERECO: String;
  function GetNUMERO: String;
  function GetCOMPLEMENTO: String;
  function GetBAIRRO: String;
  function GetCIDADE: String;
  function GetESTADO: String;
  function GetCEP: String;
  function GetOBSERVACAO: String;
  function GetTELEFONE01: String;
  function GetTELEFONE02: String;
  function GetTELEFONE03: String;
  function GetFAX: String;
  function GetSITE: String;
  function GetEMAIL01: String;
  function GetEMAIL02: String;
  function GetEMAIL03: String;
  function GetCONTATO01: String;
  function GetCONTATO02: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetDDD1: String;
  function GetDDD2: String;
  function GetDDD3: String;
  function GetMULTA: Double;
  function GetDESCONTO_MINIMO: Double;
  function GetDESCONTO_MAXIMO: Double;
  function GetPERCENTUAL_ATRASO: Double;
  function GetAPLICAR_DADOS_FINANCEIROS: Boolean;
  function GetGERAR_BOLETOS: Boolean;
  procedure SetCODIGO_CREDOR(const Value: Integer);
  procedure SetNOME_CREDOR(const Value: String);
  procedure SetTIPO_CREDOR(const Value: Word);
  procedure SetCNPJ_CPF(const Value: String);
  procedure SetRAZAO_SOCIAL(const Value: String);
  procedure SetDATA_CADASTRO(const Value: String);
  procedure SetENDERECO(const Value: String);
  procedure SetNUMERO(const Value: String);
  procedure SetCOMPLEMENTO(const Value: String);
  procedure SetBAIRRO(const Value: String);
  procedure SetCIDADE(const Value: String);
  procedure SetESTADO(const Value: String);
  procedure SetCEP(const Value: String);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetTELEFONE01(const Value: String);
  procedure SetTELEFONE02(const Value: String);
  procedure SetTELEFONE03(const Value: String);
  procedure SetFAX(const Value: String);
  procedure SetSITE(const Value: String);
  procedure SetEMAIL01(const Value: String);
  procedure SetEMAIL02(const Value: String);
  procedure SetEMAIL03(const Value: String);
  procedure SetCONTATO01(const Value: String);
  procedure SetCONTATO02(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetDDD1(const Value: String);
  procedure SetDDD2(const Value: String);
  procedure SetDDD3(const Value: String);
  procedure SetMULTA(const Value: Double);
  procedure SetDESCONTO_MINIMO(const Value: Double);
  procedure SetDESCONTO_MAXIMO(const Value: Double);
  procedure SetPERCENTUAL_ATRASO(const Value: Double);
  procedure SetAPLICAR_DADOS_FINANCEIROS(const Value: Boolean);
  procedure SetGERAR_BOLETOS(const Value: Boolean);
  property CODIGO_CREDOR: Integer read GetCODIGO_CREDOR write SetCODIGO_CREDOR;
  property NOME_CREDOR: String read GetNOME_CREDOR write SetNOME_CREDOR;
  property TIPO_CREDOR: Word read GetTIPO_CREDOR write SetTIPO_CREDOR;
  property CNPJ_CPF: String read GetCNPJ_CPF write SetCNPJ_CPF;
  property RAZAO_SOCIAL: String read GetRAZAO_SOCIAL write SetRAZAO_SOCIAL;
  property DATA_CADASTRO: String read GetDATA_CADASTRO write SetDATA_CADASTRO;
  property ENDERECO: String read GetENDERECO write SetENDERECO;
  property NUMERO: String read GetNUMERO write SetNUMERO;
  property COMPLEMENTO: String read GetCOMPLEMENTO write SetCOMPLEMENTO;
  property BAIRRO: String read GetBAIRRO write SetBAIRRO;
  property CIDADE: String read GetCIDADE write SetCIDADE;
  property ESTADO: String read GetESTADO write SetESTADO;
  property CEP: String read GetCEP write SetCEP;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property TELEFONE01: String read GetTELEFONE01 write SetTELEFONE01;
  property TELEFONE02: String read GetTELEFONE02 write SetTELEFONE02;
  property TELEFONE03: String read GetTELEFONE03 write SetTELEFONE03;
  property FAX: String read GetFAX write SetFAX;
  property SITE: String read GetSITE write SetSITE;
  property EMAIL01: String read GetEMAIL01 write SetEMAIL01;
  property EMAIL02: String read GetEMAIL02 write SetEMAIL02;
  property EMAIL03: String read GetEMAIL03 write SetEMAIL03;
  property CONTATO01: String read GetCONTATO01 write SetCONTATO01;
  property CONTATO02: String read GetCONTATO02 write SetCONTATO02;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property DDD1: String read GetDDD1 write SetDDD1;
  property DDD2: String read GetDDD2 write SetDDD2;
  property DDD3: String read GetDDD3 write SetDDD3;
  property MULTA: Double read GetMULTA write SetMULTA;
  property DESCONTO_MINIMO: Double read GetDESCONTO_MINIMO write SetDESCONTO_MINIMO;
  property DESCONTO_MAXIMO: Double read GetDESCONTO_MAXIMO write SetDESCONTO_MAXIMO;
  property PERCENTUAL_ATRASO: Double read GetPERCENTUAL_ATRASO write SetPERCENTUAL_ATRASO;
  property APLICAR_DADOS_FINANCEIROS: Boolean read GetAPLICAR_DADOS_FINANCEIROS write SetAPLICAR_DADOS_FINANCEIROS;
  property GERAR_BOLETOS: Boolean read GetGERAR_BOLETOS write SetGERAR_BOLETOS;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TCREDORIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesCREDOR = class(TCustomSimplesCREDOR)
 public
  property CODIGO_CREDOR;
  property NOME_CREDOR;
  property TIPO_CREDOR;
  property CNPJ_CPF;
  property RAZAO_SOCIAL;
  property DATA_CADASTRO;
  property ENDERECO;
  property NUMERO;
  property COMPLEMENTO;
  property BAIRRO;
  property CIDADE;
  property ESTADO;
  property CEP;
  property OBSERVACAO;
  property TELEFONE01;
  property TELEFONE02;
  property TELEFONE03;
  property FAX;
  property SITE;
  property EMAIL01;
  property EMAIL02;
  property EMAIL03;
  property CONTATO01;
  property CONTATO02;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property DDD1;
  property DDD2;
  property DDD3;
  property MULTA;
  property DESCONTO_MINIMO;
  property DESCONTO_MAXIMO;
  property PERCENTUAL_ATRASO;
  property APLICAR_DADOS_FINANCEIROS;
  property GERAR_BOLETOS;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_CODIGO_CREDOR = 'CODIGO_CREDOR';
  CNT_NOME_CREDOR = 'NOME_CREDOR';
  CNT_TIPO_CREDOR = 'TIPO_CREDOR';
  CNT_CNPJ_CPF = 'CNPJ_CPF';
  CNT_RAZAO_SOCIAL = 'RAZAO_SOCIAL';
  CNT_DATA_CADASTRO = 'DATA_CADASTRO';
  CNT_ENDERECO = 'ENDERECO';
  CNT_NUMERO = 'NUMERO';
  CNT_COMPLEMENTO = 'COMPLEMENTO';
  CNT_BAIRRO = 'BAIRRO';
  CNT_CIDADE = 'CIDADE';
  CNT_ESTADO = 'ESTADO';
  CNT_CEP = 'CEP';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_TELEFONE01 = 'TELEFONE01';
  CNT_TELEFONE02 = 'TELEFONE02';
  CNT_TELEFONE03 = 'TELEFONE03';
  CNT_FAX = 'FAX';
  CNT_SITE = 'SITE';
  CNT_EMAIL01 = 'EMAIL01';
  CNT_EMAIL02 = 'EMAIL02';
  CNT_EMAIL03 = 'EMAIL03';
  CNT_CONTATO01 = 'CONTATO01';
  CNT_CONTATO02 = 'CONTATO02';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_DDD1 = 'DDD1';
  CNT_DDD2 = 'DDD2';
  CNT_DDD3 = 'DDD3';
  CNT_MULTA = 'MULTA';
  CNT_DESCONTO_MINIMO = 'DESCONTO_MINIMO';
  CNT_DESCONTO_MAXIMO = 'DESCONTO_MAXIMO';
  CNT_PERCENTUAL_ATRASO = 'PERCENTUAL_ATRASO';
  CNT_APLICAR_DADOS_FINANCEIROS = 'APLICAR_DADOS_FINANCEIROS';
  CNT_GERAR_BOLETOS = 'GERAR_BOLETOS';

constructor TCustomCREDOR.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'CREDOR';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomCREDOR.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomCREDOR.DoBeforePost;
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

function TCustomCREDOR.GetCODIGO_CREDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_CREDOR).AsInteger;
end;


function TCustomCREDOR.GetNOME_CREDOR: String;
begin
  Result := FieldByName(CNT_NOME_CREDOR).AsString;
end;


function TCustomCREDOR.GetTIPO_CREDOR: Word;
begin
  Result := FieldByName(CNT_TIPO_CREDOR).AsInteger;
end;


function TCustomCREDOR.GetCNPJ_CPF: String;
begin
  Result := FieldByName(CNT_CNPJ_CPF).AsString;
end;


function TCustomCREDOR.GetRAZAO_SOCIAL: String;
begin
  Result := FieldByName(CNT_RAZAO_SOCIAL).AsString;
end;


function TCustomCREDOR.GetDATA_CADASTRO: String;
begin
  Result := FieldByName(CNT_DATA_CADASTRO).AsString;
end;


function TCustomCREDOR.GetENDERECO: String;
begin
  Result := FieldByName(CNT_ENDERECO).AsString;
end;


function TCustomCREDOR.GetNUMERO: String;
begin
  Result := FieldByName(CNT_NUMERO).AsString;
end;


function TCustomCREDOR.GetCOMPLEMENTO: String;
begin
  Result := FieldByName(CNT_COMPLEMENTO).AsString;
end;


function TCustomCREDOR.GetBAIRRO: String;
begin
  Result := FieldByName(CNT_BAIRRO).AsString;
end;


function TCustomCREDOR.GetCIDADE: String;
begin
  Result := FieldByName(CNT_CIDADE).AsString;
end;


function TCustomCREDOR.GetESTADO: String;
begin
  Result := FieldByName(CNT_ESTADO).AsString;
end;


function TCustomCREDOR.GetCEP: String;
begin
  Result := FieldByName(CNT_CEP).AsString;
end;


function TCustomCREDOR.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomCREDOR.GetTELEFONE01: String;
begin
  Result := FieldByName(CNT_TELEFONE01).AsString;
end;


function TCustomCREDOR.GetTELEFONE02: String;
begin
  Result := FieldByName(CNT_TELEFONE02).AsString;
end;


function TCustomCREDOR.GetTELEFONE03: String;
begin
  Result := FieldByName(CNT_TELEFONE03).AsString;
end;


function TCustomCREDOR.GetFAX: String;
begin
  Result := FieldByName(CNT_FAX).AsString;
end;


function TCustomCREDOR.GetSITE: String;
begin
  Result := FieldByName(CNT_SITE).AsString;
end;


function TCustomCREDOR.GetEMAIL01: String;
begin
  Result := FieldByName(CNT_EMAIL01).AsString;
end;


function TCustomCREDOR.GetEMAIL02: String;
begin
  Result := FieldByName(CNT_EMAIL02).AsString;
end;


function TCustomCREDOR.GetEMAIL03: String;
begin
  Result := FieldByName(CNT_EMAIL03).AsString;
end;


function TCustomCREDOR.GetCONTATO01: String;
begin
  Result := FieldByName(CNT_CONTATO01).AsString;
end;


function TCustomCREDOR.GetCONTATO02: String;
begin
  Result := FieldByName(CNT_CONTATO02).AsString;
end;


function TCustomCREDOR.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomCREDOR.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomCREDOR.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomCREDOR.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomCREDOR.GetDDD1: String;
begin
  Result := FieldByName(CNT_DDD1).AsString;
end;


function TCustomCREDOR.GetDDD2: String;
begin
  Result := FieldByName(CNT_DDD2).AsString;
end;


function TCustomCREDOR.GetDDD3: String;
begin
  Result := FieldByName(CNT_DDD3).AsString;
end;


function TCustomCREDOR.GetMULTA: Double;
begin
  Result := FieldByName(CNT_MULTA).AsFloat;
end;


function TCustomCREDOR.GetDESCONTO_MINIMO: Double;
begin
  Result := FieldByName(CNT_DESCONTO_MINIMO).AsFloat;
end;


function TCustomCREDOR.GetDESCONTO_MAXIMO: Double;
begin
  Result := FieldByName(CNT_DESCONTO_MAXIMO).AsFloat;
end;


function TCustomCREDOR.GetPERCENTUAL_ATRASO: Double;
begin
  Result := FieldByName(CNT_PERCENTUAL_ATRASO).AsFloat;
end;


function TCustomCREDOR.GetAPLICAR_DADOS_FINANCEIROS: Boolean;
begin
  Result := FieldByName(CNT_APLICAR_DADOS_FINANCEIROS).AsBoolean;
end;


function TCustomCREDOR.GetGERAR_BOLETOS: Boolean;
begin
  Result := FieldByName(CNT_GERAR_BOLETOS).AsBoolean;
end;


procedure TCustomCREDOR.SetCODIGO_CREDOR(const Value: Integer);
begin
 FieldByName(CNT_CODIGO_CREDOR).AsInteger := Value;
end;


procedure TCustomCREDOR.SetNOME_CREDOR(const Value: String);
begin
 FieldByName(CNT_NOME_CREDOR).AsString := Value;
end;


procedure TCustomCREDOR.SetTIPO_CREDOR(const Value: Word);
begin
 FieldByName(CNT_TIPO_CREDOR).AsInteger := Value;
end;


procedure TCustomCREDOR.SetCNPJ_CPF(const Value: String);
begin
 FieldByName(CNT_CNPJ_CPF).AsString := Value;
end;


procedure TCustomCREDOR.SetRAZAO_SOCIAL(const Value: String);
begin
 FieldByName(CNT_RAZAO_SOCIAL).AsString := Value;
end;


procedure TCustomCREDOR.SetDATA_CADASTRO(const Value: String);
begin
 FieldByName(CNT_DATA_CADASTRO).AsString := Value;
end;


procedure TCustomCREDOR.SetENDERECO(const Value: String);
begin
 FieldByName(CNT_ENDERECO).AsString := Value;
end;


procedure TCustomCREDOR.SetNUMERO(const Value: String);
begin
 FieldByName(CNT_NUMERO).AsString := Value;
end;


procedure TCustomCREDOR.SetCOMPLEMENTO(const Value: String);
begin
 FieldByName(CNT_COMPLEMENTO).AsString := Value;
end;


procedure TCustomCREDOR.SetBAIRRO(const Value: String);
begin
 FieldByName(CNT_BAIRRO).AsString := Value;
end;


procedure TCustomCREDOR.SetCIDADE(const Value: String);
begin
 FieldByName(CNT_CIDADE).AsString := Value;
end;


procedure TCustomCREDOR.SetESTADO(const Value: String);
begin
 FieldByName(CNT_ESTADO).AsString := Value;
end;


procedure TCustomCREDOR.SetCEP(const Value: String);
begin
 FieldByName(CNT_CEP).AsString := Value;
end;


procedure TCustomCREDOR.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomCREDOR.SetTELEFONE01(const Value: String);
begin
 FieldByName(CNT_TELEFONE01).AsString := Value;
end;


procedure TCustomCREDOR.SetTELEFONE02(const Value: String);
begin
 FieldByName(CNT_TELEFONE02).AsString := Value;
end;


procedure TCustomCREDOR.SetTELEFONE03(const Value: String);
begin
 FieldByName(CNT_TELEFONE03).AsString := Value;
end;


procedure TCustomCREDOR.SetFAX(const Value: String);
begin
 FieldByName(CNT_FAX).AsString := Value;
end;


procedure TCustomCREDOR.SetSITE(const Value: String);
begin
 FieldByName(CNT_SITE).AsString := Value;
end;


procedure TCustomCREDOR.SetEMAIL01(const Value: String);
begin
 FieldByName(CNT_EMAIL01).AsString := Value;
end;


procedure TCustomCREDOR.SetEMAIL02(const Value: String);
begin
 FieldByName(CNT_EMAIL02).AsString := Value;
end;


procedure TCustomCREDOR.SetEMAIL03(const Value: String);
begin
 FieldByName(CNT_EMAIL03).AsString := Value;
end;


procedure TCustomCREDOR.SetCONTATO01(const Value: String);
begin
 FieldByName(CNT_CONTATO01).AsString := Value;
end;


procedure TCustomCREDOR.SetCONTATO02(const Value: String);
begin
 FieldByName(CNT_CONTATO02).AsString := Value;
end;


procedure TCustomCREDOR.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomCREDOR.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomCREDOR.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomCREDOR.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomCREDOR.SetDDD1(const Value: String);
begin
 FieldByName(CNT_DDD1).AsString := Value;
end;


procedure TCustomCREDOR.SetDDD2(const Value: String);
begin
 FieldByName(CNT_DDD2).AsString := Value;
end;


procedure TCustomCREDOR.SetDDD3(const Value: String);
begin
 FieldByName(CNT_DDD3).AsString := Value;
end;


procedure TCustomCREDOR.SetMULTA(const Value: Double);
begin
 FieldByName(CNT_MULTA).AsFloat := Value;
end;


procedure TCustomCREDOR.SetDESCONTO_MINIMO(const Value: Double);
begin
 FieldByName(CNT_DESCONTO_MINIMO).AsFloat := Value;
end;


procedure TCustomCREDOR.SetDESCONTO_MAXIMO(const Value: Double);
begin
 FieldByName(CNT_DESCONTO_MAXIMO).AsFloat := Value;
end;


procedure TCustomCREDOR.SetPERCENTUAL_ATRASO(const Value: Double);
begin
 FieldByName(CNT_PERCENTUAL_ATRASO).AsFloat := Value;
end;


procedure TCustomCREDOR.SetAPLICAR_DADOS_FINANCEIROS(const Value: Boolean);
begin
 FieldByName(CNT_APLICAR_DADOS_FINANCEIROS).AsBoolean := Value;
end;


procedure TCustomCREDOR.SetGERAR_BOLETOS(const Value: Boolean);
begin
 FieldByName(CNT_GERAR_BOLETOS).AsBoolean := Value;
end;


function TCustomCREDOR.FindByInd_Cnpj_Cpf(pCNPJ_CPF : String) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'CNPJ_CPF';
  fvalue := pCNPJ_CPF;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomCREDOR.FindBypk_Codigo_Credor(pCODIGO_CREDOR : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'CODIGO_CREDOR';
  fvalue := pCODIGO_CREDOR;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesCREDOR.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesCREDOR.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesCREDOR.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from CREDOR');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesCREDOR.GetCODIGO_CREDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_CREDOR).AsInteger;
end;


function TCustomSimplesCREDOR.GetNOME_CREDOR: String;
begin
  Result := FieldByName(CNT_NOME_CREDOR).AsString;
end;


function TCustomSimplesCREDOR.GetTIPO_CREDOR: Word;
begin
  Result := FieldByName(CNT_TIPO_CREDOR).AsInteger;
end;


function TCustomSimplesCREDOR.GetCNPJ_CPF: String;
begin
  Result := FieldByName(CNT_CNPJ_CPF).AsString;
end;


function TCustomSimplesCREDOR.GetRAZAO_SOCIAL: String;
begin
  Result := FieldByName(CNT_RAZAO_SOCIAL).AsString;
end;


function TCustomSimplesCREDOR.GetDATA_CADASTRO: String;
begin
  Result := FieldByName(CNT_DATA_CADASTRO).AsString;
end;


function TCustomSimplesCREDOR.GetENDERECO: String;
begin
  Result := FieldByName(CNT_ENDERECO).AsString;
end;


function TCustomSimplesCREDOR.GetNUMERO: String;
begin
  Result := FieldByName(CNT_NUMERO).AsString;
end;


function TCustomSimplesCREDOR.GetCOMPLEMENTO: String;
begin
  Result := FieldByName(CNT_COMPLEMENTO).AsString;
end;


function TCustomSimplesCREDOR.GetBAIRRO: String;
begin
  Result := FieldByName(CNT_BAIRRO).AsString;
end;


function TCustomSimplesCREDOR.GetCIDADE: String;
begin
  Result := FieldByName(CNT_CIDADE).AsString;
end;


function TCustomSimplesCREDOR.GetESTADO: String;
begin
  Result := FieldByName(CNT_ESTADO).AsString;
end;


function TCustomSimplesCREDOR.GetCEP: String;
begin
  Result := FieldByName(CNT_CEP).AsString;
end;


function TCustomSimplesCREDOR.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesCREDOR.GetTELEFONE01: String;
begin
  Result := FieldByName(CNT_TELEFONE01).AsString;
end;


function TCustomSimplesCREDOR.GetTELEFONE02: String;
begin
  Result := FieldByName(CNT_TELEFONE02).AsString;
end;


function TCustomSimplesCREDOR.GetTELEFONE03: String;
begin
  Result := FieldByName(CNT_TELEFONE03).AsString;
end;


function TCustomSimplesCREDOR.GetFAX: String;
begin
  Result := FieldByName(CNT_FAX).AsString;
end;


function TCustomSimplesCREDOR.GetSITE: String;
begin
  Result := FieldByName(CNT_SITE).AsString;
end;


function TCustomSimplesCREDOR.GetEMAIL01: String;
begin
  Result := FieldByName(CNT_EMAIL01).AsString;
end;


function TCustomSimplesCREDOR.GetEMAIL02: String;
begin
  Result := FieldByName(CNT_EMAIL02).AsString;
end;


function TCustomSimplesCREDOR.GetEMAIL03: String;
begin
  Result := FieldByName(CNT_EMAIL03).AsString;
end;


function TCustomSimplesCREDOR.GetCONTATO01: String;
begin
  Result := FieldByName(CNT_CONTATO01).AsString;
end;


function TCustomSimplesCREDOR.GetCONTATO02: String;
begin
  Result := FieldByName(CNT_CONTATO02).AsString;
end;


function TCustomSimplesCREDOR.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesCREDOR.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesCREDOR.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesCREDOR.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesCREDOR.GetDDD1: String;
begin
  Result := FieldByName(CNT_DDD1).AsString;
end;


function TCustomSimplesCREDOR.GetDDD2: String;
begin
  Result := FieldByName(CNT_DDD2).AsString;
end;


function TCustomSimplesCREDOR.GetDDD3: String;
begin
  Result := FieldByName(CNT_DDD3).AsString;
end;


function TCustomSimplesCREDOR.GetMULTA: Double;
begin
  Result := FieldByName(CNT_MULTA).AsFloat;
end;


function TCustomSimplesCREDOR.GetDESCONTO_MINIMO: Double;
begin
  Result := FieldByName(CNT_DESCONTO_MINIMO).AsFloat;
end;


function TCustomSimplesCREDOR.GetDESCONTO_MAXIMO: Double;
begin
  Result := FieldByName(CNT_DESCONTO_MAXIMO).AsFloat;
end;


function TCustomSimplesCREDOR.GetPERCENTUAL_ATRASO: Double;
begin
  Result := FieldByName(CNT_PERCENTUAL_ATRASO).AsFloat;
end;


function TCustomSimplesCREDOR.GetAPLICAR_DADOS_FINANCEIROS: Boolean;
begin
  Result := FieldByName(CNT_APLICAR_DADOS_FINANCEIROS).AsBoolean;
end;


function TCustomSimplesCREDOR.GetGERAR_BOLETOS: Boolean;
begin
  Result := FieldByName(CNT_GERAR_BOLETOS).AsBoolean;
end;


procedure TCustomSimplesCREDOR.SetCODIGO_CREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_CODIGO_CREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetNOME_CREDOR(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_CREDOR+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetTIPO_CREDOR(const Value: Word);
begin
  StrCondicao.Add(CNT_TIPO_CREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetCNPJ_CPF(const Value: String);
begin
  StrCondicao.Add(CNT_CNPJ_CPF+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetRAZAO_SOCIAL(const Value: String);
begin
  StrCondicao.Add(CNT_RAZAO_SOCIAL+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetDATA_CADASTRO(const Value: String);
begin
  StrCondicao.Add(CNT_DATA_CADASTRO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetENDERECO(const Value: String);
begin
  StrCondicao.Add(CNT_ENDERECO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetNUMERO(const Value: String);
begin
  StrCondicao.Add(CNT_NUMERO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetCOMPLEMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_COMPLEMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetBAIRRO(const Value: String);
begin
  StrCondicao.Add(CNT_BAIRRO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetCIDADE(const Value: String);
begin
  StrCondicao.Add(CNT_CIDADE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetESTADO(const Value: String);
begin
  StrCondicao.Add(CNT_ESTADO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetCEP(const Value: String);
begin
  StrCondicao.Add(CNT_CEP+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetTELEFONE01(const Value: String);
begin
  StrCondicao.Add(CNT_TELEFONE01+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetTELEFONE02(const Value: String);
begin
  StrCondicao.Add(CNT_TELEFONE02+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetTELEFONE03(const Value: String);
begin
  StrCondicao.Add(CNT_TELEFONE03+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetFAX(const Value: String);
begin
  StrCondicao.Add(CNT_FAX+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetSITE(const Value: String);
begin
  StrCondicao.Add(CNT_SITE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetEMAIL01(const Value: String);
begin
  StrCondicao.Add(CNT_EMAIL01+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetEMAIL02(const Value: String);
begin
  StrCondicao.Add(CNT_EMAIL02+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetEMAIL03(const Value: String);
begin
  StrCondicao.Add(CNT_EMAIL03+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetCONTATO01(const Value: String);
begin
  StrCondicao.Add(CNT_CONTATO01+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetCONTATO02(const Value: String);
begin
  StrCondicao.Add(CNT_CONTATO02+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCREDOR.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCREDOR.SetDDD1(const Value: String);
begin
  StrCondicao.Add(CNT_DDD1+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetDDD2(const Value: String);
begin
  StrCondicao.Add(CNT_DDD2+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetDDD3(const Value: String);
begin
  StrCondicao.Add(CNT_DDD3+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetMULTA(const Value: Double);
begin
  StrCondicao.Add(CNT_MULTA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetDESCONTO_MINIMO(const Value: Double);
begin
  StrCondicao.Add(CNT_DESCONTO_MINIMO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetDESCONTO_MAXIMO(const Value: Double);
begin
  StrCondicao.Add(CNT_DESCONTO_MAXIMO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetPERCENTUAL_ATRASO(const Value: Double);
begin
  StrCondicao.Add(CNT_PERCENTUAL_ATRASO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesCREDOR.SetAPLICAR_DADOS_FINANCEIROS(const Value: Boolean);
begin
  StrCondicao.Add(CNT_APLICAR_DADOS_FINANCEIROS+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesCREDOR.SetGERAR_BOLETOS(const Value: Boolean);
begin
  StrCondicao.Add(CNT_GERAR_BOLETOS+' = '+IntToStr(-Ord(Value))); 
end;

procedure TCustomSimplesCREDOR.plMontaCondicao;
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

procedure TCustomSimplesCREDOR.plOrdenarPor(leIndice : TCREDORIndex );
begin
  Case leIndice Of
    credorInd_Cnpj_Cpf : lsOrdenar := ' Order By CNPJ_CPF';
    credorpk_Codigo_Credor : lsOrdenar := ' Order By CODIGO_CREDOR';
    credorInd_Nome_Credor : lsOrdenar := ' Order By NOME_CREDOR';
    credorInd_Razao_Social : lsOrdenar := ' Order By RAZAO_SOCIAL';
  End;
end;

procedure TCustomSimplesCREDOR.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesCREDOR.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesCREDOR.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

