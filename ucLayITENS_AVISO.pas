unit ucLayITENS_AVISO;

interface

uses classes, adodb, variants;

type

 TITENS_AVISOIndex = (itens_avisopk_IdDevedor_Aviso, itens_avisoInd_Cobranca, itens_avisoInd_Devedor, itens_avisoInd_IdAviso);

 TCustomITENS_AVISO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDDEVEDOR_AVISO: Integer;
  function GetIDAVISO: Integer;
  function GetIDDEVEDOR: Integer;
  function GetIDCOBRANCA: Integer;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDDEVEDOR_AVISO(const Value: Integer);
  procedure SetIDAVISO(const Value: Integer);
  procedure SetIDDEVEDOR(const Value: Integer);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDDEVEDOR_AVISO: Integer read GetIDDEVEDOR_AVISO write SetIDDEVEDOR_AVISO;
  property IDAVISO: Integer read GetIDAVISO write SetIDAVISO;
  property IDDEVEDOR: Integer read GetIDDEVEDOR write SetIDDEVEDOR;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdDevedor_Aviso(pIDDEVEDOR_AVISO : Integer) : Boolean;
 end;

 TITENS_AVISO = class(TCustomITENS_AVISO)
 public
  property IDDEVEDOR_AVISO;
  property IDAVISO;
  property IDDEVEDOR;
  property IDCOBRANCA;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesITENS_AVISO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDDEVEDOR_AVISO: Integer;
  function GetIDAVISO: Integer;
  function GetIDDEVEDOR: Integer;
  function GetIDCOBRANCA: Integer;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDDEVEDOR_AVISO(const Value: Integer);
  procedure SetIDAVISO(const Value: Integer);
  procedure SetIDDEVEDOR(const Value: Integer);
  procedure SetIDCOBRANCA(const Value: Integer);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDDEVEDOR_AVISO: Integer read GetIDDEVEDOR_AVISO write SetIDDEVEDOR_AVISO;
  property IDAVISO: Integer read GetIDAVISO write SetIDAVISO;
  property IDDEVEDOR: Integer read GetIDDEVEDOR write SetIDDEVEDOR;
  property IDCOBRANCA: Integer read GetIDCOBRANCA write SetIDCOBRANCA;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TITENS_AVISOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesITENS_AVISO = class(TCustomSimplesITENS_AVISO)
 public
  property IDDEVEDOR_AVISO;
  property IDAVISO;
  property IDDEVEDOR;
  property IDCOBRANCA;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDDEVEDOR_AVISO = 'IDDEVEDOR_AVISO';
  CNT_IDAVISO = 'IDAVISO';
  CNT_IDDEVEDOR = 'IDDEVEDOR';
  CNT_IDCOBRANCA = 'IDCOBRANCA';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomITENS_AVISO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'ITENS_AVISO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomITENS_AVISO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomITENS_AVISO.DoBeforePost;
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

function TCustomITENS_AVISO.GetIDDEVEDOR_AVISO: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR_AVISO).AsInteger;
end;


function TCustomITENS_AVISO.GetIDAVISO: Integer;
begin
  Result := FieldByName(CNT_IDAVISO).AsInteger;
end;


function TCustomITENS_AVISO.GetIDDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR).AsInteger;
end;


function TCustomITENS_AVISO.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDCOBRANCA).AsInteger;
end;


function TCustomITENS_AVISO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomITENS_AVISO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomITENS_AVISO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomITENS_AVISO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomITENS_AVISO.SetIDDEVEDOR_AVISO(const Value: Integer);
begin
 FieldByName(CNT_IDDEVEDOR_AVISO).AsInteger := Value;
end;


procedure TCustomITENS_AVISO.SetIDAVISO(const Value: Integer);
begin
 FieldByName(CNT_IDAVISO).AsInteger := Value;
end;


procedure TCustomITENS_AVISO.SetIDDEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_IDDEVEDOR).AsInteger := Value;
end;


procedure TCustomITENS_AVISO.SetIDCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_IDCOBRANCA).AsInteger := Value;
end;


procedure TCustomITENS_AVISO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomITENS_AVISO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomITENS_AVISO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomITENS_AVISO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomITENS_AVISO.FindBypk_IdDevedor_Aviso(pIDDEVEDOR_AVISO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDDEVEDOR_AVISO';
  fvalue := pIDDEVEDOR_AVISO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesITENS_AVISO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesITENS_AVISO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesITENS_AVISO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from ITENS_AVISO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesITENS_AVISO.GetIDDEVEDOR_AVISO: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR_AVISO).AsInteger;
end;


function TCustomSimplesITENS_AVISO.GetIDAVISO: Integer;
begin
  Result := FieldByName(CNT_IDAVISO).AsInteger;
end;


function TCustomSimplesITENS_AVISO.GetIDDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR).AsInteger;
end;


function TCustomSimplesITENS_AVISO.GetIDCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_IDCOBRANCA).AsInteger;
end;


function TCustomSimplesITENS_AVISO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesITENS_AVISO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesITENS_AVISO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesITENS_AVISO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesITENS_AVISO.SetIDDEVEDOR_AVISO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDDEVEDOR_AVISO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_AVISO.SetIDAVISO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDAVISO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_AVISO.SetIDDEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDDEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_AVISO.SetIDCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCOBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesITENS_AVISO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesITENS_AVISO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesITENS_AVISO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesITENS_AVISO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesITENS_AVISO.plMontaCondicao;
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

procedure TCustomSimplesITENS_AVISO.plOrdenarPor(leIndice : TITENS_AVISOIndex );
begin
  Case leIndice Of
    itens_avisopk_IdDevedor_Aviso : lsOrdenar := ' Order By IDDEVEDOR_AVISO';
    itens_avisoInd_Cobranca : lsOrdenar := ' Order By IDCOBRANCA';
    itens_avisoInd_Devedor : lsOrdenar := ' Order By IDDEVEDOR';
    itens_avisoInd_IdAviso : lsOrdenar := ' Order By IDAVISO';
  End;
end;

procedure TCustomSimplesITENS_AVISO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesITENS_AVISO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesITENS_AVISO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

