unit ucLayALINES;

interface

uses classes, adodb, variants;

type

 TALINESIndex = (alinespk_Motivo);

 TCustomALINES = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetMOTIVO: Word;
  function GetTIPO_ALINIAS: String;
  function GetDESCRICAO_ALINIAS: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetMOTIVO(const Value: Word);
  procedure SetTIPO_ALINIAS(const Value: String);
  procedure SetDESCRICAO_ALINIAS(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property MOTIVO: Word read GetMOTIVO write SetMOTIVO;
  property TIPO_ALINIAS: String read GetTIPO_ALINIAS write SetTIPO_ALINIAS;
  property DESCRICAO_ALINIAS: String read GetDESCRICAO_ALINIAS write SetDESCRICAO_ALINIAS;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_Motivo(pMOTIVO : Word) : Boolean;
 end;

 TALINES = class(TCustomALINES)
 public
  property MOTIVO;
  property TIPO_ALINIAS;
  property DESCRICAO_ALINIAS;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesALINES = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetMOTIVO: Word;
  function GetTIPO_ALINIAS: String;
  function GetDESCRICAO_ALINIAS: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetMOTIVO(const Value: Word);
  procedure SetTIPO_ALINIAS(const Value: String);
  procedure SetDESCRICAO_ALINIAS(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property MOTIVO: Word read GetMOTIVO write SetMOTIVO;
  property TIPO_ALINIAS: String read GetTIPO_ALINIAS write SetTIPO_ALINIAS;
  property DESCRICAO_ALINIAS: String read GetDESCRICAO_ALINIAS write SetDESCRICAO_ALINIAS;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TALINESIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesALINES = class(TCustomSimplesALINES)
 public
  property MOTIVO;
  property TIPO_ALINIAS;
  property DESCRICAO_ALINIAS;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_MOTIVO = 'MOTIVO';
  CNT_TIPO_ALINIAS = 'TIPO_ALINIAS';
  CNT_DESCRICAO_ALINIAS = 'DESCRICAO_ALINIAS';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomALINES.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'ALINES';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomALINES.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomALINES.DoBeforePost;
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

function TCustomALINES.GetMOTIVO: Word;
begin
  Result := FieldByName(CNT_MOTIVO).AsInteger;
end;


function TCustomALINES.GetTIPO_ALINIAS: String;
begin
  Result := FieldByName(CNT_TIPO_ALINIAS).AsString;
end;


function TCustomALINES.GetDESCRICAO_ALINIAS: String;
begin
  Result := FieldByName(CNT_DESCRICAO_ALINIAS).AsString;
end;


function TCustomALINES.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomALINES.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomALINES.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomALINES.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomALINES.SetMOTIVO(const Value: Word);
begin
 FieldByName(CNT_MOTIVO).AsInteger := Value;
end;


procedure TCustomALINES.SetTIPO_ALINIAS(const Value: String);
begin
 FieldByName(CNT_TIPO_ALINIAS).AsString := Value;
end;


procedure TCustomALINES.SetDESCRICAO_ALINIAS(const Value: String);
begin
 FieldByName(CNT_DESCRICAO_ALINIAS).AsString := Value;
end;


procedure TCustomALINES.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomALINES.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomALINES.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomALINES.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomALINES.FindBypk_Motivo(pMOTIVO : Word) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'MOTIVO';
  fvalue := pMOTIVO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesALINES.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesALINES.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesALINES.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from ALINES');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesALINES.GetMOTIVO: Word;
begin
  Result := FieldByName(CNT_MOTIVO).AsInteger;
end;


function TCustomSimplesALINES.GetTIPO_ALINIAS: String;
begin
  Result := FieldByName(CNT_TIPO_ALINIAS).AsString;
end;


function TCustomSimplesALINES.GetDESCRICAO_ALINIAS: String;
begin
  Result := FieldByName(CNT_DESCRICAO_ALINIAS).AsString;
end;


function TCustomSimplesALINES.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesALINES.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesALINES.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesALINES.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesALINES.SetMOTIVO(const Value: Word);
begin
  StrCondicao.Add(CNT_MOTIVO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesALINES.SetTIPO_ALINIAS(const Value: String);
begin
  StrCondicao.Add(CNT_TIPO_ALINIAS+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesALINES.SetDESCRICAO_ALINIAS(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO_ALINIAS+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesALINES.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesALINES.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesALINES.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesALINES.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesALINES.plMontaCondicao;
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

procedure TCustomSimplesALINES.plOrdenarPor(leIndice : TALINESIndex );
begin
  Case leIndice Of
    alinespk_Motivo : lsOrdenar := ' Order By MOTIVO';
  End;
end;

procedure TCustomSimplesALINES.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesALINES.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesALINES.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

