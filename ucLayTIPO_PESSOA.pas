unit ucLayTIPO_PESSOA;

interface

uses classes, adodb, variants;

type

 TTIPO_PESSOAIndex = (tipo_pessoapk_TipoPessoa);

 TCustomTIPO_PESSOA = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetTIPO_PESSOA: Word;
  function GetDESCRICAO_TIPO_PESSOA: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetTIPO_PESSOA(const Value: Word);
  procedure SetDESCRICAO_TIPO_PESSOA(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property TIPO_PESSOA: Word read GetTIPO_PESSOA write SetTIPO_PESSOA;
  property DESCRICAO_TIPO_PESSOA: String read GetDESCRICAO_TIPO_PESSOA write SetDESCRICAO_TIPO_PESSOA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_TipoPessoa(pTIPO_PESSOA : Word) : Boolean;
 end;

 TTIPO_PESSOA = class(TCustomTIPO_PESSOA)
 public
  property TIPO_PESSOA;
  property DESCRICAO_TIPO_PESSOA;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesTIPO_PESSOA = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetTIPO_PESSOA: Word;
  function GetDESCRICAO_TIPO_PESSOA: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetTIPO_PESSOA(const Value: Word);
  procedure SetDESCRICAO_TIPO_PESSOA(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property TIPO_PESSOA: Word read GetTIPO_PESSOA write SetTIPO_PESSOA;
  property DESCRICAO_TIPO_PESSOA: String read GetDESCRICAO_TIPO_PESSOA write SetDESCRICAO_TIPO_PESSOA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TTIPO_PESSOAIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesTIPO_PESSOA = class(TCustomSimplesTIPO_PESSOA)
 public
  property TIPO_PESSOA;
  property DESCRICAO_TIPO_PESSOA;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_TIPO_PESSOA = 'TIPO_PESSOA';
  CNT_DESCRICAO_TIPO_PESSOA = 'DESCRICAO_TIPO_PESSOA';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomTIPO_PESSOA.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'TIPO_PESSOA';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomTIPO_PESSOA.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomTIPO_PESSOA.DoBeforePost;
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

function TCustomTIPO_PESSOA.GetTIPO_PESSOA: Word;
begin
  Result := FieldByName(CNT_TIPO_PESSOA).AsInteger;
end;


function TCustomTIPO_PESSOA.GetDESCRICAO_TIPO_PESSOA: String;
begin
  Result := FieldByName(CNT_DESCRICAO_TIPO_PESSOA).AsString;
end;


function TCustomTIPO_PESSOA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomTIPO_PESSOA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomTIPO_PESSOA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomTIPO_PESSOA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomTIPO_PESSOA.SetTIPO_PESSOA(const Value: Word);
begin
 FieldByName(CNT_TIPO_PESSOA).AsInteger := Value;
end;


procedure TCustomTIPO_PESSOA.SetDESCRICAO_TIPO_PESSOA(const Value: String);
begin
 FieldByName(CNT_DESCRICAO_TIPO_PESSOA).AsString := Value;
end;


procedure TCustomTIPO_PESSOA.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomTIPO_PESSOA.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomTIPO_PESSOA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomTIPO_PESSOA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomTIPO_PESSOA.FindBypk_TipoPessoa(pTIPO_PESSOA : Word) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'TIPO_PESSOA';
  fvalue := pTIPO_PESSOA;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesTIPO_PESSOA.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesTIPO_PESSOA.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesTIPO_PESSOA.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from TIPO_PESSOA');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesTIPO_PESSOA.GetTIPO_PESSOA: Word;
begin
  Result := FieldByName(CNT_TIPO_PESSOA).AsInteger;
end;


function TCustomSimplesTIPO_PESSOA.GetDESCRICAO_TIPO_PESSOA: String;
begin
  Result := FieldByName(CNT_DESCRICAO_TIPO_PESSOA).AsString;
end;


function TCustomSimplesTIPO_PESSOA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesTIPO_PESSOA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesTIPO_PESSOA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesTIPO_PESSOA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesTIPO_PESSOA.SetTIPO_PESSOA(const Value: Word);
begin
  StrCondicao.Add(CNT_TIPO_PESSOA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesTIPO_PESSOA.SetDESCRICAO_TIPO_PESSOA(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO_TIPO_PESSOA+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_PESSOA.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_PESSOA.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_PESSOA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesTIPO_PESSOA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesTIPO_PESSOA.plMontaCondicao;
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

procedure TCustomSimplesTIPO_PESSOA.plOrdenarPor(leIndice : TTIPO_PESSOAIndex );
begin
  Case leIndice Of
    tipo_pessoapk_TipoPessoa : lsOrdenar := ' Order By TIPO_PESSOA';
  End;
end;

procedure TCustomSimplesTIPO_PESSOA.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesTIPO_PESSOA.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesTIPO_PESSOA.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

