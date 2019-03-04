unit ucLayAVISO;

interface

uses classes, adodb, variants;

type

 TAVISOIndex = (avisopk_IdAviso, avisoInd_IdCredor);

 TCustomAVISO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDAVISO: Integer;
  function GetIDCREDOR: Integer;
  function GetDESCRICAO: String;
  function GetDATA: TDateTime;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDAVISO(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetDATA(const Value: TDateTime);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDAVISO: Integer read GetIDAVISO write SetIDAVISO;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property DATA: TDateTime read GetDATA write SetDATA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdAviso(pIDAVISO : Integer) : Boolean;
 end;

 TAVISO = class(TCustomAVISO)
 public
  property IDAVISO;
  property IDCREDOR;
  property DESCRICAO;
  property DATA;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesAVISO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDAVISO: Integer;
  function GetIDCREDOR: Integer;
  function GetDESCRICAO: String;
  function GetDATA: TDateTime;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDAVISO(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetDATA(const Value: TDateTime);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDAVISO: Integer read GetIDAVISO write SetIDAVISO;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property DATA: TDateTime read GetDATA write SetDATA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TAVISOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesAVISO = class(TCustomSimplesAVISO)
 public
  property IDAVISO;
  property IDCREDOR;
  property DESCRICAO;
  property DATA;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDAVISO = 'IDAVISO';
  CNT_IDCREDOR = 'IDCREDOR';
  CNT_DESCRICAO = 'DESCRICAO';
  CNT_DATA = 'DATA';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomAVISO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'AVISO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomAVISO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomAVISO.DoBeforePost;
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

function TCustomAVISO.GetIDAVISO: Integer;
begin
  Result := FieldByName(CNT_IDAVISO).AsInteger;
end;


function TCustomAVISO.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomAVISO.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomAVISO.GetDATA: TDateTime;
begin
  Result := FieldByName(CNT_DATA).AsDateTime;
end;


function TCustomAVISO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomAVISO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomAVISO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomAVISO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomAVISO.SetIDAVISO(const Value: Integer);
begin
 FieldByName(CNT_IDAVISO).AsInteger := Value;
end;


procedure TCustomAVISO.SetIDCREDOR(const Value: Integer);
begin
 FieldByName(CNT_IDCREDOR).AsInteger := Value;
end;


procedure TCustomAVISO.SetDESCRICAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO).AsString := Value;
end;


procedure TCustomAVISO.SetDATA(const Value: TDateTime);
begin
 FieldByName(CNT_DATA).AsDateTime := Value;
end;


procedure TCustomAVISO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomAVISO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomAVISO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomAVISO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomAVISO.FindBypk_IdAviso(pIDAVISO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDAVISO';
  fvalue := pIDAVISO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesAVISO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesAVISO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesAVISO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from AVISO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesAVISO.GetIDAVISO: Integer;
begin
  Result := FieldByName(CNT_IDAVISO).AsInteger;
end;


function TCustomSimplesAVISO.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomSimplesAVISO.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomSimplesAVISO.GetDATA: TDateTime;
begin
  Result := FieldByName(CNT_DATA).AsDateTime;
end;


function TCustomSimplesAVISO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesAVISO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesAVISO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesAVISO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesAVISO.SetIDAVISO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDAVISO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesAVISO.SetIDCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesAVISO.SetDESCRICAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesAVISO.SetDATA(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesAVISO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesAVISO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesAVISO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesAVISO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesAVISO.plMontaCondicao;
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

procedure TCustomSimplesAVISO.plOrdenarPor(leIndice : TAVISOIndex );
begin
  Case leIndice Of
    avisopk_IdAviso : lsOrdenar := ' Order By IDAVISO';
    avisoInd_IdCredor : lsOrdenar := ' Order By IDCREDOR';
  End;
end;

procedure TCustomSimplesAVISO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesAVISO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesAVISO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

