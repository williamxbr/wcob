unit ucLayPROPOSTA;

interface

uses classes, adodb, variants;

type

 TPROPOSTAIndex = (propostapk_IdProposta, propostaInd_IdCobranca);

 TCustomPROPOSTA = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDPROPOSTA: Integer;
  function GetIDCOBRANCA: Integer;
  function GetVALOR: Double;
  function GetENTRADA: Double;
  function GetPARCELAS: Word;
  function GetDIA_VENCIMENTO: Word;
  function GetVALIDADE: TDateTime;
  function GetSITUACAO: Word;
  function GetOBSERVACAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDPROPOSTA(const Value: Integer);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetVALOR(const Value: Double);
  procedure SetENTRADA(const Value: Double);
  procedure SetPARCELAS(const Value: Word);
  procedure SetDIA_VENCIMENTO(const Value: Word);
  procedure SetVALIDADE(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDPROPOSTA: Integer read GetIDPROPOSTA write SetIDPROPOSTA;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property VALOR: Double read GetVALOR write SetVALOR;
  property ENTRADA: Double read GetENTRADA write SetENTRADA;
  property PARCELAS: Word read GetPARCELAS write SetPARCELAS;
  property DIA_VENCIMENTO: Word read GetDIA_VENCIMENTO write SetDIA_VENCIMENTO;
  property VALIDADE: TDateTime read GetVALIDADE write SetVALIDADE;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdProposta(pIDPROPOSTA : Integer) : Boolean;
 end;

 TPROPOSTA = class(TCustomPROPOSTA)
 public
  property IDPROPOSTA;
  property IDCOBRANCA;
  property VALOR;
  property ENTRADA;
  property PARCELAS;
  property DIA_VENCIMENTO;
  property VALIDADE;
  property SITUACAO;
  property OBSERVACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesPROPOSTA = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDPROPOSTA: Integer;
  function GetIDCOBRANCA: Integer;
  function GetVALOR: Double;
  function GetENTRADA: Double;
  function GetPARCELAS: Word;
  function GetDIA_VENCIMENTO: Word;
  function GetVALIDADE: TDateTime;
  function GetSITUACAO: Word;
  function GetOBSERVACAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDPROPOSTA(const Value: Integer);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetVALOR(const Value: Double);
  procedure SetENTRADA(const Value: Double);
  procedure SetPARCELAS(const Value: Word);
  procedure SetDIA_VENCIMENTO(const Value: Word);
  procedure SetVALIDADE(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDPROPOSTA: Integer read GetIDPROPOSTA write SetIDPROPOSTA;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property VALOR: Double read GetVALOR write SetVALOR;
  property ENTRADA: Double read GetENTRADA write SetENTRADA;
  property PARCELAS: Word read GetPARCELAS write SetPARCELAS;
  property DIA_VENCIMENTO: Word read GetDIA_VENCIMENTO write SetDIA_VENCIMENTO;
  property VALIDADE: TDateTime read GetVALIDADE write SetVALIDADE;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TPROPOSTAIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesPROPOSTA = class(TCustomSimplesPROPOSTA)
 public
  property IDPROPOSTA;
  property IDCOBRANCA;
  property VALOR;
  property ENTRADA;
  property PARCELAS;
  property DIA_VENCIMENTO;
  property VALIDADE;
  property SITUACAO;
  property OBSERVACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDPROPOSTA = 'IDPROPOSTA';
  CNT_IDCOBRANCA = 'IDCOBRANCA';
  CNT_VALOR = 'VALOR';
  CNT_ENTRADA = 'ENTRADA';
  CNT_PARCELAS = 'PARCELAS';
  CNT_DIA_VENCIMENTO = 'DIA_VENCIMENTO';
  CNT_VALIDADE = 'VALIDADE';
  CNT_SITUACAO = 'SITUACAO';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomPROPOSTA.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'PROPOSTA';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomPROPOSTA.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomPROPOSTA.DoBeforePost;
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

function TCustomPROPOSTA.GetIDPROPOSTA: Integer;
begin
  Result := FieldByName(CNT_IDPROPOSTA).AsInteger;
end;


function TCustomPROPOSTA.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDCOBRANCA).AsInteger;
end;


function TCustomPROPOSTA.GetVALOR: Double;
begin
  Result := FieldByName(CNT_VALOR).AsFloat;
end;


function TCustomPROPOSTA.GetENTRADA: Double;
begin
  Result := FieldByName(CNT_ENTRADA).AsFloat;
end;


function TCustomPROPOSTA.GetPARCELAS: Word;
begin
  Result := FieldByName(CNT_PARCELAS).AsInteger;
end;


function TCustomPROPOSTA.GetDIA_VENCIMENTO: Word;
begin
  Result := FieldByName(CNT_DIA_VENCIMENTO).AsInteger;
end;


function TCustomPROPOSTA.GetVALIDADE: TDateTime;
begin
  Result := FieldByName(CNT_VALIDADE).AsDateTime;
end;


function TCustomPROPOSTA.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomPROPOSTA.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomPROPOSTA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomPROPOSTA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomPROPOSTA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomPROPOSTA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomPROPOSTA.SetIDPROPOSTA(const Value: Integer);
begin
 FieldByName(CNT_IDPROPOSTA).AsInteger := Value;
end;


procedure TCustomPROPOSTA.SetIDCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_IDCOBRANCA).AsInteger := Value;
end;


procedure TCustomPROPOSTA.SetVALOR(const Value: Double);
begin
 FieldByName(CNT_VALOR).AsFloat := Value;
end;


procedure TCustomPROPOSTA.SetENTRADA(const Value: Double);
begin
 FieldByName(CNT_ENTRADA).AsFloat := Value;
end;


procedure TCustomPROPOSTA.SetPARCELAS(const Value: Word);
begin
 FieldByName(CNT_PARCELAS).AsInteger := Value;
end;


procedure TCustomPROPOSTA.SetDIA_VENCIMENTO(const Value: Word);
begin
 FieldByName(CNT_DIA_VENCIMENTO).AsInteger := Value;
end;


procedure TCustomPROPOSTA.SetVALIDADE(const Value: TDateTime);
begin
 FieldByName(CNT_VALIDADE).AsDateTime := Value;
end;


procedure TCustomPROPOSTA.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomPROPOSTA.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomPROPOSTA.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomPROPOSTA.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomPROPOSTA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomPROPOSTA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomPROPOSTA.FindBypk_IdProposta(pIDPROPOSTA : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDPROPOSTA';
  fvalue := pIDPROPOSTA;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesPROPOSTA.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesPROPOSTA.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesPROPOSTA.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from PROPOSTA');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesPROPOSTA.GetIDPROPOSTA: Integer;
begin
  Result := FieldByName(CNT_IDPROPOSTA).AsInteger;
end;


function TCustomSimplesPROPOSTA.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDCOBRANCA).AsInteger;
end;


function TCustomSimplesPROPOSTA.GetVALOR: Double;
begin
  Result := FieldByName(CNT_VALOR).AsFloat;
end;


function TCustomSimplesPROPOSTA.GetENTRADA: Double;
begin
  Result := FieldByName(CNT_ENTRADA).AsFloat;
end;


function TCustomSimplesPROPOSTA.GetPARCELAS: Word;
begin
  Result := FieldByName(CNT_PARCELAS).AsInteger;
end;


function TCustomSimplesPROPOSTA.GetDIA_VENCIMENTO: Word;
begin
  Result := FieldByName(CNT_DIA_VENCIMENTO).AsInteger;
end;


function TCustomSimplesPROPOSTA.GetVALIDADE: TDateTime;
begin
  Result := FieldByName(CNT_VALIDADE).AsDateTime;
end;


function TCustomSimplesPROPOSTA.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesPROPOSTA.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesPROPOSTA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesPROPOSTA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesPROPOSTA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesPROPOSTA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesPROPOSTA.SetIDPROPOSTA(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDPROPOSTA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetIDCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCOBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetVALOR(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetENTRADA(const Value: Double);
begin
  StrCondicao.Add(CNT_ENTRADA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetPARCELAS(const Value: Word);
begin
  StrCondicao.Add(CNT_PARCELAS+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetDIA_VENCIMENTO(const Value: Word);
begin
  StrCondicao.Add(CNT_DIA_VENCIMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetVALIDADE(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_VALIDADE+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesPROPOSTA.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesPROPOSTA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesPROPOSTA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesPROPOSTA.plMontaCondicao;
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

procedure TCustomSimplesPROPOSTA.plOrdenarPor(leIndice : TPROPOSTAIndex );
begin
  Case leIndice Of
    propostapk_IdProposta : lsOrdenar := ' Order By IDPROPOSTA';
    propostaInd_IdCobranca : lsOrdenar := ' Order By IDCOBRANCA';
  End;
end;

procedure TCustomSimplesPROPOSTA.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesPROPOSTA.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesPROPOSTA.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

