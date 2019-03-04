unit ucLayPARAMETROS;

interface

uses classes, adodb, variants;

type

 TPARAMETROSIndex = (parametrospk_Id);

 TCustomPARAMETROS = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetID: Integer;
  function GetVERSAO_SISTEMA: Integer;
  function GetULTIMO_NUM_RECIBO: Integer;
  function GetJUROS_DEPRE: Double;
  function GetIDCREDORPROPRIETARIO: Integer;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetEMPRESA: Word;
  function GetNUMERO_SERIAL: String;
  procedure SetID(const Value: Integer);
  procedure SetVERSAO_SISTEMA(const Value: Integer);
  procedure SetULTIMO_NUM_RECIBO(const Value: Integer);
  procedure SetJUROS_DEPRE(const Value: Double);
  procedure SetIDCREDORPROPRIETARIO(const Value: Integer);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetEMPRESA(const Value: Word);
  procedure SetNUMERO_SERIAL(const Value: String);
  property ID: Integer read GetID write SetID;
  property VERSAO_SISTEMA: Integer read GetVERSAO_SISTEMA write SetVERSAO_SISTEMA;
  property ULTIMO_NUM_RECIBO: Integer read GetULTIMO_NUM_RECIBO write SetULTIMO_NUM_RECIBO;
  property JUROS_DEPRE: Double read GetJUROS_DEPRE write SetJUROS_DEPRE;
  property IDCREDORPROPRIETARIO: Integer read GetIDCREDORPROPRIETARIO write SetIDCREDORPROPRIETARIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property EMPRESA: Word read GetEMPRESA write SetEMPRESA;
  property NUMERO_SERIAL: String read GetNUMERO_SERIAL write SetNUMERO_SERIAL;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Id(pID : Integer) : Boolean;
 end;

 TPARAMETROS = class(TCustomPARAMETROS)
 public
  property ID;
  property VERSAO_SISTEMA;
  property ULTIMO_NUM_RECIBO;
  property JUROS_DEPRE;
  property IDCREDORPROPRIETARIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property EMPRESA;
  property NUMERO_SERIAL;
 end;

 TCustomSimplesPARAMETROS = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetID: Integer;
  function GetVERSAO_SISTEMA: Integer;
  function GetULTIMO_NUM_RECIBO: Integer;
  function GetJUROS_DEPRE: Double;
  function GetIDCREDORPROPRIETARIO: Integer;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetEMPRESA: Word;
  function GetNUMERO_SERIAL: String;
  procedure SetID(const Value: Integer);
  procedure SetVERSAO_SISTEMA(const Value: Integer);
  procedure SetULTIMO_NUM_RECIBO(const Value: Integer);
  procedure SetJUROS_DEPRE(const Value: Double);
  procedure SetIDCREDORPROPRIETARIO(const Value: Integer);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetEMPRESA(const Value: Word);
  procedure SetNUMERO_SERIAL(const Value: String);
  property ID: Integer read GetID write SetID;
  property VERSAO_SISTEMA: Integer read GetVERSAO_SISTEMA write SetVERSAO_SISTEMA;
  property ULTIMO_NUM_RECIBO: Integer read GetULTIMO_NUM_RECIBO write SetULTIMO_NUM_RECIBO;
  property JUROS_DEPRE: Double read GetJUROS_DEPRE write SetJUROS_DEPRE;
  property IDCREDORPROPRIETARIO: Integer read GetIDCREDORPROPRIETARIO write SetIDCREDORPROPRIETARIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property EMPRESA: Word read GetEMPRESA write SetEMPRESA;
  property NUMERO_SERIAL: String read GetNUMERO_SERIAL write SetNUMERO_SERIAL;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TPARAMETROSIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesPARAMETROS = class(TCustomSimplesPARAMETROS)
 public
  property ID;
  property VERSAO_SISTEMA;
  property ULTIMO_NUM_RECIBO;
  property JUROS_DEPRE;
  property IDCREDORPROPRIETARIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property EMPRESA;
  property NUMERO_SERIAL;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_ID = 'ID';
  CNT_VERSAO_SISTEMA = 'VERSAO_SISTEMA';
  CNT_ULTIMO_NUM_RECIBO = 'ULTIMO_NUM_RECIBO';
  CNT_JUROS_DEPRE = 'JUROS_DEPRE';
  CNT_IDCREDORPROPRIETARIO = 'IDCREDORPROPRIETARIO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_EMPRESA = 'EMPRESA';
  CNT_NUMERO_SERIAL = 'NUMERO_SERIAL';

constructor TCustomPARAMETROS.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'PARAMETROS';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomPARAMETROS.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomPARAMETROS.DoBeforePost;
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

function TCustomPARAMETROS.GetID: Integer;
begin
  Result := FieldByName(CNT_ID).AsInteger;
end;


function TCustomPARAMETROS.GetVERSAO_SISTEMA: Integer;
begin
  Result := FieldByName(CNT_VERSAO_SISTEMA).AsInteger;
end;


function TCustomPARAMETROS.GetULTIMO_NUM_RECIBO: Integer;
begin
  Result := FieldByName(CNT_ULTIMO_NUM_RECIBO).AsInteger;
end;


function TCustomPARAMETROS.GetJUROS_DEPRE: Double;
begin
  Result := FieldByName(CNT_JUROS_DEPRE).AsFloat;
end;


function TCustomPARAMETROS.GetIDCREDORPROPRIETARIO: Integer;
begin
  Result := FieldByName(CNT_IDCREDORPROPRIETARIO).AsInteger;
end;


function TCustomPARAMETROS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomPARAMETROS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomPARAMETROS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomPARAMETROS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomPARAMETROS.GetEMPRESA: Word;
begin
  Result := FieldByName(CNT_EMPRESA).AsInteger;
end;


function TCustomPARAMETROS.GetNUMERO_SERIAL: String;
begin
  Result := FieldByName(CNT_NUMERO_SERIAL).AsString;
end;


procedure TCustomPARAMETROS.SetID(const Value: Integer);
begin
 FieldByName(CNT_ID).AsInteger := Value;
end;


procedure TCustomPARAMETROS.SetVERSAO_SISTEMA(const Value: Integer);
begin
 FieldByName(CNT_VERSAO_SISTEMA).AsInteger := Value;
end;


procedure TCustomPARAMETROS.SetULTIMO_NUM_RECIBO(const Value: Integer);
begin
 FieldByName(CNT_ULTIMO_NUM_RECIBO).AsInteger := Value;
end;


procedure TCustomPARAMETROS.SetJUROS_DEPRE(const Value: Double);
begin
 FieldByName(CNT_JUROS_DEPRE).AsFloat := Value;
end;


procedure TCustomPARAMETROS.SetIDCREDORPROPRIETARIO(const Value: Integer);
begin
 FieldByName(CNT_IDCREDORPROPRIETARIO).AsInteger := Value;
end;


procedure TCustomPARAMETROS.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomPARAMETROS.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomPARAMETROS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomPARAMETROS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomPARAMETROS.SetEMPRESA(const Value: Word);
begin
 FieldByName(CNT_EMPRESA).AsInteger := Value;
end;


procedure TCustomPARAMETROS.SetNUMERO_SERIAL(const Value: String);
begin
 FieldByName(CNT_NUMERO_SERIAL).AsString := Value;
end;


function TCustomPARAMETROS.FindBypk_Id(pID : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'ID';
  fvalue := pID;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesPARAMETROS.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesPARAMETROS.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesPARAMETROS.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from PARAMETROS');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesPARAMETROS.GetID: Integer;
begin
  Result := FieldByName(CNT_ID).AsInteger;
end;


function TCustomSimplesPARAMETROS.GetVERSAO_SISTEMA: Integer;
begin
  Result := FieldByName(CNT_VERSAO_SISTEMA).AsInteger;
end;


function TCustomSimplesPARAMETROS.GetULTIMO_NUM_RECIBO: Integer;
begin
  Result := FieldByName(CNT_ULTIMO_NUM_RECIBO).AsInteger;
end;


function TCustomSimplesPARAMETROS.GetJUROS_DEPRE: Double;
begin
  Result := FieldByName(CNT_JUROS_DEPRE).AsFloat;
end;


function TCustomSimplesPARAMETROS.GetIDCREDORPROPRIETARIO: Integer;
begin
  Result := FieldByName(CNT_IDCREDORPROPRIETARIO).AsInteger;
end;


function TCustomSimplesPARAMETROS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesPARAMETROS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesPARAMETROS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesPARAMETROS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesPARAMETROS.GetEMPRESA: Word;
begin
  Result := FieldByName(CNT_EMPRESA).AsInteger;
end;


function TCustomSimplesPARAMETROS.GetNUMERO_SERIAL: String;
begin
  Result := FieldByName(CNT_NUMERO_SERIAL).AsString;
end;


procedure TCustomSimplesPARAMETROS.SetID(const Value: Integer);
begin
  StrCondicao.Add(CNT_ID+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetVERSAO_SISTEMA(const Value: Integer);
begin
  StrCondicao.Add(CNT_VERSAO_SISTEMA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetULTIMO_NUM_RECIBO(const Value: Integer);
begin
  StrCondicao.Add(CNT_ULTIMO_NUM_RECIBO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetJUROS_DEPRE(const Value: Double);
begin
  StrCondicao.Add(CNT_JUROS_DEPRE+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetIDCREDORPROPRIETARIO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCREDORPROPRIETARIO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesPARAMETROS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesPARAMETROS.SetEMPRESA(const Value: Word);
begin
  StrCondicao.Add(CNT_EMPRESA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesPARAMETROS.SetNUMERO_SERIAL(const Value: String);
begin
  StrCondicao.Add(CNT_NUMERO_SERIAL+' = '+QuotedStr(Value)); 
end;

procedure TCustomSimplesPARAMETROS.plMontaCondicao;
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

procedure TCustomSimplesPARAMETROS.plOrdenarPor(leIndice : TPARAMETROSIndex );
begin
  Case leIndice Of
    parametrospk_Id : lsOrdenar := ' Order By ID';
  End;
end;

procedure TCustomSimplesPARAMETROS.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesPARAMETROS.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesPARAMETROS.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

