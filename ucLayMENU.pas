unit ucLayMENU;

interface

uses classes, adodb;

type
 TCustomMENU = class(TADOTable)
 private
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
 end;

 TMENU = class(TCustomMENU)
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
uses Parametros, uDados,DB, SysUtils;

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

constructor TCustomMENU.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'MENU';
 Connection := Dados.Conexao;
 Open;
 Active := True;
end;


function TCustomMENU.GetIDMENU: String;
begin
  Result := FieldByName(CNT_IDMENU).AsString;
end;


function TCustomMENU.GetDESCRICAO_MENU: String;
begin
  Result := FieldByName(CNT_DESCRICAO_MENU).AsString;
end;


function TCustomMENU.GetACAO_MENU: String;
begin
  Result := FieldByName(CNT_ACAO_MENU).AsString;
end;


function TCustomMENU.GetIDMENUPAI: String;
begin
  Result := FieldByName(CNT_IDMENUPAI).AsString;
end;


function TCustomMENU.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomMENU.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomMENU.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomMENU.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


function TCustomMENU.GetTEM_BARRA: Boolean;
begin
  Result := FieldByName(CNT_TEM_BARRA).AsBoolean;
end;


procedure TCustomMENU.SetIDMENU(const Value: String);
begin
 FieldByName(CNT_IDMENU).AsString := Value;
end;


procedure TCustomMENU.SetDESCRICAO_MENU(const Value: String);
begin
 FieldByName(CNT_DESCRICAO_MENU).AsString := Value;
end;


procedure TCustomMENU.SetACAO_MENU(const Value: String);
begin
 FieldByName(CNT_ACAO_MENU).AsString := Value;
end;


procedure TCustomMENU.SetIDMENUPAI(const Value: String);
begin
 FieldByName(CNT_IDMENUPAI).AsString := Value;
end;


procedure TCustomMENU.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomMENU.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomMENU.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomMENU.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


procedure TCustomMENU.SetTEM_BARRA(const Value: Boolean);
begin
 FieldByName(CNT_TEM_BARRA).AsBoolean := Value;
end;


end.
