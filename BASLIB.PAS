//*** DATA ATUALIZACAO
//*** SINDICON 18/06/01
//*** IMMOBILE 28/08/01 funcao DIA()


{ Unit sem formulario que armazena rotinas gerais para uso em qualquer sistema Delphi

  Autor : Claudio Yanagui
  Data  : 17/03/1999
  Manutenções :

 }

unit BasLib;

interface
uses SysUtils, DBIProcs, DBTables, DIALOGS, Windows, Classes,
     Controls, BDE,math,db,grids,graphics,forms,dbgrids,messages, Wwtable, Wwdbigrd, Wwdbgrid,Shellapi;

type
    TCaractA = Set of char;
function QtdeMeses(pDatai,pDataf:TdateTime):integer;
function QtdeMesesNV(pDatai,pDataf:TdateTime):integer;
procedure Quebra5Linhas(Extenso : string;
                        wTam: integer;
                        var wsLinha1,wsLinha2,wsLinha3,wsLinha4,wsLinha5:string);
function Abre_Arquivo(const wsDataBaseName,wsArquivo,wsIndice:String;const wttArquivo:TTable;b_message:boolean):boolean;
function Abre_Arquivo_Query(const wsDataBaseName,wsQuery:String;const wttArquivo:TQuery;b_message:boolean):boolean;

function ChequeNumero(const wsNumero_CHQ:String):String;
function wwRLOCK(wtabela:ttable;bcontinuo:boolean):boolean;
function Arredonda(const wvValor:Variant;const wiDecimais:Integer):Variant;
Function Desc_Mes(wnmes:variant):string;
Function Valor_Direita(wc_valor:currency;wi_qtde:integer):string;
function StrZero(const Valor:string;Zeros:integer):string;
function StrZeroLetra(const Valor:string;Zeros:integer):string;
function ZeroStr(const wcValor:Currency;wiZeros:Integer):String;
function  Centra(const wfrase:string;wtam:integer):string;
function PS_SENHA(const wfilial,wempnom,wsystem,wrede_mono,wversao,wusuarios,wdataexp,wprodutos:string): String;
function PS_MOD11(const ps_wvar:string):string;
function PS_MOD10(const ps_wvar:string):string;
function UltimoDiaDoMes(wsDt:string):string;
function PrimeiroDiaDoMes(mDta:string):string;
function ProximoVencimento(wdtini:TDateTime;wNrMeses:integer):TDateTime;
function VencimentoAnterior(wdtini:TDateTime;wNrMeses:integer):TDateTime;
function CheckForWinNT:boolean;
function TiraAcentos(wTexto : String) : String;
Function TiraPontoFlutuante(Valor:string):real;
function Cotacao(const wCodMoeda :string; wDataMoeda :TDateTime; WTableName :TTable): Double;
function ConverteCotacao(const ValorCota :Double; OldValue :Double): Double;
procedure CriaArqTemp(const wsUsuario:String;const TblTabelaTemp:TTable;const wsExtenssao:String);
procedure ZapArqTemp(const TblTabelaTemp:TTable;const wbActive:Boolean);
procedure ApagaArqTemp(const TblTabelaTemp:TTable);
procedure Sound(Freq : Word);
procedure NoSound;
procedure Retorna_Dia_Mes_Ano_Validos(var wi_dia,wi_mes,wi_ano:integer;b_max_ano:boolean);
function Retorna_Data_valida(wsData:string):TDateTime;
function BrancosaEsquerda(const wsCompletar:String;const wiTamanho:Integer):String;
function BrancosaDireita(const wsCompletar:String;const wiTamanho:Integer):String;
procedure SetPort(address, Value:Word);
function GetPort(address:word):word;
function RELATORIO_TEXTO_SIMNAO(ws_texto:string):string;
procedure BAS_BeepPlim;
procedure BAS_BeepErro;
procedure BAS_BeepPronto;
function ChequeSerie(const wsNumero_CHQ:String):String;
function ChequeSerieNumero(const wsNumero_CHQ:String):String;
function  Dia(wdData:Tdatetime):word;
function  Inverte_MesAno(const _wsAnoMes:String):string; // yyyy/mm ---> mm/yyyy
function  Inverte_AnoMes(const _wsAnoMes:String):string; // mm/yyyy ---> yyyy/mm
function  QtdeUsersLogadosBDE:integer;
function  RetornaSerialHD(Drive:String):string;
function  TiraZeroEsquerda(ps_valor:String):string;
function ALOCA_INSTRUCAO(ws_instrucao:string;wc_valor:currency;wi_caracteres:integer):string;
function FormataCodigo(psMascara,psCampo:string):string;
procedure CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; var AFont: TFont;
  var ABrush: TBrush);
procedure CalcCellColors2(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; var AFont: TFont;
  var ABrush: TBrush;wb_inativo:boolean); // usado para inativos
function ResetAutoInc(FileName: TFileName; Base: Longint): Boolean;
function  Codigo_Barras_InfoDigitus(sCodigoBarras: string): string;
procedure Bas_FormKeyPress(Formulario:TForm;Sender: TObject; var Key: Char);
procedure Fecha_Arquivo(wwTabela:TTable);
function CalculaMesAno(const wsMesAno:String;const wiMeses:Integer):String;
procedure ExcluiRegistros(self:TComponent;wsDataBase,wsTabela,wsIndice:string;wacampos:array of const;tTabelaRefresh:TTable); // Exclui Registros de Tabelas filho
procedure Copia_Arquivo_Renomeando(pOrigem, pDestino, sFileName: string);
procedure RenameDir(DirFrom, DirTo: string);
procedure cria_diretorio(psDiretorio:string);
procedure Move_Arquivos(pOrigem, pDestino: string);
procedure Exclui_Diretorio(pOrigem: string);

implementation

function Abre_Arquivo;
begin
   /// Esta funcao abre um arquivo para ser usado temporiamente pelo sistema
   /// wTabela:ttable;
   /// wTabela:=ttable.Create(Self);
   ///    /// if not  Abre_Arquivo('Dblocacao','Contas','',wTabela) then Application.Terminate;
   result:=true;
   wttArquivo.databasename:=wsDataBaseName;
   wttArquivo.tablename := wsArquivo;
   wttArquivo.Indexname :=wsIndice;
   try
     wttArquivo.open;
   except
     if b_message
     then begin
        BAS_beeperro;
        showmessage('O Arquivo Não Pode Ser Aberto'+#13+#13
                   +'Arquivo: '+wsArquivo+#13
                   +'BDE....: '+wsDataBaseName+#13
                   +'Indice : '+wsIndice);
     end;
     result:=false;
   end;
end;

function Abre_Arquivo_Query;
begin
   /// Esta funcao abre uma Queryo para ser usado temporiamente pelo sistema
   /// wTabela:ttable;
   /// wTabela:=ttable.Create(Self);
   ///    /// if not  Abre_Arquivo('Dblocacao','SQL FROM*CONTAS',wTabela) then Application.Terminate;
   result:=true;
   wttArquivo.databasename:=wsDataBaseName;
   wttArquivo.SQL.add(wsQuery);
   try
     wttArquivo.open;
   except
     if b_message
     then
     begin
        BAS_beeperro;
        showmessage('A Query Não pode ser Realizada'+wsQuery);
     end;
     result:=false;
   end;
end;

function  Dia(wdData:Tdatetime):word;
var wwAno,wwMes,wwDia:Word;
begin
     DecodeDate(wdData,wwAno,wwMes,wwDia);
     Result := wwDia;
end;

function ALOCA_INSTRUCAO(ws_instrucao:string;wc_valor:currency;wi_caracteres:integer):string;
var
   wsx1:string;
begin
   result := ws_instrucao + StringOfChar(' ',400);
   wsx1 := FORMATFLOAT(',#0.00',wc_valor);
   if wsx1 = '0,00' then
      exit;
   result:=COPY(result,1,wi_caracteres-LENGTH(wsx1))+wsx1;
end;

procedure CalcCellColors;
////////// chamada no gridcalccellcolors
///     CalcCellColors(Sender,Field,State,Highlight,AFont,ABrush);
///////// incluir em toprowchanged a linha;
/// 	wwdbgrid1.invalidate;
begin
	if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
		ABrush.color := clwhite
	else
		ABrush.Color := $00C0FFFF;  {Or try clYellow}
        Afont.Color := clBlue;
	if highlight then Afont.color := clblack;
        aFont.style := [];
        with (Sender as TwwDBGrid) do   // Coloca a linha ativa em vermelho.
             if CalcCellRow = GetActiveRow then
             begin
                AFont.Color := clRed;
                aFont.style := [fsBold];
             end;
end;
procedure CalcCellColors2;
////////// chamada no gridcalccellcolors
///     CalcCellColors(Sender,Field,State,Highlight,AFont,ABrush);
///////// incluir em toprowchanged a linha;
/// 	wwdbgrid1.invalidate;
begin
   Afont.Color := clBlue;
   IF wb_inativo
   then begin
     ABrush.color := clAqua
   end else begin
	if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
		ABrush.color := clwhite
	else
		ABrush.Color := $00C0FFFF;  {Or try clYellow}
   end;
	if highlight then Afont.color := clblack;
        aFont.style := [];
        with (Sender as TwwDBGrid) do   // Coloca a linha ativa em vermelho.
             if CalcCellRow = GetActiveRow then
             begin
                AFont.Color := clRed;
                aFont.style := [fsBold];
             end;
end;

function ChequeSerieNumero(const wsNumero_CHQ:String):String;
var CHQ_Numero:String;
    CHQ_Serie:String;
begin
     result:=wsNumero_CHQ;
     if wsNumero_CHQ='' then exit;
     CHQ_Numero := ChequeNumero(wsNumero_CHQ);
     CHQ_Serie := ChequeSerie(wsNumero_CHQ);
     if LENGTH(CHQ_Numero+CHQ_Serie)<=9
     then begin
        if CHQ_Serie<>'' then Result := CHQ_Serie+'-'+CHQ_Numero
                         Else Result := CHQ_Numero;
     end
     else  Result := CHQ_Serie+CHQ_Numero;
end;
function ChequeNumero(const wsNumero_CHQ:String):String;
var CHQ_Numero:String;
    wConta:Longint;
begin
     CHQ_Numero := '';
     result:=wsNumero_CHQ;
     if wsNumero_CHQ='' then exit;
     CHQ_Numero := '';
     for wConta := Length(wsNumero_CHQ) downto 1 do
     begin
          if Pos(Copy(wsNumero_CHQ,wConta,1),'0123456789') <> 0
             then CHQ_Numero := Copy(wsNumero_CHQ,wConta,1) + CHQ_Numero;
     end;
     Result := COPY(STRZERO('0'+CHQ_Numero,15),10,6);
end;

function ChequeSerie(const wsNumero_CHQ:String):String;
var CHQ_Serie:String;
    wConta:Integer;
begin
     CHQ_Serie := '';
     for wConta := Length(wsNumero_CHQ) downto 1 do
     begin
          if Pos(Copy(wsNumero_CHQ,wConta,1),'ABCDEFGHIJKLMNOPQRSTUVXYZ') <> 0
             then CHQ_Serie := Copy(wsNumero_CHQ,wConta,1) + CHQ_Serie;
     end;
     Result:=COPY(CHQ_Serie,1,3);
end;

function wwRLOCK(wtabela:ttable;bcontinuo:boolean):boolean;
// tenta editar um registro
VAR
   err:word;
begin
   result:=true;
   repeat
      try
         result:=true;
         wtabela.Edit;
      except
         on E: EDBEngineError do
         begin
            err:= (E as EDBEngineError).Errors[1].errorcode;
            if (err=10241) then
            begin
               result:= false;
               showmessage('Atenção Registro sendo utilizado por outro usuário'
                          +#13+(E as EDBEngineError).Errors[2].message);

            end;
         end;
      end;
   until ((result=true) or (bcontinuo=false));
end;

function  RetornaSerialHD(Drive:String):string;
var
   Serial:Dword;
   DirLen,Flags:Dword;
   DLabel:Array[0..11] of Char;
begin
     try
        GetVolumeInformation(Pchar(Drive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
        Result := TRIM(IntToHex(Serial,8));
     except
        Result := '';
     end;
end;

function QtdeUsersLogadosBDE;
var
  TmpCursor: hDbiCur;
  rslt: dbiResult;
  UsrDesc: USERDesc;
  wcontusuarios:integer;
begin
     wcontusuarios:=0;  // Calcula número de Usuários Logados no BDE no momento
     Check(DbiOpenUserList(TmpCursor));
     repeat
           rslt:= DbiGetNextRecord(TmpCursor, dbiNOLOCK, @UsrDesc, nil);
           if (rslt <> DBIERR_EOF) then
           begin
                wcontusuarios:=wcontusuarios+1;
           end;
     until rslt <> DBIERR_NONE;
     result := wcontusuarios;
     Check(DbiCloseCursor(TmpCursor));
end;

function  Inverte_MesAno(const _wsAnoMes:String):string;  /// yyyy/mm ---> mm/yyyy
begin
  result := Copy(_wsAnoMes, 6, 2) + '/' + Copy(_wsAnoMes, 1, 4);
end;

function  Inverte_AnoMes(const _wsAnoMes:String):string;  /// mm/yyyy ---> yyyy/mm
begin
  result := Copy(_wsAnoMes, 4, 4) + '/' + Copy(_wsAnoMes, 1, 2);
end;

procedure Retorna_Dia_Mes_Ano_Validos(var wi_dia,wi_mes,wi_ano:integer;b_max_ano:boolean);
begin
    wi_dia:=MAX(wi_dia,01);
    wi_dia:=MIN(wi_dia,31);
    wi_mes:=MAX(wi_mes,1);
    wi_mes:=MIN(wi_mes,12);

    if b_max_ano then
    begin
       if wi_ano=0 then wi_ano:=2000
       else if wi_ano<50 then wi_ano := wi_ano+2000
            else if wi_ano<1900 then wi_ano := wi_ano+1900
                 else wi_ano:=MAX(wi_ano,1900);
    end;

    if wi_dia>=29
    then
    begin
        case wi_mes of
        2:begin
             if ((wi_ano mod 4)= 0)
             then
             begin
               // O Windows tem uma falha e não aceita alguns anos como bisextos
               try
                  STRTODATE('29/02/'+INTTOSTR(wi_ano)); // se não aceitar muda para 28
                  wi_dia := MIN(wi_dia,29);
               except
                  wi_dia := MIN(wi_dia,28);
               end;
             end
             else
                wi_dia := MIN(wi_dia,28);
          end;
        4,6,9,11:  wi_dia := MIN(wi_dia,30);
        end;
     end;
end;


function Retorna_Data_valida(wsData:string):TDateTime;
var
    wi_ano,wi_mes,wi_dia:integer;
    code:integer;
    wi:integer;
    ws_tipo:string;
    wsx:string;
begin
     ws_tipo:='dia';
     wsx:='0';
     wi:=0;
     while wi<=length(wsData)
     do begin
        inc(wi);
        if copy(wsdata,wi,1)='/'
        then begin
           if ws_tipo='dia' then
           begin
               VAL(wsx,wi_dia,code);
               ws_tipo:='mes'
           end else if ws_tipo='mes' then
           begin
               VAL(wsx,wi_mes,code);
           end;
           wsx:='0';
        end else wsx:=wsx+copy(wsdata,wi,1);
     end;
     VAL(wsx,wi_ano,code);
    Retorna_Dia_Mes_Ano_Validos(wi_dia,wi_mes,wi_ano,true);
    Result := EncodeDate(wi_ano,wi_mes,wi_dia);
end;

//----------------------------------------------------------------------------------
// Arredondamento de Valores de acordo com o número de casas descimais fornecido.
// Parametros : wvValor - Valor a ser arredondado.
//              wiDecimais - Casas Deecimais.
// Retorna    : Valor Arredondado.
//----------------------------------------------------------------------------------
function Arredonda(const wvValor:Variant;const wiDecimais:Integer):Variant;
var wsValor:String;
begin
     wsValor := FloatToStrF(wvValor,ffFixed,12,wiDecimais);
     Result := StrToFloat(wsValor);
end;
//----------------------------------------------------------------------------------
// Centraliza uma string
// Parametros : wfrase (String a ser centralizada)
//              wtam (Número inteiro para ajuste da centralizacao
// Retorna    : wfrase com espacos em branco a esquerda e a direita
//----------------------------------------------------------------------------------
function  Centra(const wfrase:string;wtam:integer):string;
var i,wspc:integer;
    wstr,wblank:string;
begin
     i:=0;
     wstr:=Trim(wfrase);
     wspc:=(wtam-Length(wstr)) div 2;
     While i<=wspc do
           begin
                insert(' ',wblank,1);
                i:=i+1;
           end;
     result:=wblank+wstr+wblank;
end;
//----------------------------------------------------------------------------------
// Para retornar zeros a esquerda de uma string caracter
// Parametros : valor,qtde de caracteres
// Retorna    : valor com zeros a esquerda
//----------------------------------------------------------------------------------
Function TiraPontoFlutuante(Valor:string):real;
var
  k,y:string;
  x:integer;
  ws_caracteres:string;
begin
   y:='0';        // caso receba um caractere nulo ''

   for x:=1 to length(valor) do
       begin
          if pos(',',y)>0 then ws_caracteres:='0123456789'
                          else ws_caracteres:='0123456789,';
          k:=COPY(valor,x,1);
          if POS(k,ws_caracteres)>0 then
             y:=y+k;

       end;
   result:=STRTOFLOAT(y);
end;

//----------------------------------------------------------------------------------
// Para retornar zeros a esquerda de uma string caracter
// Parametros : valor,qtde de caracteres
// Retorna    : valor com zeros a esquerda
//----------------------------------------------------------------------------------
Function StrZero(const Valor:string;Zeros:integer):string;
var
k,y:string;
x:integer;
begin
   y:='';
   for x:=1 to length(valor) do
       begin
          k:=COPY(valor,x,1);
          if POS(k,'0123456789')>0 then
             y:=y+k;
       end;
   result:='';
   for x:=1 to zeros-length(y) do
       result:=result+'0';
   result:=result+y;
end;

//----------------------------------------------------------------------------------
// Para retornar zeros a esquerda de uma string caracter
// Parametros : valor,qtde de caracteres
// Retorna    : valor com zeros a esquerda
//----------------------------------------------------------------------------------
Function StrZeroLetra(const Valor:string;Zeros:integer):string;
var
k,y:string;
x:integer;
begin
   y:='';
   for x:=1 to length(valor) do
       begin
          k:=COPY(valor,x,1);
          if POS(k,'0123456789ABCDEFGHIJKLMNOPQRSTUWXYZ')>0 then
             y:=y+k;
       end;
   result:='';
   for x:=1 to zeros-length(y) do
       result:=result+'0';
   result:=result+y;
end;

//----------------------------------------------------------------------------------
// para pegar cotação da moeda
// Parametros : Codigo da moeda, Data Cotação, Nome da Tabela
// Retorna    : Um numero formatado com n decimais
//----------------------------------------------------------------------------------
function Cotacao(const wCodMoeda :string; wDataMoeda :TDateTime; WTableName :TTable): Double;
begin
  if WcodMoeda = '00' then
  begin
     Result := 1.000000;
     exit;
  end;
  WTableName.Open;
  Result := 999999999;
  if WTableName.findkey([wCodMoeda,wDataMoeda]) then
     Result := WTableName.FieldbyName('Vl_cotacao').asfloat;
end;

//----------------------------------------------------------------------------------
// para Converter cotação da moeda
// Parametros : Codigo da moeda,Data Cotaçao
// Retorna    : Um numero formatado com n decimais
//----------------------------------------------------------------------------------
function ConverteCotacao(const ValorCota :Double; OldValue :Double): Double;
begin
  Result := OldValue / ValorCota;
end;

//----------------------------------------------------------------------------------
// Para retornar zeros a esquerda de um Número.
// Parametros : valor,qtde de caracteres
// Retorna    : valor com zeros a esquerda
//----------------------------------------------------------------------------------
function ZeroStr(const wcValor:Currency;wiZeros:Integer):String;
var wsValor,wsbase:String;
begin
     wsValor := FloatToStr(wcValor);
     wsbase  := '%.'+IntToStr(wiZeros)+'d';
     Result  := Format(wsbase,[StrToInt(Trim(wsValor))]);
end;


// Para capturar o nome do usuário na rede
function GetUserName: String;
var
cpNetName: Array[0..48] of Char;
iResult: DBIResult;
begin
     iResult := DBIGetNetUserName(cpNetName);
     if iResult <> DBIERR_NONE then
        DBIError(iResult);
     Result := StrPas(cpNetName);
end;

//----------------------------------------------------------------------------------
// Calculo da Personalização
// Parametros : wempnom - Empresa a ser personalizada
//              wsystem - Sistema
//              wrede_mono - (M)ono ou (R)ede
//              wversao    - Versao
//              wusuarios  - Número máximo de usuários permitidos
// Retorna    : Senha de Personalizacao
//-----------------------------------------------------------------------------------
function PS_SENHA(const wfilial,wempnom,wsystem,wrede_mono,wversao,wusuarios,wdataexp,wprodutos:string): String;
var
wfilil,wempnm,wsystm,wverso,wusuaris,wver_sys,woperacao,wdataep:string;
wlen_empnm,wlen_systm,wlen_vrsys:integer;
wsoma,wsoma0,wsoma1,wsoma2:integer;
wpeso,wconta:integer;
wmod11_1od,wmod11_2od,wmod11_3od,wmod11_4od,wmod10_5od,wmod10_6od:string;
vpesos:array[1..5] of integer;

begin
     vpesos[1] := 66;
     vpesos[2] := 65;
     vpesos[3] := 83;
     vpesos[4] := 73;
     vpesos[5] := 83;

     wfilil   := StrZero(wfilial,3);
     wempnm   := Trim(wempnom);
     wempnm   := wempnm+StringOfChar(' ',(50-Length(wempnm)));

     wsystm   := Trim(wsystem);
     wsystm   := wsystm+StringOfChar(' ',(10-Length(wsystm)));

     wverso   := Copy(wversao,1,1)+Copy(wversao,3,1);
     wusuaris := StrZero(wusuarios,3);
     wdataep  := Trim(wdataexp);
     wver_sys := TRIM(wverso + wrede_mono + wfilil + wdataep+wprodutos);

     wlen_empnm := Length(wempnm);
     wlen_systm := Length(wsystm);
     wlen_vrsys := Length(wver_sys);

     wsoma0 := 0;
     wpeso  := 5;
     for wconta := 1 to wlen_vrsys do
     begin
          wsoma0 := wsoma0 + (ord(wver_sys[wconta]) * vpesos[wpeso]);
          if wpeso-1 = 0 then wpeso := 5
                         else wpeso := wpeso-1;
     end;

     wsoma1    := 0;
     wpeso     := 1;
     woperacao := 'wpeso+1';
     for wconta := 1 to wlen_empnm do
     begin
          wsoma1 := wsoma1 + ((ord(wempnm[wconta]) + wsoma0) * vpesos[wpeso]);
          if ((woperacao = 'wpeso+1') and (wpeso >= 5)) then
             begin
                  woperacao := 'wpeso-1';
                  wpeso := wpeso - 1;
             end
             else
             begin
                  if ((woperacao = 'wpeso-1') and (wpeso <= 1)) then
                  begin
                       woperacao := 'wpeso+1';
                       wpeso := wpeso + 1;
                  end
                  else
                  begin
                       if woperacao = 'wpeso+1' then wpeso := wpeso + 1
                                                else wpeso := wpeso - 1;
                  end;
             end;

     end;

     wpeso := 5;
     for wconta := 1 to wlen_systm do
     begin
          wsoma1 := wsoma1 + ((ord(wsystm[wconta]) + wsoma0) * vpesos[wpeso]);
          if wpeso-1 =0 then wpeso := 5
                        else wpeso := wpeso-1;
     end;

     wsoma2 := 0;
     wpeso  := 1;
     for wconta := 1 to length(wusuaris) do
     begin
          wsoma2 := wsoma2 + ((ord(wusuaris[wconta]) + wsoma0) * vpesos[wpeso]);
          if wpeso+1 > 5 then wpeso := 1
                         else wpeso := wpeso+1;
     end;

     wsoma := wsoma1+wsoma2;

     wmod11_1od := PS_MOD11(InttoStr(wsoma1));
     wmod11_2od := PS_MOD11(InttoStr(wsoma1) + wmod11_1od);

     wmod11_3od := PS_MOD11(InttoStr(wsoma2));
     wmod11_4od := PS_MOD11(InttoStr(wsoma2) + wmod11_3od);

     wmod10_5od := PS_MOD10(InttoStr(wsoma1) + wmod11_4od);
     wmod10_6od := PS_MOD10(InttoStr(wsoma2) + wmod10_5od);

     Result :=wmod10_5od+wmod10_6od+Copy(InttoStr(wsoma),1,6)+wmod11_1od+
              wmod11_2od+wmod11_3od+wmod11_4od;
end;

//----------------------------------------------------------------------------------
// Consistência do digito de controle do Módulo 11 de uma variável de ate 20 caracts
// Parametro: ps_wvar
// Retorna  : Codigo do digito calculado
//----------------------------------------------------------------------------------

function PS_MOD11(const ps_wvar:string): String;
var
ps_wsoma,ps_wtam,ps_wi,ps_wresto,ps_wdig:integer;
ps_wfator,ps_wfatorinv:string;
begin
     ps_wsoma     := 0;
     ps_wfator    := '54329876543298765432';
     ps_wfatorinv := '';
     ps_wtam   := Length(ps_wvar);
     ps_wfatorinv := ps_wfatorinv+Copy(ps_wfator,21-ps_wtam,ps_wtam);
     for ps_wi :=ps_wtam downto 1 do
     begin
         ps_wsoma := ps_wsoma + (StrtoInt(Copy(ps_wvar,ps_wi,1)) * StrtoInt(Copy(ps_wfatorinv,ps_wi,1)));
     end;
     ps_wresto := ps_wsoma Mod 11;
     if ps_wresto <= 1 then ps_wdig := 0
                       else ps_wdig := 11-ps_wresto;

     Result:=InttoStr(ps_wdig);

end;
function BrancosaEsquerda(const wsCompletar:String;const wiTamanho:Integer):String;
begin
     Result := StringOfChar(' ',(wiTamanho - Length(wsCompletar))) + wsCompletar;
end;
function BrancosaDireita(const wsCompletar:String;const wiTamanho:Integer):String;
begin
     Result := wsCompletar+StringOfChar(' ',(wiTamanho - Length(wsCompletar)));
end;

//----------------------------------------------------------------------------------
// Consistência do digito de controle do Módulo 10 de uma variável de ate 20 caracts
// Parametro: ps_wvar
// Retorna  : Codigo do digito calculado
//----------------------------------------------------------------------------------
function  TiraZeroEsquerda(ps_valor:String):string;
var i,wilen:integer;
begin
   result:=ps_valor;
   wilen:=length(ps_valor);
   i:=1;
   while i<=wilen
   do begin
      result:=copy(ps_valor,i,wilen-i+1);
      if copy(result,1,1)<>'0' then break;
      INC(i)
   end;
end;

function PS_MOD10(const ps_wvar:string): String;
var
ps_wsoma,ps_wtam,ps_wi,ps_wresto,ps_wdig:integer;
ps_wfator,ps_wfatorinv:string;
begin
     ps_wsoma     := 0;
     ps_wfator    := '21212121212121212121';
     ps_wfatorinv := '';
     ps_wtam   := Length(ps_wvar);
     ps_wfatorinv := ps_wfatorinv+Copy(ps_wfator,21-ps_wtam,ps_wtam);
     for ps_wi :=ps_wtam downto 1 do
     begin
         ps_wsoma := ps_wsoma + (StrtoInt(Copy(ps_wvar,ps_wi,1)) * StrtoInt(Copy(ps_wfatorinv,ps_wi,1)));
     end;
     ps_wresto := ps_wsoma Mod 10;
     if ps_wresto <> 0 then ps_wdig := 10-ps_wresto
                       else ps_wdig := 0;

     Result:=InttoStr(ps_wdig);

end;

{







                   FUNCOES DESENVOLVIDAS PELO MILTON













}
//----------------------------------------------------------------------------------
// Funcao para achar o ultimo dia do mes
// Parametro: mDT sring no formato dd/mm/aaaa
// Retorna  : Retorna data string referente ao ultimo dia do mes
//----------------------------------------------------------------------------------

function UltimoDiaDoMes(wsDt:string):string;
var
    wi_ano,wi_mes,wi_dia:integer;
    code:integer;
begin
     try
        VAL(FORMATDATETIME('mm',STRTODATE(wsdt)),wi_mes,code);
        VAL(FORMATDATETIME('yyyy',STRTODATE(wsdt)),wi_ano,code);
     except
     end;
     wi_dia:=31;

     Retorna_Dia_Mes_Ano_Validos(wi_dia,wi_mes,wi_ano,false);

     Result := DATETOSTR(EncodeDate(wi_ano,wi_mes,wi_dia));
end;
//----------------------------------------------------------------------------------
// Funcao para achar o primeiro dia do mes
// Parametro: mDta sring no formato dd/mm/aaaa
// Retorna  : Retorna data string referente ao primeiro dia do mes
//----------------------------------------------------------------------------------

function PrimeiroDiaDoMes(mDta:string):string;
begin
  try
     result  := '01/'+formatdatetime('mm/yyyy',STRTODATE(mdta));
  except
  end;
end;

// ####### PROCEDURES DE BEEP / CONTROLE FALANTE ########
//----------------------------------------------------------------------------------
// Rotinas de Beep em falante retiradas da internet sem o uso de componente
// Parametro : Nenhum
// Retorna   : Nenhum
//----------------------------------------------------------------------------------

function CheckForWinNT:boolean;
var
 WinVersion : TOSVersionInfo;
begin
  WinVersion.dwOSVersionInfoSize:= SizeOf(WinVersion);
  GetVersionEx(WinVersion);
  Result:=WinVersion.dwPlatformID = VER_PLATFORM_WIN32_NT;
end;  { CheckForWinNT }


procedure CriaArqTemp(const wsUsuario:String;const TblTabelaTemp:TTable;const wsExtenssao:String);
var wiSequenciaArqTemp:Integer;
    wbActive:Boolean;
begin
     wiSequenciaArqTemp := 0;

     with TblTabelaTemp do
     begin
          wbActive := Active;

          Active := False;
          if Exists = True then DeleteTable;

          TableName := '$USU'+ wsUsuario + StrZero(IntToStr(wiSequenciaArqTemp),2) +'.'+ wsExtenssao;
          while Exists = True do
          begin
               wiSequenciaArqTemp := wiSequenciaArqTemp + 1;
               TableName := '$USU'+ wsUsuario + StrZero(IntToStr(wiSequenciaArqTemp),2) +'.'+ wsExtenssao;
          end;
          Active := wbActive;
     end;
end;

procedure ZapArqTemp(const TblTabelaTemp:TTable;const wbActive:Boolean);
begin
     with TblTabelaTemp do
     begin
          Active := False;
          EmptyTable;
          Active := wbActive;
     end;
end;

procedure ApagaArqTemp(const TblTabelaTemp:TTable);
begin
     with TblTabelaTemp do
     begin
          Active := False;
          if Exists = True then DeleteTable;
          TableName := '';
     end;
end;

procedure Sound(Freq : Word);
var
    B : Byte;
begin
    if not CheckForWinNT then
    begin
    if Freq > 18 then
        begin
            Freq := Word(1193181 div LongInt(Freq));
            B := Byte(GetPort($61));

            if (B and 3) = 0 then
               begin
                   SetPort($61, Word(B or 3));
                   SetPort($43, $B6);
               end;

            SetPort($42, Freq);
            SetPort($42, Freq shr 8);
        end;
    end;
end;

procedure NoSound;
var
  Value: Word;
begin
    if not CheckForWinNT then
    begin
         Value := GetPort($61) and $FC;
         SetPort($61, Value);
    end;
end;

procedure SetPort(address, Value:Word);
var
  bValue: byte;
begin
  bValue := trunc(Value and 255);
  asm
    mov dx, address
    mov al, bValue
    out dx, al
  end;
end;

function GetPort(address:word):word;
var
  bValue: byte;
begin
  asm
    mov dx, address
    in al, dx
    mov bValue, al
  end;
  GetPort := bValue;
end;

procedure BAS_BeepPlim;
var
   f,msecs,y:longint;
begin
      msecs:=350;
      f:=GETtickcount;
      Sound(1200);
      repeat
          y:=longint(gettickcount);
      until ((y-f)>=msecs);
      NoSound;
end;

procedure BAS_BeepErro;
var
   f,y,msecs:longint;
begin
      msecs:=700;
      f:=GETtickcount;
      Sound(155);
      repeat
          y:=longint(gettickcount);
      until ((y-f)>=msecs);
      NoSound;
end;

procedure BAS_BeepPronto;
var
   f,y,msecs:longint;
   i:integer;
begin
   msecs:=100;
   for i:=1 to 10
   do begin
      f:=GETtickcount;
      Sound(1500);
      repeat
          y:=longint(gettickcount);
      until ((y-f)>=msecs);
      NoSound;
      repeat
          y:=longint(gettickcount);
      until ((y-f)>=msecs);
   end;
end;
// #### FIM PROCEDURES DE BEEP / CONTROLE FALANTE ########

//----------------------------------------------------------------------------------
// Funcao para exibição da descrição do mes
// Parametro: wnmes mes numérico
// Retorna  : Retorna descricao do mes
//----------------------------------------------------------------------------------

Function Desc_Mes(wnmes:variant):string;
begin
CASE wnmes of
  1:result:='Janeiro';
  2:result:='Fevereiro';
  3:result:='Março';
  4:result:='Abril';
  5:result:='Maio';
  6:result:='Junho';
  7:result:='Julho';
  8:result:='Agosto';
  9:result:='Setembro';
 10:result:='Outubro';
 11:result:='Novembro';
 12:result:='Dezembro';
else
  result:='('+INTTOSTR(wnmes)+')Mês Invalido';
end;
end;
//----------------------------------------------------------------------------------
// Funcao para execucao de consultas em SQL de campos data
// Parametro: wsdata data string no formato dd/mm/aaaa
// Retorna  : Retorna data no formato americano mm/dd/aaaa
//----------------------------------------------------------------------------------

function Data_Americana(wsdata:string):string;
var
wsmes:string;
wsdia:string;
wsano:string;
begin
  wsdia:=COPY(wsdata,1,2);
  wsmes:=COPY(wsdata,4,2);
  wsano:=COPY(wsdata,7,4);
  result:=wsmes+'/'+wsdia+'/'+wsano;
end;

//----------------------------------------------------------------------------------
// Calcula o próximo vencimento de uma prestação (Retirado livro Delphi 3 p/Clippeiros)
// Parametro: wdtini -> Data Inicial : TDateTime
//            wNrMeses - > No de meses p/ o próximo vencimento : Integer
// Retorna  : Data vencimento : TDateTime
//----------------------------------------------------------------------------------
function ProximoVencimento(wdtini:TDateTime;wNrMeses:integer):TDateTime;
var
    wano,wmes,wdia,x,y:word;
    wsdata:string;
    TempDate:Tdatetime;
begin
     TempDate:=wdtini;
     if wnrmeses=0 then
     begin
        result:=TempDate;
        exit;
     end;
     DecodeDate(wdtini,wano,wmes,wdia);
     y:=wmes+wNrMeses;
     x:=wmes;
     while x<y
     do begin
        INC(x);
        if x>12 then
        begin
           x:=1;
           y:=y-12;
           wano:=wano+1;
        end;
     end;
     wmes:=x;
     while true
     do begin
        wsdata:=INTTOSTR(wdia)+'/';
        wsdata:=wsdata+INTTOSTR(wmes)+'/';
        wsdata:=wsdata+INTTOSTR(wano);
        begin
           try
              TempDate := Retorna_Data_valida(wsdata);
           except
              on E: EConvertError do  // aparece msgs apenas ao debugar
              begin
                  DEC(wdia);
                  continue;
              end;
           end;
        end;
        break;
     end;
     result:=TempDate;
end;
function VencimentoAnterior(wdtini:TDateTime;wNrMeses:integer):TDateTime;
var
    wano,wmes,wdia,x:word;
    y:integer;
    wsdata:string;
    TempDate:Tdatetime;
begin
     TempDate:=wdtini;
     if wnrmeses=0 then
     begin
        result:=TempDate;
        exit;
     end;
     DecodeDate(wdtini,wano,wmes,wdia);
     y:=wmes-wNrMeses;
     x:=wmes;
     while x>y
     do begin
        DEC(x);
        if x<1  then
        begin
           x:=12;
           y:=y+12;
           wano:=wano-1;
        end;
     end;
     wmes:=x;
     while true
     do begin
        wsdata:=INTTOSTR(wdia)+'/';
        wsdata:=wsdata+INTTOSTR(wmes)+'/';
        wsdata:=wsdata+INTTOSTR(wano);
        begin
           try
              TempDate := Retorna_Data_valida(wsdata);
           except
              on E: EConvertError do  // aparece msgs apenas ao debugar
              begin
                  DEC(wdia);
                  continue;
              end;
           end;
        end;
        break;
     end;
     result:=TempDate;
end;


//----------------------------------------------------------------------------------
// Tira acentos das vogais do alfabeto português (Retirado de algum livro)
// Parametro: wTexto -> texto a ser convertido
// Retorna  : texto sem acentos
//----------------------------------------------------------------------------------
function TiraAcentos(wTexto : String):String;
var I : integer;
    wCaractA1,wCaractE1,wCaractI1,wCaractO1,wCaractU1,wCaractS :TCaractA;
    wCaractA2,wCaractE2,wCaractI2,wCaractO2,wCaractU2 :TCaractA;
begin
     wCaractA1 := ['Ã','Á','À','Â'];
     wCaractE1 := ['É','È','Ê'];
     wCaractI1 := ['Í','Ì'];
     wCaractO1 := ['Ô','Õ','Ó','Ò'];
     wCaractU1 := ['Ú','Ü','Ù'];

     wCaractA2 := ['à','á','ã'];
     wCaractE2 := ['é','è','ê'];
     wCaractI2 := ['í','ì'];
     wCaractO2 := ['ô','õ','ó','ò'];
     wCaractU2 := ['ú','ü','ù'];

     wCaractS := ['º','ª','"'];

     for I := 1 to Length(wTexto) do
          begin
               if wTexto[I] in wCaractA1 then
                  wTexto[I] := 'A';
               if wTexto[I] in wCaractE1 then
                  wTexto[I] := 'E';
               if wTexto[I] in wCaractI1 then
                  wTexto[I] := 'I';
               if wTexto[I] in wCaractO1 then
                  wTexto[I] := 'O';
               if wTexto[I] in wCaractU1 then
                  wTexto[I] := 'U';
               if wTexto[I] = 'Ç' then
                  wTexto[I] := 'C';

               if wTexto[I] in wCaractA2 then
                  wTexto[I] := 'a';
               if wTexto[I] in wCaractE2 then
                  wTexto[I] := 'e';
               if wTexto[I] in wCaractI2 then
                  wTexto[I] := 'i';
               if wTexto[I] in wCaractO2 then
                  wTexto[I] := 'o';
               if wTexto[I] in wCaractU2 then
                  wTexto[I] := 'u';
               if wTexto[I] = 'ç' then
                  wTexto[I] := 'c';

               if wTexto[I] in wCaractS then
                  wTexto[I] := ' ';
          end;
     Result := wTexto;
end;

Function Valor_Direita(wc_valor:currency;wi_qtde:integer):string;
var
  ws_valor:string;
begin
   ws_valor:=formatfloat(',#0.00',wc_valor);
   while length(ws_valor)<wi_qtde do
   begin
      ws_valor:=' '+ws_valor;
   end;
   result:=ws_valor;
end;

function FormataCodigo(psMascara,psCampo:string):string;
var
  i,x:integer;
begin
  result:='';
  i:=length(psMascara);
  x:=length(psCampo);
  while i>0
  do begin
     if copy(psMascara,i,1)='#'
     then begin
          result:=copy(psCampo,x,1)+result;
          dec(x);
     end
     else result:=copy(psMascara,i,1)+result;
     dec(i);
  end;
end;
function RELATORIO_TEXTO_SIMNAO(ws_texto:string):string;
// retorna para o campo de um relatório a Palavra Sim ou Não
begin
    result := ws_texto;
    if ws_texto='True'  then result := 'Sim';
    if ws_texto='False' then result := 'Não';
    if ws_texto='-1'    then result := 'Sim';
    if ws_texto='0'     then result := 'Não';
end;
procedure Quebra5Linhas(Extenso : string;
                        wTam: integer;
                        var wsLinha1,wsLinha2,wsLinha3,wsLinha4,wsLinha5:string);
var wTamExt,wTamLin,wColI,wColF,wLinha : integer;
    Linhas:array[1..5] of string;
const
    wComplemento = ' ';
begin
     Extenso := Trim(Extenso);
     linhas[1]    := StringOfChar(wComplemento,wTam);
     linhas[2]    := StringOfChar(wComplemento,wTam);
     linhas[3]    := StringOfChar(wComplemento,wTam);;
     linhas[4]    := StringOfChar(wComplemento,wTam);
     linhas[5]    := StringOfChar(wComplemento,wTam);

     wTamExt := length(Extenso);
     wLinha  := 1;
     wColI   := 1;
     wColF   := length(Linhas[wLinha]);
     while True do
     begin
          wTamLin := length(Linhas[wLinha]);
          {ShowMessage('vou verificar' + #13 +
                      'Linha = ' + inttostr(wLinha) + #13 +
                      'Coluna Inicial = ' + inttostr(wColI) + #13 +
                      'Coluna Final = ' + inttostr(wColF) + #13 +
                      'Tamanho da Linha = ' + inttoStr(wTamlin));}
          if (wTamExt <  wTamLin) or (wlinha=5) then
             begin
                  Linhas[wLinha] := copy(Extenso,wColI,wTamExt) +
                                    StringOfChar(wComplemento,wTamLin-wTamExt);
                  break;
             end;
          While True do
          begin
              if copy(Extenso,wColF,1) = ' ' then break;
              wColF := wColF - 1;
          end;
          Extenso[wColF] := wComplemento;
          Linhas[wLinha] := copy(Extenso,wColI,wColF-wColI) +
                            StringOfChar(wComplemento,wTamLin-wColI-wColF);
          wLinha  := wLinha + 1;
          wColI   := wColF + 1;
          wTamExt := length(Extenso)-wColF;
          wColF   := wColI + length(Linhas[wLinha]);
     end;
     wsLinha1 := Linhas[1];
     wsLinha2 := Linhas[2];
     wsLinha3 := Linhas[3];
     wsLinha4 := Linhas[4];
     wsLinha5 := Linhas[5];
end;
/// Funcao para resetar autoinclemento das tabelas, dica do elivaldo
///
function ResetAutoInc(FileName: TFileName; Base: Longint): Boolean;
begin
  result:=true;
  try
     with TFileStream.Create(FileName, fmOpenReadWrite) do
       begin
         Result := (Seek($49, soFromBeginning) = $49) and (Write(Base, 4) = 4);
         Free;
       end;
  except
  end;
end;

function Codigo_Barras_InfoDigitus(sCodigoBarras: string): string;
const
   sBarra09 = 'nnWWnNnwwNnNwwNNNwwnnnWwNNnWwnnNWwnnnwWNNnwWnnNwWn';
   sBarra19 = 'wnNNwWnnnWwNnnWWNnnwwnNnWWnNnwwNNnwwnnNWWnnNwwNnNw';
   sBarra29 = 'nwNNwNwnnWnWnnWNWnnwnwNnWNwNnwnWNnwnwnNWNwnNwnWnNw';
   sBarra39 = 'wwNNnWwnnNwWnnNWWnnnwwNnNWwNnnwWNnnwwnNNWwnNnwWnNn';
   sBarra49 = 'nnWNwNnwnWnNwnWNNwnwnnWnWNnWnwnNWnwnnwNWNnwNwnNwNw';
   sBarra59 = 'wnWNnWnwnNwNwnNWNwnnwnWnNWnWnnwNWnnwnwNNWnwNnwNwNn';
   sBarra69 = 'nwWNnNwwnNnWwnNNWwnnnwWnNNwWnnnWWnnnwwNNNwwNnnWwNn';
   sBarra79 = 'nnNWwNnnwWnNnwWNNnwwnnNwWNnNwwnNNwwnnnWWNnnWwnNnWw';
   sBarra89 = 'wnNWnWnnwNwNnwNWNnwnwnNwNWnNwnwNNwnwnnWNWnnWnwNnWn';
   sBarra99 = 'nwNWnNwnwNnWnwNNWnwnnwNwNNwNwnnWNwnnwnWNNwnWnnWnWn';
var
   I : integer;
   s : string;
begin
   Result := '';
   for I := 1 to 44 do
      if (I div 2) = (I / 2) then
      begin
         s := Copy(sCodigoBarras, I -1, 2);
         case StrToInt(s) of
            0..9   : Result := Result + Copy(sBarra09, StrToInt(s) * 5 + 1, 5);
            10..19 : Result := Result + Copy(sBarra19, (StrToInt(s) - 10) * 5 + 1, 5);
            20..29 : Result := Result + Copy(sBarra29, (StrToInt(s) - 20) * 5 + 1, 5);
            30..39 : Result := Result + Copy(sBarra39, (StrToInt(s) - 30) * 5 + 1, 5);
            40..49 : Result := Result + Copy(sBarra49, (StrToInt(s) - 40) * 5 + 1, 5);
            50..59 : Result := Result + Copy(sBarra59, (StrToInt(s) - 50) * 5 + 1, 5);
            60..69 : Result := Result + Copy(sBarra69, (StrToInt(s) - 60) * 5 + 1, 5);
            70..79 : Result := Result + Copy(sBarra79, (StrToInt(s) - 70) * 5 + 1, 5);
            80..89 : Result := Result + Copy(sBarra89, (StrToInt(s) - 80) * 5 + 1, 5);
            90..99 : Result := Result + Copy(sBarra99, (StrToInt(s) - 90) * 5 + 1, 5);
         end;
      end;
end;

procedure Bas_FormKeyPress(Formulario:TForm;Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
        key:=#0;
        if (Sender is TDBGrid) then
            TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
        else
            Formulario.Perform(WM_NextDlgCtl,0,0);
     end;
end;

procedure Fecha_Arquivo;
begin
   if (wwTabela.CachedUpdates)
   then
   begin
      if (wwtabela.UpdatesPending)
      then
         wwTabela.CommitUpdates;
      wwTabela.CachedUpdates:=false;
   end;
   wwTabela.Filter:='';
   wwTabela.filtered:=false;
   wwTabela.MasterFields:='';
   wwTabela.MasterSource:=Nil;
   wwTabela.indexname:='';
   if wwTabela.active=true
   then wwTabela.cancelrange;
   wwTabela.Close;
end;
function QtdeMeses(pDatai,pDataf:TdateTime):integer;
var
  wd:tdatetime;
//  wDiasRestante:Extended;
  wsi,wsf:string;
begin
  wsi:=DATETOSTR(pDatai);
  wsf:=DATETOSTR(pDataf);
  result:=0;
  while true
  do
  begin
     wd := ProximoVencimento(pDatai,result);
     if wd>=pDataf
     then
        break;
     result:=result+1;
  end;
end;
function QtdeMesesNV(pDatai,pDataf:TdateTime):integer;
var
  wd:tdatetime;
  wsi,wsf:string;
begin
  wsi:=DATETOSTR(pDatai);
  wsf:=DATETOSTR(pDataf);
  result:=0;
  while true
  do
  begin
     wd := ProximoVencimento(pDatai,result+1);
     if wd>pDataf
     then
        break;
     result:=result+1;
  end;
end;
function CalculaMesAno(const wsMesAno:String;const wiMeses:Integer):String;
var wdReferencia:TDate;
begin
   try
      result:=wsMesAno;
      if wsMesAno='' then exit;
      wdReferencia := StrToDateTime('01/'+ wsMesAno);
      wdReferencia := IncMonth(wdReferencia,wiMeses);
      Result := FormatDateTime('mm/yyyy',wdReferencia);
   except
      result:='01/1900';
   end;
end;

procedure ExcluiRegistros;
var
  wTabela:TTable;
  x:integer;
begin
  wTabela:=TTable.create(Self);
  wTabela.DataBaseName:=wsDataBase;
  wTabela.TableName:=wsTabela;
  wTabela.IndexName:=wsIndice;
  tTabelaRefresh.close;
  for x:=1 to 10000
  do
  begin
     try
       wTabela.Open;
       while wtabela.FindKey(wacampos)
       do wTabela.Delete;
       break;
     except
     end;
  end;
  tTabelaRefresh.Open;
end;

procedure Copia_Arquivo_Renomeando(pOrigem, pDestino, sFileName: string);
var
   F : TSHFILEOPSTRUCT;
begin
   IF pDestino='' then exit;
   IF pOrigem='' then exit;
   if not DirectoryExists(pDestino) then
      CreateDir(pDestino);
   FillChar(F, SizeOf(F), 0);
   F.wFunc  := FO_Copy;
   F.pFrom  := PCHAR(pOrigem  + #0);
   F.pTo    := PCHAR(pDestino + #0);
   F.fFlags := FOF_NOCONFIRMATION;
   if ShFileOperation(F) <> 0 then
   begin
      ShowMessage('Falha na cópia de arquivo para o Diretório' + pDestino);
      exit;
   end;
end;
procedure Move_Arquivos(pOrigem, pDestino: string);
var
   F : TSHFILEOPSTRUCT;    //imconv01
begin
   IF pDestino='' then exit;
   IF pOrigem='' then exit;
   if not DirectoryExists(pOrigem) then exit;

   FillChar(F, SizeOf(F), 0);
   F.wFunc  := FO_Move;

   F.pFrom  := PCHAR(pOrigem+'\*.*'  + #0);
   F.pTo    := PCHAR(pDestino + #0);
   F.fFlags := FOF_NOCONFIRMATION;
   cria_diretorio(pDestino);
   if ShFileOperation(F) <> 0 then
   begin
      ShowMessage('Falha ao Mover os arquivos para o Diretório' + pDestino);
      exit;
   end;
   removedirectory(Pchar(pOrigem));
end;
procedure Exclui_Diretorio(pOrigem: string);
var
   F : TSHFILEOPSTRUCT;    //imconv01
begin
   IF pOrigem='' then exit;
   if not DirectoryExists(pOrigem) then exit;

   FillChar(F, SizeOf(F), 0);
   F.wFunc  := FO_DELETE;

   F.pFrom  := PCHAR(pOrigem+'*.*'  + #0);
   F.fFlags := FOF_NOCONFIRMATION;
   if ShFileOperation(F) <> 0 then
   begin
      ShowMessage('Falha na Exclusão dos arquivos e Diretório' + pOrigem);
      exit;
   end;
//   removedirectory(Pchar(pOrigem));
end;
procedure RenameDir(DirFrom, DirTo: string);
var
  shellinfo: TSHFileOpStruct;
begin
  with shellinfo do
  begin
    Wnd    := 0;
    wFunc  := FO_RENAME;
    pFrom  := PChar(DirFrom);
    pTo    := PChar(DirTo);
    fFlags := FOF_FILESONLY or FOF_ALLOWUNDO or
              FOF_SILENT or FOF_NOCONFIRMATION;
  end;
  SHFileOperation(shellinfo);
end;
procedure cria_diretorio(psDiretorio:string);
procedure cria_diretorio2(psDiretorio2:string);
begin
//  showmessage(psDiretorio)
  createdir(TRIM(psDiretorio2));
end;
var
  i,u:integer;
  ws_diretorio:string;
begin
 i:=1;
 u:=2;
  while (i<=length(psDiretorio))
           and
        (i<u)
  do
  begin
     u:=POS('\',copy(psDiretorio,i+1,500));
     if u=0
     then
        ws_diretorio:=ws_diretorio+(copy(psDiretorio,i,500))
     else
        ws_diretorio:=ws_diretorio+(copy(psDiretorio,i,u));
     cria_diretorio2(ws_diretorio);
     i:=length(ws_diretorio)+1;
     u:=i+1;
  end;
end;
end.
