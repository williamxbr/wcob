unit ucLayUSUARIO_MENU;

interface

uses classes, adodb, variants;

type

 TUSUARIO_MENUIndex = (usuario_menuPk_IdUsuario_IdMenu);

 TCustomUSUARIO_MENU = class(TADOTable)
 private
 protected
 procedure DoBeforePost; override;
  function GetIDUSUARIO: Integer;
  function GetIDMENU: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDUSUARIO(const Value: Integer);
  procedure SetIDMENU(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDUSUARIO: Integer read GetIDUSUARIO write SetIDUSUARIO;
  property IDMENU: String read GetIDMENU write SetIDMENU;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  procedure Carrega(Filtro : Boolean);
  function FindByPk_IdUsuario_IdMenu(pIDUSUARIO : Integer; pIDMENU : String) : Boolean;
 end;

 TUSUARIO_MENU = class(TCustomUSUARIO_MENU)
 public
  property IDUSUARIO;
  property IDMENU;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

 TCustomSimplesUSUARIO_MENU = class(TADOQuery)
 private
   StrCondicao  : TStringList;
   lsOrdenar    : String;
   procedure plMontaCondicao;
 protected
  function GetIDUSUARIO: Integer;
  function GetIDMENU: String;
  function GetUSUARIO_INCLUSAO: String;
  function GetUSUARIO_ALTERACAO: String;
  function GetDATA_INCLUSAO: TDateTime;
  function GetDATA_ALTERACAO: TDateTime;
  procedure SetIDUSUARIO(const Value: Integer);
  procedure SetIDMENU(const Value: String);
  procedure SetUSUARIO_INCLUSAO(const Value: String);
  procedure SetUSUARIO_ALTERACAO(const Value: String);
  procedure SetDATA_INCLUSAO(const Value: TDateTime);
  procedure SetDATA_ALTERACAO(const Value: TDateTime);
  property IDUSUARIO: Integer read GetIDUSUARIO write SetIDUSUARIO;
  property IDMENU: String read GetIDMENU write SetIDMENU;
  property USUARIO_INCLUSAO: String read GetUSUARIO_INCLUSAO write SetUSUARIO_INCLUSAO;
  property USUARIO_ALTERACAO: String read GetUSUARIO_ALTERACAO write SetUSUARIO_ALTERACAO;
  property DATA_INCLUSAO: TDateTime read GetDATA_INCLUSAO write SetDATA_INCLUSAO;
  property DATA_ALTERACAO: TDateTime read GetDATA_ALTERACAO write SetDATA_ALTERACAO;
 public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  procedure CarregaSQL;
  procedure plOrdenarPor(leIndice : TUSUARIO_MENUIndex );
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : TDateTime); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : Integer); overload;
  procedure plBetween(Campo : String; cValorInicial, cValorFinal : String); overload;
 end;

 TSimplesUSUARIO_MENU = class(TCustomSimplesUSUARIO_MENU)
 public
  property IDUSUARIO;
  property IDMENU;
  property USUARIO_INCLUSAO;
  property USUARIO_ALTERACAO;
  property DATA_INCLUSAO;
  property DATA_ALTERACAO;
 end;

implementation
uses Parametros, DB, SysUtils;

Const
  CNT_IDUSUARIO = 'IDUSUARIO';
  CNT_IDMENU = 'IDMENU';
  CNT_USUARIO_INCLUSAO = 'USUARIO_INCLUSAO';
  CNT_USUARIO_ALTERACAO = 'USUARIO_ALTERACAO';
  CNT_DATA_INCLUSAO = 'DATA_INCLUSAO';
  CNT_DATA_ALTERACAO = 'DATA_ALTERACAO';

constructor TCustomUSUARIO_MENU.Create(AOwner: TComponent);
begin
 inherited;
 TableName := 'USUARIO_MENU';
 Connection := TUniqueParametros.GetParametros.Conexao;
end;

procedure TCustomUSUARIO_MENU.Carrega(Filtro: Boolean);
begin
 Open;
 Active := True;
end;

procedure TCustomUSUARIO_MENU.DoBeforePost;
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

function TCustomUSUARIO_MENU.GetIDUSUARIO: Integer;
begin
  Result := FieldByName(CNT_IDUSUARIO).AsInteger;
end;


function TCustomUSUARIO_MENU.GetIDMENU: String;
begin
  Result := FieldByName(CNT_IDMENU).AsString;
end;


function TCustomUSUARIO_MENU.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomUSUARIO_MENU.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomUSUARIO_MENU.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomUSUARIO_MENU.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomUSUARIO_MENU.SetIDUSUARIO(const Value: Integer);
begin
 FieldByName(CNT_IDUSUARIO).AsInteger := Value;
end;


procedure TCustomUSUARIO_MENU.SetIDMENU(const Value: String);
begin
 FieldByName(CNT_IDMENU).AsString := Value;
end;


procedure TCustomUSUARIO_MENU.SetUSUARIO_INCLUSAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_INCLUSAO).AsString := Value;
end;


procedure TCustomUSUARIO_MENU.SetUSUARIO_ALTERACAO(const Value: String);
begin
 FieldByName(CNT_USUARIO_ALTERACAO).AsString := Value;
end;


procedure TCustomUSUARIO_MENU.SetDATA_INCLUSAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_INCLUSAO).AsDateTime := Value;
end;


procedure TCustomUSUARIO_MENU.SetDATA_ALTERACAO(const Value: TDateTime);
begin
 FieldByName(CNT_DATA_ALTERACAO).AsDateTime := Value;
end;


function TCustomUSUARIO_MENU.FindByPk_IdUsuario_IdMenu(pIDUSUARIO : Integer; pIDMENU : String) : Boolean;
var
  ffield : String;
  fvalue : Variant;
  opts   : TLocateOptions;
Begin
  ffield := 'IDUSUARIO;IDMENU';
  fvalue := VarArrayOf([pIDUSUARIO,pIDMENU]);
  opts := [loCaseInsensitive];
  Result := Locate(ffield, fvalue, opts);
End;


constructor TCustomSimplesUSUARIO_MENU.Create(AOwner: TComponent);
begin
 inherited;
 Connection := TUniqueParametros.GetParametros.Conexao;
 StrCondicao := TStringList.Create;
 lsOrdenar   := '';
end;

destructor TCustomSimplesUSUARIO_MENU.Destroy;
begin
 StrCondicao.Free;
 inherited;
end;

procedure TCustomSimplesUSUARIO_MENU.CarregaSQL;
begin
 Active := False;
 SQL.Clear;
 SQL.Add('Select * from USUARIO_MENU');
 plMontaCondicao;
 SQL.Add(lsOrdenar);
 Open;
 Active := True;
end;


function TCustomSimplesUSUARIO_MENU.GetIDUSUARIO: Integer;
begin
  Result := FieldByName(CNT_IDUSUARIO).AsInteger;
end;


function TCustomSimplesUSUARIO_MENU.GetIDMENU: String;
begin
  Result := FieldByName(CNT_IDMENU).AsString;
end;


function TCustomSimplesUSUARIO_MENU.GetUSUARIO_INCLUSAO: String;
begin
  Result := FieldByName(CNT_USUARIO_INCLUSAO).AsString;
end;


function TCustomSimplesUSUARIO_MENU.GetUSUARIO_ALTERACAO: String;
begin
  Result := FieldByName(CNT_USUARIO_ALTERACAO).AsString;
end;


function TCustomSimplesUSUARIO_MENU.GetDATA_INCLUSAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_INCLUSAO).AsDateTime;
end;


function TCustomSimplesUSUARIO_MENU.GetDATA_ALTERACAO: TDateTime;
begin
  Result := FieldByName(CNT_DATA_ALTERACAO).AsDateTime;
end;


procedure TCustomSimplesUSUARIO_MENU.SetIDUSUARIO(const Value: Integer);
begin
  StrCondicao.Add(CNT_IDUSUARIO+' = '+IntToStr(Value)); 
end;


procedure TCustomSimplesUSUARIO_MENU.SetIDMENU(const Value: String);
begin
  StrCondicao.Add(CNT_IDMENU+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO_MENU.SetUSUARIO_INCLUSAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_INCLUSAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO_MENU.SetUSUARIO_ALTERACAO(const Value: String);
begin
  StrCondicao.Add(CNT_USUARIO_ALTERACAO+' = '+QuotedStr(Value)); 
end;


procedure TCustomSimplesUSUARIO_MENU.SetDATA_INCLUSAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_INCLUSAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;


procedure TCustomSimplesUSUARIO_MENU.SetDATA_ALTERACAO(const Value: TDateTime);
begin
  StrCondicao.Add(CNT_DATA_ALTERACAO+' = #'+FormatDateTime('mm/dd/yyyy',Value)+'#'); 
end;

procedure TCustomSimplesUSUARIO_MENU.plMontaCondicao;
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

procedure TCustomSimplesUSUARIO_MENU.plOrdenarPor(leIndice : TUSUARIO_MENUIndex );
begin
  Case leIndice Of
    usuario_menuPk_IdUsuario_IdMenu : lsOrdenar := ' Order By IDUSUARIO,IDMENU';
  End;
end;

procedure TCustomSimplesUSUARIO_MENU.plBetween(Campo: String; cValorInicial,
  cValorFinal: TDateTime);
begin
  StrCondicao.Add(Campo + ' BETWEEN #'+ FormatDateTime('mm/dd/yyyy',cValorInicial) + '# AND #'+ FormatDateTime('mm/dd/yyyy',cValorFinal) + '#');
end;

procedure TCustomSimplesUSUARIO_MENU.plBetween(Campo: String; cValorInicial,
  cValorFinal: Integer);
begin
  StrCondicao.Add(Campo + ' BETWEEN '+ IntToStr(cValorInicial) + ' AND '+ IntToStr(cValorFinal));
end;

procedure TCustomSimplesUSUARIO_MENU.plBetween(Campo, cValorInicial,
  cValorFinal: String);
begin
  StrCondicao.Add(Campo + ' BETWEEN ' + cValorInicial + ' AND '+ cValorFinal);
end;

end.

