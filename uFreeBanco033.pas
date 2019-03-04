unit uFreeBanco033;

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBanco033 = class(TFreeClasseBanco)
  published
    procedure ChecarDadosIniciais(Boleto: TFreeBoleto); override;
    procedure InicializaDadosPadroes(Boleto: TFreeBoleto); override;
    function GetCodigoBanco: string; override;
    function GetCodigoBancoComDigito: string; override;
    function GetCampoLivre(Boleto: TFreeBoleto): string; override;
    function FormataAgencCodigoCedente(Boleto: TFreeBoleto): string; override;
    function GetDigitoNossoNum(Boleto: TFreeBoleto): char; override;
    function GetNumeroBancario(Boleto: TFreeBoleto): string; override;
    function GetNomeBanco: string; override;
  end;

implementation

{ TFreeBanco033 }

procedure TFreeBanco033.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Length(NossoNumero) > 7 then
      Raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 7 caracteres!')
    else
      NossoNumero := Padl(NossoNumero,7,'0');

    if Length(Boleto.Cedente.CodigoCedente) <> 11 then
      Raise Exception.Create('O Código do Cedente deve ter 11 caracteres!');

    if Boleto.Cedente.Agencia = '' then
      Raise Exception.Create('Defina a agência bancária!');
  end;
end;

function TFreeBanco033.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Copy(Boleto.Cedente.CodigoCedente, 1, 3) + '.' +
    Copy(Boleto.Cedente.CodigoCedente, 4, 2) + '.' +
    Copy(Boleto.Cedente.CodigoCedente, 6, 5) + '.' +
    Copy(Boleto.Cedente.CodigoCedente, 11, 1);
end;

function TFreeBanco033.GetCampoLivre(Boleto: TFreeBoleto): string;
const Filler: string = '00';
var
  CLivre, D1, D2: string;
  Resto: integer;
begin
  inherited;
  CLivre := Boleto.Cedente.CodigoCedente + Padl(Boleto.NossoNumero, 7, '0') + Filler + GetCodigoBanco;
  D1 := Modulo10(CLivre);
  repeat
    D2 := Modulo11(CLivre + D1, 7, Resto);
    if Resto = 1 then
    begin
      if D1 = '9' then
        D1 := '0'
      else
        if StrToInt(D1) < 9 then D1 := IntToStr(StrToInt(D1) + Resto);
    end;
  until Resto <> 1;
  Result := CLivre + D1 + D2;
end;

function TFreeBanco033.GetCodigoBanco: string;
begin
  inherited;
  Result := '033';
end;

function TFreeBanco033.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result:='033-7';
end;

function TFreeBanco033.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
const
  peso: string = '7319731973';
var
  k, i: integer;
  Num: string;
begin
  inherited;
  Num := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 3, '0') + Padl(Boleto.NossoNumero,7,'0');
  k := 0;
  for i := 1 to 10 do
    k := k + (strToInt(Num[i]) * StrToInt(peso[i]));
  k := (k mod 10);
  if k <> 0 then k := 10 - k;
  Result := chr(48 + k);
end;

function TFreeBanco033.GetNomeBanco: string;
begin
  inherited;
  Result := 'Banespa';
end;

function TFreeBanco033.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 3, '0') + ' ' + Padl(Boleto.NossoNumero,7,'0') + '-' + GetDigitoNossoNum(Boleto);
end;

procedure TFreeBanco033.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if EspecieDoc = '' then EspecieDoc := 'DM - CI';
    if Aceite = '' then Aceite := 'N';
    if Carteira = '' then Carteira := 'COB';
  end;
end;

initialization
  RegisterClass(TFreeBanco033);

end.

