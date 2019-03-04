unit ucLayGRUPO_COBRANCA;

interface

uses classes, adodb, variants;

type

 TGRUPO_COBRANCAIndex = (grupo_cobrancapk_IdGrupo, grupo_cobrancaInd_IdCredor);

 TCustomGRUPO_COBRANCA = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDGRUPO: Integer;
  function GetDESCRICAO: String;
  function GetIDCREDOR: Integer;
  function GetOBSERVACAO: String;
  function GetVALIDADE: TDateTime;
  function GetSITUACAO: Word;
  function GetDESCONTO_MAXIMO: Double;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDGRUPO(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetVALIDADE(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetDESCONTO_MAXIMO(const Value: Double);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDGRUPO: Integer read GetIDGRUPO write SetIDGRUPO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property VALIDADE: TDateTime read GetVALIDADE write SetVALIDADE;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property DESCONTO_MAXIMO: Double read GetDESCONTO_MAXIMO write SetDESCONTO_MAXIMO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdGrupo(pIDGRUPO : Integer) : Boolean;
 end;

 TGRUPO_COBRANCA = class(TCustomGRUPO_COBRANCA)
 public
  property IDGRUPO;
  property DESCRICAO;
  property IDCREDOR;
  property OBSERVACAO;
  property VALIDADE;
  property SITUACAO;
  property DESCONTO_MAXIMO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesGRUPO_COBRANCA = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDGRUPO: Integer;
  function GetDESCRICAO: String;
  function GetIDCREDOR: Integer;
  function GetOBSERVACAO: String;
  function GetVALIDADE: TDateTime;
  function GetSITUACAO: Word;
  function GetDESCONTO_MAXIMO: Double;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDGRUPO(const Value: Integer);
  procedure SetDESCRICAO(const Value: String);
  procedure SetIDCREDOR(const Value: Integer);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetVALIDADE(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetDESCONTO_MAXIMO(const Value: Double);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDGRUPO: Integer read GetIDGRUPO write SetIDGRUPO;
  property DESCRICAO: String read GetDESCRICAO write SetDESCRICAO;
  property IDCREDOR: Integer read GetIDCREDOR write SetIDCREDOR;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property VALIDADE: TDateTime read GetVALIDADE write SetVALIDADE;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property DESCONTO_MAXIMO: Double read GetDESCONTO_MAXIMO write SetDESCONTO_MAXIMO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TGRUPO_COBRANCAIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesGRUPO_COBRANCA = class(TCustomSimplesGRUPO_COBRANCA)
 public
  property IDGRUPO;
  property DESCRICAO;
  property IDCREDOR;
  property OBSERVACAO;
  property VALIDADE;
  property SITUACAO;
  property DESCONTO_MAXIMO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDGRUPO = 'IDGRUPO';
  CNT_DESCRICAO = 'DESCRICAO';
  CNT_IDCREDOR = 'IDCREDOR';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_VALIDADE = 'VALIDADE';
  CNT_SITUACAO = 'SITUACAO';
  CNT_DESCONTO_MAXIMO = 'DESCONTO_MAXIMO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomGRUPO_COBRANCA.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'GRUPO_COBRANCA';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomGRUPO_COBRANCA.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomGRUPO_COBRANCA.DoBeforePost;
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

function TCustomGRUPO_COBRANCA.GetIDGRUPO: Integer;
begin
  Result := FieldByName(CNT_IDGRUPO).AsInteger;
end;


function TCustomGRUPO_COBRANCA.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomGRUPO_COBRANCA.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomGRUPO_COBRANCA.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomGRUPO_COBRANCA.GetVALIDADE: TDateTime;
begin
  Result := FieldByName(CNT_VALIDADE).AsDateTime;
end;


function TCustomGRUPO_COBRANCA.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomGRUPO_COBRANCA.GetDESCONTO_MAXIMO: Double;
begin
  Result := FieldByName(CNT_DESCONTO_MAXIMO).AsFloat;
end;


function TCustomGRUPO_COBRANCA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomGRUPO_COBRANCA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomGRUPO_COBRANCA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomGRUPO_COBRANCA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomGRUPO_COBRANCA.SetIDGRUPO(const Value: Integer);
begin
 FieldByName(CNT_IDGRUPO).AsInteger := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetDESCRICAO(const Value: String);
begin
 FieldByName(CNT_DESCRICAO).AsString := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetIDCREDOR(const Value: Integer);
begin
 FieldByName(CNT_IDCREDOR).AsInteger := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetVALIDADE(const Value: TDateTime);
begin
 FieldByName(CNT_VALIDADE).AsDateTime := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetDESCONTO_MAXIMO(const Value: Double);
begin
 FieldByName(CNT_DESCONTO_MAXIMO).AsFloat := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomGRUPO_COBRANCA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomGRUPO_COBRANCA.FindBypk_IdGrupo(pIDGRUPO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDGRUPO';
  fvalue := pIDGRUPO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesGRUPO_COBRANCA.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesGRUPO_COBRANCA.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesGRUPO_COBRANCA.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from GRUPO_COBRANCA');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesGRUPO_COBRANCA.GetIDGRUPO: Integer;
begin
  Result := FieldByName(CNT_IDGRUPO).AsInteger;
end;


function TCustomSimplesGRUPO_COBRANCA.GetDESCRICAO: String;
begin
  Result := FieldByName(CNT_DESCRICAO).AsString;
end;


function TCustomSimplesGRUPO_COBRANCA.GetIDCREDOR: Integer;
begin
  Result := FieldByName(CNT_IDCREDOR).AsInteger;
end;


function TCustomSimplesGRUPO_COBRANCA.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesGRUPO_COBRANCA.GetVALIDADE: TDateTime;
begin
  Result := FieldByName(CNT_VALIDADE).AsDateTime;
end;


function TCustomSimplesGRUPO_COBRANCA.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesGRUPO_COBRANCA.GetDESCONTO_MAXIMO: Double;
begin
  Result := FieldByName(CNT_DESCONTO_MAXIMO).AsFloat;
end;


function TCustomSimplesGRUPO_COBRANCA.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesGRUPO_COBRANCA.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesGRUPO_COBRANCA.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesGRUPO_COBRANCA.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetIDGRUPO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDGRUPO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetDESCRICAO(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetIDCREDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCREDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetVALIDADE(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_VALIDADE+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetDESCONTO_MAXIMO(const Value: Double);
begin
  StrCondicao.Add(CNT_DESCONTO_MAXIMO+' = '+FloatToStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesGRUPO_COBRANCA.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesGRUPO_COBRANCA.plMontaCondicao;
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

procedure TCustomSimplesGRUPO_COBRANCA.plOrdenarPor(leIndice : TGRUPO_COBRANCAIndex );
begin
  Case leIndice Of
    grupo_cobrancapk_IdGrupo : lsOrdenar := ' Order By IDGRUPO';
    grupo_cobrancaInd_IdCredor : lsOrdenar := ' Order By IDCREDOR';
  End;
end;

procedure TCustomSimplesGRUPO_COBRANCA.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesGRUPO_COBRANCA.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesGRUPO_COBRANCA.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

