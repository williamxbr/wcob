unit ucLayCOBRANCA;

interface

uses classes, adodb, variants;

type

 TCOBRANCAIndex = (cobrancapk_Cobranca);

 TCustomCOBRANCA = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetCOBRANCA: Integer;
  function GetCREDOR: Integer;
  function GetDEVEDOR: Integer;
  function GetDATA_CADASTRO: TDateTime;
  function GetFORMA_PAGAMENTO: Integer;
  function GetSITUACAO: Integer;
  function GetCOBRADOR: Integer;
  function GetVALOR_DIVIDA: Double;
  function GetDATA_ENCERRAMENTO: TDateTime;
  function GetMOTIVO_ENCERRAMENTO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetDATA_DIVIDA: TDateTime;
  function GetVALOR_CORRIGIDO: Double;
  function GetGRUPO_COBRANCA: Integer;
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetCREDOR(const Value: Integer);
  procedure SetDEVEDOR(const Value: Integer);
  procedure SetDATA_CADASTRO(const Value: TDateTime);
  procedure SetFORMA_PAGAMENTO(const Value: Integer);
  procedure SetSITUACAO(const Value: Integer);
  procedure SetCOBRADOR(const Value: Integer);
  procedure SetVALOR_DIVIDA(const Value: Double);
  procedure SetDATA_ENCERRAMENTO(const Value: TDateTime);
  procedure SetMOTIVO_ENCERRAMENTO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetDATA_DIVIDA(const Value: TDateTime);
  procedure SetVALOR_CORRIGIDO(const Value: Double);
  procedure SetGRUPO_COBRANCA(const Value: Integer);
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property CREDOR: Integer read GetCREDOR write SetCREDOR;
  property DEVEDOR: Integer read GetDEVEDOR write SetDEVEDOR;
  property DATA_CADASTRO: TDateTime read GetDATA_CADASTRO write SetDATA_CADASTRO;
  property FORMA_PAGAMENTO: Integer read GetFORMA_PAGAMENTO write SetFORMA_PAGAMENTO;
  property SITUACAO: Integer read GetSITUACAO write SetSITUACAO;
  property COBRADOR: Integer read GetCOBRADOR write SetCOBRADOR;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
  property DATA_ENCERRAMENTO: TDateTime read GetDATA_ENCERRAMENTO write SetDATA_ENCERRAMENTO;
  property MOTIVO_ENCERRAMENTO: String read GetMOTIVO_ENCERRAMENTO write SetMOTIVO_ENCERRAMENTO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property DATA_DIVIDA: TDateTime read GetDATA_DIVIDA write SetDATA_DIVIDA;
  property VALOR_CORRIGIDO: Double read GetVALOR_CORRIGIDO write SetVALOR_CORRIGIDO;
  property GRUPO_COBRANCA: Integer read GetGRUPO_COBRANCA write SetGRUPO_COBRANCA;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Cobranca(pCOBRANCA : Integer) : Boolean;
 end;

 TCOBRANCA = class(TCustomCOBRANCA)
 public
  property COBRANCA;
  property CREDOR;
  property DEVEDOR;
  property DATA_CADASTRO;
  property FORMA_PAGAMENTO;
  property SITUACAO;
  property COBRADOR;
  property VALOR_DIVIDA;
  property DATA_ENCERRAMENTO;
  property MOTIVO_ENCERRAMENTO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property DATA_DIVIDA;
  property VALOR_CORRIGIDO;
  property GRUPO_COBRANCA;
 end;

 TCustomSimplesCOBRANCA = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetCOBRANCA: Integer;
  function GetCREDOR: Integer;
  function GetDEVEDOR: Integer;
  function GetDATA_CADASTRO: TDateTime;
  function GetFORMA_PAGAMENTO: Integer;
  function GetSITUACAO: Integer;
  function GetCOBRADOR: Integer;
  function GetVALOR_DIVIDA: Double;
  function GetDATA_ENCERRAMENTO: TDateTime;
  function GetMOTIVO_ENCERRAMENTO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetDATA_DIVIDA: TDateTime;
  function GetVALOR_CORRIGIDO: Double;
  function GetGRUPO_COBRANCA: Integer;
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetCREDOR(const Value: Integer);
  procedure SetDEVEDOR(const Value: Integer);
  procedure SetDATA_CADASTRO(const Value: TDateTime);
  procedure SetFORMA_PAGAMENTO(const Value: Integer);
  procedure SetSITUACAO(const Value: Integer);
  procedure SetCOBRADOR(const Value: Integer);
  procedure SetVALOR_DIVIDA(const Value: Double);
  procedure SetDATA_ENCERRAMENTO(const Value: TDateTime);
  procedure SetMOTIVO_ENCERRAMENTO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetDATA_DIVIDA(const Value: TDateTime);
  procedure SetVALOR_CORRIGIDO(const Value: Double);
  procedure SetGRUPO_COBRANCA(const Value: Integer);
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property CREDOR: Integer read GetCREDOR write SetCREDOR;
  property DEVEDOR: Integer read GetDEVEDOR write SetDEVEDOR;
  property DATA_CADASTRO: TDateTime read GetDATA_CADASTRO write SetDATA_CADASTRO;
  property FORMA_PAGAMENTO: Integer read GetFORMA_PAGAMENTO write SetFORMA_PAGAMENTO;
  property SITUACAO: Integer read GetSITUACAO write SetSITUACAO;
  property COBRADOR: Integer read GetCOBRADOR write SetCOBRADOR;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
  property DATA_ENCERRAMENTO: TDateTime read GetDATA_ENCERRAMENTO write SetDATA_ENCERRAMENTO;
  property MOTIVO_ENCERRAMENTO: String read GetMOTIVO_ENCERRAMENTO write SetMOTIVO_ENCERRAMENTO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property DATA_DIVIDA: TDateTime read GetDATA_DIVIDA write SetDATA_DIVIDA;
  property VALOR_CORRIGIDO: Double read GetVALOR_CORRIGIDO write SetVALOR_CORRIGIDO;
  property GRUPO_COBRANCA: Integer read GetGRUPO_COBRANCA write SetGRUPO_COBRANCA;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TCOBRANCAIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesCOBRANCA = class(TCustomSimplesCOBRANCA)
 public
  property COBRANCA;
  property CREDOR;
  property DEVEDOR;
  property DATA_CADASTRO;
  property FORMA_PAGAMENTO;
  property SITUACAO;
  property COBRADOR;
  property VALOR_DIVIDA;
  property DATA_ENCERRAMENTO;
  property MOTIVO_ENCERRAMENTO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property DATA_DIVIDA;
  property VALOR_CORRIGIDO;
  property GRUPO_COBRANCA;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_COBRANCA = 'COBRANCA';
  CNT_CREDOR = 'CREDOR';
  CNT_DEVEDOR = 'DEVEDOR';
  CNT_DATA_CADASTRO = 'DATA_CADASTRO';
  CNT_FORMA_PAGAMENTO = 'FORMA_PAGAMENTO';
  CNT_SITUACAO = 'SITUACAO';
  CNT_COBRADOR = 'COBRADOR';
  CNT_VALOR_DIVIDA = 'VALOR_DIVIDA';
  CNT_DATA_ENCERRAMENTO = 'DATA_ENCERRAMENTO';
  CNT_MOTIVO_ENCERRAMENTO = 'MOTIVO_ENCERRAMENTO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_DATA_DIVIDA = 'DATA_DIVIDA';
  CNT_VALOR_CORRIGIDO = 'VALOR_CORRIGIDO';
  CNT_GRUPO_COBRANCA = 'GRUPO_COBRANCA';

constructor TCustomCOBRANCA.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'COBRANCA';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomCOBRANCA.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomCOBRANCA.DoBeforePost;
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

function TCustomCOBRANCA.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomCOBRANCA.GetCREDOR: Integer;
begin
  Result := FieldByName(CNT_CREDOR).AsInteger;
end;


function TCustomCOBRANCA.GetDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_DEVEDOR).AsInteger;
end;


function TCustomCOBRANCA.GetDATA_CADASTRO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_CADASTRO).AsDateTime;
end;


function TCustomCOBRANCA.GetFORMA_PAGAMENTO: Integer;
begin
  Result := FieldByName(CNT_FORMA_PAGAMENTO).AsInteger;
end;


function TCustomCOBRANCA.GetSITUACAO: Integer;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomCOBRANCA.GetCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_COBRADOR).AsInteger;
end;


function TCustomCOBRANCA.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(CNT_VALOR_DIVIDA).AsFloat;
end;


function TCustomCOBRANCA.GetDATA_ENCERRAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ENCERRAMENTO).AsDateTime;
end;


function TCustomCOBRANCA.GetMOTIVO_ENCERRAMENTO: String;
begin
  Result := FieldByName(CNT_MOTIVO_ENCERRAMENTO).AsString;
end;


function TCustomCOBRANCA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomCOBRANCA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomCOBRANCA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomCOBRANCA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomCOBRANCA.GetDATA_DIVIDA: TDateTime;
begin
  Result := FieldByName(CNT_DATA_DIVIDA).AsDateTime;
end;


function TCustomCOBRANCA.GetVALOR_CORRIGIDO: Double;
begin
  Result := FieldByName(CNT_VALOR_CORRIGIDO).AsFloat;
end;


function TCustomCOBRANCA.GetGRUPO_COBRANCA: Integer;
begin
  Result := FieldByName(CNT_GRUPO_COBRANCA).AsInteger;
end;


procedure TCustomCOBRANCA.SetCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_COBRANCA).AsInteger := Value;
end;


procedure TCustomCOBRANCA.SetCREDOR(const Value: Integer);
begin
 FieldByName(CNT_CREDOR).AsInteger := Value;
end;


procedure TCustomCOBRANCA.SetDEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_DEVEDOR).AsInteger := Value;
end;


procedure TCustomCOBRANCA.SetDATA_CADASTRO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_CADASTRO).AsDateTime := Value;
end;


procedure TCustomCOBRANCA.SetFORMA_PAGAMENTO(const Value: Integer);
begin
 FieldByName(CNT_FORMA_PAGAMENTO).AsInteger := Value;
end;


procedure TCustomCOBRANCA.SetSITUACAO(const Value: Integer);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomCOBRANCA.SetCOBRADOR(const Value: Integer);
begin
 FieldByName(CNT_COBRADOR).AsInteger := Value;
end;


procedure TCustomCOBRANCA.SetVALOR_DIVIDA(const Value: Double);
begin
 FieldByName(CNT_VALOR_DIVIDA).AsFloat := Value;
end;


procedure TCustomCOBRANCA.SetDATA_ENCERRAMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ENCERRAMENTO).AsDateTime := Value;
end;


procedure TCustomCOBRANCA.SetMOTIVO_ENCERRAMENTO(const Value: String);
begin
 FieldByName(CNT_MOTIVO_ENCERRAMENTO).AsString := Value;
end;


procedure TCustomCOBRANCA.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomCOBRANCA.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomCOBRANCA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomCOBRANCA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomCOBRANCA.SetDATA_DIVIDA(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_DIVIDA).AsDateTime := Value;
end;


procedure TCustomCOBRANCA.SetVALOR_CORRIGIDO(const Value: Double);
begin
 FieldByName(CNT_VALOR_CORRIGIDO).AsFloat := Value;
end;


procedure TCustomCOBRANCA.SetGRUPO_COBRANCA(const Value: Integer);
begin
 FieldByName(CNT_GRUPO_COBRANCA).AsInteger := Value;
end;


function TCustomCOBRANCA.FindBypk_Cobranca(pCOBRANCA : Integer) : Boolean;
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


constructor TCustomSimplesCOBRANCA.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesCOBRANCA.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesCOBRANCA.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from COBRANCA');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesCOBRANCA.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomSimplesCOBRANCA.GetCREDOR: Integer;
begin
  Result := FieldByName(CNT_CREDOR).AsInteger;
end;


function TCustomSimplesCOBRANCA.GetDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_DEVEDOR).AsInteger;
end;


function TCustomSimplesCOBRANCA.GetDATA_CADASTRO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_CADASTRO).AsDateTime;
end;


function TCustomSimplesCOBRANCA.GetFORMA_PAGAMENTO: Integer;
begin
  Result := FieldByName(CNT_FORMA_PAGAMENTO).AsInteger;
end;


function TCustomSimplesCOBRANCA.GetSITUACAO: Integer;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesCOBRANCA.GetCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_COBRADOR).AsInteger;
end;


function TCustomSimplesCOBRANCA.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(CNT_VALOR_DIVIDA).AsFloat;
end;


function TCustomSimplesCOBRANCA.GetDATA_ENCERRAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ENCERRAMENTO).AsDateTime;
end;


function TCustomSimplesCOBRANCA.GetMOTIVO_ENCERRAMENTO: String;
begin
  Result := FieldByName(CNT_MOTIVO_ENCERRAMENTO).AsString;
end;


function TCustomSimplesCOBRANCA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesCOBRANCA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesCOBRANCA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesCOBRANCA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesCOBRANCA.GetDATA_DIVIDA: TDateTime;
begin
  Result := FieldByName(CNT_DATA_DIVIDA).AsDateTime;
end;


function TCustomSimplesCOBRANCA.GetVALOR_CORRIGIDO: Double;
begin
  Result := FieldByName(CNT_VALOR_CORRIGIDO).AsFloat;
end;


function TCustomSimplesCOBRANCA.GetGRUPO_COBRANCA: Integer;
begin
  Result := FieldByName(CNT_GRUPO_COBRANCA).AsInteger;
end;


procedure TCustomSimplesCOBRANCA.SetCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_CREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetDEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_DEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetDATA_CADASTRO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_CADASTRO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRANCA.SetFORMA_PAGAMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_FORMA_PAGAMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetSITUACAO(const Value: Integer);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetCOBRADOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRADOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetVALOR_DIVIDA(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_DIVIDA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetDATA_ENCERRAMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ENCERRAMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRANCA.SetMOTIVO_ENCERRAMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_MOTIVO_ENCERRAMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRANCA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRANCA.SetDATA_DIVIDA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_DIVIDA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRANCA.SetVALOR_CORRIGIDO(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_CORRIGIDO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesCOBRANCA.SetGRUPO_COBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_GRUPO_COBRANCA+' = '+IntToStr(Value)); 
end;

procedure TCustomSimplesCOBRANCA.plMontaCondicao;
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

procedure TCustomSimplesCOBRANCA.plOrdenarPor(leIndice : TCOBRANCAIndex );
begin
  Case leIndice Of
    cobrancapk_Cobranca : lsOrdenar := ' Order By COBRANCA';
  End;
end;

procedure TCustomSimplesCOBRANCA.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesCOBRANCA.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesCOBRANCA.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

