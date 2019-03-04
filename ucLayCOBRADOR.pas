unit ucLayCOBRADOR;

interface

uses classes, adodb, variants;

type

 TCOBRADORIndex = (cobradorInd_Usuario, cobradorpk_IdCobrador);

 TCustomCOBRADOR = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDCOBRADOR: Integer;
  function GetNOME_COBRADOR: String;
  function GetIDUSUARIO: Integer;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetATIVO: Boolean;
  procedure SetIDCOBRADOR(const Value: Integer);
  procedure SetNOME_COBRADOR(const Value: String);
  procedure SetIDUSUARIO(const Value: Integer);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetATIVO(const Value: Boolean);
  property IDCOBRADOR: Integer read GetIDCOBRADOR write SetIDCOBRADOR;
  property NOME_COBRADOR: String read GetNOME_COBRADOR write SetNOME_COBRADOR;
  property IDUSUARIO: Integer read GetIDUSUARIO write SetIDUSUARIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property ATIVO: Boolean read GetATIVO write SetATIVO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Usuario(pIDUSUARIO : Integer) : Boolean;
  function FindBypk_IdCobrador(pIDCOBRADOR : Integer) : Boolean;
 end;

 TCOBRADOR = class(TCustomCOBRADOR)
 public
  property IDCOBRADOR;
  property NOME_COBRADOR;
  property IDUSUARIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property ATIVO;
 end;

 TCustomSimplesCOBRADOR = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDCOBRADOR: Integer;
  function GetNOME_COBRADOR: String;
  function GetIDUSUARIO: Integer;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetATIVO: Boolean;
  procedure SetIDCOBRADOR(const Value: Integer);
  procedure SetNOME_COBRADOR(const Value: String);
  procedure SetIDUSUARIO(const Value: Integer);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetATIVO(const Value: Boolean);
  property IDCOBRADOR: Integer read GetIDCOBRADOR write SetIDCOBRADOR;
  property NOME_COBRADOR: String read GetNOME_COBRADOR write SetNOME_COBRADOR;
  property IDUSUARIO: Integer read GetIDUSUARIO write SetIDUSUARIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property ATIVO: Boolean read GetATIVO write SetATIVO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TCOBRADORIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesCOBRADOR = class(TCustomSimplesCOBRADOR)
 public
  property IDCOBRADOR;
  property NOME_COBRADOR;
  property IDUSUARIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property ATIVO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDCOBRADOR = 'IDCOBRADOR';
  CNT_NOME_COBRADOR = 'NOME_COBRADOR';
  CNT_IDUSUARIO = 'IDUSUARIO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_ATIVO = 'ATIVO';

constructor TCustomCOBRADOR.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'COBRADOR';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomCOBRADOR.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomCOBRADOR.DoBeforePost;
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

function TCustomCOBRADOR.GetIDCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_IDCOBRADOR).AsInteger;
end;


function TCustomCOBRADOR.GetNOME_COBRADOR: String;
begin
  Result := FieldByName(CNT_NOME_COBRADOR).AsString;
end;


function TCustomCOBRADOR.GetIDUSUARIO: Integer;
begin
  Result := FieldByName(CNT_IDUSUARIO).AsInteger;
end;


function TCustomCOBRADOR.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomCOBRADOR.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomCOBRADOR.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomCOBRADOR.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomCOBRADOR.GetATIVO: Boolean;
begin
  Result := FieldByName(CNT_ATIVO).AsBoolean;
end;


procedure TCustomCOBRADOR.SetIDCOBRADOR(const Value: Integer);
begin
 FieldByName(CNT_IDCOBRADOR).AsInteger := Value;
end;


procedure TCustomCOBRADOR.SetNOME_COBRADOR(const Value: String);
begin
 FieldByName(CNT_NOME_COBRADOR).AsString := Value;
end;


procedure TCustomCOBRADOR.SetIDUSUARIO(const Value: Integer);
begin
 FieldByName(CNT_IDUSUARIO).AsInteger := Value;
end;


procedure TCustomCOBRADOR.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomCOBRADOR.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomCOBRADOR.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomCOBRADOR.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomCOBRADOR.SetATIVO(const Value: Boolean);
begin
 FieldByName(CNT_ATIVO).AsBoolean := Value;
end;


function TCustomCOBRADOR.FindByInd_Usuario(pIDUSUARIO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDUSUARIO';
  fvalue := pIDUSUARIO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomCOBRADOR.FindBypk_IdCobrador(pIDCOBRADOR : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDCOBRADOR';
  fvalue := pIDCOBRADOR;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesCOBRADOR.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesCOBRADOR.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesCOBRADOR.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from COBRADOR');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesCOBRADOR.GetIDCOBRADOR: Integer;
begin
  Result := FieldByName(CNT_IDCOBRADOR).AsInteger;
end;


function TCustomSimplesCOBRADOR.GetNOME_COBRADOR: String;
begin
  Result := FieldByName(CNT_NOME_COBRADOR).AsString;
end;


function TCustomSimplesCOBRADOR.GetIDUSUARIO: Integer;
begin
  Result := FieldByName(CNT_IDUSUARIO).AsInteger;
end;


function TCustomSimplesCOBRADOR.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesCOBRADOR.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesCOBRADOR.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesCOBRADOR.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesCOBRADOR.GetATIVO: Boolean;
begin
  Result := FieldByName(CNT_ATIVO).AsBoolean;
end;


procedure TCustomSimplesCOBRADOR.SetIDCOBRADOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCOBRADOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRADOR.SetNOME_COBRADOR(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_COBRADOR+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCOBRADOR.SetIDUSUARIO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDUSUARIO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesCOBRADOR.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCOBRADOR.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesCOBRADOR.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRADOR.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesCOBRADOR.SetATIVO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_ATIVO+' = '+IntToStr(-Ord(Value))); 
end;

procedure TCustomSimplesCOBRADOR.plMontaCondicao;
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

procedure TCustomSimplesCOBRADOR.plOrdenarPor(leIndice : TCOBRADORIndex );
begin
  Case leIndice Of
    cobradorInd_Usuario : lsOrdenar := ' Order By IDUSUARIO';
    cobradorpk_IdCobrador : lsOrdenar := ' Order By IDCOBRADOR';
  End;
end;

procedure TCustomSimplesCOBRADOR.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesCOBRADOR.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesCOBRADOR.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

