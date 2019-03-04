unit ucLayTELEFONES;

interface

uses classes, adodb, variants;

type

 TTELEFONESIndex = (telefonesInd_CodigoDevedor_ItemTelefone, telefonespk_ItemTelefone, telefonesInd_CodigoDevedor);

 TCustomTELEFONES = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetITEM_TELEFONE: Integer;
  function GetCODIGO_DEVEDOR: Integer;
  function GetREFERENCIA_TELEFONE: String;
  function GetDDD: String;
  function GetNUMERO_TELEFONE: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetITEM_TELEFONE(const Value: Integer);
  procedure SetCODIGO_DEVEDOR(const Value: Integer);
  procedure SetREFERENCIA_TELEFONE(const Value: String);
  procedure SetDDD(const Value: String);
  procedure SetNUMERO_TELEFONE(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property ITEM_TELEFONE: Integer read GetITEM_TELEFONE write SetITEM_TELEFONE;
  property CODIGO_DEVEDOR: Integer read GetCODIGO_DEVEDOR write SetCODIGO_DEVEDOR;
  property REFERENCIA_TELEFONE: String read GetREFERENCIA_TELEFONE write SetREFERENCIA_TELEFONE;
  property DDD: String read GetDDD write SetDDD;
  property NUMERO_TELEFONE: String read GetNUMERO_TELEFONE write SetNUMERO_TELEFONE;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_CodigoDevedor_ItemTelefone(pITEM_TELEFONE : Integer; pCODIGO_DEVEDOR : Integer) : Boolean;
  function FindBypk_ItemTelefone(pITEM_TELEFONE : Integer) : Boolean;
 end;

 TTELEFONES = class(TCustomTELEFONES)
 public
  property ITEM_TELEFONE;
  property CODIGO_DEVEDOR;
  property REFERENCIA_TELEFONE;
  property DDD;
  property NUMERO_TELEFONE;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesTELEFONES = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetITEM_TELEFONE: Integer;
  function GetCODIGO_DEVEDOR: Integer;
  function GetREFERENCIA_TELEFONE: String;
  function GetDDD: String;
  function GetNUMERO_TELEFONE: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetITEM_TELEFONE(const Value: Integer);
  procedure SetCODIGO_DEVEDOR(const Value: Integer);
  procedure SetREFERENCIA_TELEFONE(const Value: String);
  procedure SetDDD(const Value: String);
  procedure SetNUMERO_TELEFONE(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property ITEM_TELEFONE: Integer read GetITEM_TELEFONE write SetITEM_TELEFONE;
  property CODIGO_DEVEDOR: Integer read GetCODIGO_DEVEDOR write SetCODIGO_DEVEDOR;
  property REFERENCIA_TELEFONE: String read GetREFERENCIA_TELEFONE write SetREFERENCIA_TELEFONE;
  property DDD: String read GetDDD write SetDDD;
  property NUMERO_TELEFONE: String read GetNUMERO_TELEFONE write SetNUMERO_TELEFONE;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TTELEFONESIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesTELEFONES = class(TCustomSimplesTELEFONES)
 public
  property ITEM_TELEFONE;
  property CODIGO_DEVEDOR;
  property REFERENCIA_TELEFONE;
  property DDD;
  property NUMERO_TELEFONE;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_ITEM_TELEFONE = 'ITEM_TELEFONE';
  CNT_CODIGO_DEVEDOR = 'CODIGO_DEVEDOR';
  CNT_REFERENCIA_TELEFONE = 'REFERENCIA_TELEFONE';
  CNT_DDD = 'DDD';
  CNT_NUMERO_TELEFONE = 'NUMERO_TELEFONE';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomTELEFONES.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'TELEFONES';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomTELEFONES.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomTELEFONES.DoBeforePost;
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

function TCustomTELEFONES.GetITEM_TELEFONE: Integer;
begin
  Result := FieldByName(CNT_ITEM_TELEFONE).AsInteger;
end;


function TCustomTELEFONES.GetCODIGO_DEVEDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_DEVEDOR).AsInteger;
end;


function TCustomTELEFONES.GetREFERENCIA_TELEFONE: String;
begin
  Result := FieldByName(CNT_REFERENCIA_TELEFONE).AsString;
end;


function TCustomTELEFONES.GetDDD: String;
begin
  Result := FieldByName(CNT_DDD).AsString;
end;


function TCustomTELEFONES.GetNUMERO_TELEFONE: String;
begin
  Result := FieldByName(CNT_NUMERO_TELEFONE).AsString;
end;


function TCustomTELEFONES.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomTELEFONES.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomTELEFONES.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomTELEFONES.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomTELEFONES.SetITEM_TELEFONE(const Value: Integer);
begin
 FieldByName(CNT_ITEM_TELEFONE).AsInteger := Value;
end;


procedure TCustomTELEFONES.SetCODIGO_DEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_CODIGO_DEVEDOR).AsInteger := Value;
end;


procedure TCustomTELEFONES.SetREFERENCIA_TELEFONE(const Value: String);
begin
 FieldByName(CNT_REFERENCIA_TELEFONE).AsString := Value;
end;


procedure TCustomTELEFONES.SetDDD(const Value: String);
begin
 FieldByName(CNT_DDD).AsString := Value;
end;


procedure TCustomTELEFONES.SetNUMERO_TELEFONE(const Value: String);
begin
 FieldByName(CNT_NUMERO_TELEFONE).AsString := Value;
end;


procedure TCustomTELEFONES.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomTELEFONES.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomTELEFONES.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomTELEFONES.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomTELEFONES.FindByInd_CodigoDevedor_ItemTelefone(pITEM_TELEFONE : Integer; pCODIGO_DEVEDOR : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'ITEM_TELEFONE;CODIGO_DEVEDOR';
  fvalue := VarArrayOf([pITEM_TELEFONE,pCODIGO_DEVEDOR]);
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomTELEFONES.FindBypk_ItemTelefone(pITEM_TELEFONE : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'ITEM_TELEFONE';
  fvalue := pITEM_TELEFONE;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesTELEFONES.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesTELEFONES.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesTELEFONES.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from TELEFONES');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesTELEFONES.GetITEM_TELEFONE: Integer;
begin
  Result := FieldByName(CNT_ITEM_TELEFONE).AsInteger;
end;


function TCustomSimplesTELEFONES.GetCODIGO_DEVEDOR: Integer;
begin
  Result := FieldByName(CNT_CODIGO_DEVEDOR).AsInteger;
end;


function TCustomSimplesTELEFONES.GetREFERENCIA_TELEFONE: String;
begin
  Result := FieldByName(CNT_REFERENCIA_TELEFONE).AsString;
end;


function TCustomSimplesTELEFONES.GetDDD: String;
begin
  Result := FieldByName(CNT_DDD).AsString;
end;


function TCustomSimplesTELEFONES.GetNUMERO_TELEFONE: String;
begin
  Result := FieldByName(CNT_NUMERO_TELEFONE).AsString;
end;


function TCustomSimplesTELEFONES.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesTELEFONES.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesTELEFONES.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesTELEFONES.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesTELEFONES.SetITEM_TELEFONE(const Value: Integer);
begin
  StrCondicao.Add(CNT_ITEM_TELEFONE+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetCODIGO_DEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_CODIGO_DEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetREFERENCIA_TELEFONE(const Value: String);
begin
  StrCondicao.Add(CNT_REFERENCIA_TELEFONE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetDDD(const Value: String);
begin
  StrCondicao.Add(CNT_DDD+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetNUMERO_TELEFONE(const Value: String);
begin
  StrCondicao.Add(CNT_NUMERO_TELEFONE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesTELEFONES.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesTELEFONES.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesTELEFONES.plMontaCondicao;
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

procedure TCustomSimplesTELEFONES.plOrdenarPor(leIndice : TTELEFONESIndex );
begin
  Case leIndice Of
    telefonesInd_CodigoDevedor_ItemTelefone : lsOrdenar := ' Order By ITEM_TELEFONE,CODIGO_DEVEDOR';
    telefonespk_ItemTelefone : lsOrdenar := ' Order By ITEM_TELEFONE';
    telefonesInd_CodigoDevedor : lsOrdenar := ' Order By CODIGO_DEVEDOR';
  End;
end;

procedure TCustomSimplesTELEFONES.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesTELEFONES.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesTELEFONES.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

