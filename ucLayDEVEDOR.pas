unit ucLayDEVEDOR;

interface

uses classes, adodb, variants;

type

 TDEVEDORIndex = (devedorInd_Cnpj_Cpf, devedorpk_Codigo_Devedor, devedorInd_Identidade, devedorInd_Nome_Devedor);

 TCustomDEVEDOR = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetCODIGO_DEVEDOR: Integer;
  function GetNOME_DEVEDOR: String;
  function GetTIPO_DEVEDOR: Word;
  function GetDATA_CADASTRO: TDateTime;
  function GetPROFISSAO: String;
  function GetRENDA: Double;
  function GetCARRO_MODELO: String;
  function GetPLACA: String;
  function GetCNPJ_CPF: String;
  function GetUSUARIO_CADASTRO: String;
  function GetOBSERVACAO: String;
  function GetEMPRESA: String;
  function GetFUNCAO: String;
  function GetNOME_PAI: String;
  function GetNOME_MAE: String;
  function GetESTADO_CIVIL: String;
  function GetIDENTIDADE: String;
  function GetEMAIL01: String;
  function GetEMAIL02: String;
  function GetEMAIL03: String;
  function GetCODIGO_ALTERNATIVO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetEH_LOCALIZADO: Boolean;
  function GetENDERECO_PRINCIPAL: Integer;
  function GetTELEFONE_PRINCIPAL: Integer;
  procedure SetCODIGO_DEVEDOR(const Value: Integer);
  procedure SetNOME_DEVEDOR(const Value: String);
  procedure SetTIPO_DEVEDOR(const Value: Word);
  procedure SetDATA_CADASTRO(const Value: TDateTime);
  procedure SetPROFISSAO(const Value: String);
  procedure SetRENDA(const Value: Double);
  procedure SetCARRO_MODELO(const Value: String);
  procedure SetPLACA(const Value: String);
  procedure SetCNPJ_CPF(const Value: String);
  procedure SetUSUARIO_CADASTRO(const Value: String);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetEMPRESA(const Value: String);
  procedure SetFUNCAO(const Value: String);
  procedure SetNOME_PAI(const Value: String);
  procedure SetNOME_MAE(const Value: String);
  procedure SetESTADO_CIVIL(const Value: String);
  procedure SetIDENTIDADE(const Value: String);
  procedure SetEMAIL01(const Value: String);
  procedure SetEMAIL02(const Value: String);
  procedure SetEMAIL03(const Value: String);
  procedure SetCODIGO_ALTERNATIVO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetEH_LOCALIZADO(const Value: Boolean);
  procedure SetENDERECO_PRINCIPAL(const Value: Integer);
  procedure SetTELEFONE_PRINCIPAL(const Value: Integer);
  property CODIGO_DEVEDOR: Integer read GetCODIGO_DEVEDOR write SetCODIGO_DEVEDOR;
  property NOME_DEVEDOR: String read GetNOME_DEVEDOR write SetNOME_DEVEDOR;
  property TIPO_DEVEDOR: Word read GetTIPO_DEVEDOR write SetTIPO_DEVEDOR;
  property DATA_CADASTRO: TDateTime read GetDATA_CADASTRO write SetDATA_CADASTRO;
  property PROFISSAO: String read GetPROFISSAO write SetPROFISSAO;
  property RENDA: Double read GetRENDA write SetRENDA;
  property CARRO_MODELO: String read GetCARRO_MODELO write SetCARRO_MODELO;
  property PLACA: String read GetPLACA write SetPLACA;
  property CNPJ_CPF: String read GetCNPJ_CPF write SetCNPJ_CPF;
  property USUARIO_CADASTRO: String read GetUSUARIO_CADASTRO write SetUSUARIO_CADASTRO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property EMPRESA: String read GetEMPRESA write SetEMPRESA;
  property FUNCAO: String read GetFUNCAO write SetFUNCAO;
  property NOME_PAI: String read GetNOME_PAI write SetNOME_PAI;
  property NOME_MAE: String read GetNOME_MAE write SetNOME_MAE;
  property ESTADO_CIVIL: String read GetESTADO_CIVIL write SetESTADO_CIVIL;
  property IDENTIDADE: String read GetIDENTIDADE write SetIDENTIDADE;
  property EMAIL01: String read GetEMAIL01 write SetEMAIL01;
  property EMAIL02: String read GetEMAIL02 write SetEMAIL02;
  property EMAIL03: String read GetEMAIL03 write SetEMAIL03;
  property CODIGO_ALTERNATIVO: String read GetCODIGO_ALTERNATIVO write SetCODIGO_ALTERNATIVO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property EH_LOCALIZADO: Boolean read GetEH_LOCALIZADO write SetEH_LOCALIZADO;
  property ENDERECO_PRINCIPAL: Integer read GetENDERECO_PRINCIPAL write SetENDERECO_PRINCIPAL;
  property TELEFONE_PRINCIPAL: Integer read GetTELEFONE_PRINCIPAL write SetTELEFONE_PRINCIPAL;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Cnpj_Cpf(pCNPJ_CPF : String) : Boolean;
  function FindBypk_Codigo_Devedor(pCODIGO_DEVEDOR : Integer) : Boolean;
 end;

 TDEVEDOR = class(TCustomDEVEDOR)
 public
  property CODIGO_DEVEDOR;
  property NOME_DEVEDOR;
  property TIPO_DEVEDOR;
  property DATA_CADASTRO;
  property PROFISSAO;
  property RENDA;
  property CARRO_MODELO;
  property PLACA;
  property CNPJ_CPF;
  property USUARIO_CADASTRO;
  property OBSERVACAO;
  property EMPRESA;
  property FUNCAO;
  property NOME_PAI;
  property NOME_MAE;
  property ESTADO_CIVIL;
  property IDENTIDADE;
  property EMAIL01;
  property EMAIL02;
  property EMAIL03;
  property CODIGO_ALTERNATIVO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property EH_LOCALIZADO;
  property ENDERECO_PRINCIPAL;
  property TELEFONE_PRINCIPAL;
 end;

 TCustomSimplesDEVEDOR = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetCODIGO_DEVEDOR: Integer;
  function GetNOME_DEVEDOR: String;
  function GetTIPO_DEVEDOR: Word;
  function GetDATA_CADASTRO: TDateTime;
  function GetPROFISSAO: String;
  function GetRENDA: Double;
  function GetCARRO_MODELO: String;
  function GetPLACA: String;
  function GetCNPJ_CPF: String;
  function GetUSUARIO_CADASTRO: String;
  function GetOBSERVACAO: String;
  function GetEMPRESA: String;
  function GetFUNCAO: String;
  function GetNOME_PAI: String;
  function GetNOME_MAE: String;
  function GetESTADO_CIVIL: String;
  function GetIDENTIDADE: String;
  function GetEMAIL01: String;
  function GetEMAIL02: String;
  function GetEMAIL03: String;
  function GetCODIGO_ALTERNATIVO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetEH_LOCALIZADO: Boolean;
  function GetENDERECO_PRINCIPAL: Integer;
  function GetTELEFONE_PRINCIPAL: Integer;
  procedure SetCODIGO_DEVEDOR(const Value: Integer);
  procedure SetNOME_DEVEDOR(const Value: String);
  procedure SetTIPO_DEVEDOR(const Value: Word);
  procedure SetDATA_CADASTRO(const Value: TDateTime);
  procedure SetPROFISSAO(const Value: String);
  procedure SetRENDA(const Value: Double);
  procedure SetCARRO_MODELO(const Value: String);
  procedure SetPLACA(const Value: String);
  procedure SetCNPJ_CPF(const Value: String);
  procedure SetUSUARIO_CADASTRO(const Value: String);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetEMPRESA(const Value: String);
  procedure SetFUNCAO(const Value: String);
  procedure SetNOME_PAI(const Value: String);
  procedure SetNOME_MAE(const Value: String);
  procedure SetESTADO_CIVIL(const Value: String);
  procedure SetIDENTIDADE(const Value: String);
  procedure SetEMAIL01(const Value: String);
  procedure SetEMAIL02(const Value: String);
  procedure SetEMAIL03(const Value: String);
  procedure SetCODIGO_ALTERNATIVO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetEH_LOCALIZADO(const Value: Boolean);
  procedure SetENDERECO_PRINCIPAL(const Value: Integer);
  procedure SetTELEFONE_PRINCIPAL(const Value: Integer);
  property CODIGO_DEVEDOR: Integer read GetCODIGO_DEVEDOR write SetCODIGO_DEVEDOR;
  property NOME_DEVEDOR: String read GetNOME_DEVEDOR write SetNOME_DEVEDOR;
  property TIPO_DEVEDOR: Word read GetTIPO_DEVEDOR write SetTIPO_DEVEDOR;
  property DATA_CADASTRO: TDateTime read GetDATA_CADASTRO write SetDATA_CADASTRO;
  property PROFISSAO: String read GetPROFISSAO write SetPROFISSAO;
  property RENDA: Double read GetRENDA write SetRENDA;
  property CARRO_MODELO: String read GetCARRO_MODELO write SetCARRO_MODELO;
  property PLACA: String read GetPLACA write SetPLACA;
  property CNPJ_CPF: String read GetCNPJ_CPF write SetCNPJ_CPF;
  property USUARIO_CADASTRO: String read GetUSUARIO_CADASTRO write SetUSUARIO_CADASTRO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property EMPRESA: String read GetEMPRESA write SetEMPRESA;
  property FUNCAO: String read GetFUNCAO write SetFUNCAO;
  property NOME_PAI: String read GetNOME_PAI write SetNOME_PAI;
  property NOME_MAE: String read GetNOME_MAE write SetNOME_MAE;
  property ESTADO_CIVIL: String read GetESTADO_CIVIL write SetESTADO_CIVIL;
  property IDENTIDADE: String read GetIDENTIDADE write SetIDENTIDADE;
  property EMAIL01: String read GetEMAIL01 write SetEMAIL01;
  property EMAIL02: String read GetEMAIL02 write SetEMAIL02;
  property EMAIL03: String read GetEMAIL03 write SetEMAIL03;
  property CODIGO_ALTERNATIVO: String read GetCODIGO_ALTERNATIVO write SetCODIGO_ALTERNATIVO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property EH_LOCALIZADO: Boolean read GetEH_LOCALIZADO write SetEH_LOCALIZADO;
  property ENDERECO_PRINCIPAL: Integer read GetENDERECO_PRINCIPAL write SetENDERECO_PRINCIPAL;
  property TELEFONE_PRINCIPAL: Integer read GetTELEFONE_PRINCIPAL write SetTELEFONE_PRINCIPAL;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TDEVEDORIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesDEVEDOR = class(TCustomSimplesDEVEDOR)
 public
  property CODIGO_DEVEDOR;
  property NOME_DEVEDOR;
  property TIPO_DEVEDOR;
  property DATA_CADASTRO;
  property PROFISSAO;
  property RENDA;
  property CARRO_MODELO;
  property PLACA;
  property CNPJ_CPF;
  property USUARIO_CADASTRO;
  property OBSERVACAO;
  property EMPRESA;
  property FUNCAO;
  property NOME_PAI;
  property NOME_MAE;
  property ESTADO_CIVIL;
  property IDENTIDADE;
  property EMAIL01;
  property EMAIL02;
  property EMAIL03;
  property CODIGO_ALTERNATIVO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property EH_LOCALIZADO;
  property ENDERECO_PRINCIPAL;
  property TELEFONE_PRINCIPAL;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_CODIGO_DEVEDOR = 'CODIGO_DEVEDOR';
  CNT_NOME_DEVEDOR = 'NOME_DEVEDOR';
  CNT_TIPO_DEVEDOR = 'TIPO_DEVEDOR';
  CNT_DATA_CADASTRO = 'DATA_CADASTRO';
  CNT_PROFISSAO = 'PROFISSAO';
  CNT_RENDA = 'RENDA';
  CNT_CARRO_MODELO = 'CARRO_MODELO';
  CNT_PLACA = 'PLACA';
  CNT_CNPJ_CPF = 'CNPJ_CPF';
  CNT_USUARIO_CADASTRO = 'USUARIO_CADASTRO';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_EMPRESA = 'EMPRESA';
  CNT_FUNCAO = 'FUNCAO';
  CNT_NOME_PAI = 'NOME_PAI';
  CNT_NOME_MAE = 'NOME_MAE';
  CNT_ESTADO_CIVIL = 'ESTADO_CIVIL';
  CNT_IDENTIDADE = 'IDENTIDADE';
  CNT_EMAIL01 = 'EMAIL01';
  CNT_EMAIL02 = 'EMAIL02';
  CNT_EMAIL03 = 'EMAIL03';
  CNT_CODIGO_ALTERNATIVO = 'CODIGO_ALTERNATIVO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_EH_LOCALIZADO = 'EH_LOCALIZADO';
  CNT_ENDERECO_PRINCIPAL = 'ENDERECO_PRINCIPAL';
  CNT_TELEFONE_PRINCIPAL = 'TELEFONE_PRINCIPAL';

constructor TCustomDEVEDOR.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'DEVEDOR';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomDEVEDOR.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomDEVEDOR.DoBeforePost;
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

function TCustomDEVEDOR.GetCODIGO_DEVEDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_DEVEDOR).AsInteger;
end;


function TCustomDEVEDOR.GetNOME_DEVEDOR: String;
begin
  Result := FieldByName(CNT_NOME_DEVEDOR).AsString;
end;


function TCustomDEVEDOR.GetTIPO_DEVEDOR: Word;
begin
  Result := FieldByName(CNT_TIPO_DEVEDOR).AsInteger;
end;


function TCustomDEVEDOR.GetDATA_CADASTRO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_CADASTRO).AsDateTime;
end;


function TCustomDEVEDOR.GetPROFISSAO: String;
begin
  Result := FieldByName(CNT_PROFISSAO).AsString;
end;


function TCustomDEVEDOR.GetRENDA: Double;
begin
  Result := FieldByName(CNT_RENDA).AsFloat;
end;


function TCustomDEVEDOR.GetCARRO_MODELO: String;
begin
  Result := FieldByName(CNT_CARRO_MODELO).AsString;
end;


function TCustomDEVEDOR.GetPLACA: String;
begin
  Result := FieldByName(CNT_PLACA).AsString;
end;


function TCustomDEVEDOR.GetCNPJ_CPF: String;
begin
  Result := FieldByName(CNT_CNPJ_CPF).AsString;
end;


function TCustomDEVEDOR.GetUSUARIO_CADASTRO: String;
begin
  Result := FieldByName(CNT_USUARIO_CADASTRO).AsString;
end;


function TCustomDEVEDOR.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomDEVEDOR.GetEMPRESA: String;
begin
  Result := FieldByName(CNT_EMPRESA).AsString;
end;


function TCustomDEVEDOR.GetFUNCAO: String;
begin
  Result := FieldByName(CNT_FUNCAO).AsString;
end;


function TCustomDEVEDOR.GetNOME_PAI: String;
begin
  Result := FieldByName(CNT_NOME_PAI).AsString;
end;


function TCustomDEVEDOR.GetNOME_MAE: String;
begin
  Result := FieldByName(CNT_NOME_MAE).AsString;
end;


function TCustomDEVEDOR.GetESTADO_CIVIL: String;
begin
  Result := FieldByName(CNT_ESTADO_CIVIL).AsString;
end;


function TCustomDEVEDOR.GetIDENTIDADE: String;
begin
  Result := FieldByName(CNT_IDENTIDADE).AsString;
end;


function TCustomDEVEDOR.GetEMAIL01: String;
begin
  Result := FieldByName(CNT_EMAIL01).AsString;
end;


function TCustomDEVEDOR.GetEMAIL02: String;
begin
  Result := FieldByName(CNT_EMAIL02).AsString;
end;


function TCustomDEVEDOR.GetEMAIL03: String;
begin
  Result := FieldByName(CNT_EMAIL03).AsString;
end;


function TCustomDEVEDOR.GetCODIGO_ALTERNATIVO: String;
begin
  Result := FieldByName(CNT_CODIGO_ALTERNATIVO).AsString;
end;


function TCustomDEVEDOR.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomDEVEDOR.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomDEVEDOR.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomDEVEDOR.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomDEVEDOR.GetEH_LOCALIZADO: Boolean;
begin
  Result := FieldByName(CNT_EH_LOCALIZADO).AsBoolean;
end;


function TCustomDEVEDOR.GetENDERECO_PRINCIPAL: Integer;
begin
  Result := FieldByName(CNT_ENDERECO_PRINCIPAL).AsInteger;
end;


function TCustomDEVEDOR.GetTELEFONE_PRINCIPAL: Integer;
begin
  Result := FieldByName(CNT_TELEFONE_PRINCIPAL).AsInteger;
end;


procedure TCustomDEVEDOR.SetCODIGO_DEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_CODIGO_DEVEDOR).AsInteger := Value;
end;


procedure TCustomDEVEDOR.SetNOME_DEVEDOR(const Value: String);
begin
 FieldByName(CNT_NOME_DEVEDOR).AsString := Value;
end;


procedure TCustomDEVEDOR.SetTIPO_DEVEDOR(const Value: Word);
begin
 FieldByName(CNT_TIPO_DEVEDOR).AsInteger := Value;
end;


procedure TCustomDEVEDOR.SetDATA_CADASTRO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_CADASTRO).AsDateTime := Value;
end;


procedure TCustomDEVEDOR.SetPROFISSAO(const Value: String);
begin
 FieldByName(CNT_PROFISSAO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetRENDA(const Value: Double);
begin
 FieldByName(CNT_RENDA).AsFloat := Value;
end;


procedure TCustomDEVEDOR.SetCARRO_MODELO(const Value: String);
begin
 FieldByName(CNT_CARRO_MODELO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetPLACA(const Value: String);
begin
 FieldByName(CNT_PLACA).AsString := Value;
end;


procedure TCustomDEVEDOR.SetCNPJ_CPF(const Value: String);
begin
 FieldByName(CNT_CNPJ_CPF).AsString := Value;
end;


procedure TCustomDEVEDOR.SetUSUARIO_CADASTRO(const Value: String);
begin
 FieldByName(CNT_USUARIO_CADASTRO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetEMPRESA(const Value: String);
begin
 FieldByName(CNT_EMPRESA).AsString := Value;
end;


procedure TCustomDEVEDOR.SetFUNCAO(const Value: String);
begin
 FieldByName(CNT_FUNCAO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetNOME_PAI(const Value: String);
begin
 FieldByName(CNT_NOME_PAI).AsString := Value;
end;


procedure TCustomDEVEDOR.SetNOME_MAE(const Value: String);
begin
 FieldByName(CNT_NOME_MAE).AsString := Value;
end;


procedure TCustomDEVEDOR.SetESTADO_CIVIL(const Value: String);
begin
 FieldByName(CNT_ESTADO_CIVIL).AsString := Value;
end;


procedure TCustomDEVEDOR.SetIDENTIDADE(const Value: String);
begin
 FieldByName(CNT_IDENTIDADE).AsString := Value;
end;


procedure TCustomDEVEDOR.SetEMAIL01(const Value: String);
begin
 FieldByName(CNT_EMAIL01).AsString := Value;
end;


procedure TCustomDEVEDOR.SetEMAIL02(const Value: String);
begin
 FieldByName(CNT_EMAIL02).AsString := Value;
end;


procedure TCustomDEVEDOR.SetEMAIL03(const Value: String);
begin
 FieldByName(CNT_EMAIL03).AsString := Value;
end;


procedure TCustomDEVEDOR.SetCODIGO_ALTERNATIVO(const Value: String);
begin
 FieldByName(CNT_CODIGO_ALTERNATIVO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomDEVEDOR.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomDEVEDOR.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomDEVEDOR.SetEH_LOCALIZADO(const Value: Boolean);
begin
 FieldByName(CNT_EH_LOCALIZADO).AsBoolean := Value;
end;


procedure TCustomDEVEDOR.SetENDERECO_PRINCIPAL(const Value: Integer);
begin
 FieldByName(CNT_ENDERECO_PRINCIPAL).AsInteger := Value;
end;


procedure TCustomDEVEDOR.SetTELEFONE_PRINCIPAL(const Value: Integer);
begin
 FieldByName(CNT_TELEFONE_PRINCIPAL).AsInteger := Value;
end;


function TCustomDEVEDOR.FindByInd_Cnpj_Cpf(pCNPJ_CPF : String) : Boolean;
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

function TCustomDEVEDOR.FindBypk_Codigo_Devedor(pCODIGO_DEVEDOR : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'CODIGO_DEVEDOR';
  fvalue := pCODIGO_DEVEDOR;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesDEVEDOR.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesDEVEDOR.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesDEVEDOR.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from DEVEDOR');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesDEVEDOR.GetCODIGO_DEVEDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_DEVEDOR).AsInteger;
end;


function TCustomSimplesDEVEDOR.GetNOME_DEVEDOR: String;
begin
  Result := FieldByName(CNT_NOME_DEVEDOR).AsString;
end;


function TCustomSimplesDEVEDOR.GetTIPO_DEVEDOR: Word;
begin
  Result := FieldByName(CNT_TIPO_DEVEDOR).AsInteger;
end;


function TCustomSimplesDEVEDOR.GetDATA_CADASTRO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_CADASTRO).AsDateTime;
end;


function TCustomSimplesDEVEDOR.GetPROFISSAO: String;
begin
  Result := FieldByName(CNT_PROFISSAO).AsString;
end;


function TCustomSimplesDEVEDOR.GetRENDA: Double;
begin
  Result := FieldByName(CNT_RENDA).AsFloat;
end;


function TCustomSimplesDEVEDOR.GetCARRO_MODELO: String;
begin
  Result := FieldByName(CNT_CARRO_MODELO).AsString;
end;


function TCustomSimplesDEVEDOR.GetPLACA: String;
begin
  Result := FieldByName(CNT_PLACA).AsString;
end;


function TCustomSimplesDEVEDOR.GetCNPJ_CPF: String;
begin
  Result := FieldByName(CNT_CNPJ_CPF).AsString;
end;


function TCustomSimplesDEVEDOR.GetUSUARIO_CADASTRO: String;
begin
  Result := FieldByName(CNT_USUARIO_CADASTRO).AsString;
end;


function TCustomSimplesDEVEDOR.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesDEVEDOR.GetEMPRESA: String;
begin
  Result := FieldByName(CNT_EMPRESA).AsString;
end;


function TCustomSimplesDEVEDOR.GetFUNCAO: String;
begin
  Result := FieldByName(CNT_FUNCAO).AsString;
end;


function TCustomSimplesDEVEDOR.GetNOME_PAI: String;
begin
  Result := FieldByName(CNT_NOME_PAI).AsString;
end;


function TCustomSimplesDEVEDOR.GetNOME_MAE: String;
begin
  Result := FieldByName(CNT_NOME_MAE).AsString;
end;


function TCustomSimplesDEVEDOR.GetESTADO_CIVIL: String;
begin
  Result := FieldByName(CNT_ESTADO_CIVIL).AsString;
end;


function TCustomSimplesDEVEDOR.GetIDENTIDADE: String;
begin
  Result := FieldByName(CNT_IDENTIDADE).AsString;
end;


function TCustomSimplesDEVEDOR.GetEMAIL01: String;
begin
  Result := FieldByName(CNT_EMAIL01).AsString;
end;


function TCustomSimplesDEVEDOR.GetEMAIL02: String;
begin
  Result := FieldByName(CNT_EMAIL02).AsString;
end;


function TCustomSimplesDEVEDOR.GetEMAIL03: String;
begin
  Result := FieldByName(CNT_EMAIL03).AsString;
end;


function TCustomSimplesDEVEDOR.GetCODIGO_ALTERNATIVO: String;
begin
  Result := FieldByName(CNT_CODIGO_ALTERNATIVO).AsString;
end;


function TCustomSimplesDEVEDOR.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesDEVEDOR.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesDEVEDOR.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesDEVEDOR.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesDEVEDOR.GetEH_LOCALIZADO: Boolean;
begin
  Result := FieldByName(CNT_EH_LOCALIZADO).AsBoolean;
end;


function TCustomSimplesDEVEDOR.GetENDERECO_PRINCIPAL: Integer;
begin
  Result := FieldByName(CNT_ENDERECO_PRINCIPAL).AsInteger;
end;


function TCustomSimplesDEVEDOR.GetTELEFONE_PRINCIPAL: Integer;
begin
  Result := FieldByName(CNT_TELEFONE_PRINCIPAL).AsInteger;
end;


procedure TCustomSimplesDEVEDOR.SetCODIGO_DEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_CODIGO_DEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetNOME_DEVEDOR(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_DEVEDOR+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetTIPO_DEVEDOR(const Value: Word);
begin
  StrCondicao.Add(CNT_TIPO_DEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetDATA_CADASTRO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_CADASTRO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesDEVEDOR.SetPROFISSAO(const Value: String);
begin
  StrCondicao.Add(CNT_PROFISSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetRENDA(const Value: Double);
begin
  StrCondicao.Add(CNT_RENDA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetCARRO_MODELO(const Value: String);
begin
  StrCondicao.Add(CNT_CARRO_MODELO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetPLACA(const Value: String);
begin
  StrCondicao.Add(CNT_PLACA+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetCNPJ_CPF(const Value: String);
begin
  StrCondicao.Add(CNT_CNPJ_CPF+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetUSUARIO_CADASTRO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_CADASTRO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetEMPRESA(const Value: String);
begin
  StrCondicao.Add(CNT_EMPRESA+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetFUNCAO(const Value: String);
begin
  StrCondicao.Add(CNT_FUNCAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetNOME_PAI(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_PAI+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetNOME_MAE(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_MAE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetESTADO_CIVIL(const Value: String);
begin
  StrCondicao.Add(CNT_ESTADO_CIVIL+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetIDENTIDADE(const Value: String);
begin
  StrCondicao.Add(CNT_IDENTIDADE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetEMAIL01(const Value: String);
begin
  StrCondicao.Add(CNT_EMAIL01+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetEMAIL02(const Value: String);
begin
  StrCondicao.Add(CNT_EMAIL02+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetEMAIL03(const Value: String);
begin
  StrCondicao.Add(CNT_EMAIL03+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetCODIGO_ALTERNATIVO(const Value: String);
begin
  StrCondicao.Add(CNT_CODIGO_ALTERNATIVO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesDEVEDOR.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesDEVEDOR.SetEH_LOCALIZADO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_EH_LOCALIZADO+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesDEVEDOR.SetENDERECO_PRINCIPAL(const Value: Integer);
begin
  StrCondicao.Add(CNT_ENDERECO_PRINCIPAL+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesDEVEDOR.SetTELEFONE_PRINCIPAL(const Value: Integer);
begin
  StrCondicao.Add(CNT_TELEFONE_PRINCIPAL+' = '+IntToStr(Value)); 
end;

procedure TCustomSimplesDEVEDOR.plMontaCondicao;
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

procedure TCustomSimplesDEVEDOR.plOrdenarPor(leIndice : TDEVEDORIndex );
begin
  Case leIndice Of
    devedorInd_Cnpj_Cpf : lsOrdenar := ' Order By CNPJ_CPF';
    devedorpk_Codigo_Devedor : lsOrdenar := ' Order By CODIGO_DEVEDOR';
    devedorInd_Identidade : lsOrdenar := ' Order By IDENTIDADE';
    devedorInd_Nome_Devedor : lsOrdenar := ' Order By NOME_DEVEDOR';
  End;
end;

procedure TCustomSimplesDEVEDOR.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesDEVEDOR.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesDEVEDOR.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

