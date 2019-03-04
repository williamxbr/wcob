unit ucLayTIPO_SITUACAO;

interface

uses classes, adodb, variants;

type

 TTIPO_SITUACAOIndex = (tipo_situacaopk_TipoSituacao);

 TCustomTIPO_SITUACAO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetTIPO_SITUACAO: Word;
  function GetDESCRICAO_SITUACAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetSITUACAO: Word;
  procedure SetTIPO_SITUACAO(const Value: Word);
  procedure SetDESCRICAO_SITUACAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  property TIPO_SITUACAO: Word read GetTIPO_SITUACAO write SetTIPO_SITUACAO;
  property DESCRICAO_SITUACAO: String read GetDESCRICAO_SITUACAO write SetDESCRICAO_SITUACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_TipoSituacao(pTIPO_SITUACAO : Word) : Boolean;
 end;

 TTIPO_SITUACAO = class(TCustomTIPO_SITUACAO)
 public
  property TIPO_SITUACAO;
  property DESCRICAO_SITUACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property SITUACAO;
 end;

 TCustomSimplesTIPO_SITUACAO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetTIPO_SITUACAO: Word;
  function GetDESCRICAO_SITUACAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetSITUACAO: Word;
  procedure SetTIPO_SITUACAO(const Value: Word);
  procedure SetDESCRICAO_SITUACAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  property TIPO_SITUACAO: Word read GetTIPO_SITUACAO write SetTIPO_SITUACAO;
  property DESCRICAO_SITUACAO: String read GetDESCRICAO_SITUACAO write SetDESCRICAO_SITUACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TTIPO_SITUACAOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesTIPO_SITUACAO = class(TCustomSimplesTIPO_SITUACAO)
 public
  property TIPO_SITUACAO;
  property DESCRICAO_SITUACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property SITUACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_TIPO_SITUACAO = 'TIPO_SITUACAO';
  CNT_DESCRICAO_SITUACAO = 'DESCRICAO_SITUACAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_SITUACAO = 'SITUACAO';

constructor TCustomTIPO_SITUACAO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'TIPO_SITUACAO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomTIPO_SITUACAO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomTIPO_SITUACAO.DoBeforePost;
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

function TCustomTIPO_SITUACAO.GetTIPO_SITUACAO: Word;
begin
  Result := FieldByName(CNT_TIPO_SITUACAO).AsInteger;
end;


function TCustomTIPO_SITUACAO.GetDESCRICAO_SITUACAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO_SITUACAO).AsString;
end;


function TCustomTIPO_SITUACAO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomTIPO_SITUACAO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomTIPO_SITUACAO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomTIPO_SITUACAO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomTIPO_SITUACAO.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


procedure TCustomTIPO_SITUACAO.SetTIPO_SITUACAO(const Value: Word);
begin
 FieldByName(CNT_TIPO_SITUACAO).AsInteger := Value;
end;


procedure TCustomTIPO_SITUACAO.SetDESCRICAO_SITUACAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO_SITUACAO).AsString := Value;
end;


procedure TCustomTIPO_SITUACAO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomTIPO_SITUACAO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomTIPO_SITUACAO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomTIPO_SITUACAO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomTIPO_SITUACAO.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


function TCustomTIPO_SITUACAO.FindBypk_TipoSituacao(pTIPO_SITUACAO : Word) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'TIPO_SITUACAO';
  fvalue := pTIPO_SITUACAO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesTIPO_SITUACAO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesTIPO_SITUACAO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesTIPO_SITUACAO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from TIPO_SITUACAO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesTIPO_SITUACAO.GetTIPO_SITUACAO: Word;
begin
  Result := FieldByName(CNT_TIPO_SITUACAO).AsInteger;
end;


function TCustomSimplesTIPO_SITUACAO.GetDESCRICAO_SITUACAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO_SITUACAO).AsString;
end;


function TCustomSimplesTIPO_SITUACAO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesTIPO_SITUACAO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesTIPO_SITUACAO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesTIPO_SITUACAO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesTIPO_SITUACAO.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


procedure TCustomSimplesTIPO_SITUACAO.SetTIPO_SITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_TIPO_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesTIPO_SITUACAO.SetDESCRICAO_SITUACAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO_SITUACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_SITUACAO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_SITUACAO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_SITUACAO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesTIPO_SITUACAO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesTIPO_SITUACAO.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;

procedure TCustomSimplesTIPO_SITUACAO.plMontaCondicao;
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

procedure TCustomSimplesTIPO_SITUACAO.plOrdenarPor(leIndice : TTIPO_SITUACAOIndex );
begin
  Case leIndice Of
    tipo_situacaopk_TipoSituacao : lsOrdenar := ' Order By TIPO_SITUACAO';
  End;
end;

procedure TCustomSimplesTIPO_SITUACAO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesTIPO_SITUACAO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesTIPO_SITUACAO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

