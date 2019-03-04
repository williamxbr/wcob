unit ucLayITENS_COBRANCA;

interface

uses classes, adodb, variants;

type

 TITENS_COBRANCAIndex = (itens_cobrancaind_cobranca_item, itens_cobrancapk_IdItemCobranca);

 TCustomITENS_COBRANCA = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDITEMCOBRANCA: Integer;
  function GetCOBRANCA: Integer;
  function GetITEM: Integer;
  function GetTIPODOCUMENTO: Integer;
  function GetNUMERO_DOCUMENTO: String;
  function GetEMISSAO_DOCUMENTO: TDateTime;
  function GetVENCIMENTO_DOCUMENTO: TDateTime;
  function GetVALOR_DOCUMENTO: Double;
  function GetSITUACAO: Integer;
  function GetALINES: Word;
  function GetBANCO_DOCUMENTO: Integer;
  function GetOBSERVACAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetDATA_DIVIDA: TDateTime;
  procedure SetIDITEMCOBRANCA(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetITEM(const Value: Integer);
  procedure SetTIPODOCUMENTO(const Value: Integer);
  procedure SetNUMERO_DOCUMENTO(const Value: String);
  procedure SetEMISSAO_DOCUMENTO(const Value: TDateTime);
  procedure SetVENCIMENTO_DOCUMENTO(const Value: TDateTime);
  procedure SetVALOR_DOCUMENTO(const Value: Double);
  procedure SetSITUACAO(const Value: Integer);
  procedure SetALINES(const Value: Word);
  procedure SetBANCO_DOCUMENTO(const Value: Integer);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetDATA_DIVIDA(const Value: TDateTime);
  property IDITEMCOBRANCA: Integer read GetIDITEMCOBRANCA write SetIDITEMCOBRANCA;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property ITEM: Integer read GetITEM write SetITEM;
  property TIPODOCUMENTO: Integer read GetTIPODOCUMENTO write SetTIPODOCUMENTO;
  property NUMERO_DOCUMENTO: String read GetNUMERO_DOCUMENTO write SetNUMERO_DOCUMENTO;
  property EMISSAO_DOCUMENTO: TDateTime read GetEMISSAO_DOCUMENTO write SetEMISSAO_DOCUMENTO;
  property VENCIMENTO_DOCUMENTO: TDateTime read GetVENCIMENTO_DOCUMENTO write SetVENCIMENTO_DOCUMENTO;
  property VALOR_DOCUMENTO: Double read GetVALOR_DOCUMENTO write SetVALOR_DOCUMENTO;
  property SITUACAO: Integer read GetSITUACAO write SetSITUACAO;
  property ALINES: Word read GetALINES write SetALINES;
  property BANCO_DOCUMENTO: Integer read GetBANCO_DOCUMENTO write SetBANCO_DOCUMENTO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property DATA_DIVIDA: TDateTime read GetDATA_DIVIDA write SetDATA_DIVIDA;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByind_cobranca_item(pCOBRANCA : Integer; pITEM : Integer) : Boolean;
  function FindBypk_IdItemCobranca(pIDITEMCOBRANCA : Integer) : Boolean;
 end;

 TITENS_COBRANCA = class(TCustomITENS_COBRANCA)
 public
  property IDITEMCOBRANCA;
  property COBRANCA;
  property ITEM;
  property TIPODOCUMENTO;
  property NUMERO_DOCUMENTO;
  property EMISSAO_DOCUMENTO;
  property VENCIMENTO_DOCUMENTO;
  property VALOR_DOCUMENTO;
  property SITUACAO;
  property ALINES;
  property BANCO_DOCUMENTO;
  property OBSERVACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property DATA_DIVIDA;
 end;

 TCustomSimplesITENS_COBRANCA = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDITEMCOBRANCA: Integer;
  function GetCOBRANCA: Integer;
  function GetITEM: Integer;
  function GetTIPODOCUMENTO: Integer;
  function GetNUMERO_DOCUMENTO: String;
  function GetEMISSAO_DOCUMENTO: TDateTime;
  function GetVENCIMENTO_DOCUMENTO: TDateTime;
  function GetVALOR_DOCUMENTO: Double;
  function GetSITUACAO: Integer;
  function GetALINES: Word;
  function GetBANCO_DOCUMENTO: Integer;
  function GetOBSERVACAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetDATA_DIVIDA: TDateTime;
  procedure SetIDITEMCOBRANCA(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetITEM(const Value: Integer);
  procedure SetTIPODOCUMENTO(const Value: Integer);
  procedure SetNUMERO_DOCUMENTO(const Value: String);
  procedure SetEMISSAO_DOCUMENTO(const Value: TDateTime);
  procedure SetVENCIMENTO_DOCUMENTO(const Value: TDateTime);
  procedure SetVALOR_DOCUMENTO(const Value: Double);
  procedure SetSITUACAO(const Value: Integer);
  procedure SetALINES(const Value: Word);
  procedure SetBANCO_DOCUMENTO(const Value: Integer);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetDATA_DIVIDA(const Value: TDateTime);
  property IDITEMCOBRANCA: Integer read GetIDITEMCOBRANCA write SetIDITEMCOBRANCA;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property ITEM: Integer read GetITEM write SetITEM;
  property TIPODOCUMENTO: Integer read GetTIPODOCUMENTO write SetTIPODOCUMENTO;
  property NUMERO_DOCUMENTO: String read GetNUMERO_DOCUMENTO write SetNUMERO_DOCUMENTO;
  property EMISSAO_DOCUMENTO: TDateTime read GetEMISSAO_DOCUMENTO write SetEMISSAO_DOCUMENTO;
  property VENCIMENTO_DOCUMENTO: TDateTime read GetVENCIMENTO_DOCUMENTO write SetVENCIMENTO_DOCUMENTO;
  property VALOR_DOCUMENTO: Double read GetVALOR_DOCUMENTO write SetVALOR_DOCUMENTO;
  property SITUACAO: Integer read GetSITUACAO write SetSITUACAO;
  property ALINES: Word read GetALINES write SetALINES;
  property BANCO_DOCUMENTO: Integer read GetBANCO_DOCUMENTO write SetBANCO_DOCUMENTO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property DATA_DIVIDA: TDateTime read GetDATA_DIVIDA write SetDATA_DIVIDA;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TITENS_COBRANCAIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesITENS_COBRANCA = class(TCustomSimplesITENS_COBRANCA)
 public
  property IDITEMCOBRANCA;
  property COBRANCA;
  property ITEM;
  property TIPODOCUMENTO;
  property NUMERO_DOCUMENTO;
  property EMISSAO_DOCUMENTO;
  property VENCIMENTO_DOCUMENTO;
  property VALOR_DOCUMENTO;
  property SITUACAO;
  property ALINES;
  property BANCO_DOCUMENTO;
  property OBSERVACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property DATA_DIVIDA;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDITEMCOBRANCA = 'IDITEMCOBRANCA';
  CNT_COBRANCA = 'COBRANCA';
  CNT_ITEM = 'ITEM';
  CNT_TIPODOCUMENTO = 'TIPODOCUMENTO';
  CNT_NUMERO_DOCUMENTO = 'NUMERO_DOCUMENTO';
  CNT_EMISSAO_DOCUMENTO = 'EMISSAO_DOCUMENTO';
  CNT_VENCIMENTO_DOCUMENTO = 'VENCIMENTO_DOCUMENTO';
  CNT_VALOR_DOCUMENTO = 'VALOR_DOCUMENTO';
  CNT_SITUACAO = 'SITUACAO';
  CNT_ALINES = 'ALINES';
  CNT_BANCO_DOCUMENTO = 'BANCO_DOCUMENTO';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_DATA_DIVIDA = 'DATA_DIVIDA';

constructor TCustomITENS_COBRANCA.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'ITENS_COBRANCA';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomITENS_COBRANCA.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomITENS_COBRANCA.DoBeforePost;
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

function TCustomITENS_COBRANCA.GetIDITEMCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDITEMCOBRANCA).AsInteger;
end;


function TCustomITENS_COBRANCA.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomITENS_COBRANCA.GetITEM: Integer;
begin
  Result := FieldByName(CNT_ITEM).AsInteger;
end;


function TCustomITENS_COBRANCA.GetTIPODOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_TIPODOCUMENTO).AsInteger;
end;


function TCustomITENS_COBRANCA.GetNUMERO_DOCUMENTO: String;
begin
  Result := FieldByName(CNT_NUMERO_DOCUMENTO).AsString;
end;


function TCustomITENS_COBRANCA.GetEMISSAO_DOCUMENTO: TDateTime;
begin
  Result := FieldByName(CNT_EMISSAO_DOCUMENTO).AsDateTime;
end;


function TCustomITENS_COBRANCA.GetVENCIMENTO_DOCUMENTO: TDateTime;
begin
  Result := FieldByName(CNT_VENCIMENTO_DOCUMENTO).AsDateTime;
end;


function TCustomITENS_COBRANCA.GetVALOR_DOCUMENTO: Double;
begin
  Result := FieldByName(CNT_VALOR_DOCUMENTO).AsFloat;
end;


function TCustomITENS_COBRANCA.GetSITUACAO: Integer;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomITENS_COBRANCA.GetALINES: Word;
begin
  Result := FieldByName(CNT_ALINES).AsInteger;
end;


function TCustomITENS_COBRANCA.GetBANCO_DOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_BANCO_DOCUMENTO).AsInteger;
end;


function TCustomITENS_COBRANCA.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomITENS_COBRANCA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomITENS_COBRANCA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomITENS_COBRANCA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomITENS_COBRANCA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomITENS_COBRANCA.GetDATA_DIVIDA: TDateTime;
begin
  Result := FieldByName(CNT_DATA_DIVIDA).AsDateTime;
end;


procedure TCustomITENS_COBRANCA.SetIDITEMCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_IDITEMCOBRANCA).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_COBRANCA).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetITEM(const Value: Integer);
begin
 FieldByName(CNT_ITEM).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetTIPODOCUMENTO(const Value: Integer);
begin
 FieldByName(CNT_TIPODOCUMENTO).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetNUMERO_DOCUMENTO(const Value: String);
begin
 FieldByName(CNT_NUMERO_DOCUMENTO).AsString := Value;
end;


procedure TCustomITENS_COBRANCA.SetEMISSAO_DOCUMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_EMISSAO_DOCUMENTO).AsDateTime := Value;
end;


procedure TCustomITENS_COBRANCA.SetVENCIMENTO_DOCUMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_VENCIMENTO_DOCUMENTO).AsDateTime := Value;
end;


procedure TCustomITENS_COBRANCA.SetVALOR_DOCUMENTO(const Value: Double);
begin
 FieldByName(CNT_VALOR_DOCUMENTO).AsFloat := Value;
end;


procedure TCustomITENS_COBRANCA.SetSITUACAO(const Value: Integer);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetALINES(const Value: Word);
begin
 FieldByName(CNT_ALINES).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetBANCO_DOCUMENTO(const Value: Integer);
begin
 FieldByName(CNT_BANCO_DOCUMENTO).AsInteger := Value;
end;


procedure TCustomITENS_COBRANCA.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomITENS_COBRANCA.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomITENS_COBRANCA.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomITENS_COBRANCA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomITENS_COBRANCA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomITENS_COBRANCA.SetDATA_DIVIDA(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_DIVIDA).AsDateTime := Value;
end;


function TCustomITENS_COBRANCA.FindByind_cobranca_item(pCOBRANCA : Integer; pITEM : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'COBRANCA;ITEM';
  fvalue := VarArrayOf([pCOBRANCA,pITEM]);
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomITENS_COBRANCA.FindBypk_IdItemCobranca(pIDITEMCOBRANCA : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDITEMCOBRANCA';
  fvalue := pIDITEMCOBRANCA;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesITENS_COBRANCA.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesITENS_COBRANCA.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesITENS_COBRANCA.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from ITENS_COBRANCA');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesITENS_COBRANCA.GetIDITEMCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDITEMCOBRANCA).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetITEM: Integer;
begin
  Result := FieldByName(CNT_ITEM).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetTIPODOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_TIPODOCUMENTO).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetNUMERO_DOCUMENTO: String;
begin
  Result := FieldByName(CNT_NUMERO_DOCUMENTO).AsString;
end;


function TCustomSimplesITENS_COBRANCA.GetEMISSAO_DOCUMENTO: TDateTime;
begin
  Result := FieldByName(CNT_EMISSAO_DOCUMENTO).AsDateTime;
end;


function TCustomSimplesITENS_COBRANCA.GetVENCIMENTO_DOCUMENTO: TDateTime;
begin
  Result := FieldByName(CNT_VENCIMENTO_DOCUMENTO).AsDateTime;
end;


function TCustomSimplesITENS_COBRANCA.GetVALOR_DOCUMENTO: Double;
begin
  Result := FieldByName(CNT_VALOR_DOCUMENTO).AsFloat;
end;


function TCustomSimplesITENS_COBRANCA.GetSITUACAO: Integer;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetALINES: Word;
begin
  Result := FieldByName(CNT_ALINES).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetBANCO_DOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_BANCO_DOCUMENTO).AsInteger;
end;


function TCustomSimplesITENS_COBRANCA.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesITENS_COBRANCA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesITENS_COBRANCA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesITENS_COBRANCA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesITENS_COBRANCA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesITENS_COBRANCA.GetDATA_DIVIDA: TDateTime;
begin
  Result := FieldByName(CNT_DATA_DIVIDA).AsDateTime;
end;


procedure TCustomSimplesITENS_COBRANCA.SetIDITEMCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDITEMCOBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetITEM(const Value: Integer);
begin
  StrCondicao.Add(CNT_ITEM+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetTIPODOCUMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_TIPODOCUMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetNUMERO_DOCUMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_NUMERO_DOCUMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetEMISSAO_DOCUMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_EMISSAO_DOCUMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetVENCIMENTO_DOCUMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_VENCIMENTO_DOCUMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetVALOR_DOCUMENTO(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_DOCUMENTO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetSITUACAO(const Value: Integer);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetALINES(const Value: Word);
begin
  StrCondicao.Add(CNT_ALINES+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetBANCO_DOCUMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_BANCO_DOCUMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesITENS_COBRANCA.SetDATA_DIVIDA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_DIVIDA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesITENS_COBRANCA.plMontaCondicao;
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

procedure TCustomSimplesITENS_COBRANCA.plOrdenarPor(leIndice : TITENS_COBRANCAIndex );
begin
  Case leIndice Of
    itens_cobrancaind_cobranca_item : lsOrdenar := ' Order By COBRANCA,ITEM';
    itens_cobrancapk_IdItemCobranca : lsOrdenar := ' Order By IDITEMCOBRANCA';
  End;
end;

procedure TCustomSimplesITENS_COBRANCA.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesITENS_COBRANCA.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesITENS_COBRANCA.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

