unit ucLayCHAMADO;

interface

uses classes, adodb, variants;

type

 TCHAMADOIndex = (chamadopk_IdChamado, chamadoInd_IdAcordo, chamadoInd_IdCobrador, chamadoInd_IdCobranca, chamadoInd_IdCredor, chamadoInd_IdDevedor);

 TCustomCHAMADO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDCHAMADO: Integer;
  function GetIDCOBRADOR: Integer;
  function GetIDCREDOR: Integer;
  function GetIDDEVEDOR: Integer;
  function GetIDCOBRANCA: Integer;
  function GetIDACORDO: Integer;
  function GetHORA_INICIO_CONFIRMADA: TDateTime;
  function GetHORA_FINAL_CONFIRMADA: TDateTime;
  function GetHORA_INICIO_PROGRAMADA: TDateTime;
  function GetHORA_FINAL_PROGRAMADA: TDateTime;
  function GetSITUACAO: Word;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetTIPO_CHAMADO: Word;
  procedure SetIDCHAMADO(const Value: Integer);
  procedure SetIDCOBRADOR(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetIDDEVEDOR(const Value: Integer);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetIDACORDO(const Value: Integer);
  procedure SetHORA_INICIO_CONFIRMADA(const Value: TDateTime);
  procedure SetHORA_FINAL_CONFIRMADA(const Value: TDateTime);
  procedure SetHORA_INICIO_PROGRAMADA(const Value: TDateTime);
  procedure SetHORA_FINAL_PROGRAMADA(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetTIPO_CHAMADO(const Value: Word);
  property IDCHAMADO: Integer read GetIDCHAMADO write SetIDCHAMADO;
  property IDCOBRADOR: Integer read GetIDCOBRADOR write SetIDCOBRADOR;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property IDDEVEDOR: Integer read GetIDDEVEDOR write SetIDDEVEDOR;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property IDACORDO: Integer read GetIDACORDO write SetIDACORDO;
  property HORA_INICIO_CONFIRMADA: TDateTime read GetHORA_INICIO_CONFIRMADA write SetHORA_INICIO_CONFIRMADA;
  property HORA_FINAL_CONFIRMADA: TDateTime read GetHORA_FINAL_CONFIRMADA write SetHORA_FINAL_CONFIRMADA;
  property HORA_INICIO_PROGRAMADA: TDateTime read GetHORA_INICIO_PROGRAMADA write SetHORA_INICIO_PROGRAMADA;
  property HORA_FINAL_PROGRAMADA: TDateTime read GetHORA_FINAL_PROGRAMADA write SetHORA_FINAL_PROGRAMADA;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property TIPO_CHAMADO: Word read GetTIPO_CHAMADO write SetTIPO_CHAMADO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdChamado(pIDCHAMADO : Integer) : Boolean;
 end;

 TCHAMADO = class(TCustomCHAMADO)
 public
  property IDCHAMADO;
  property IDCOBRADOR;
  property IDCREDOR;
  property IDDEVEDOR;
  property IDCOBRANCA;
  property IDACORDO;
  property HORA_INICIO_CONFIRMADA;
  property HORA_FINAL_CONFIRMADA;
  property HORA_INICIO_PROGRAMADA;
  property HORA_FINAL_PROGRAMADA;
  property SITUACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property TIPO_CHAMADO;
 end;

 TCustomSimplesCHAMADO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDCHAMADO: Integer;
  function GetIDCOBRADOR: Integer;
  function GetIDCREDOR: Integer;
  function GetIDDEVEDOR: Integer;
  function GetIDCOBRANCA: Integer;
  function GetIDACORDO: Integer;
  function GetHORA_INICIO_CONFIRMADA: TDateTime;
  function GetHORA_FINAL_CONFIRMADA: TDateTime;
  function GetHORA_INICIO_PROGRAMADA: TDateTime;
  function GetHORA_FINAL_PROGRAMADA: TDateTime;
  function GetSITUACAO: Word;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetTIPO_CHAMADO: Word;
  procedure SetIDCHAMADO(const Value: Integer);
  procedure SetIDCOBRADOR(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetIDDEVEDOR(const Value: Integer);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetIDACORDO(const Value: Integer);
  procedure SetHORA_INICIO_CONFIRMADA(const Value: TDateTime);
  procedure SetHORA_FINAL_CONFIRMADA(const Value: TDateTime);
  procedure SetHORA_INICIO_PROGRAMADA(const Value: TDateTime);
  procedure SetHORA_FINAL_PROGRAMADA(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetTIPO_CHAMADO(const Value: Word);
  property IDCHAMADO: Integer read GetIDCHAMADO write SetIDCHAMADO;
  property IDCOBRADOR: Integer read GetIDCOBRADOR write SetIDCOBRADOR;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property IDDEVEDOR: Integer read GetIDDEVEDOR write SetIDDEVEDOR;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property IDACORDO: Integer read GetIDACORDO write SetIDACORDO;
  property HORA_INICIO_CONFIRMADA: TDateTime read GetHORA_INICIO_CONFIRMADA write SetHORA_INICIO_CONFIRMADA;
  property HORA_FINAL_CONFIRMADA: TDateTime read GetHORA_FINAL_CONFIRMADA write SetHORA_FINAL_CONFIRMADA;
  property HORA_INICIO_PROGRAMADA: TDateTime read GetHORA_INICIO_PROGRAMADA write SetHORA_INICIO_PROGRAMADA;
  property HORA_FINAL_PROGRAMADA: TDateTime read GetHORA_FINAL_PROGRAMADA write SetHORA_FINAL_PROGRAMADA;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property TIPO_CHAMADO: Word read GetTIPO_CHAMADO write SetTIPO_CHAMADO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TCHAMADOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesCHAMADO = class(TCustomSimplesCHAMADO)
 public
  property IDCHAMADO;
  property IDCOBRADOR;
  property IDCREDOR;
  property IDDEVEDOR;
  property IDCOBRANCA;
  property IDACORDO;
  property HORA_INICIO_CONFIRMADA;
  property HORA_FINAL_CONFIRMADA;
  property HORA_INICIO_PROGRAMADA;
  property HORA_FINAL_PROGRAMADA;
  property SITUACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property TIPO_CHAMADO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDCHAMADO = 'IDCHAMADO';
  CNT_IDCOBRADOR = 'IDCOBRADOR';
  CNT_IDCREDOR = 'IDCREDOR';
  CNT_IDDEVEDOR = 'IDDEVEDOR';
  CNT_IDCOBRANCA = 'IDCOBRANCA';
  CNT_IDACORDO = 'IDACORDO';
  CNT_HORA_INICIO_CONFIRMADA = 'HORA_INICIO_CONFIRMADA';
  CNT_HORA_FINAL_CONFIRMADA = 'HORA_FINAL_CONFIRMADA';
  CNT_HORA_INICIO_PROGRAMADA = 'HORA_INICIO_PROGRAMADA';
  CNT_HORA_FINAL_PROGRAMADA = 'HORA_FINAL_PROGRAMADA';
  CNT_SITUACAO = 'SITUACAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_TIPO_CHAMADO = 'TIPO_CHAMADO';

constructor TCustomCHAMADO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'CHAMADO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomCHAMADO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomCHAMADO.DoBeforePost;
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

function TCustomCHAMADO.GetIDCHAMADO: Integer;
begin
  Result := FieldByName(CNT_IDCHAMADO).AsInteger;
end;


function TCustomCHAMADO.GetIDCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_IDCOBRADOR).AsInteger;
end;


function TCustomCHAMADO.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomCHAMADO.GetIDDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR).AsInteger;
end;


function TCustomCHAMADO.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDCOBRANCA).AsInteger;
end;


function TCustomCHAMADO.GetIDACORDO: Integer;
begin
  Result := FieldByName(CNT_IDACORDO).AsInteger;
end;


function TCustomCHAMADO.GetHORA_INICIO_CONFIRMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_INICIO_CONFIRMADA).AsDateTime;
end;


function TCustomCHAMADO.GetHORA_FINAL_CONFIRMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_FINAL_CONFIRMADA).AsDateTime;
end;


function TCustomCHAMADO.GetHORA_INICIO_PROGRAMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_INICIO_PROGRAMADA).AsDateTime;
end;


function TCustomCHAMADO.GetHORA_FINAL_PROGRAMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_FINAL_PROGRAMADA).AsDateTime;
end;


function TCustomCHAMADO.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomCHAMADO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomCHAMADO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomCHAMADO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomCHAMADO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomCHAMADO.GetTIPO_CHAMADO: Word;
begin
  Result := FieldByName(CNT_TIPO_CHAMADO).AsInteger;
end;


procedure TCustomCHAMADO.SetIDCHAMADO(const Value: Integer);
begin
 FieldByName(CNT_IDCHAMADO).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetIDCOBRADOR(const Value: Integer);
begin
 FieldByName(CNT_IDCOBRADOR).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetIDCREDOR(const Value: Integer);
begin
 FieldByName(CNT_IDCREDOR).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetIDDEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_IDDEVEDOR).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetIDCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_IDCOBRANCA).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetIDACORDO(const Value: Integer);
begin
 FieldByName(CNT_IDACORDO).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetHORA_INICIO_CONFIRMADA(const Value: TDateTime);
begin
 FieldByName(CNT_HORA_INICIO_CONFIRMADA).AsDateTime := Value;
end;


procedure TCustomCHAMADO.SetHORA_FINAL_CONFIRMADA(const Value: TDateTime);
begin
 FieldByName(CNT_HORA_FINAL_CONFIRMADA).AsDateTime := Value;
end;


procedure TCustomCHAMADO.SetHORA_INICIO_PROGRAMADA(const Value: TDateTime);
begin
 FieldByName(CNT_HORA_INICIO_PROGRAMADA).AsDateTime := Value;
end;


procedure TCustomCHAMADO.SetHORA_FINAL_PROGRAMADA(const Value: TDateTime);
begin
 FieldByName(CNT_HORA_FINAL_PROGRAMADA).AsDateTime := Value;
end;


procedure TCustomCHAMADO.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomCHAMADO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomCHAMADO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomCHAMADO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomCHAMADO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomCHAMADO.SetTIPO_CHAMADO(const Value: Word);
begin
 FieldByName(CNT_TIPO_CHAMADO).AsInteger := Value;
end;


function TCustomCHAMADO.FindBypk_IdChamado(pIDCHAMADO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDCHAMADO';
  fvalue := pIDCHAMADO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesCHAMADO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesCHAMADO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesCHAMADO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from CHAMADO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesCHAMADO.GetIDCHAMADO: Integer;
begin
  Result := FieldByName(CNT_IDCHAMADO).AsInteger;
end;


function TCustomSimplesCHAMADO.GetIDCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_IDCOBRADOR).AsInteger;
end;


function TCustomSimplesCHAMADO.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomSimplesCHAMADO.GetIDDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR).AsInteger;
end;


function TCustomSimplesCHAMADO.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDCOBRANCA).AsInteger;
end;


function TCustomSimplesCHAMADO.GetIDACORDO: Integer;
begin
  Result := FieldByName(CNT_IDACORDO).AsInteger;
end;


function TCustomSimplesCHAMADO.GetHORA_INICIO_CONFIRMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_INICIO_CONFIRMADA).AsDateTime;
end;


function TCustomSimplesCHAMADO.GetHORA_FINAL_CONFIRMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_FINAL_CONFIRMADA).AsDateTime;
end;


function TCustomSimplesCHAMADO.GetHORA_INICIO_PROGRAMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_INICIO_PROGRAMADA).AsDateTime;
end;


function TCustomSimplesCHAMADO.GetHORA_FINAL_PROGRAMADA: TDateTime;
begin
  Result := FieldByName(CNT_HORA_FINAL_PROGRAMADA).AsDateTime;
end;


function TCustomSimplesCHAMADO.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesCHAMADO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesCHAMADO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesCHAMADO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesCHAMADO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesCHAMADO.GetTIPO_CHAMADO: Word;
begin
  Result := FieldByName(CNT_TIPO_CHAMADO).AsInteger;
end;


procedure TCustomSimplesCHAMADO.SetIDCHAMADO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCHAMADO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetIDCOBRADOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCOBRADOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetIDCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetIDDEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDDEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetIDCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCOBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetIDACORDO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDACORDO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetHORA_INICIO_CONFIRMADA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_HORA_INICIO_CONFIRMADA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCHAMADO.SetHORA_FINAL_CONFIRMADA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_HORA_FINAL_CONFIRMADA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCHAMADO.SetHORA_INICIO_PROGRAMADA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_HORA_INICIO_PROGRAMADA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCHAMADO.SetHORA_FINAL_PROGRAMADA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_HORA_FINAL_PROGRAMADA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCHAMADO.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCHAMADO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCHAMADO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCHAMADO.SetTIPO_CHAMADO(const Value: Word);
begin
  StrCondicao.Add(CNT_TIPO_CHAMADO+' = '+IntToStr(Value)); 
end;

procedure TCustomSimplesCHAMADO.plMontaCondicao;
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

procedure TCustomSimplesCHAMADO.plOrdenarPor(leIndice : TCHAMADOIndex );
begin
  Case leIndice Of
    chamadopk_IdChamado : lsOrdenar := ' Order By IDCHAMADO';
    chamadoInd_IdAcordo : lsOrdenar := ' Order By IDACORDO';
    chamadoInd_IdCobrador : lsOrdenar := ' Order By IDCOBRADOR';
    chamadoInd_IdCobranca : lsOrdenar := ' Order By IDCOBRANCA';
    chamadoInd_IdCredor : lsOrdenar := ' Order By IDCREDOR';
    chamadoInd_IdDevedor : lsOrdenar := ' Order By IDDEVEDOR';
  End;
end;

procedure TCustomSimplesCHAMADO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesCHAMADO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesCHAMADO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

