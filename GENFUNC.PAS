unit GenFunc;

interface

uses Classes;

function DelphiDateTimeToSGTDate(aDate: TDateTime): Longint;
function NumericFmt(AMasc: String; const Num:Extended) : String;
function Integerof(const Value: String): Integer;
function floatof(const Value: String): Double;
function BoolStr(const Value: Boolean): String;
function StrBool(const Value: String): Boolean;
function SumCalcColumnSection(const ASession: String): String;
procedure ClearObjectList(const AList: TList);
procedure ClearObjectStringList(const AList: TStrings);
function ReportNametoReportSection(const AReportName: String): String;
function CFGNametoCFGReport(const AName: String): String;
procedure FreePointerList(aList: TList);

implementation

uses SysUtils;

const
  STRBOOLEAN: array[Boolean] of String = ('Não', 'Sim');
  SUMSECTION = 'SUM';

function DelphiDateTimeToSGTDate(aDate: TDateTime): Longint;
var DD, MM, YY: Word;
    sDD, sMM, sYY: String;
begin
  DecodeDate(aDate, YY, MM, DD);
  sDD:=IntToStr(DD);
  if  DD < 10 then
      sDD:='0' + sDD;
  sMM:=IntToStr(MM);
  if  MM < 10 then
      sMM:='0' + sMM;
  sYY:=IntToStr(YY);
  Result:=StrToInt(sYY + sMM + sDD);
end;

Function Insere_Caracter(Inform : ShortString) : ShortString;
Var String_Auxiliar, Resto : ShortString;
    ResultadoInteiro, rrrr,yyyy       : Integer;
Begin
  ResultadoInteiro:=Pos('|', Inform);
  While ResultadoInteiro > 0 Do
       Begin
         Delete(Inform, Pos('|', Inform), 1);
         YYYY:=Pos('|', Inform);
         If   YYYY > 0 Then
              Begin
                String_Auxiliar:=Copy(Inform, ResultadoInteiro, YYYY - ResultadoInteiro);
                Delete(Inform, ResultadoInteiro, YYYY - ResultadoInteiro + 1);
                Resto:='';
                While (String_Auxiliar[01] In ['0'..'9']) Do
                     Begin
                       Resto:=Resto + String_Auxiliar[01];
                       Delete(String_Auxiliar, 1, 1);
                     End;
                If   Resto <> '' Then
                     Begin
                       Val(Resto, RRRR, YYYY);
                       If   YYYY = 0 Then
                            Begin
                              While RRRR <> 0 Do
                                   Begin
                                     Insert(String_Auxiliar[01], Inform, ResultadoInteiro);
                                     Dec(RRRR);
                                   End;
                            End;
                     End;
              End;
         ResultadoInteiro:=Pos('|', Inform);
       End;
  Result := Inform;
End;

function NumericFmt(AMasc: String; const Num:Extended) : String;
var
  Editado : String[60];
  Numero  : String[60];
  xxxx, YYYY: Integer;
begin
  AMasc := Insere_Caracter(AMasc);
  if AMasc = '' then
     Result := FloatToStr(Num)
  else
  begin
  If   (Pos('B', AMasc) <> 0)
  And  (Num = 0.0) Then
       Begin
         Editado:='';
         For XXXX:=1 To Length(AMasc) Do
           Editado := Editado+' ';
         Result := Editado;
         Exit;
       End;
  If   (Pos(',', AMasc) = 0)
  Or   (Pos(',', AMasc) = Length(AMasc)) Then
       Str(Num:Length(AMasc):0,Numero)
  Else
       Begin
         Str(Num:Length(AMasc):(Length(AMasc)-Pos(',',AMasc)),Numero);
         Numero[Pos('.',Numero)]:=',';
       End;
  Editado:=AMasc;
  If   (Pos(',',Numero) <> 0)
  And  (Pos(',',AMasc) <> Pos(',',Numero)) Then
       Begin
         While Pos('#',Editado) <> 0 Do Editado[Pos('#',Editado)]:='*';
         While Pos('@',Editado) <> 0 Do Editado[Pos('@',Editado)]:='*';
         Result:=Editado;
         Exit;
       End;
  XXXX:=Length(AMasc);
  YYYY:=XXXX;
  While (XXXX > 0)
  And   (YYYY > 0) Do
       Begin
         If   (Numero[XXXX] = '+')
         Or   (Numero[XXXX] = '-') Then Editado[YYYY]:=Numero[XXXX]
         Else
              Begin
                If   Numero[XXXX] <> ' ' Then
                     Begin
                       While (Editado[YYYY] <> '#')
                       And   (Editado[YYYY] <> '$')
                       And   (Editado[YYYY] <> 'B')
                       And   (Editado[YYYY] <> ',')
                       And   (Editado[YYYY] <> '@') Do Dec(YYYY);
                       Editado[YYYY]:=Numero[XXXX];
                     End
                Else
                     If   Editado[YYYY] = '@' Then Editado[YYYY]:='0'
                     Else 
                          If   (YYYY > 1)
                          And  (Editado[YYYY] = '.')
                          And  (Editado[YYYY-1] = '@') Then
                          Else
                               If   Editado[YYYY] = 'B' Then
                                    Delete(Editado, YYYY, 1)
                               Else Editado[YYYY]:=' ';
              End;
         Dec(XXXX); Dec(YYYY);
       End;
  If   Pos('$', AMasc) <> 0 Then
       Begin
         Delete(Editado,1,5);
         Editado:='R$ '+Editado;
       End;
  If   (Pos('+',AMasc) = 0)
  And  (Pos('-',AMasc) = 0) Then
       Begin
         If   Pos('-',Editado) <> 0 Then Editado[Pos('-',Editado)]:=' ';
         If   Pos('+',Editado) <> 0 Then Editado[Pos('+',Editado)]:=' ';
       End;
  Result := Editado;
  end;
end;

function Integerof(const Value: String): Integer;
var
  lTmp: String;
begin
  lTmp := Trim(Value);
  While Pos(ThousandSeparator, lTmp) > 0 do
    Delete(lTmp, Pos(ThousandSeparator, lTmp), 1);
  if lTmp = '' then
    Result := 0
  else
    Result := StrToInt(lTmp);
end;

function floatof(const Value: String): Double;
var
  lTmp: String;
begin
  lTmp := Trim(Value);
  While Pos(ThousandSeparator, lTmp) > 0 do
    Delete(lTmp, Pos(ThousandSeparator, lTmp), 1);
  if lTmp = '' then
    Result := 0.0
  else
    Result := StrToFloat(lTmp);
end;

function BoolStr(const Value: Boolean): String;
begin
  Result := STRBOOLEAN[Value];
end;

function StrBool(const Value: String): Boolean;
begin
  Result := (STRBOOLEAN[True] = Value);
end;

function SumCalcColumnSection(const ASession: String): String;
begin
  Result := ASession + SUMSECTION;
end;

procedure ClearObjectList(const AList: TList);
var
  iIndex: Longint;
begin
  try
    for iIndex := 0 to AList.Count -1 do
      TObject(AList[iIndex]).Free;
  finally
    AList.Clear;
  end;
end;

procedure ClearObjectStringList(const AList: TStrings);
var
  iIndex: Longint;
begin
  try
    for iIndex := 0 to AList.Count -1 do
      TObject(AList.Objects[iIndex]).Free;
  finally
    AList.Clear;
  end;
end;

function ReportNametoReportSection(const AReportName: String): String;
const
  Valid_CHAR = ['A'..'Z', 'a'..'z', '0'..'9'];
var
  lTmp : String;
  iChar: Longint;
begin
  lTmp := AReportName;
  iChar := 1;
  while iChar <= Length(lTmp) do
  begin
    if not (lTmp[iChar] in Valid_CHAR) then
      Delete(lTmp, iChar, 1)
    else Inc(iChar);
  end;
  Result := 'R' + lTmp;
end;

function CFGNametoCFGReport(const AName: String): String;
begin
  Result := AName + 'RPT.cfg';
end;

procedure FreePointerList(aList: TList);
var
  i: Integer;
begin
  for i := 0 to Pred(aList.Count) do
    Dispose(aList[i]);
  aList.Free;
end;

end.
 