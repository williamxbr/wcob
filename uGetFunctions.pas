unit uGetFunctions;

interface
Uses
   DB, Windows, Variants, SysUtils, Forms,
   ShellApi, Classes, StrUtils, TypInfo;


function PegaLetraColuna(IntNumber: Integer): String;

procedure CentralizarForm(Me : TForm);

procedure CloneProperties(SourceComp, DestComp: TObject);

function ValidaCNPJ(numCNPJ: string): boolean;

function ValidaCPF(numCPF: string): boolean;

function PrimeiraLetraMaiscula(Str: string): string;

implementation

(******************************************************************************)
function PegaLetraColuna(IntNumber : Integer): String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 256 then
      Result:='IV'
    else
    begin
      if IntNumber > 26 then
      begin
        Result:=Chr(64 + (IntNumber div 26));
        Result:=Result+Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;

procedure CentralizarForm(Me : TForm);
var
  r   : TRect;
  osv : TOSVersionInfo;
begin
  osv.dwOSVersionInfoSize := sizeof(osv);
  GetVersionEx(osv);
  if    osv.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
        begin
          SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);
          Me.Left := ((r.right - r.left) - Me.Width) div 2;
          Me.Top := ((r.bottom - r.top) - Me.Height) div 2;
        end
  else  begin
          Me.Left := (GetSystemMetrics(SM_CXSCREEN) - Me.Width) div 2;
          Me.Top := (GetSystemMetrics(SM_CYSCREEN) - Me.Height) div 2;
        end;
end;

procedure CloneProperties(SourceComp, DestComp: TObject);
var
  Propinfo: PPropInfo;
  Properties: PPropList;
  FCount: Integer;
  FSize: Integer;
  i: Integer;
  PropName: String;
  SourcePropObject: TObject;
  DestPropObject: TObject;
begin
  FCount := GetPropList(SourceComp.ClassInfo, tkAny, nil);
  FSize := FCount * SizeOf(Pointer);
  GetMem(Properties, FSize);
  GetPropList(SourceComp.ClassInfo, tkAny, Properties);
  for i := 0 to FCount-1 do
  begin
    PropName := Properties^[i].Name;
    PropInfo := GetPropInfo(DestComp.ClassInfo, PropName);
    if (PropInfo = nil) or (UpperCase(PropName) = 'NAME') then
      Continue;
    case PropType(SourceComp, PropName) of
      tkInteger,
      tkWChar,
      tkSet,
      tkChar        : SetOrdProp(DestComp,PropName,GetOrdProp(SourceComp,PropName));
      tkString,
      tkLString,
      tkWString     : SetStrProp(DestComp,PropName,GetStrProp(SourceComp,PropName));
      tkEnumeration : SetEnumProp(DestComp,PropName,GetEnumProp(SourceComp,PropName));
      tkFloat       : SetFloatProp(DestComp,PropName,GetFloatProp(SourceComp,PropName));
      tkClass       : begin
                        SourcePropObject := GetObjectProp(SourceComp,PropName);
                        DestPropObject := GetObjectProp(DestComp,PropName);
                        if (SourcePropObject<>nil) and (DestPropObject<>nil)
                        and (SourcePropObject.ClassType.ClassParent.ClassName='TPersistent') then
                          CloneProperties(SourcePropObject,DestPropObject)
                        else
                          SetObjectProp(DestComp,PropName,GetObjectProp(SourceComp,PropName));
                      end;
    end;
  end;
  if Properties <> nil then
    FreeMem(Properties, FSize);
end;

function ValidaCNPJ(numCNPJ: string): boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
ret:=False;
cnpj:='';
//Analisa os formatos
if Length(numCNPJ) = 18 then
    if (Copy(numCNPJ,3,1) + Copy(numCNPJ,7,1) + Copy(numCNPJ,11,1) + Copy(numCNPJ,16,1) = '../-') then
        begin
        cnpj:=Copy(numCNPJ,1,2) + Copy(numCNPJ,4,3) + Copy(numCNPJ,8,3) + Copy(numCNPJ,12,4) + Copy(numCNPJ,17,2);
        ret:=True;
        end;
if Length(numCNPJ) = 14 then
    begin
    cnpj:=numCNPJ;
    ret:=True;
    end;
//Verifica
if ret then
    begin
    try
        //1° digito
        total:=0;
        for x:=1 to 12 do
            begin
            if x < 5 then
                Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
            else
                Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
            end;
        dg1:=11 - (total mod 11);
        if dg1 > 9 then
            dg1:=0;
        //2° digito
        total:=0;
        for x:=1 to 13 do
            begin
            if x < 6 then
                Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
            else
                Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
            end;
        dg2:=11 - (total mod 11);
        if dg2 > 9 then
            dg2:=0;
        //Validação final
        if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
            ret:=True
        else
            ret:=False;
    except
        ret:=False;
        end;
    //Inválidos
    case AnsiIndexStr(cnpj,['00000000000000','11111111111111','22222222222222','33333333333333','44444444444444',

                           '55555555555555','66666666666666','77777777777777','88888888888888','99999999999999']) of

        0..9:   ret:=False;

        end;
    end;
ValidaCNPJ:=ret;
end;

function ValidaCPF(numCPF: string): boolean;
var
    cpf: string;
    x, total, dg1, dg2: Integer;
    ret: boolean;
begin
ret:=True;
for x:=1 to Length(numCPF) do
    if not (numCPF[x] in ['0'..'9', '-', '.', ' ']) then
        ret:=False;
if ret then
    begin
    ret:=True;
    cpf:='';
    for x:=1 to Length(numCPF) do
        if numCPF[x] in ['0'..'9'] then
            cpf:=cpf + numCPF[x];
    if Length(cpf) <> 11 then
        ret:=False;
    if ret then
        begin
        //1° dígito
        total:=0;
        for x:=1 to 9 do
            total:=total + (StrToInt(cpf[x]) * x);
        dg1:=total mod 11;
        if dg1 = 10 then
            dg1:=0;
        //2° dígito
        total:=0;
        for x:=1 to 8 do
            total:=total + (StrToInt(cpf[x + 1]) * (x));
        total:=total + (dg1 * 9);
        dg2:=total mod 11;
        if dg2 = 10 then
            dg2:=0;
        //Validação final
        if dg1 = StrToInt(cpf[10]) then
            if dg2 = StrToInt(cpf[11]) then
                ret:=True;
        //Inválidos

        case AnsiIndexStr(cpf,['00000000000','11111111111','22222222222','33333333333','44444444444',

                               '55555555555','66666666666','77777777777','88888888888','99999999999']) of

            0..9:   ret:=False;

            end;

        end
    else
        begin
        //Se não informado deixa passar
        if cpf = '' then
            ret:=True;
        end;
    end;
ValidaCPF:=ret;
end;

{
Nesta funçao, passa-se como parametro uma string e é retornado a string com a primeira letra de cada palavra em maíuscula. Dúvidas entre em contato pelo msn: h1b3rt0@hotmail.com
}
function PrimeiraLetraMaiscula(Str: string): string;
var
  i: integer;
  esp: boolean;
begin
  str := LowerCase(Trim(str));
  for i := 1 to Length(str) do
  begin
    if i = 1 then
      str[i] := UpCase(str[i])
    else
      begin
        if i <> Length(str) then
        begin
          esp := (str[i] = ' ');
          if esp then
            str[i+1] := UpCase(str[i+1]);
        end;
      end;
  end;
  Result := Str;
end;

end.
