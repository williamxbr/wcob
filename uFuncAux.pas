unit uFuncAux;

interface

function PadL(Oque: string; Tamanho: integer; ComOque: char): string;
function Modulo10(Valor: string): string;
function Modulo11(Valor: string; Base: integer; var Resto: integer): string;
function CalcDigVerificador(CodigoBarras: string): char;

implementation

uses SysUtils;

function PadL(Oque: string; Tamanho: integer; ComOque: char): string;
var
  FillStr: string;
begin
  Oque := trim(Oque);
  SetLength(FillStr, Tamanho);
  FillChar(FillStr[1], Tamanho, ComOque);
  if Length(Oque) > Tamanho then
    Result := Copy(Oque, 1, Tamanho)
  else
    Result := Copy(FillStr, 1, Tamanho - Length(oque)) + Oque;
end;

function Modulo10(Valor: string): string;
var
  Somatoria, P, Resto, Peso, i: integer;
begin
  Peso := 2;  Somatoria := 0;
  for i := Length(Valor) downto 1 do
  begin
    P := StrToInt(Valor[i]) * Peso;
    if P > 9 then
      Inc(Somatoria, P - 9)
    else
      Inc(Somatoria, P);

    if Peso = 2 then
      Peso := 1
    else
      Peso := 2;
  end;

  Resto := Somatoria mod 10;

  if Resto = 0 then
    Result := '0'
  else
    Result := IntToStr(10 - Resto);
end;

function Modulo11(Valor: string; Base: integer; var Resto: integer): string;
var
  Somatoria, P, Peso, i: integer;
begin
  Peso := 2; Somatoria := 0;
  for i := Length(Valor) downto 1 do
  begin
    P := StrToInt(Valor[i]) * Peso;
    Inc(Somatoria, P);

    if Peso < Base then
      Inc(Peso, 1)
    else
      Peso := 2;
  end;

  Resto := Somatoria mod 11;

  if Resto = 0 then
    Result := '0'
  else
    Result := IntToStr(11 - Resto);
end;


function CalcDigVerificador(CodigoBarras: string): char;
var
  Somatoria, P, Peso, i, Resto: integer;
begin
  Peso := 2; Somatoria := 0;
  for i := Length(CodigoBarras) downto 1 do
    if i <> 5 then // Pula a quinta casa, pois eh a propria casa do digito verificador
    begin
      P := StrToInt(CodigoBarras[i]) * Peso;
      Inc(Somatoria, P);
      if Peso < 9 then
        Inc(Peso, 1)
      else
        Peso := 2;
    end;

  Resto := 11 - (Somatoria mod 11);

  if (Resto = 0) or (Resto = 1) or (Resto > 9) then
    Result := '1'
  else
    Result := chr(48 + Resto); // CHR(48) = '0', CHR(49) = '1', etc...
end;

end.

