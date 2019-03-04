unit ucLayMENU_ACAO;

interface

uses classes, adodb, variants;

type

 TMENU_ACAOIndex = (menu_acaopk_IdMenu, menu_acaoInd_IdMenuPai);

 TCustomMENU_ACAO = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDMENU: String;
  function GetDESCRICAO_MENU: String;
  function GetACAO_MENU: String;
  function GetIDMENUPAI: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetTEM_BARRA: Boolean;
  procedure SetIDMENU(const Value: String);
  procedure SetDESCRICAO_MENU(const Value: String);
  procedure SetACAO_MENU(const Value: String);
  procedure SetIDMENUPAI(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetTEM_BARRA(const Value: Boolean);
  property IDMENU: String read GetIDMENU write SetIDMENU;
  property DESCRICAO_MENU: String read GetDESCRICAO_MENU write SetDESCRICAO_MENU;
  property ACAO_MENU: String read GetACAO_MENU write SetACAO_MENU;
  property IDMENUPAI: String read GetIDMENUPAI write SetIDMENUPAI;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property TEM_BARRA: Boolean read GetTEM_BARRA write SetTEM_BARRA;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindBypk_IdMenu(pIDMENU : String) : Boolean;
 end;

 TMENU_ACAO = class(TCustomMENU_ACAO)
 public
  property IDMENU;
  property DESCRICAO_MENU;
  property ACAO_MENU;
  property IDMENUPAI;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property TEM_BARRA;
 end;

 TCustomSimplesMENU_ACAO = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDMENU: String;
  function GetDESCRICAO_MENU: String;
  function GetACAO_MENU: String;
  function GetIDMENUPAI: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  function GetTEM_BARRA: Boolean;
  procedure SetIDMENU(const Value: String);
  procedure SetDESCRICAO_MENU(const Value: String);
  procedure SetACAO_MENU(const Value: String);
  procedure SetIDMENUPAI(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  procedure SetTEM_BARRA(const Value: Boolean);
  property IDMENU: String read GetIDMENU write SetIDMENU;
  property DESCRICAO_MENU: String read GetDESCRICAO_MENU write SetDESCRICAO_MENU;
  property ACAO_MENU: String read GetACAO_MENU write SetACAO_MENU;
  property IDMENUPAI: String read GetIDMENUPAI write SetIDMENUPAI;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
  property TEM_BARRA: Boolean read GetTEM_BARRA write SetTEM_BARRA;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TMENU_ACAOIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesMENU_ACAO = class(TCustomSimplesMENU_ACAO)
 public
  property IDMENU;
  property DESCRICAO_MENU;
  property ACAO_MENU;
  property IDMENUPAI;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
  property TEM_BARRA;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDMENU = 'IDMENU';
  CNT_DESCRICAO_MENU = 'DESCRICAO_MENU';
  CNT_ACAO_MENU = 'ACAO_MENU';
  CNT_IDMENUPAI = 'IDMENUPAI';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';
  CNT_TEM_BARRA = 'TEM_BARRA';

constructor TCustomMENU_ACAO.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'MENU_ACAO';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomMENU_ACAO.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomMENU_ACAO.DoBeforePost;
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

function TCustomMENU_ACAO.GetIDMENU: String;
begin
  Result := FieldByName(CNT_IDMENU).AsString;
end;


function TCustomMENU_ACAO.GetDESCRICAO_MENU: String;
begin
  Result := FieldByName(CNT_DESCRICAO_MENU).AsString;
end;


function TCustomMENU_ACAO.GetACAO_MENU: String;
begin
  Result := FieldByName(CNT_ACAO_MENU).AsString;
end;


function TCustomMENU_ACAO.GetIDMENUPAI: String;
begin
  Result := FieldByName(CNT_IDMENUPAI).AsString;
end;


function TCustomMENU_ACAO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomMENU_ACAO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomMENU_ACAO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomMENU_ACAO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomMENU_ACAO.GetTEM_BARRA: Boolean;
begin
  Result := FieldByName(CNT_TEM_BARRA).AsBoolean;
end;


procedure TCustomMENU_ACAO.SetIDMENU(const Value: String);
begin
 FieldByName(CNT_IDMENU).AsString := Value;
end;


procedure TCustomMENU_ACAO.SetDESCRICAO_MENU(const Value: String);
begin
 FieldByName(CNT_DESCRICAO_MENU).AsString := Value;
end;


procedure TCustomMENU_ACAO.SetACAO_MENU(const Value: String);
begin
 FieldByName(CNT_ACAO_MENU).AsString := Value;
end;


procedure TCustomMENU_ACAO.SetIDMENUPAI(const Value: String);
begin
 FieldByName(CNT_IDMENUPAI).AsString := Value;
end;


procedure TCustomMENU_ACAO.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomMENU_ACAO.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomMENU_ACAO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomMENU_ACAO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomMENU_ACAO.SetTEM_BARRA(const Value: Boolean);
begin
 FieldByName(CNT_TEM_BARRA).AsBoolean := Value;
end;


function TCustomMENU_ACAO.FindBypk_IdMenu(pIDMENU : String) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDMENU';
  fvalue := pIDMENU;
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesMENU_ACAO.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesMENU_ACAO.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesMENU_ACAO.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from MENU_ACAO');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesMENU_ACAO.GetIDMENU: String;
begin
  Result := FieldByName(CNT_IDMENU).AsString;
end;


function TCustomSimplesMENU_ACAO.GetDESCRICAO_MENU: String;
begin
  Result := FieldByName(CNT_DESCRICAO_MENU).AsString;
end;


function TCustomSimplesMENU_ACAO.GetACAO_MENU: String;
begin
  Result := FieldByName(CNT_ACAO_MENU).AsString;
end;


function TCustomSimplesMENU_ACAO.GetIDMENUPAI: String;
begin
  Result := FieldByName(CNT_IDMENUPAI).AsString;
end;


function TCustomSimplesMENU_ACAO.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesMENU_ACAO.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesMENU_ACAO.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesMENU_ACAO.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomSimplesMENU_ACAO.GetTEM_BARRA: Boolean;
begin
  Result := FieldByName(CNT_TEM_BARRA).AsBoolean;
end;


procedure TCustomSimplesMENU_ACAO.SetIDMENU(const Value: String);
begin
  StrCondicao.Add(CNT_IDMENU+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMENU_ACAO.SetDESCRICAO_MENU(const Value: String);
begin
  StrCondicao.Add(CNT_DESCRICAO_MENU+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMENU_ACAO.SetACAO_MENU(const Value: String);
begin
  StrCondicao.Add(CNT_ACAO_MENU+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMENU_ACAO.SetIDMENUPAI(const Value: String);
begin
  StrCondicao.Add(CNT_IDMENUPAI+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMENU_ACAO.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMENU_ACAO.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesMENU_ACAO.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesMENU_ACAO.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesMENU_ACAO.SetTEM_BARRA(const Value: Boolean);
begin
  StrCondicao.Add(CNT_TEM_BARRA+' = '+IntToStr(-Ord(Value))); 
end;

procedure TCustomSimplesMENU_ACAO.plMontaCondicao;
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

procedure TCustomSimplesMENU_ACAO.plOrdenarPor(leIndice : TMENU_ACAOIndex );
begin
  Case leIndice Of
    menu_acaopk_IdMenu : lsOrdenar := ' Order By IDMENU';
    menu_acaoInd_IdMenuPai : lsOrdenar := ' Order By IDMENUPAI';
  End;
end;

procedure TCustomSimplesMENU_ACAO.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesMENU_ACAO.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesMENU_ACAO.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

