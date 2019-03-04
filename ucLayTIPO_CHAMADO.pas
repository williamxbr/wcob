unit ucLayTIPO_CHAMADO;

interface

uses classes, adodb, variants;

type

 TTIPO_CHAMADOIndex = (tipo_chamadoPK_IDTIPOCHAMADO);

 TCustomTIPO_CHAMADO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDTIPOCHAMADO: Word;
  function GetDESCRICAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDTIPOCHAMADO(const Value: Word);
  procedure SetDESCRICAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDTIPOCHAMADO: Word read GetIDTIPOCHAMADO write SetIDTIPOCHAMADO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByPK_IDTIPOCHAMADO(pIDTIPOCHAMADO : Word) : Boolean;
 end;

 TTIPO_CHAMADO = class(TCustomTIPO_CHAMADO)
 public
  property IDTIPOCHAMADO;
  property DESCRICAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesTIPO_CHAMADO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDTIPOCHAMADO: Word;
  function GetDESCRICAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDTIPOCHAMADO(const Value: Word);
  procedure SetDESCRICAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDTIPOCHAMADO: Word read GetIDTIPOCHAMADO write SetIDTIPOCHAMADO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TTIPO_CHAMADOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesTIPO_CHAMADO = class(TCustomSimplesTIPO_CHAMADO)
 public
  property IDTIPOCHAMADO;
  property DESCRICAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDTIPOCHAMADO = 'IDTIPOCHAMADO';
  CNT_DESCRICAO = 'DESCRICAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomTIPO_CHAMADO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'TIPO_CHAMADO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomTIPO_CHAMADO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomTIPO_CHAMADO.DoBeforePost;
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

function TCustomTIPO_CHAMADO.GetIDTIPOCHAMADO: Word;
begin
  Result := FieldByName(CNT_IDTIPOCHAMADO).AsInteger;
end;


function TCustomTIPO_CHAMADO.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomTIPO_CHAMADO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomTIPO_CHAMADO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomTIPO_CHAMADO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomTIPO_CHAMADO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomTIPO_CHAMADO.SetIDTIPOCHAMADO(const Value: Word);
begin
 FieldByName(CNT_IDTIPOCHAMADO).AsInteger := Value;
end;


procedure TCustomTIPO_CHAMADO.SetDESCRICAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO).AsString := Value;
end;


procedure TCustomTIPO_CHAMADO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomTIPO_CHAMADO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomTIPO_CHAMADO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomTIPO_CHAMADO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomTIPO_CHAMADO.FindByPK_IDTIPOCHAMADO(pIDTIPOCHAMADO : Word) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDTIPOCHAMADO';
  fvalue := pIDTIPOCHAMADO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesTIPO_CHAMADO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesTIPO_CHAMADO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesTIPO_CHAMADO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from TIPO_CHAMADO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesTIPO_CHAMADO.GetIDTIPOCHAMADO: Word;
begin
  Result := FieldByName(CNT_IDTIPOCHAMADO).AsInteger;
end;


function TCustomSimplesTIPO_CHAMADO.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomSimplesTIPO_CHAMADO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesTIPO_CHAMADO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesTIPO_CHAMADO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesTIPO_CHAMADO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesTIPO_CHAMADO.SetIDTIPOCHAMADO(const Value: Word);
begin
  StrCondicao.Add(CNT_IDTIPOCHAMADO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesTIPO_CHAMADO.SetDESCRICAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_CHAMADO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_CHAMADO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_CHAMADO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesTIPO_CHAMADO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesTIPO_CHAMADO.plMontaCondicao;
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

procedure TCustomSimplesTIPO_CHAMADO.plOrdenarPor(leIndice : TTIPO_CHAMADOIndex );
begin
  Case leIndice Of
    tipo_chamadoPK_IDTIPOCHAMADO : lsOrdenar := ' Order By IDTIPOCHAMADO';
  End;
end;

procedure TCustomSimplesTIPO_CHAMADO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesTIPO_CHAMADO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesTIPO_CHAMADO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

