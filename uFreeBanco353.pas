unit uFreeBanco353;
{Unit desenvolvida por Fábio Gomes <fabio.gomes@cadena.com.br>}
interface

uses classes,
  SysUtils,
  uFreeBoleto,
  uFuncAux;

type
  TFreeBanco353 = class(TFreeClasseBanco)
  published
    procedure ChecarDadosIniciais(Boleto: TFreeBoleto); override;
    procedure InicializaDadosPadroes(Boleto: TFreeBoleto); override;
    function GetCodigoBanco: string; override;
    function GetCodigoBancoComDigito: string; override;
    function GetCampoLivre(Boleto: TFreeBoleto): string; override;
    function FormataAgencCodigoCedente(Boleto: TFreeBoleto): string; override;
    function GetDigitoNossoNum(Boleto: TFreeBoleto): string; reintroduce;
    function GetNumeroBancario(Boleto: TFreeBoleto): string; override;
    function GetNomeBanco: string; override;
  end;

implementation

{ TFreeBanco353 }

procedure TFreeBanco353.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Length(NossoNumero) > 7 then
      raise EFreeBoleto.Create('O tamanho do NossoNúmero não pode ser maior que 7 caracteres!')
    else
      NossoNumero := Padl(NossoNumero, 7, '0');

    if Length(Boleto.Cedente.CodigoCedente) <> 7 then
      raise EFreeBoleto.Create('O Código do Cedente deve ter 7 caracteres!');

    if Boleto.Cedente.Agencia = '' then
      raise EFreeBoleto.Create('Defina a agência bancária!');
  end;
end;

function TFreeBanco353.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.Cedente.Agencia + ' / ' + Boleto.Cedente.CodigoCedente;
end;

function TFreeBanco353.GetCampoLivre(Boleto: TFreeBoleto): string;
begin
  Result := '9' + Copy(Boleto.Cedente.CodigoCedente, 1, 7) + PadL(Boleto.NossoNumero, 13, '0') + '0' + '102';
end;

function TFreeBanco353.GetCodigoBanco: string;
begin
  inherited;
  Result := '353';
end;

function TFreeBanco353.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '353-0';
end;

function TFreeBanco353.GetDigitoNossoNum(Boleto: TFreeBoleto): string;
const
  peso: string = '23456789';
var
  k, i, ii: integer;
  Num: string;
begin
  inherited;
  Num := Padl(Boleto.NossoNumero, 12, '0');
  k := 0;
  ii := 1;
  for i := 1 to 12 do
  begin
    if ii > 8 then ii := 1;
    k := k + (strToInt(Num[i]) * StrToInt(peso[ii]));
    ii := ii + 1;
  end;
  k := (k mod 11);
  if (k <> 0) and (k <> 1) and (k <> 10) then
    k := 11 - k;

  if (k = 10) then
    Result := '01'
  else
    Result := IntToStr(k);
end;

function TFreeBanco353.GetNomeBanco: string;
begin
  inherited;
  Result := 'Santander';
end;

function TFreeBanco353.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Padl(Boleto.NossoNumero, 12, '0') + '-' + GetDigitoNossoNum(Boleto);
end;

procedure TFreeBanco353.InicializaDadosPadroes(Boleto: TFreeBoleto);
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
  RegisterClass(TFreeBanco353);

end.

