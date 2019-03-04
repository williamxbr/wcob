unit ucLayENDERECOS;

interface

uses classes, adodb, variants;

type

 TENDERECOSIndex = (enderecosInd_Numero_Devedor, enderecospk_Numero_Endereco, enderecosInd_Codigo_Devedor);

 TCustomENDERECOS = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetNUMERO_ENDERECO: Integer;
  function GetCODIGO_DEVEDOR: Integer;
  function GetREFERENCIA_ENDERECO: String;
  function GetENDERECO: String;
  function GetNUMERO: String;
  function GetCOMPLEMENTO: String;
  function GetBAIRRO: String;
  function GetCIDADE: String;
  function GetESTADO: String;
  function GetOBSERVACAO: String;
  function GetCEP: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetNUMERO_ENDERECO(const Value: Integer);
  procedure SetCODIGO_DEVEDOR(const Value: Integer);
  procedure SetREFERENCIA_ENDERECO(const Value: String);
  procedure SetENDERECO(const Value: String);
  procedure SetNUMERO(const Value: String);
  procedure SetCOMPLEMENTO(const Value: String);
  procedure SetBAIRRO(const Value: String);
  procedure SetCIDADE(const Value: String);
  procedure SetESTADO(const Value: String);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetCEP(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property NUMERO_ENDERECO: Integer read GetNUMERO_ENDERECO write SetNUMERO_ENDERECO;
  property CODIGO_DEVEDOR: Integer read GetCODIGO_DEVEDOR write SetCODIGO_DEVEDOR;
  property REFERENCIA_ENDERECO: String read GetREFERENCIA_ENDERECO write SetREFERENCIA_ENDERECO;
  property ENDERECO: String read GetENDERECO write SetENDERECO;
  property NUMERO: String read GetNUMERO write SetNUMERO;
  property COMPLEMENTO: String read GetCOMPLEMENTO write SetCOMPLEMENTO;
  property BAIRRO: String read GetBAIRRO write SetBAIRRO;
  property CIDADE: String read GetCIDADE write SetCIDADE;
  property ESTADO: String read GetESTADO write SetESTADO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property CEP: String read GetCEP write SetCEP;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Numero_Devedor(pCODIGO_DEVEDOR : Integer; pNUMERO_ENDERECO : Integer) : Boolean;
  function FindBypk_Numero_Endereco(pNUMERO_ENDERECO : Integer) : Boolean;
 end;

 TENDERECOS = class(TCustomENDERECOS)
 public
  property NUMERO_ENDERECO;
  property CODIGO_DEVEDOR;
  property REFERENCIA_ENDERECO;
  property ENDERECO;
  property NUMERO;
  property COMPLEMENTO;
  property BAIRRO;
  property CIDADE;
  property ESTADO;
  property OBSERVACAO;
  property CEP;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesENDERECOS = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetNUMERO_ENDERECO: Integer;
  function GetCODIGO_DEVEDOR: Integer;
  function GetREFERENCIA_ENDERECO: String;
  function GetENDERECO: String;
  function GetNUMERO: String;
  function GetCOMPLEMENTO: String;
  function GetBAIRRO: String;
  function GetCIDADE: String;
  function GetESTADO: String;
  function GetOBSERVACAO: String;
  function GetCEP: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetNUMERO_ENDERECO(const Value: Integer);
  procedure SetCODIGO_DEVEDOR(const Value: Integer);
  procedure SetREFERENCIA_ENDERECO(const Value: String);
  procedure SetENDERECO(const Value: String);
  procedure SetNUMERO(const Value: String);
  procedure SetCOMPLEMENTO(const Value: String);
  procedure SetBAIRRO(const Value: String);
  procedure SetCIDADE(const Value: String);
  procedure SetESTADO(const Value: String);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetCEP(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property NUMERO_ENDERECO: Integer read GetNUMERO_ENDERECO write SetNUMERO_ENDERECO;
  property CODIGO_DEVEDOR: Integer read GetCODIGO_DEVEDOR write SetCODIGO_DEVEDOR;
  property REFERENCIA_ENDERECO: String read GetREFERENCIA_ENDERECO write SetREFERENCIA_ENDERECO;
  property ENDERECO: String read GetENDERECO write SetENDERECO;
  property NUMERO: String read GetNUMERO write SetNUMERO;
  property COMPLEMENTO: String read GetCOMPLEMENTO write SetCOMPLEMENTO;
  property BAIRRO: String read GetBAIRRO write SetBAIRRO;
  property CIDADE: String read GetCIDADE write SetCIDADE;
  property ESTADO: String read GetESTADO write SetESTADO;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property CEP: String read GetCEP write SetCEP;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TENDERECOSIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesENDERECOS = class(TCustomSimplesENDERECOS)
 public
  property NUMERO_ENDERECO;
  property CODIGO_DEVEDOR;
  property REFERENCIA_ENDERECO;
  property ENDERECO;
  property NUMERO;
  property COMPLEMENTO;
  property BAIRRO;
  property CIDADE;
  property ESTADO;
  property OBSERVACAO;
  property CEP;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_NUMERO_ENDERECO = 'NUMERO_ENDERECO';
  CNT_CODIGO_DEVEDOR = 'CODIGO_DEVEDOR';
  CNT_REFERENCIA_ENDERECO = 'REFERENCIA_ENDERECO';
  CNT_ENDERECO = 'ENDERECO';
  CNT_NUMERO = 'NUMERO';
  CNT_COMPLEMENTO = 'COMPLEMENTO';
  CNT_BAIRRO = 'BAIRRO';
  CNT_CIDADE = 'CIDADE';
  CNT_ESTADO = 'ESTADO';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_CEP = 'CEP';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomENDERECOS.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'ENDERECOS';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomENDERECOS.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomENDERECOS.DoBeforePost;
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

function TCustomENDERECOS.GetNUMERO_ENDERECO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_ENDERECO).AsInteger;
end;


function TCustomENDERECOS.GetCODIGO_DEVEDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_DEVEDOR).AsInteger;
end;


function TCustomENDERECOS.GetREFERENCIA_ENDERECO: String;
begin
  Result := FieldByName(CNT_REFERENCIA_ENDERECO).AsString;
end;


function TCustomENDERECOS.GetENDERECO: String;
begin
  Result := FieldByName(CNT_ENDERECO).AsString;
end;


function TCustomENDERECOS.GetNUMERO: String;
begin
  Result := FieldByName(CNT_NUMERO).AsString;
end;


function TCustomENDERECOS.GetCOMPLEMENTO: String;
begin
  Result := FieldByName(CNT_COMPLEMENTO).AsString;
end;


function TCustomENDERECOS.GetBAIRRO: String;
begin
  Result := FieldByName(CNT_BAIRRO).AsString;
end;


function TCustomENDERECOS.GetCIDADE: String;
begin
  Result := FieldByName(CNT_CIDADE).AsString;
end;


function TCustomENDERECOS.GetESTADO: String;
begin
  Result := FieldByName(CNT_ESTADO).AsString;
end;


function TCustomENDERECOS.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomENDERECOS.GetCEP: String;
begin
  Result := FieldByName(CNT_CEP).AsString;
end;


function TCustomENDERECOS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomENDERECOS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomENDERECOS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomENDERECOS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomENDERECOS.SetNUMERO_ENDERECO(const Value: Integer);
begin
 FieldByName(CNT_NUMERO_ENDERECO).AsInteger := Value;
end;


procedure TCustomENDERECOS.SetCODIGO_DEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_CODIGO_DEVEDOR).AsInteger := Value;
end;


procedure TCustomENDERECOS.SetREFERENCIA_ENDERECO(const Value: String);
begin
 FieldByName(CNT_REFERENCIA_ENDERECO).AsString := Value;
end;


procedure TCustomENDERECOS.SetENDERECO(const Value: String);
begin
 FieldByName(CNT_ENDERECO).AsString := Value;
end;


procedure TCustomENDERECOS.SetNUMERO(const Value: String);
begin
 FieldByName(CNT_NUMERO).AsString := Value;
end;


procedure TCustomENDERECOS.SetCOMPLEMENTO(const Value: String);
begin
 FieldByName(CNT_COMPLEMENTO).AsString := Value;
end;


procedure TCustomENDERECOS.SetBAIRRO(const Value: String);
begin
 FieldByName(CNT_BAIRRO).AsString := Value;
end;


procedure TCustomENDERECOS.SetCIDADE(const Value: String);
begin
 FieldByName(CNT_CIDADE).AsString := Value;
end;


procedure TCustomENDERECOS.SetESTADO(const Value: String);
begin
 FieldByName(CNT_ESTADO).AsString := Value;
end;


procedure TCustomENDERECOS.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomENDERECOS.SetCEP(const Value: String);
begin
 FieldByName(CNT_CEP).AsString := Value;
end;


procedure TCustomENDERECOS.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomENDERECOS.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomENDERECOS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomENDERECOS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomENDERECOS.FindByInd_Numero_Devedor(pCODIGO_DEVEDOR : Integer; pNUMERO_ENDERECO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'CODIGO_DEVEDOR;NUMERO_ENDERECO';
  fvalue := VarArrayOf([pCODIGO_DEVEDOR,pNUMERO_ENDERECO]);
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomENDERECOS.FindBypk_Numero_Endereco(pNUMERO_ENDERECO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'NUMERO_ENDERECO';
  fvalue := pNUMERO_ENDERECO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesENDERECOS.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesENDERECOS.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesENDERECOS.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from ENDERECOS');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesENDERECOS.GetNUMERO_ENDERECO: Integer;
begin
  Result := FieldByName(CNT_NUMERO_ENDERECO).AsInteger;
end;


function TCustomSimplesENDERECOS.GetCODIGO_DEVEDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_DEVEDOR).AsInteger;
end;


function TCustomSimplesENDERECOS.GetREFERENCIA_ENDERECO: String;
begin
  Result := FieldByName(CNT_REFERENCIA_ENDERECO).AsString;
end;


function TCustomSimplesENDERECOS.GetENDERECO: String;
begin
  Result := FieldByName(CNT_ENDERECO).AsString;
end;


function TCustomSimplesENDERECOS.GetNUMERO: String;
begin
  Result := FieldByName(CNT_NUMERO).AsString;
end;


function TCustomSimplesENDERECOS.GetCOMPLEMENTO: String;
begin
  Result := FieldByName(CNT_COMPLEMENTO).AsString;
end;


function TCustomSimplesENDERECOS.GetBAIRRO: String;
begin
  Result := FieldByName(CNT_BAIRRO).AsString;
end;


function TCustomSimplesENDERECOS.GetCIDADE: String;
begin
  Result := FieldByName(CNT_CIDADE).AsString;
end;


function TCustomSimplesENDERECOS.GetESTADO: String;
begin
  Result := FieldByName(CNT_ESTADO).AsString;
end;


function TCustomSimplesENDERECOS.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesENDERECOS.GetCEP: String;
begin
  Result := FieldByName(CNT_CEP).AsString;
end;


function TCustomSimplesENDERECOS.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesENDERECOS.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesENDERECOS.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesENDERECOS.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesENDERECOS.SetNUMERO_ENDERECO(const Value: Integer);
begin
  StrCondicao.Add(CNT_NUMERO_ENDERECO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetCODIGO_DEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_CODIGO_DEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetREFERENCIA_ENDERECO(const Value: String);
begin
  StrCondicao.Add(CNT_REFERENCIA_ENDERECO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetENDERECO(const Value: String);
begin
  StrCondicao.Add(CNT_ENDERECO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetNUMERO(const Value: String);
begin
  StrCondicao.Add(CNT_NUMERO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetCOMPLEMENTO(const Value: String);
begin
  StrCondicao.Add(CNT_COMPLEMENTO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetBAIRRO(const Value: String);
begin
  StrCondicao.Add(CNT_BAIRRO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetCIDADE(const Value: String);
begin
  StrCondicao.Add(CNT_CIDADE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetESTADO(const Value: String);
begin
  StrCondicao.Add(CNT_ESTADO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetCEP(const Value: String);
begin
  StrCondicao.Add(CNT_CEP+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesENDERECOS.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesENDERECOS.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesENDERECOS.plMontaCondicao;
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

procedure TCustomSimplesENDERECOS.plOrdenarPor(leIndice : TENDERECOSIndex );
begin
  Case leIndice Of
    enderecosInd_Numero_Devedor : lsOrdenar := ' Order By CODIGO_DEVEDOR,NUMERO_ENDERECO';
    enderecospk_Numero_Endereco : lsOrdenar := ' Order By NUMERO_ENDERECO';
    enderecosInd_Codigo_Devedor : lsOrdenar := ' Order By CODIGO_DEVEDOR';
  End;
end;

procedure TCustomSimplesENDERECOS.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesENDERECOS.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesENDERECOS.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

