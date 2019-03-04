unit ucLayDEPRE;

interface

uses classes, adodb, variants;

type

 TDEPREIndex = (depreInd_Ano_Mes, deprepk_IdDepre);

 TCustomDEPRE = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDDEPRE: Integer;
  function GetANO: Integer;
  function GetMES: Word;
  function GetINDICE: Double;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDDEPRE(const Value: Integer);
  procedure SetANO(const Value: Integer);
  procedure SetMES(const Value: Word);
  procedure SetINDICE(const Value: Double);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDDEPRE: Integer read GetIDDEPRE write SetIDDEPRE;
  property ANO: Integer read GetANO write SetANO;
  property MES: Word read GetMES write SetMES;
  property INDICE: Double read GetINDICE write SetINDICE;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Ano_Mes(pANO : Integer; pMES : Word) : Boolean;
  function FindBypk_IdDepre(pIDDEPRE : Integer) : Boolean;
 end;

 TDEPRE = class(TCustomDEPRE)
 public
  property IDDEPRE;
  property ANO;
  property MES;
  property INDICE;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesDEPRE = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDDEPRE: Integer;
  function GetANO: Integer;
  function GetMES: Word;
  function GetINDICE: Double;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDDEPRE(const Value: Integer);
  procedure SetANO(const Value: Integer);
  procedure SetMES(const Value: Word);
  procedure SetINDICE(const Value: Double);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDDEPRE: Integer read GetIDDEPRE write SetIDDEPRE;
  property ANO: Integer read GetANO write SetANO;
  property MES: Word read GetMES write SetMES;
  property INDICE: Double read GetINDICE write SetINDICE;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TDEPREIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesDEPRE = class(TCustomSimplesDEPRE)
 public
  property IDDEPRE;
  property ANO;
  property MES;
  property INDICE;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDDEPRE = 'IDDEPRE';
  CNT_ANO = 'ANO';
  CNT_MES = 'MES';
  CNT_INDICE = 'INDICE';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomDEPRE.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'DEPRE';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomDEPRE.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomDEPRE.DoBeforePost;
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

function TCustomDEPRE.GetIDDEPRE: Integer;
begin
  Result := FieldByName(CNT_IDDEPRE).AsInteger;
end;


function TCustomDEPRE.GetANO: Integer;
begin
  Result := FieldByName(CNT_ANO).AsInteger;
end;


function TCustomDEPRE.GetMES: Word;
begin
  Result := FieldByName(CNT_MES).AsInteger;
end;


function TCustomDEPRE.GetINDICE: Double;
begin
  Result := FieldByName(CNT_INDICE).AsFloat;
end;


function TCustomDEPRE.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomDEPRE.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomDEPRE.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomDEPRE.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomDEPRE.SetIDDEPRE(const Value: Integer);
begin
 FieldByName(CNT_IDDEPRE).AsInteger := Value;
end;


procedure TCustomDEPRE.SetANO(const Value: Integer);
begin
 FieldByName(CNT_ANO).AsInteger := Value;
end;


procedure TCustomDEPRE.SetMES(const Value: Word);
begin
 FieldByName(CNT_MES).AsInteger := Value;
end;


procedure TCustomDEPRE.SetINDICE(const Value: Double);
begin
 FieldByName(CNT_INDICE).AsFloat := Value;
end;


procedure TCustomDEPRE.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomDEPRE.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomDEPRE.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomDEPRE.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomDEPRE.FindByInd_Ano_Mes(pANO : Integer; pMES : Word) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'ANO;MES';
  fvalue := VarArrayOf([pANO,pMES]);
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomDEPRE.FindBypk_IdDepre(pIDDEPRE : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDDEPRE';
  fvalue := pIDDEPRE;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesDEPRE.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesDEPRE.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesDEPRE.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from DEPRE');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesDEPRE.GetIDDEPRE: Integer;
begin
  Result := FieldByName(CNT_IDDEPRE).AsInteger;
end;


function TCustomSimplesDEPRE.GetANO: Integer;
begin
  Result := FieldByName(CNT_ANO).AsInteger;
end;


function TCustomSimplesDEPRE.GetMES: Word;
begin
  Result := FieldByName(CNT_MES).AsInteger;
end;


function TCustomSimplesDEPRE.GetINDICE: Double;
begin
  Result := FieldByName(CNT_INDICE).AsFloat;
end;


function TCustomSimplesDEPRE.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesDEPRE.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesDEPRE.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesDEPRE.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesDEPRE.SetIDDEPRE(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDDEPRE+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesDEPRE.SetANO(const Value: Integer);
begin
  StrCondicao.Add(CNT_ANO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesDEPRE.SetMES(const Value: Word);
begin
  StrCondicao.Add(CNT_MES+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesDEPRE.SetINDICE(const Value: Double);
begin
  StrCondicao.Add(CNT_INDICE+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesDEPRE.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEPRE.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesDEPRE.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesDEPRE.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesDEPRE.plMontaCondicao;
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

procedure TCustomSimplesDEPRE.plOrdenarPor(leIndice : TDEPREIndex );
begin
  Case leIndice Of
    depreInd_Ano_Mes : lsOrdenar := ' Order By ANO,MES';
    deprepk_IdDepre : lsOrdenar := ' Order By IDDEPRE';
  End;
end;

procedure TCustomSimplesDEPRE.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesDEPRE.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesDEPRE.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

