unit ucLayTIPO_DOCUMENTO;

interface

uses classes, adodb, variants;

type

 TTIPO_DOCUMENTOIndex = (tipo_documentopk_TipoDocumento);

 TCustomTIPO_DOCUMENTO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetTIPO_DOCUMENTO: Integer;
  function GetSIGLA_DOCUMENTO: String;
  function GetDESCRICAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetTIPO_DOCUMENTO(const Value: Integer);
  procedure SetSIGLA_DOCUMENTO(const Value: String);
  procedure SetDESCRICAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property TIPO_DOCUMENTO: Integer read GetTIPO_DOCUMENTO write SetTIPO_DOCUMENTO;
  property SIGLA_DOCUMENTO: String read GetSIGLA_DOCUMENTO write SetSIGLA_DOCUMENTO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_TipoDocumento(pTIPO_DOCUMENTO : Integer) : Boolean;
 end;

 TTIPO_DOCUMENTO = class(TCustomTIPO_DOCUMENTO)
 public
  property TIPO_DOCUMENTO;
  property SIGLA_DOCUMENTO;
  property DESCRICAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesTIPO_DOCUMENTO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetTIPO_DOCUMENTO: Integer;
  function GetSIGLA_DOCUMENTO: String;
  function GetDESCRICAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetTIPO_DOCUMENTO(const Value: Integer);
  procedure SetSIGLA_DOCUMENTO(const Value: String);
  procedure SetDESCRICAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property TIPO_DOCUMENTO: Integer read GetTIPO_DOCUMENTO write SetTIPO_DOCUMENTO;
  property SIGLA_DOCUMENTO: String read GetSIGLA_DOCUMENTO write SetSIGLA_DOCUMENTO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TTIPO_DOCUMENTOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesTIPO_DOCUMENTO = class(TCustomSimplesTIPO_DOCUMENTO)
 public
  property TIPO_DOCUMENTO;
  property SIGLA_DOCUMENTO;
  property DESCRICAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_TIPO_DOCUMENTO = 'TIPO_DOCUMENTO';
  CNT_SIGLA_DOCUMENTO = 'SIGLA_DOCUMENTO';
  CNT_DESCRICAO = 'DESCRICAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomTIPO_DOCUMENTO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'TIPO_DOCUMENTO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomTIPO_DOCUMENTO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomTIPO_DOCUMENTO.DoBeforePost;
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

function TCustomTIPO_DOCUMENTO.GetTIPO_DOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_TIPO_DOCUMENTO).AsInteger;
end;


function TCustomTIPO_DOCUMENTO.GetSIGLA_DOCUMENTO: String;
begin
  Result := FieldByName(CNT_SIGLA_DOCUMENTO).AsString;
end;


function TCustomTIPO_DOCUMENTO.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomTIPO_DOCUMENTO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomTIPO_DOCUMENTO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomTIPO_DOCUMENTO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomTIPO_DOCUMENTO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomTIPO_DOCUMENTO.SetTIPO_DOCUMENTO(const Value: Integer);
begin
 FieldByName(CNT_TIPO_DOCUMENTO).AsInteger := Value;
end;


procedure TCustomTIPO_DOCUMENTO.SetSIGLA_DOCUMENTO(const Value: String);
begin
 FieldByName(CNT_SIGLA_DOCUMENTO).AsString := Value;
end;


procedure TCustomTIPO_DOCUMENTO.SetDESCRICAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO).AsString := Value;
end;


procedure TCustomTIPO_DOCUMENTO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomTIPO_DOCUMENTO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomTIPO_DOCUMENTO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomTIPO_DOCUMENTO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomTIPO_DOCUMENTO.FindBypk_TipoDocumento(pTIPO_DOCUMENTO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'TIPO_DOCUMENTO';
  fvalue := pTIPO_DOCUMENTO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesTIPO_DOCUMENTO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesTIPO_DOCUMENTO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesTIPO_DOCUMENTO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from TIPO_DOCUMENTO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetTIPO_DOCUMENTO: Integer;
begin
  Result := FieldByName(CNT_TIPO_DOCUMENTO).AsInteger;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetSIGLA_DOCUMENTO: String;
begin
  Result := FieldByName(CNT_SIGLA_DOCUMENTO).AsString;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesTIPO_DOCUMENTO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetTIPO_DOCUMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_TIPO_DOCUMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetSIGLA_DOCUMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_SIGLA_DOCUMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetDESCRICAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesTIPO_DOCUMENTO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesTIPO_DOCUMENTO.plMontaCondicao;
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

procedure TCustomSimplesTIPO_DOCUMENTO.plOrdenarPor(leIndice : TTIPO_DOCUMENTOIndex );
begin
  Case leIndice Of
    tipo_documentopk_TipoDocumento : lsOrdenar := ' Order By TIPO_DOCUMENTO';
  End;
end;

procedure TCustomSimplesTIPO_DOCUMENTO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesTIPO_DOCUMENTO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesTIPO_DOCUMENTO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

