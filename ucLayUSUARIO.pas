unit ucLayUSUARIO;

interface

uses classes, adodb, variants;

type

 TUSUARIOIndex = (usuarioInd_Usuario, usuariopk_Id);

 TCustomUSUARIO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetID: Integer;
  function GetUSUARIO: String;
  function GetSENHA: String;
  function GetNOME: String;
  function GetTIPO_USUARIO: Boolean;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetENDERECO_IP: String;
  function GetNOME_COMPUTADOR: String;
  function GetUSUARIO_REDE: String;
  function GetUSUARIO_LOGADO: Boolean;
  function GetATIVO: Boolean;
  procedure SetID(const Value: Integer);
  procedure SetUSUARIO(const Value: String);
  procedure SetSENHA(const Value: String);
  procedure SetNOME(const Value: String);
  procedure SetTIPO_USUARIO(const Value: Boolean);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetENDERECO_IP(const Value: String);
  procedure SetNOME_COMPUTADOR(const Value: String);
  procedure SetUSUARIO_REDE(const Value: String);
  procedure SetUSUARIO_LOGADO(const Value: Boolean);
  procedure SetATIVO(const Value: Boolean);
  property ID: Integer read GetID write SetID;
  property USUARIO: String read GetUSUARIO write SetUSUARIO;
  property SENHA: String read GetSENHA write SetSENHA;
  property NOME: String read GetNOME write SetNOME;
  property TIPO_USUARIO: Boolean read GetTIPO_USUARIO write SetTIPO_USUARIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property ENDERECO_IP: String read GetENDERECO_IP write SetENDERECO_IP;
  property NOME_COMPUTADOR: String read GetNOME_COMPUTADOR write SetNOME_COMPUTADOR;
  property USUARIO_REDE: String read GetUSUARIO_REDE write SetUSUARIO_REDE;
  property USUARIO_LOGADO: Boolean read GetUSUARIO_LOGADO write SetUSUARIO_LOGADO;
  property ATIVO: Boolean read GetATIVO write SetATIVO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByInd_Usuario(pUSUARIO : String) : Boolean;
  function FindBypk_Id(pID : Integer) : Boolean;
 end;

 TUSUARIO = class(TCustomUSUARIO)
 public
  property ID;
  property USUARIO;
  property SENHA;
  property NOME;
  property TIPO_USUARIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property ENDERECO_IP;
  property NOME_COMPUTADOR;
  property USUARIO_REDE;
  property USUARIO_LOGADO;
  property ATIVO;
 end;

 TCustomSimplesUSUARIO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetID: Integer;
  function GetUSUARIO: String;
  function GetSENHA: String;
  function GetNOME: String;
  function GetTIPO_USUARIO: Boolean;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetENDERECO_IP: String;
  function GetNOME_COMPUTADOR: String;
  function GetUSUARIO_REDE: String;
  function GetUSUARIO_LOGADO: Boolean;
  function GetATIVO: Boolean;
  procedure SetID(const Value: Integer);
  procedure SetUSUARIO(const Value: String);
  procedure SetSENHA(const Value: String);
  procedure SetNOME(const Value: String);
  procedure SetTIPO_USUARIO(const Value: Boolean);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetENDERECO_IP(const Value: String);
  procedure SetNOME_COMPUTADOR(const Value: String);
  procedure SetUSUARIO_REDE(const Value: String);
  procedure SetUSUARIO_LOGADO(const Value: Boolean);
  procedure SetATIVO(const Value: Boolean);
  property ID: Integer read GetID write SetID;
  property USUARIO: String read GetUSUARIO write SetUSUARIO;
  property SENHA: String read GetSENHA write SetSENHA;
  property NOME: String read GetNOME write SetNOME;
  property TIPO_USUARIO: Boolean read GetTIPO_USUARIO write SetTIPO_USUARIO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property ENDERECO_IP: String read GetENDERECO_IP write SetENDERECO_IP;
  property NOME_COMPUTADOR: String read GetNOME_COMPUTADOR write SetNOME_COMPUTADOR;
  property USUARIO_REDE: String read GetUSUARIO_REDE write SetUSUARIO_REDE;
  property USUARIO_LOGADO: Boolean read GetUSUARIO_LOGADO write SetUSUARIO_LOGADO;
  property ATIVO: Boolean read GetATIVO write SetATIVO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TUSUARIOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesUSUARIO = class(TCustomSimplesUSUARIO)
 public
  property ID;
  property USUARIO;
  property SENHA;
  property NOME;
  property TIPO_USUARIO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property ENDERECO_IP;
  property NOME_COMPUTADOR;
  property USUARIO_REDE;
  property USUARIO_LOGADO;
  property ATIVO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_ID = 'ID';
  CNT_USUARIO = 'USUARIO';
  CNT_SENHA = 'SENHA';
  CNT_NOME = 'NOME';
  CNT_TIPO_USUARIO = 'TIPO_USUARIO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_ENDERECO_IP = 'ENDERECO_IP';
  CNT_NOME_COMPUTADOR = 'NOME_COMPUTADOR';
  CNT_USUARIO_REDE = 'USUARIO_REDE';
  CNT_USUARIO_LOGADO = 'USUARIO_LOGADO';
  CNT_ATIVO = 'ATIVO';

constructor TCustomUSUARIO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'USUARIO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomUSUARIO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomUSUARIO.DoBeforePost;
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

function TCustomUSUARIO.GetID: Integer;
begin
  Result := FieldByName(CNT_ID).AsInteger;
end;


function TCustomUSUARIO.GetUSUARIO: String;
begin
  Result := FieldByName(CNT_USUARIO).AsString;
end;


function TCustomUSUARIO.GetSENHA: String;
begin
  Result := FieldByName(CNT_SENHA).AsString;
end;


function TCustomUSUARIO.GetNOME: String;
begin
  Result := FieldByName(CNT_NOME).AsString;
end;


function TCustomUSUARIO.GetTIPO_USUARIO: Boolean;
begin
  Result := FieldByName(CNT_TIPO_USUARIO).AsBoolean;
end;


function TCustomUSUARIO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomUSUARIO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomUSUARIO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomUSUARIO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomUSUARIO.GetENDERECO_IP: String;
begin
  Result := FieldByName(CNT_ENDERECO_IP).AsString;
end;


function TCustomUSUARIO.GetNOME_COMPUTADOR: String;
begin
  Result := FieldByName(CNT_NOME_COMPUTADOR).AsString;
end;


function TCustomUSUARIO.GetUSUARIO_REDE: String;
begin
  Result := FieldByName(CNT_USUARIO_REDE).AsString;
end;


function TCustomUSUARIO.GetUSUARIO_LOGADO: Boolean;
begin
  Result := FieldByName(CNT_USUARIO_LOGADO).AsBoolean;
end;


function TCustomUSUARIO.GetATIVO: Boolean;
begin
  Result := FieldByName(CNT_ATIVO).AsBoolean;
end;


procedure TCustomUSUARIO.SetID(const Value: Integer);
begin
 FieldByName(CNT_ID).AsInteger := Value;
end;


procedure TCustomUSUARIO.SetUSUARIO(const Value: String);
begin
 FieldByName(CNT_USUARIO).AsString := Value;
end;


procedure TCustomUSUARIO.SetSENHA(const Value: String);
begin
 FieldByName(CNT_SENHA).AsString := Value;
end;


procedure TCustomUSUARIO.SetNOME(const Value: String);
begin
 FieldByName(CNT_NOME).AsString := Value;
end;


procedure TCustomUSUARIO.SetTIPO_USUARIO(const Value: Boolean);
begin
 FieldByName(CNT_TIPO_USUARIO).AsBoolean := Value;
end;


procedure TCustomUSUARIO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomUSUARIO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomUSUARIO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomUSUARIO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomUSUARIO.SetENDERECO_IP(const Value: String);
begin
 FieldByName(CNT_ENDERECO_IP).AsString := Value;
end;


procedure TCustomUSUARIO.SetNOME_COMPUTADOR(const Value: String);
begin
 FieldByName(CNT_NOME_COMPUTADOR).AsString := Value;
end;


procedure TCustomUSUARIO.SetUSUARIO_REDE(const Value: String);
begin
 FieldByName(CNT_USUARIO_REDE).AsString := Value;
end;


procedure TCustomUSUARIO.SetUSUARIO_LOGADO(const Value: Boolean);
begin
 FieldByName(CNT_USUARIO_LOGADO).AsBoolean := Value;
end;


procedure TCustomUSUARIO.SetATIVO(const Value: Boolean);
begin
 FieldByName(CNT_ATIVO).AsBoolean := Value;
end;


function TCustomUSUARIO.FindByInd_Usuario(pUSUARIO : String) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'USUARIO';
  fvalue := pUSUARIO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;

function TCustomUSUARIO.FindBypk_Id(pID : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'ID';
  fvalue := pID;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesUSUARIO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesUSUARIO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesUSUARIO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from USUARIO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesUSUARIO.GetID: Integer;
begin
  Result := FieldByName(CNT_ID).AsInteger;
end;


function TCustomSimplesUSUARIO.GetUSUARIO: String;
begin
  Result := FieldByName(CNT_USUARIO).AsString;
end;


function TCustomSimplesUSUARIO.GetSENHA: String;
begin
  Result := FieldByName(CNT_SENHA).AsString;
end;


function TCustomSimplesUSUARIO.GetNOME: String;
begin
  Result := FieldByName(CNT_NOME).AsString;
end;


function TCustomSimplesUSUARIO.GetTIPO_USUARIO: Boolean;
begin
  Result := FieldByName(CNT_TIPO_USUARIO).AsBoolean;
end;


function TCustomSimplesUSUARIO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesUSUARIO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesUSUARIO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesUSUARIO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesUSUARIO.GetENDERECO_IP: String;
begin
  Result := FieldByName(CNT_ENDERECO_IP).AsString;
end;


function TCustomSimplesUSUARIO.GetNOME_COMPUTADOR: String;
begin
  Result := FieldByName(CNT_NOME_COMPUTADOR).AsString;
end;


function TCustomSimplesUSUARIO.GetUSUARIO_REDE: String;
begin
  Result := FieldByName(CNT_USUARIO_REDE).AsString;
end;


function TCustomSimplesUSUARIO.GetUSUARIO_LOGADO: Boolean;
begin
  Result := FieldByName(CNT_USUARIO_LOGADO).AsBoolean;
end;


function TCustomSimplesUSUARIO.GetATIVO: Boolean;
begin
  Result := FieldByName(CNT_ATIVO).AsBoolean;
end;


procedure TCustomSimplesUSUARIO.SetID(const Value: Integer);
begin
  StrCondicao.Add(CNT_ID+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetUSUARIO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetSENHA(const Value: String);
begin
  StrCondicao.Add(CNT_SENHA+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetNOME(const Value: String);
begin
  StrCondicao.Add(CNT_NOME+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetTIPO_USUARIO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_TIPO_USUARIO+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesUSUARIO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesUSUARIO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesUSUARIO.SetENDERECO_IP(const Value: String);
begin
  StrCondicao.Add(CNT_ENDERECO_IP+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetNOME_COMPUTADOR(const Value: String);
begin
  StrCondicao.Add(CNT_NOME_COMPUTADOR+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetUSUARIO_REDE(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_REDE+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO.SetUSUARIO_LOGADO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_USUARIO_LOGADO+' = '+IntToStr(-Ord(Value))); 
end;


procedure TCustomSimplesUSUARIO.SetATIVO(const Value: Boolean);
begin
  StrCondicao.Add(CNT_ATIVO+' = '+IntToStr(-Ord(Value))); 
end;

procedure TCustomSimplesUSUARIO.plMontaCondicao;
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

procedure TCustomSimplesUSUARIO.plOrdenarPor(leIndice : TUSUARIOIndex );
begin
  Case leIndice Of
    usuarioInd_Usuario : lsOrdenar := ' Order By USUARIO';
    usuariopk_Id : lsOrdenar := ' Order By ID';
  End;
end;

procedure TCustomSimplesUSUARIO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesUSUARIO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesUSUARIO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

