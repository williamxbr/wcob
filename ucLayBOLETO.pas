unit ucLayBOLETO;

interface

uses classes, adodb, variants;

type

 TBOLETOIndex = (boletoInd_IdCredor, boletopk_IdBoleto);

 TCustomBOLETO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDBOLETO: Integer;
  function GetIDCREDOR: Integer;
  function GetBANCO: String;
  function GetCEDENTE: String;
  function GetCARTEIRA: String;
  function GetNOSSO_NUMERO: Integer;
  function GetAGENCIA: String;
  function GetCONTA_CORRENTE: String;
  function GetDIGITO: String;
  function GetMODALIDADE: String;
  function GetCONVENIO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDBOLETO(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetBANCO(const Value: String);
  procedure SetCEDENTE(const Value: String);
  procedure SetCARTEIRA(const Value: String);
  procedure SetNOSSO_NUMERO(const Value: Integer);
  procedure SetAGENCIA(const Value: String);
  procedure SetCONTA_CORRENTE(const Value: String);
  procedure SetDIGITO(const Value: String);
  procedure SetMODALIDADE(const Value: String);
  procedure SetCONVENIO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDBOLETO: Integer read GetIDBOLETO write SetIDBOLETO;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property BANCO: String read GetBANCO write SetBANCO;
  property CEDENTE: String read GetCEDENTE write SetCEDENTE;
  property CARTEIRA: String read GetCARTEIRA write SetCARTEIRA;
  property NOSSO_NUMERO: Integer read GetNOSSO_NUMERO write SetNOSSO_NUMERO;
  property AGENCIA: String read GetAGENCIA write SetAGENCIA;
  property CONTA_CORRENTE: String read GetCONTA_CORRENTE write SetCONTA_CORRENTE;
  property DIGITO: String read GetDIGITO write SetDIGITO;
  property MODALIDADE: String read GetMODALIDADE write SetMODALIDADE;
  property CONVENIO: String read GetCONVENIO write SetCONVENIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_IdCredor(pIDCREDOR : Integer) : Boolean;
  function FindBypk_IdBoleto(pIDBOLETO : Integer) : Boolean;
 end;

 TBOLETO = class(TCustomBOLETO)
 public
  property IDBOLETO;
  property IDCREDOR;
  property BANCO;
  property CEDENTE;
  property CARTEIRA;
  property NOSSO_NUMERO;
  property AGENCIA;
  property CONTA_CORRENTE;
  property DIGITO;
  property MODALIDADE;
  property CONVENIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesBOLETO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDBOLETO: Integer;
  function GetIDCREDOR: Integer;
  function GetBANCO: String;
  function GetCEDENTE: String;
  function GetCARTEIRA: String;
  function GetNOSSO_NUMERO: Integer;
  function GetAGENCIA: String;
  function GetCONTA_CORRENTE: String;
  function GetDIGITO: String;
  function GetMODALIDADE: String;
  function GetCONVENIO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDBOLETO(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetBANCO(const Value: String);
  procedure SetCEDENTE(const Value: String);
  procedure SetCARTEIRA(const Value: String);
  procedure SetNOSSO_NUMERO(const Value: Integer);
  procedure SetAGENCIA(const Value: String);
  procedure SetCONTA_CORRENTE(const Value: String);
  procedure SetDIGITO(const Value: String);
  procedure SetMODALIDADE(const Value: String);
  procedure SetCONVENIO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDBOLETO: Integer read GetIDBOLETO write SetIDBOLETO;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property BANCO: String read GetBANCO write SetBANCO;
  property CEDENTE: String read GetCEDENTE write SetCEDENTE;
  property CARTEIRA: String read GetCARTEIRA write SetCARTEIRA;
  property NOSSO_NUMERO: Integer read GetNOSSO_NUMERO write SetNOSSO_NUMERO;
  property AGENCIA: String read GetAGENCIA write SetAGENCIA;
  property CONTA_CORRENTE: String read GetCONTA_CORRENTE write SetCONTA_CORRENTE;
  property DIGITO: String read GetDIGITO write SetDIGITO;
  property MODALIDADE: String read GetMODALIDADE write SetMODALIDADE;
  property CONVENIO: String read GetCONVENIO write SetCONVENIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TBOLETOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesBOLETO = class(TCustomSimplesBOLETO)
 public
  property IDBOLETO;
  property IDCREDOR;
  property BANCO;
  property CEDENTE;
  property CARTEIRA;
  property NOSSO_NUMERO;
  property AGENCIA;
  property CONTA_CORRENTE;
  property DIGITO;
  property MODALIDADE;
  property CONVENIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDBOLETO = 'IDBOLETO';
  CNT_IDCREDOR = 'IDCREDOR';
  CNT_BANCO = 'BANCO';
  CNT_CEDENTE = 'CEDENTE';
  CNT_CARTEIRA = 'CARTEIRA';
  CNT_NOSSO_NUMERO = 'NOSSO_NUMERO';
  CNT_AGENCIA = 'AGENCIA';
  CNT_CONTA_CORRENTE = 'CONTA_CORRENTE';
  CNT_DIGITO = 'DIGITO';
  CNT_MODALIDADE = 'MODALIDADE';
  CNT_CONVENIO = 'CONVENIO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomBOLETO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'BOLETO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomBOLETO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomBOLETO.DoBeforePost;
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

function TCustomBOLETO.GetIDBOLETO: Integer;
begin
  Result := FieldByName(CNT_IDBOLETO).AsInteger;
end;


function TCustomBOLETO.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomBOLETO.GetBANCO: String;
begin
  Result := FieldByName(CNT_BANCO).AsString;
end;


function TCustomBOLETO.GetCEDENTE: String;
begin
  Result := FieldByName(CNT_CEDENTE).AsString;
end;


function TCustomBOLETO.GetCARTEIRA: String;
begin
  Result := FieldByName(CNT_CARTEIRA).AsString;
end;


function TCustomBOLETO.GetNOSSO_NUMERO: Integer;
begin
  Result := FieldByName(CNT_NOSSO_NUMERO).AsInteger;
end;


function TCustomBOLETO.GetAGENCIA: String;
begin
  Result := FieldByName(CNT_AGENCIA).AsString;
end;


function TCustomBOLETO.GetCONTA_CORRENTE: String;
begin
  Result := FieldByName(CNT_CONTA_CORRENTE).AsString;
end;


function TCustomBOLETO.GetDIGITO: String;
begin
  Result := FieldByName(CNT_DIGITO).AsString;
end;


function TCustomBOLETO.GetMODALIDADE: String;
begin
  Result := FieldByName(CNT_MODALIDADE).AsString;
end;


function TCustomBOLETO.GetCONVENIO: String;
begin
  Result := FieldByName(CNT_CONVENIO).AsString;
end;


function TCustomBOLETO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomBOLETO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomBOLETO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomBOLETO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomBOLETO.SetIDBOLETO(const Value: Integer);
begin
 FieldByName(CNT_IDBOLETO).AsInteger := Value;
end;


procedure TCustomBOLETO.SetIDCREDOR(const Value: Integer);
begin
 FieldByName(CNT_IDCREDOR).AsInteger := Value;
end;


procedure TCustomBOLETO.SetBANCO(const Value: String);
begin
 FieldByName(CNT_BANCO).AsString := Value;
end;


procedure TCustomBOLETO.SetCEDENTE(const Value: String);
begin
 FieldByName(CNT_CEDENTE).AsString := Value;
end;


procedure TCustomBOLETO.SetCARTEIRA(const Value: String);
begin
 FieldByName(CNT_CARTEIRA).AsString := Value;
end;


procedure TCustomBOLETO.SetNOSSO_NUMERO(const Value: Integer);
begin
 FieldByName(CNT_NOSSO_NUMERO).AsInteger := Value;
end;


procedure TCustomBOLETO.SetAGENCIA(const Value: String);
begin
 FieldByName(CNT_AGENCIA).AsString := Value;
end;


procedure TCustomBOLETO.SetCONTA_CORRENTE(const Value: String);
begin
 FieldByName(CNT_CONTA_CORRENTE).AsString := Value;
end;


procedure TCustomBOLETO.SetDIGITO(const Value: String);
begin
 FieldByName(CNT_DIGITO).AsString := Value;
end;


procedure TCustomBOLETO.SetMODALIDADE(const Value: String);
begin
 FieldByName(CNT_MODALIDADE).AsString := Value;
end;


procedure TCustomBOLETO.SetCONVENIO(const Value: String);
begin
 FieldByName(CNT_CONVENIO).AsString := Value;
end;


procedure TCustomBOLETO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomBOLETO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomBOLETO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomBOLETO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomBOLETO.FindByInd_IdCredor(pIDCREDOR : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDCREDOR';
  fvalue := pIDCREDOR;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomBOLETO.FindBypk_IdBoleto(pIDBOLETO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDBOLETO';
  fvalue := pIDBOLETO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesBOLETO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesBOLETO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesBOLETO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from BOLETO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesBOLETO.GetIDBOLETO: Integer;
begin
  Result := FieldByName(CNT_IDBOLETO).AsInteger;
end;


function TCustomSimplesBOLETO.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomSimplesBOLETO.GetBANCO: String;
begin
  Result := FieldByName(CNT_BANCO).AsString;
end;


function TCustomSimplesBOLETO.GetCEDENTE: String;
begin
  Result := FieldByName(CNT_CEDENTE).AsString;
end;


function TCustomSimplesBOLETO.GetCARTEIRA: String;
begin
  Result := FieldByName(CNT_CARTEIRA).AsString;
end;


function TCustomSimplesBOLETO.GetNOSSO_NUMERO: Integer;
begin
  Result := FieldByName(CNT_NOSSO_NUMERO).AsInteger;
end;


function TCustomSimplesBOLETO.GetAGENCIA: String;
begin
  Result := FieldByName(CNT_AGENCIA).AsString;
end;


function TCustomSimplesBOLETO.GetCONTA_CORRENTE: String;
begin
  Result := FieldByName(CNT_CONTA_CORRENTE).AsString;
end;


function TCustomSimplesBOLETO.GetDIGITO: String;
begin
  Result := FieldByName(CNT_DIGITO).AsString;
end;


function TCustomSimplesBOLETO.GetMODALIDADE: String;
begin
  Result := FieldByName(CNT_MODALIDADE).AsString;
end;


function TCustomSimplesBOLETO.GetCONVENIO: String;
begin
  Result := FieldByName(CNT_CONVENIO).AsString;
end;


function TCustomSimplesBOLETO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesBOLETO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesBOLETO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesBOLETO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesBOLETO.SetIDBOLETO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDBOLETO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetIDCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetBANCO(const Value: String);
begin
  StrCondicao.Add(CNT_BANCO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetCEDENTE(const Value: String);
begin
  StrCondicao.Add(CNT_CEDENTE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetCARTEIRA(const Value: String);
begin
  StrCondicao.Add(CNT_CARTEIRA+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetNOSSO_NUMERO(const Value: Integer);
begin
  StrCondicao.Add(CNT_NOSSO_NUMERO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetAGENCIA(const Value: String);
begin
  StrCondicao.Add(CNT_AGENCIA+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetCONTA_CORRENTE(const Value: String);
begin
  StrCondicao.Add(CNT_CONTA_CORRENTE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetDIGITO(const Value: String);
begin
  StrCondicao.Add(CNT_DIGITO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetMODALIDADE(const Value: String);
begin
  StrCondicao.Add(CNT_MODALIDADE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetCONVENIO(const Value: String);
begin
  StrCondicao.Add(CNT_CONVENIO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBOLETO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesBOLETO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesBOLETO.plMontaCondicao;
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

procedure TCustomSimplesBOLETO.plOrdenarPor(leIndice : TBOLETOIndex );
begin
  Case leIndice Of
    boletoInd_IdCredor : lsOrdenar := ' Order By IDCREDOR';
    boletopk_IdBoleto : lsOrdenar := ' Order By IDBOLETO';
  End;
end;

procedure TCustomSimplesBOLETO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesBOLETO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesBOLETO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

