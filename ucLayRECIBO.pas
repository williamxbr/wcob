unit ucLayRECIBO;

interface

uses classes, adodb, variants;

type

 TRECIBOIndex = (recibopk_Numero_Recibo, reciboInd_IdRecebimento);

 TCustomRECIBO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetNUMERO_RECIBO: Integer;
  function GetIDRECEBIMENTO: Integer;
  function GetVALOR_PRINCIPAL: Double;
  function GetENCARGOS: Double;
  function GetMULTA: Double;
  function GetHONORARIOS: Double;
  function GetSITUACAO: Word;
  function GetMOTIVO_CANCELAMENTO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetNUMERO_RECIBO(const Value: Integer);
  procedure SetIDRECEBIMENTO(const Value: Integer);
  procedure SetVALOR_PRINCIPAL(const Value: Double);
  procedure SetENCARGOS(const Value: Double);
  procedure SetMULTA(const Value: Double);
  procedure SetHONORARIOS(const Value: Double);
  procedure SetSITUACAO(const Value: Word);
  procedure SetMOTIVO_CANCELAMENTO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property NUMERO_RECIBO: Integer read GetNUMERO_RECIBO write SetNUMERO_RECIBO;
  property IDRECEBIMENTO: Integer read GetIDRECEBIMENTO write SetIDRECEBIMENTO;
  property VALOR_PRINCIPAL: Double read GetVALOR_PRINCIPAL write SetVALOR_PRINCIPAL;
  property ENCARGOS: Double read GetENCARGOS write SetENCARGOS;
  property MULTA: Double read GetMULTA write SetMULTA;
  property HONORARIOS: Double read GetHONORARIOS write SetHONORARIOS;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property MOTIVO_CANCELAMENTO: String read GetMOTIVO_CANCELAMENTO write SetMOTIVO_CANCELAMENTO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Numero_Recibo(pNUMERO_RECIBO : Integer) : Boolean;
 end;

 TRECIBO = class(TCustomRECIBO)
 public
  property NUMERO_RECIBO;
  property IDRECEBIMENTO;
  property VALOR_PRINCIPAL;
  property ENCARGOS;
  property MULTA;
  property HONORARIOS;
  property SITUACAO;
  property MOTIVO_CANCELAMENTO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesRECIBO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetNUMERO_RECIBO: Integer;
  function GetIDRECEBIMENTO: Integer;
  function GetVALOR_PRINCIPAL: Double;
  function GetENCARGOS: Double;
  function GetMULTA: Double;
  function GetHONORARIOS: Double;
  function GetSITUACAO: Word;
  function GetMOTIVO_CANCELAMENTO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetNUMERO_RECIBO(const Value: Integer);
  procedure SetIDRECEBIMENTO(const Value: Integer);
  procedure SetVALOR_PRINCIPAL(const Value: Double);
  procedure SetENCARGOS(const Value: Double);
  procedure SetMULTA(const Value: Double);
  procedure SetHONORARIOS(const Value: Double);
  procedure SetSITUACAO(const Value: Word);
  procedure SetMOTIVO_CANCELAMENTO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property NUMERO_RECIBO: Integer read GetNUMERO_RECIBO write SetNUMERO_RECIBO;
  property IDRECEBIMENTO: Integer read GetIDRECEBIMENTO write SetIDRECEBIMENTO;
  property VALOR_PRINCIPAL: Double read GetVALOR_PRINCIPAL write SetVALOR_PRINCIPAL;
  property ENCARGOS: Double read GetENCARGOS write SetENCARGOS;
  property MULTA: Double read GetMULTA write SetMULTA;
  property HONORARIOS: Double read GetHONORARIOS write SetHONORARIOS;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property MOTIVO_CANCELAMENTO: String read GetMOTIVO_CANCELAMENTO write SetMOTIVO_CANCELAMENTO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TRECIBOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesRECIBO = class(TCustomSimplesRECIBO)
 public
  property NUMERO_RECIBO;
  property IDRECEBIMENTO;
  property VALOR_PRINCIPAL;
  property ENCARGOS;
  property MULTA;
  property HONORARIOS;
  property SITUACAO;
  property MOTIVO_CANCELAMENTO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_NUMERO_RECIBO = 'NUMERO_RECIBO';
  CNT_IDRECEBIMENTO = 'IDRECEBIMENTO';
  CNT_VALOR_PRINCIPAL = 'VALOR_PRINCIPAL';
  CNT_ENCARGOS = 'ENCARGOS';
  CNT_MULTA = 'MULTA';
  CNT_HONORARIOS = 'HONORARIOS';
  CNT_SITUACAO = 'SITUACAO';
  CNT_MOTIVO_CANCELAMENTO = 'MOTIVO_CANCELAMENTO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomRECIBO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'RECIBO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomRECIBO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomRECIBO.DoBeforePost;
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

function TCustomRECIBO.GetNUMERO_RECIBO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_RECIBO).AsInteger;
end;


function TCustomRECIBO.GetIDRECEBIMENTO: Integer;
begin
  Result := FieldByName(CNT_IDRECEBIMENTO).AsInteger;
end;


function TCustomRECIBO.GetVALOR_PRINCIPAL: Double;
begin
  Result := FieldByName(CNT_VALOR_PRINCIPAL).AsFloat;
end;


function TCustomRECIBO.GetENCARGOS: Double;
begin
  Result := FieldByName(CNT_ENCARGOS).AsFloat;
end;


function TCustomRECIBO.GetMULTA: Double;
begin
  Result := FieldByName(CNT_MULTA).AsFloat;
end;


function TCustomRECIBO.GetHONORARIOS: Double;
begin
  Result := FieldByName(CNT_HONORARIOS).AsFloat;
end;


function TCustomRECIBO.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomRECIBO.GetMOTIVO_CANCELAMENTO: String;
begin
  Result := FieldByName(CNT_MOTIVO_CANCELAMENTO).AsString;
end;


function TCustomRECIBO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomRECIBO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomRECIBO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomRECIBO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomRECIBO.SetNUMERO_RECIBO(const Value: Integer);
begin
 FieldByName(CNT_NUMERO_RECIBO).AsInteger := Value;
end;


procedure TCustomRECIBO.SetIDRECEBIMENTO(const Value: Integer);
begin
 FieldByName(CNT_IDRECEBIMENTO).AsInteger := Value;
end;


procedure TCustomRECIBO.SetVALOR_PRINCIPAL(const Value: Double);
begin
 FieldByName(CNT_VALOR_PRINCIPAL).AsFloat := Value;
end;


procedure TCustomRECIBO.SetENCARGOS(const Value: Double);
begin
 FieldByName(CNT_ENCARGOS).AsFloat := Value;
end;


procedure TCustomRECIBO.SetMULTA(const Value: Double);
begin
 FieldByName(CNT_MULTA).AsFloat := Value;
end;


procedure TCustomRECIBO.SetHONORARIOS(const Value: Double);
begin
 FieldByName(CNT_HONORARIOS).AsFloat := Value;
end;


procedure TCustomRECIBO.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomRECIBO.SetMOTIVO_CANCELAMENTO(const Value: String);
begin
 FieldByName(CNT_MOTIVO_CANCELAMENTO).AsString := Value;
end;


procedure TCustomRECIBO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomRECIBO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomRECIBO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomRECIBO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomRECIBO.FindBypk_Numero_Recibo(pNUMERO_RECIBO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'NUMERO_RECIBO';
  fvalue := pNUMERO_RECIBO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesRECIBO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesRECIBO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesRECIBO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from RECIBO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesRECIBO.GetNUMERO_RECIBO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_RECIBO).AsInteger;
end;


function TCustomSimplesRECIBO.GetIDRECEBIMENTO: Integer;
begin
  Result := FieldByName(CNT_IDRECEBIMENTO).AsInteger;
end;


function TCustomSimplesRECIBO.GetVALOR_PRINCIPAL: Double;
begin
  Result := FieldByName(CNT_VALOR_PRINCIPAL).AsFloat;
end;


function TCustomSimplesRECIBO.GetENCARGOS: Double;
begin
  Result := FieldByName(CNT_ENCARGOS).AsFloat;
end;


function TCustomSimplesRECIBO.GetMULTA: Double;
begin
  Result := FieldByName(CNT_MULTA).AsFloat;
end;


function TCustomSimplesRECIBO.GetHONORARIOS: Double;
begin
  Result := FieldByName(CNT_HONORARIOS).AsFloat;
end;


function TCustomSimplesRECIBO.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesRECIBO.GetMOTIVO_CANCELAMENTO: String;
begin
  Result := FieldByName(CNT_MOTIVO_CANCELAMENTO).AsString;
end;


function TCustomSimplesRECIBO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesRECIBO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesRECIBO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesRECIBO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesRECIBO.SetNUMERO_RECIBO(const Value: Integer);
begin
  StrCondicao.Add(CNT_NUMERO_RECIBO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetIDRECEBIMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDRECEBIMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetVALOR_PRINCIPAL(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_PRINCIPAL+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetENCARGOS(const Value: Double);
begin
  StrCondicao.Add(CNT_ENCARGOS+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetMULTA(const Value: Double);
begin
  StrCondicao.Add(CNT_MULTA+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetHONORARIOS(const Value: Double);
begin
  StrCondicao.Add(CNT_HONORARIOS+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetMOTIVO_CANCELAMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_MOTIVO_CANCELAMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesRECIBO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesRECIBO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesRECIBO.plMontaCondicao;
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

procedure TCustomSimplesRECIBO.plOrdenarPor(leIndice : TRECIBOIndex );
begin
  Case leIndice Of
    recibopk_Numero_Recibo : lsOrdenar := ' Order By NUMERO_RECIBO';
    reciboInd_IdRecebimento : lsOrdenar := ' Order By IDRECEBIMENTO';
  End;
end;

procedure TCustomSimplesRECIBO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesRECIBO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesRECIBO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

