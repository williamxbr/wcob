unit ucLayMOTIVOS_ACIONAMENTOS;

interface

uses classes, adodb, variants;

type

 TMOTIVOS_ACIONAMENTOSIndex = (motivos_acionamentospk_Codigo);

 TCustomMOTIVOS_ACIONAMENTOS = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetCODIGO: Integer;
  function GetDESCRICAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetCODIGO(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property CODIGO: Integer read GetCODIGO write SetCODIGO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Codigo(pCODIGO : Integer) : Boolean;
 end;

 TMOTIVOS_ACIONAMENTOS = class(TCustomMOTIVOS_ACIONAMENTOS)
 public
  property CODIGO;
  property DESCRICAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesMOTIVOS_ACIONAMENTOS = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetCODIGO: Integer;
  function GetDESCRICAO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetCODIGO(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property CODIGO: Integer read GetCODIGO write SetCODIGO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TMOTIVOS_ACIONAMENTOSIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesMOTIVOS_ACIONAMENTOS = class(TCustomSimplesMOTIVOS_ACIONAMENTOS)
 public
  property CODIGO;
  property DESCRICAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_CODIGO = 'CODIGO';
  CNT_DESCRICAO = 'DESCRICAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomMOTIVOS_ACIONAMENTOS.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'MOTIVOS_ACIONAMENTOS';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomMOTIVOS_ACIONAMENTOS.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomMOTIVOS_ACIONAMENTOS.DoBeforePost;
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

function TCustomMOTIVOS_ACIONAMENTOS.GetCODIGO: Integer;
begin
  Result := FieldByName(CNT_CODIGO).AsInteger;
end;


function TCustomMOTIVOS_ACIONAMENTOS.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomMOTIVOS_ACIONAMENTOS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomMOTIVOS_ACIONAMENTOS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomMOTIVOS_ACIONAMENTOS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomMOTIVOS_ACIONAMENTOS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomMOTIVOS_ACIONAMENTOS.SetCODIGO(const Value: Integer);
begin
 FieldByName(CNT_CODIGO).AsInteger := Value;
end;


procedure TCustomMOTIVOS_ACIONAMENTOS.SetDESCRICAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO).AsString := Value;
end;


procedure TCustomMOTIVOS_ACIONAMENTOS.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomMOTIVOS_ACIONAMENTOS.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomMOTIVOS_ACIONAMENTOS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomMOTIVOS_ACIONAMENTOS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomMOTIVOS_ACIONAMENTOS.FindBypk_Codigo(pCODIGO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'CODIGO';
  fvalue := pCODIGO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesMOTIVOS_ACIONAMENTOS.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesMOTIVOS_ACIONAMENTOS.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from MOTIVOS_ACIONAMENTOS');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesMOTIVOS_ACIONAMENTOS.GetCODIGO: Integer;
begin
  Result := FieldByName(CNT_CODIGO).AsInteger;
end;


function TCustomSimplesMOTIVOS_ACIONAMENTOS.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomSimplesMOTIVOS_ACIONAMENTOS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesMOTIVOS_ACIONAMENTOS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesMOTIVOS_ACIONAMENTOS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesMOTIVOS_ACIONAMENTOS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.SetCODIGO(const Value: Integer);
begin
  StrCondicao.Add(CNT_CODIGO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.SetDESCRICAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.plMontaCondicao;
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

procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.plOrdenarPor(leIndice : TMOTIVOS_ACIONAMENTOSIndex );
begin
  Case leIndice Of
    motivos_acionamentospk_Codigo : lsOrdenar := ' Order By CODIGO';
  End;
end;

procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesMOTIVOS_ACIONAMENTOS.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

