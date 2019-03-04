unit ucLayACORDO;

interface

uses classes, adodb, variants;

type

 TACORDOIndex = (acordoInd_Cobranca, acordopk_IdAcordo, acordoInd_Credor, acordoInd_Devedor, acordoInd_Status);

 TCustomACORDO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDACORDO: Integer;
  function GetCOBRANCA: Integer;
  function GetCREDOR: Integer;
  function GetDEVEDOR: Integer;
  function GetVALOR_DIVIDA: Double;
  function GetTAXA: Double;
  function GetVALOR_CORRIGIDO: Double;
  function GetSTATUS: Word;
  function GetPRESTACOES: Word;
  function GetPERIODO: Word;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetCOBRADOR: Integer;
  function GetVALOR_ENTRADA: Double;
  function GetDATA_ACORDO: TDateTime;
  procedure SetIDACORDO(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetCREDOR(const Value: Integer);
  procedure SetDEVEDOR(const Value: Integer);
  procedure SetVALOR_DIVIDA(const Value: Double);
  procedure SetTAXA(const Value: Double);
  procedure SetVALOR_CORRIGIDO(const Value: Double);
  procedure SetSTATUS(const Value: Word);
  procedure SetPRESTACOES(const Value: Word);
  procedure SetPERIODO(const Value: Word);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetCOBRADOR(const Value: Integer);
  procedure SetVALOR_ENTRADA(const Value: Double);
  procedure SetDATA_ACORDO(const Value: TDateTime);
  property IDACORDO: Integer read GetIDACORDO write SetIDACORDO;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property CREDOR: Integer read GetCREDOR write SetCREDOR;
  property DEVEDOR: Integer read GetDEVEDOR write SetDEVEDOR;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
  property TAXA: Double read GetTAXA write SetTAXA;
  property VALOR_CORRIGIDO: Double read GetVALOR_CORRIGIDO write SetVALOR_CORRIGIDO;
  property STATUS: Word read GetSTATUS write SetSTATUS;
  property PRESTACOES: Word read GetPRESTACOES write SetPRESTACOES;
  property PERIODO: Word read GetPERIODO write SetPERIODO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property COBRADOR: Integer read GetCOBRADOR write SetCOBRADOR;
  property VALOR_ENTRADA: Double read GetVALOR_ENTRADA write SetVALOR_ENTRADA;
  property DATA_ACORDO: TDateTime read GetDATA_ACORDO write SetDATA_ACORDO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Cobranca(pCOBRANCA : Integer) : Boolean;
  function FindBypk_IdAcordo(pIDACORDO : Integer) : Boolean;
 end;

 TACORDO = class(TCustomACORDO)
 public
  property IDACORDO;
  property COBRANCA;
  property CREDOR;
  property DEVEDOR;
  property VALOR_DIVIDA;
  property TAXA;
  property VALOR_CORRIGIDO;
  property STATUS;
  property PRESTACOES;
  property PERIODO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property COBRADOR;
  property VALOR_ENTRADA;
  property DATA_ACORDO;
 end;

 TCustomSimplesACORDO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDACORDO: Integer;
  function GetCOBRANCA: Integer;
  function GetCREDOR: Integer;
  function GetDEVEDOR: Integer;
  function GetVALOR_DIVIDA: Double;
  function GetTAXA: Double;
  function GetVALOR_CORRIGIDO: Double;
  function GetSTATUS: Word;
  function GetPRESTACOES: Word;
  function GetPERIODO: Word;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetCOBRADOR: Integer;
  function GetVALOR_ENTRADA: Double;
  function GetDATA_ACORDO: TDateTime;
  procedure SetIDACORDO(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetCREDOR(const Value: Integer);
  procedure SetDEVEDOR(const Value: Integer);
  procedure SetVALOR_DIVIDA(const Value: Double);
  procedure SetTAXA(const Value: Double);
  procedure SetVALOR_CORRIGIDO(const Value: Double);
  procedure SetSTATUS(const Value: Word);
  procedure SetPRESTACOES(const Value: Word);
  procedure SetPERIODO(const Value: Word);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetCOBRADOR(const Value: Integer);
  procedure SetVALOR_ENTRADA(const Value: Double);
  procedure SetDATA_ACORDO(const Value: TDateTime);
  property IDACORDO: Integer read GetIDACORDO write SetIDACORDO;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property CREDOR: Integer read GetCREDOR write SetCREDOR;
  property DEVEDOR: Integer read GetDEVEDOR write SetDEVEDOR;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
  property TAXA: Double read GetTAXA write SetTAXA;
  property VALOR_CORRIGIDO: Double read GetVALOR_CORRIGIDO write SetVALOR_CORRIGIDO;
  property STATUS: Word read GetSTATUS write SetSTATUS;
  property PRESTACOES: Word read GetPRESTACOES write SetPRESTACOES;
  property PERIODO: Word read GetPERIODO write SetPERIODO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property COBRADOR: Integer read GetCOBRADOR write SetCOBRADOR;
  property VALOR_ENTRADA: Double read GetVALOR_ENTRADA write SetVALOR_ENTRADA;
  property DATA_ACORDO: TDateTime read GetDATA_ACORDO write SetDATA_ACORDO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TACORDOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesACORDO = class(TCustomSimplesACORDO)
 public
  property IDACORDO;
  property COBRANCA;
  property CREDOR;
  property DEVEDOR;
  property VALOR_DIVIDA;
  property TAXA;
  property VALOR_CORRIGIDO;
  property STATUS;
  property PRESTACOES;
  property PERIODO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property COBRADOR;
  property VALOR_ENTRADA;
  property DATA_ACORDO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDACORDO = 'IDACORDO';
  CNT_COBRANCA = 'COBRANCA';
  CNT_CREDOR = 'CREDOR';
  CNT_DEVEDOR = 'DEVEDOR';
  CNT_VALOR_DIVIDA = 'VALOR_DIVIDA';
  CNT_TAXA = 'TAXA';
  CNT_VALOR_CORRIGIDO = 'VALOR_CORRIGIDO';
  CNT_STATUS = 'STATUS';
  CNT_PRESTACOES = 'PRESTACOES';
  CNT_PERIODO = 'PERIODO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_COBRADOR = 'COBRADOR';
  CNT_VALOR_ENTRADA = 'VALOR_ENTRADA';
  CNT_DATA_ACORDO = 'DATA_ACORDO';

constructor TCustomACORDO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'ACORDO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomACORDO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomACORDO.DoBeforePost;
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

function TCustomACORDO.GetIDACORDO: Integer;
begin
  Result := FieldByName(CNT_IDACORDO).AsInteger;
end;


function TCustomACORDO.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomACORDO.GetCREDOR: Integer;
begin
  Result := FieldByName(CNT_CREDOR).AsInteger;
end;


function TCustomACORDO.GetDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_DEVEDOR).AsInteger;
end;


function TCustomACORDO.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(CNT_VALOR_DIVIDA).AsFloat;
end;


function TCustomACORDO.GetTAXA: Double;
begin
  Result := FieldByName(CNT_TAXA).AsFloat;
end;


function TCustomACORDO.GetVALOR_CORRIGIDO: Double;
begin
  Result := FieldByName(CNT_VALOR_CORRIGIDO).AsFloat;
end;


function TCustomACORDO.GetSTATUS: Word;
begin
  Result := FieldByName(CNT_STATUS).AsInteger;
end;


function TCustomACORDO.GetPRESTACOES: Word;
begin
  Result := FieldByName(CNT_PRESTACOES).AsInteger;
end;


function TCustomACORDO.GetPERIODO: Word;
begin
  Result := FieldByName(CNT_PERIODO).AsInteger;
end;


function TCustomACORDO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomACORDO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomACORDO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomACORDO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomACORDO.GetCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_COBRADOR).AsInteger;
end;


function TCustomACORDO.GetVALOR_ENTRADA: Double;
begin
  Result := FieldByName(CNT_VALOR_ENTRADA).AsFloat;
end;


function TCustomACORDO.GetDATA_ACORDO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ACORDO).AsDateTime;
end;


procedure TCustomACORDO.SetIDACORDO(const Value: Integer);
begin
 FieldByName(CNT_IDACORDO).AsInteger := Value;
end;


procedure TCustomACORDO.SetCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_COBRANCA).AsInteger := Value;
end;


procedure TCustomACORDO.SetCREDOR(const Value: Integer);
begin
 FieldByName(CNT_CREDOR).AsInteger := Value;
end;


procedure TCustomACORDO.SetDEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_DEVEDOR).AsInteger := Value;
end;


procedure TCustomACORDO.SetVALOR_DIVIDA(const Value: Double);
begin
 FieldByName(CNT_VALOR_DIVIDA).AsFloat := Value;
end;


procedure TCustomACORDO.SetTAXA(const Value: Double);
begin
 FieldByName(CNT_TAXA).AsFloat := Value;
end;


procedure TCustomACORDO.SetVALOR_CORRIGIDO(const Value: Double);
begin
 FieldByName(CNT_VALOR_CORRIGIDO).AsFloat := Value;
end;


procedure TCustomACORDO.SetSTATUS(const Value: Word);
begin
 FieldByName(CNT_STATUS).AsInteger := Value;
end;


procedure TCustomACORDO.SetPRESTACOES(const Value: Word);
begin
 FieldByName(CNT_PRESTACOES).AsInteger := Value;
end;


procedure TCustomACORDO.SetPERIODO(const Value: Word);
begin
 FieldByName(CNT_PERIODO).AsInteger := Value;
end;


procedure TCustomACORDO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomACORDO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomACORDO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomACORDO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomACORDO.SetCOBRADOR(const Value: Integer);
begin
 FieldByName(CNT_COBRADOR).AsInteger := Value;
end;


procedure TCustomACORDO.SetVALOR_ENTRADA(const Value: Double);
begin
 FieldByName(CNT_VALOR_ENTRADA).AsFloat := Value;
end;


procedure TCustomACORDO.SetDATA_ACORDO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ACORDO).AsDateTime := Value;
end;


function TCustomACORDO.FindByInd_Cobranca(pCOBRANCA : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'COBRANCA';
  fvalue := pCOBRANCA;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomACORDO.FindBypk_IdAcordo(pIDACORDO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDACORDO';
  fvalue := pIDACORDO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesACORDO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesACORDO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesACORDO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from ACORDO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesACORDO.GetIDACORDO: Integer;
begin
  Result := FieldByName(CNT_IDACORDO).AsInteger;
end;


function TCustomSimplesACORDO.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomSimplesACORDO.GetCREDOR: Integer;
begin
  Result := FieldByName(CNT_CREDOR).AsInteger;
end;


function TCustomSimplesACORDO.GetDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_DEVEDOR).AsInteger;
end;


function TCustomSimplesACORDO.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(CNT_VALOR_DIVIDA).AsFloat;
end;


function TCustomSimplesACORDO.GetTAXA: Double;
begin
  Result := FieldByName(CNT_TAXA).AsFloat;
end;


function TCustomSimplesACORDO.GetVALOR_CORRIGIDO: Double;
begin
  Result := FieldByName(CNT_VALOR_CORRIGIDO).AsFloat;
end;


function TCustomSimplesACORDO.GetSTATUS: Word;
begin
  Result := FieldByName(CNT_STATUS).AsInteger;
end;


function TCustomSimplesACORDO.GetPRESTACOES: Word;
begin
  Result := FieldByName(CNT_PRESTACOES).AsInteger;
end;


function TCustomSimplesACORDO.GetPERIODO: Word;
begin
  Result := FieldByName(CNT_PERIODO).AsInteger;
end;


function TCustomSimplesACORDO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesACORDO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesACORDO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesACORDO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesACORDO.GetCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_COBRADOR).AsInteger;
end;


function TCustomSimplesACORDO.GetVALOR_ENTRADA: Double;
begin
  Result := FieldByName(CNT_VALOR_ENTRADA).AsFloat;
end;


function TCustomSimplesACORDO.GetDATA_ACORDO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ACORDO).AsDateTime;
end;


procedure TCustomSimplesACORDO.SetIDACORDO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDACORDO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_CREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetDEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_DEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetVALOR_DIVIDA(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_DIVIDA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetTAXA(const Value: Double);
begin
  StrCondicao.Add(CNT_TAXA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetVALOR_CORRIGIDO(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_CORRIGIDO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetSTATUS(const Value: Word);
begin
  StrCondicao.Add(CNT_STATUS+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetPRESTACOES(const Value: Word);
begin
  StrCondicao.Add(CNT_PRESTACOES+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetPERIODO(const Value: Word);
begin
  StrCondicao.Add(CNT_PERIODO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesACORDO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesACORDO.SetCOBRADOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRADOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetVALOR_ENTRADA(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_ENTRADA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesACORDO.SetDATA_ACORDO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ACORDO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesACORDO.plMontaCondicao;
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

procedure TCustomSimplesACORDO.plOrdenarPor(leIndice : TACORDOIndex );
begin
  Case leIndice Of
    acordoInd_Cobranca : lsOrdenar := ' Order By COBRANCA';
    acordopk_IdAcordo : lsOrdenar := ' Order By IDACORDO';
    acordoInd_Credor : lsOrdenar := ' Order By CREDOR';
    acordoInd_Devedor : lsOrdenar := ' Order By DEVEDOR';
    acordoInd_Status : lsOrdenar := ' Order By STATUS';
  End;
end;

procedure TCustomSimplesACORDO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesACORDO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesACORDO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

