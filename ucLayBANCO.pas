unit ucLayBANCO;

interface

uses classes, adodb, variants;

type

 TBANCOIndex = (bancopk_Numero_Banco);

 TCustomBANCO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetNUMERO_BANCO: Integer;
  function GetNOME_BANCO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetNUMERO_BANCO(const Value: Integer);
  procedure SetNOME_BANCO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property NUMERO_BANCO: Integer read GetNUMERO_BANCO write SetNUMERO_BANCO;
  property NOME_BANCO: String read GetNOME_BANCO write SetNOME_BANCO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Numero_Banco(pNUMERO_BANCO : Integer) : Boolean;
 end;

 TBANCO = class(TCustomBANCO)
 public
  property NUMERO_BANCO;
  property NOME_BANCO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesBANCO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetNUMERO_BANCO: Integer;
  function GetNOME_BANCO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetNUMERO_BANCO(const Value: Integer);
  procedure SetNOME_BANCO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property NUMERO_BANCO: Integer read GetNUMERO_BANCO write SetNUMERO_BANCO;
  property NOME_BANCO: String read GetNOME_BANCO write SetNOME_BANCO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TBANCOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesBANCO = class(TCustomSimplesBANCO)
 public
  property NUMERO_BANCO;
  property NOME_BANCO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_NUMERO_BANCO = 'NUMERO_BANCO';
  CNT_NOME_BANCO = 'NOME_BANCO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomBANCO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'BANCO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomBANCO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomBANCO.DoBeforePost;
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

function TCustomBANCO.GetNUMERO_BANCO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_BANCO).AsInteger;
end;


function TCustomBANCO.GetNOME_BANCO: String;
begin
  Result := FieldByName(CNT_NOME_BANCO).AsString;
end;


function TCustomBANCO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomBANCO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomBANCO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomBANCO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomBANCO.SetNUMERO_BANCO(const Value: Integer);
begin
 FieldByName(CNT_NUMERO_BANCO).AsInteger := Value;
end;


procedure TCustomBANCO.SetNOME_BANCO(const Value: String);
begin
 FieldByName(CNT_NOME_BANCO).AsString := Value;
end;


procedure TCustomBANCO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomBANCO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomBANCO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomBANCO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomBANCO.FindBypk_Numero_Banco(pNUMERO_BANCO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'NUMERO_BANCO';
  fvalue := pNUMERO_BANCO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesBANCO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesBANCO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesBANCO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from BANCO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesBANCO.GetNUMERO_BANCO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_BANCO).AsInteger;
end;


function TCustomSimplesBANCO.GetNOME_BANCO: String;
begin
  Result := FieldByName(CNT_NOME_BANCO).AsString;
end;


function TCustomSimplesBANCO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesBANCO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesBANCO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesBANCO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesBANCO.SetNUMERO_BANCO(const Value: Integer);
begin
  StrCondicao.Add(CNT_NUMERO_BANCO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesBANCO.SetNOME_BANCO(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_BANCO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBANCO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBANCO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesBANCO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesBANCO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesBANCO.plMontaCondicao;
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

procedure TCustomSimplesBANCO.plOrdenarPor(leIndice : TBANCOIndex );
begin
  Case leIndice Of
    bancopk_Numero_Banco : lsOrdenar := ' Order By NUMERO_BANCO';
  End;
end;

procedure TCustomSimplesBANCO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesBANCO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesBANCO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

