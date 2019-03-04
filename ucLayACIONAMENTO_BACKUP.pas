unit ucLayACIONAMENTO_BACKUP;

interface

uses classes, adodb, variants;

type

 TACIONAMENTO_BACKUPIndex = (acionamento_backupPK_IDACIONAMENTO, acionamento_backupInd_Cobranca, acionamento_backupInd_Devedor, acionamento_backupInd_IdChamado, acionamento_backupInd_IdTelefone);

 TCustomACIONAMENTO_BACKUP = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDACIONAMENTO: Integer;
  function GetCOBRANCA: Integer;
  function GetDATA_ACIONAMENTO: TDateTime;
  function GetHISTORICO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetSITUACAO: Word;
  function GetIDDEVEDOR: Integer;
  function GetOBSERVACAO: String;
  function GetIDCHAMADO: Integer;
  function GetIDTELEFONE: Integer;
  procedure SetIDACIONAMENTO(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetDATA_ACIONAMENTO(const Value: TDateTime);
  procedure SetHISTORICO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetIDDEVEDOR(const Value: Integer);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetIDCHAMADO(const Value: Integer);
  procedure SetIDTELEFONE(const Value: Integer);
  property IDACIONAMENTO: Integer read GetIDACIONAMENTO write SetIDACIONAMENTO;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property DATA_ACIONAMENTO: TDateTime read GetDATA_ACIONAMENTO write SetDATA_ACIONAMENTO;
  property HISTORICO: String read GetHISTORICO write SetHISTORICO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property IDDEVEDOR: Integer read GetIDDEVEDOR write SetIDDEVEDOR;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property IDCHAMADO: Integer read GetIDCHAMADO write SetIDCHAMADO;
  property IDTELEFONE: Integer read GetIDTELEFONE write SetIDTELEFONE;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByPK_IDACIONAMENTO(pIDACIONAMENTO : Integer) : Boolean;
 end;

 TACIONAMENTO_BACKUP = class(TCustomACIONAMENTO_BACKUP)
 public
  property IDACIONAMENTO;
  property COBRANCA;
  property DATA_ACIONAMENTO;
  property HISTORICO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property SITUACAO;
  property IDDEVEDOR;
  property OBSERVACAO;
  property IDCHAMADO;
  property IDTELEFONE;
 end;

 TCustomSimplesACIONAMENTO_BACKUP = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDACIONAMENTO: Integer;
  function GetCOBRANCA: Integer;
  function GetDATA_ACIONAMENTO: TDateTime;
  function GetHISTORICO: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetSITUACAO: Word;
  function GetIDDEVEDOR: Integer;
  function GetOBSERVACAO: String;
  function GetIDCHAMADO: Integer;
  function GetIDTELEFONE: Integer;
  procedure SetIDACIONAMENTO(const Value: Integer);
  procedure SetCOBRANCA(const Value: Integer);
  procedure SetDATA_ACIONAMENTO(const Value: TDateTime);
  procedure SetHISTORICO(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetSITUACAO(const Value: Word);
  procedure SetIDDEVEDOR(const Value: Integer);
  procedure SetOBSERVACAO(const Value: String);
  procedure SetIDCHAMADO(const Value: Integer);
  procedure SetIDTELEFONE(const Value: Integer);
  property IDACIONAMENTO: Integer read GetIDACIONAMENTO write SetIDACIONAMENTO;
  property COBRANCA: Integer read GetCOBRANCA write SetCOBRANCA;
  property DATA_ACIONAMENTO: TDateTime read GetDATA_ACIONAMENTO write SetDATA_ACIONAMENTO;
  property HISTORICO: String read GetHISTORICO write SetHISTORICO;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property SITUACAO: Word read GetSITUACAO write SetSITUACAO;
  property IDDEVEDOR: Integer read GetIDDEVEDOR write SetIDDEVEDOR;
  property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
  property IDCHAMADO: Integer read GetIDCHAMADO write SetIDCHAMADO;
  property IDTELEFONE: Integer read GetIDTELEFONE write SetIDTELEFONE;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TACIONAMENTO_BACKUPIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesACIONAMENTO_BACKUP = class(TCustomSimplesACIONAMENTO_BACKUP)
 public
  property IDACIONAMENTO;
  property COBRANCA;
  property DATA_ACIONAMENTO;
  property HISTORICO;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property SITUACAO;
  property IDDEVEDOR;
  property OBSERVACAO;
  property IDCHAMADO;
  property IDTELEFONE;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDACIONAMENTO = 'IDACIONAMENTO';
  CNT_COBRANCA = 'COBRANCA';
  CNT_DATA_ACIONAMENTO = 'DATA_ACIONAMENTO';
  CNT_HISTORICO = 'HISTORICO';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_SITUACAO = 'SITUACAO';
  CNT_IDDEVEDOR = 'IDDEVEDOR';
  CNT_OBSERVACAO = 'OBSERVACAO';
  CNT_IDCHAMADO = 'IDCHAMADO';
  CNT_IDTELEFONE = 'IDTELEFONE';

constructor TCustomACIONAMENTO_BACKUP.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'ACIONAMENTO_BACKUP';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomACIONAMENTO_BACKUP.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomACIONAMENTO_BACKUP.DoBeforePost;
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

function TCustomACIONAMENTO_BACKUP.GetIDACIONAMENTO: Integer;
begin
  Result := FieldByName(CNT_IDACIONAMENTO).AsInteger;
end;


function TCustomACIONAMENTO_BACKUP.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomACIONAMENTO_BACKUP.GetDATA_ACIONAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ACIONAMENTO).AsDateTime;
end;


function TCustomACIONAMENTO_BACKUP.GetHISTORICO: String;
begin
  Result := FieldByName(CNT_HISTORICO).AsString;
end;


function TCustomACIONAMENTO_BACKUP.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomACIONAMENTO_BACKUP.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomACIONAMENTO_BACKUP.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomACIONAMENTO_BACKUP.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomACIONAMENTO_BACKUP.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomACIONAMENTO_BACKUP.GetIDDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR).AsInteger;
end;


function TCustomACIONAMENTO_BACKUP.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomACIONAMENTO_BACKUP.GetIDCHAMADO: Integer;
begin
  Result := FieldByName(CNT_IDCHAMADO).AsInteger;
end;


function TCustomACIONAMENTO_BACKUP.GetIDTELEFONE: Integer;
begin
  Result := FieldByName(CNT_IDTELEFONE).AsInteger;
end;


procedure TCustomACIONAMENTO_BACKUP.SetIDACIONAMENTO(const Value: Integer);
begin
 FieldByName(CNT_IDACIONAMENTO).AsInteger := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetCOBRANCA(const Value: Integer);
begin
 FieldByName(CNT_COBRANCA).AsInteger := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetDATA_ACIONAMENTO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ACIONAMENTO).AsDateTime := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetHISTORICO(const Value: String);
begin
 FieldByName(CNT_HISTORICO).AsString := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetSITUACAO(const Value: Word);
begin
 FieldByName(CNT_SITUACAO).AsInteger := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetIDDEVEDOR(const Value: Integer);
begin
 FieldByName(CNT_IDDEVEDOR).AsInteger := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetOBSERVACAO(const Value: String);
begin
 FieldByName(CNT_OBSERVACAO).AsString := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetIDCHAMADO(const Value: Integer);
begin
 FieldByName(CNT_IDCHAMADO).AsInteger := Value;
end;


procedure TCustomACIONAMENTO_BACKUP.SetIDTELEFONE(const Value: Integer);
begin
 FieldByName(CNT_IDTELEFONE).AsInteger := Value;
end;


function TCustomACIONAMENTO_BACKUP.FindByPK_IDACIONAMENTO(pIDACIONAMENTO : Integer) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDACIONAMENTO';
  fvalue := pIDACIONAMENTO;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesACIONAMENTO_BACKUP.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesACIONAMENTO_BACKUP.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesACIONAMENTO_BACKUP.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from ACIONAMENTO_BACKUP');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetIDACIONAMENTO: Integer;
begin
  Result := FieldByName(CNT_IDACIONAMENTO).AsInteger;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetCOBRANCA: Integer;
begin
  Result := FieldByName(CNT_COBRANCA).AsInteger;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetDATA_ACIONAMENTO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ACIONAMENTO).AsDateTime;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetHISTORICO: String;
begin
  Result := FieldByName(CNT_HISTORICO).AsString;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetSITUACAO: Word;
begin
  Result := FieldByName(CNT_SITUACAO).AsInteger;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetIDDEVEDOR: Integer;
begin
  Result := FieldByName(CNT_IDDEVEDOR).AsInteger;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetOBSERVACAO: String;
begin
  Result := FieldByName(CNT_OBSERVACAO).AsString;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetIDCHAMADO: Integer;
begin
  Result := FieldByName(CNT_IDCHAMADO).AsInteger;
end;


function TCustomSimplesACIONAMENTO_BACKUP.GetIDTELEFONE: Integer;
begin
  Result := FieldByName(CNT_IDTELEFONE).AsInteger;
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetIDACIONAMENTO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDACIONAMENTO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetCOBRANCA(const Value: Integer);
begin
  StrCondicao.Add(CNT_COBRANCA+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetDATA_ACIONAMENTO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ACIONAMENTO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetHISTORICO(const Value: String);
begin
  StrCondicao.Add(CNT_HISTORICO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetSITUACAO(const Value: Word);
begin
  StrCondicao.Add(CNT_SITUACAO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetIDDEVEDOR(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDDEVEDOR+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetOBSERVACAO(const Value: String);
begin
  StrCondicao.Add(CNT_OBSERVACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetIDCHAMADO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDCHAMADO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesACIONAMENTO_BACKUP.SetIDTELEFONE(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDTELEFONE+' = '+IntToStr(Value)); 
end;

procedure TCustomSimplesACIONAMENTO_BACKUP.plMontaCondicao;
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

procedure TCustomSimplesACIONAMENTO_BACKUP.plOrdenarPor(leIndice : TACIONAMENTO_BACKUPIndex );
begin
  Case leIndice Of
    acionamento_backupPK_IDACIONAMENTO : lsOrdenar := ' Order By IDACIONAMENTO';
    acionamento_backupInd_Cobranca : lsOrdenar := ' Order By COBRANCA';
    acionamento_backupInd_Devedor : lsOrdenar := ' Order By IDDEVEDOR';
    acionamento_backupInd_IdChamado : lsOrdenar := ' Order By IDCHAMADO';
    acionamento_backupInd_IdTelefone : lsOrdenar := ' Order By IDTELEFONE';
  End;
end;

procedure TCustomSimplesACIONAMENTO_BACKUP.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesACIONAMENTO_BACKUP.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesACIONAMENTO_BACKUP.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

