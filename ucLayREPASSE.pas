unit ucLayREPASSE;

interface

uses classes, adodb, variants;

type

 TREPASSEIndex = (repassepk_IdRepasse, repasseId_IdCredor_DataRepasse, repasseIND_IDCREDOR);

 TCustomREPASSE = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDREPASSE: Integer;
  function GetIDCREDOR: Integer;
  function GetDESCRICAO: String;
  function GetDATA_REPASSE: TDateTime;
  function GetVALOR_REPASSE: Double;
  function GetSITUACAO: Word;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDREPASSE(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetDATA_REPASSE(const Value: TDateTime);
  procedure SetVALOR_REPASSE(const Value: Double);
  procedure SetSITUACAO(const Value: Word);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDREPASSE: Integer read GetIDREPASSE write SetIDREPASSE;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property DATA_REPASSE: TDateTime read GetDATA_REPASSE write SetDATA_REPASSE;
  property VALOR_REPASSE: Double read GetVALOR_REPASSE write SetVALOR_REPASSE;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdRepasse(pIDREPASSE : Integer) : Boolean;
 end;

 TREPASSE = class(TCustomREPASSE)
 public
  property IDREPASSE;
  property IDCREDOR;
  property DESCRICAO;
  property DATA_REPASSE;
  property VALOR_REPASSE;
  property SITUACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesREPASSE = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDREPASSE: Integer;
  function GetIDCREDOR: Integer;
  function GetDESCRICAO: String;
  function GetDATA_REPASSE: TDateTime;
  function GetVALOR_REPASSE: Double;
  function GetSITUACAO: Word;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDREPASSE(const Value: Integer);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetDATA_REPASSE(const Value: TDateTime);
  procedure SetVALOR_REPASSE(const Value: Double);
  procedure SetSITUACAO(const Value: Word);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDREPASSE: Integer read GetIDREPASSE write SetIDREPASSE;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property DATA_REPASSE: TDateTime read GetDATA_REPASSE write SetDATA_REPASSE;
  property VALOR_REPASSE: Double read GetVALOR_REPASSE write SetVALOR_REPASSE;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TREPASSEIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesREPASSE = class(TCustomSimplesREPASSE)
 public
  property IDREPASSE;
  property IDCREDOR;
  property DESCRICAO;
  property DATA_REPASSE;
  property VALOR_REPASSE;
  property SITUACAO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDREPASSE = 'IDREPASSE';
  CNT_IDCREDOR = 'IDCREDOR';
  CNT_DESCRICAO = 'DESCRICAO';
  CNT_DATA_REPASSE = 'DATA_REPASSE';
  CNT_VALOR_REPASSE = 'VALOR_REPASSE';
  CNT_SITUACAO = 'SITUACAO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomREPASSE.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'REPASSE';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomREPASSE.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomREPASSE.DoBeforePost;
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

function TCustomREPASSE.GetIDREPASSE: Integer;
begin
  Result := FieldByName(CNT_IDREPASSE).AsInteger;
end;


function TCustomREPASSE.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomREPASSE.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomREPASSE.GetDATA_REPASSE: TDateTime;
begin
  Result := FieldByName(CNT_DATA_REPASSE).AsDateTime;
end;


function TCustomREPASSE.GetVALOR_REPASSE: Double;
begin
  Result := FieldByName(CNT_VALOR_REPASSE).AsFloat;
end;


function TCustomREPASSE.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomREPASSE.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomREPASSE.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomREPASSE.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomREPASSE.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomREPASSE.SetIDREPASSE(const Value: Integer);
begin
 FieldByName(CNT_IDREPASSE).AsInteger := Value;
end;


procedure TCustomREPASSE.SetIDCREDOR(const Value: Integer);
begin
 FieldByName(CNT_IDCREDOR).AsInteger := Value;
end;


procedure TCustomREPASSE.SetDESCRICAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO).AsString := Value;
end;


procedure TCustomREPASSE.SetDATA_REPASSE(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_REPASSE).AsDateTime := Value;
end;


procedure TCustomREPASSE.SetVALOR_REPASSE(const Value: Double);
begin
 FieldByName(CNT_VALOR_REPASSE).AsFloat := Value;
end;


procedure TCustomREPASSE.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomREPASSE.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomREPASSE.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomREPASSE.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomREPASSE.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomREPASSE.FindBypk_IdRepasse(pIDREPASSE : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDREPASSE';
  fvalue := pIDREPASSE;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesREPASSE.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesREPASSE.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesREPASSE.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from REPASSE');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesREPASSE.GetIDREPASSE: Integer;
begin
  Result := FieldByName(CNT_IDREPASSE).AsInteger;
end;


function TCustomSimplesREPASSE.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomSimplesREPASSE.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomSimplesREPASSE.GetDATA_REPASSE: TDateTime;
begin
  Result := FieldByName(CNT_DATA_REPASSE).AsDateTime;
end;


function TCustomSimplesREPASSE.GetVALOR_REPASSE: Double;
begin
  Result := FieldByName(CNT_VALOR_REPASSE).AsFloat;
end;


function TCustomSimplesREPASSE.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesREPASSE.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesREPASSE.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesREPASSE.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesREPASSE.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesREPASSE.SetIDREPASSE(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDREPASSE+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetIDCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetDESCRICAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetDATA_REPASSE(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_REPASSE+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesREPASSE.SetVALOR_REPASSE(const Value: Double);
begin
  StrCondicao.Add(CNT_VALOR_REPASSE+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesREPASSE.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesREPASSE.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesREPASSE.plMontaCondicao;
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

procedure TCustomSimplesREPASSE.plOrdenarPor(leIndice : TREPASSEIndex );
begin
  Case leIndice Of
    repassepk_IdRepasse : lsOrdenar := ' Order By IDREPASSE';
    repasseId_IdCredor_DataRepasse : lsOrdenar := ' Order By IDCREDOR,DATA_REPASSE';
    repasseIND_IDCREDOR : lsOrdenar := ' Order By IDCREDOR';
  End;
end;

procedure TCustomSimplesREPASSE.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesREPASSE.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesREPASSE.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

