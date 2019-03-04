unit ucLayMETAS;

interface

uses classes, adodb, variants;

type

 TMETASIndex = (metasInd_IdCobrador_Ano_Mes, metaspk_IdMeta);

 TCustomMETAS = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDMETA: Integer;
  function GetIDCOBRADOR: Integer;
  function GetANO: Integer;
  function GetMES: Word;
  function GetMETA: Double;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDMETA(const Value: Integer);
  procedure SetIDCOBRADOR(const Value: Integer);
  procedure SetANO(const Value: Integer);
  procedure SetMES(const Value: Word);
  procedure SetMETA(const Value: Double);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDMETA: Integer read GetIDMETA write SetIDMETA;
  property IDCOBRADOR: Integer read GetIDCOBRADOR write SetIDCOBRADOR;
  property ANO: Integer read GetANO write SetANO;
  property MES: Word read GetMES write SetMES;
  property META: Double read GetMETA write SetMETA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_IdCobrador_Ano_Mes(pIDCOBRADOR : Integer; pANO : Integer; pMES : Word) : Boolean;
  function FindBypk_IdMeta(pIDMETA : Integer) : Boolean;
 end;

 TMETAS = class(TCustomMETAS)
 public
  property IDMETA;
  property IDCOBRADOR;
  property ANO;
  property MES;
  property META;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesMETAS = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDMETA: Integer;
  function GetIDCOBRADOR: Integer;
  function GetANO: Integer;
  function GetMES: Word;
  function GetMETA: Double;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDMETA(const Value: Integer);
  procedure SetIDCOBRADOR(const Value: Integer);
  procedure SetANO(const Value: Integer);
  procedure SetMES(const Value: Word);
  procedure SetMETA(const Value: Double);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDMETA: Integer read GetIDMETA write SetIDMETA;
  property IDCOBRADOR: Integer read GetIDCOBRADOR write SetIDCOBRADOR;
  property ANO: Integer read GetANO write SetANO;
  property MES: Word read GetMES write SetMES;
  property META: Double read GetMETA write SetMETA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TMETASIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesMETAS = class(TCustomSimplesMETAS)
 public
  property IDMETA;
  property IDCOBRADOR;
  property ANO;
  property MES;
  property META;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDMETA = 'IDMETA';
  CNT_IDCOBRADOR = 'IDCOBRADOR';
  CNT_ANO = 'ANO';
  CNT_MES = 'MES';
  CNT_META = 'META';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomMETAS.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'METAS';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomMETAS.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomMETAS.DoBeforePost;
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

function TCustomMETAS.GetIDMETA: Integer;
begin
  Result := FieldByName(CNT_IDMETA).AsInteger;
end;


function TCustomMETAS.GetIDCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_IDCOBRADOR).AsInteger;
end;


function TCustomMETAS.GetANO: Integer;
begin
  Result := FieldByName(CNT_ANO).AsInteger;
end;


function TCustomMETAS.GetMES: Word;
begin
  Result := FieldByName(CNT_MES).AsInteger;
end;


function TCustomMETAS.GetMETA: Double;
begin
  Result := FieldByName(CNT_META).AsFloat;
end;


function TCustomMETAS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomMETAS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomMETAS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomMETAS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomMETAS.SetIDMETA(const Value: Integer);
begin
 FieldByName(CNT_IDMETA).AsInteger := Value;
end;


procedure TCustomMETAS.SetIDCOBRADOR(const Value: Integer);
begin
 FieldByName(CNT_IDCOBRADOR).AsInteger := Value;
end;


procedure TCustomMETAS.SetANO(const Value: Integer);
begin
 FieldByName(CNT_ANO).AsInteger := Value;
end;


procedure TCustomMETAS.SetMES(const Value: Word);
begin
 FieldByName(CNT_MES).AsInteger := Value;
end;


procedure TCustomMETAS.SetMETA(const Value: Double);
begin
 FieldByName(CNT_META).AsFloat := Value;
end;


procedure TCustomMETAS.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomMETAS.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomMETAS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomMETAS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomMETAS.FindByInd_IdCobrador_Ano_Mes(pIDCOBRADOR : Integer; pANO : Integer; pMES : Word) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDCOBRADOR;ANO;MES';
  fvalue := VarArrayOf([pIDCOBRADOR,pANO,pMES]);
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomMETAS.FindBypk_IdMeta(pIDMETA : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDMETA';
  fvalue := pIDMETA;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesMETAS.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesMETAS.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesMETAS.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from METAS');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesMETAS.GetIDMETA: Integer;
begin
  Result := FieldByName(CNT_IDMETA).AsInteger;
end;


function TCustomSimplesMETAS.GetIDCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_IDCOBRADOR).AsInteger;
end;


function TCustomSimplesMETAS.GetANO: Integer;
begin
  Result := FieldByName(CNT_ANO).AsInteger;
end;


function TCustomSimplesMETAS.GetMES: Word;
begin
  Result := FieldByName(CNT_MES).AsInteger;
end;


function TCustomSimplesMETAS.GetMETA: Double;
begin
  Result := FieldByName(CNT_META).AsFloat;
end;


function TCustomSimplesMETAS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesMETAS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesMETAS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesMETAS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesMETAS.SetIDMETA(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDMETA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetIDCOBRADOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCOBRADOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetANO(const Value: Integer);
begin
  StrCondicao.Add(CNT_ANO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetMES(const Value: Word);
begin
  StrCondicao.Add(CNT_MES+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetMETA(const Value: Double);
begin
  StrCondicao.Add(CNT_META+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMETAS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesMETAS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesMETAS.plMontaCondicao;
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

procedure TCustomSimplesMETAS.plOrdenarPor(leIndice : TMETASIndex );
begin
  Case leIndice Of
    metasInd_IdCobrador_Ano_Mes : lsOrdenar := ' Order By IDCOBRADOR,ANO,MES';
    metaspk_IdMeta : lsOrdenar := ' Order By IDMETA';
  End;
end;

procedure TCustomSimplesMETAS.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesMETAS.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesMETAS.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

