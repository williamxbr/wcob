unit uFreeBanco151;

{No campo nosso numero, a rotina automaticamente acrescenta o 99 no inicio
do numero (obrigatorio)}

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBanco151 = class(TFreeClasseBanco)
  private
    ModalidadeConta: char;
    procedure ConfiguraModalidadeConta(Modalidade: string);
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

{ TFreeBanco151 }

procedure TFreeBanco151.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Length(Boleto.Cedente.Banco151.ModalidadeConta) <> 2 then
      raise exception.create('Para o banco NossaCaixa é necessário informar o Modelo da Carteira com 2 caracteres!');

    if Length(NossoNumero) > 7 then
      raise Exception.Create('O tamanho do NossoNúmero deve ter no máximo 7 caracteres!')
    else
      NossoNumero := Padl(NossoNumero,7,'0');

    if Boleto.Cedente.Agencia = '' then
      raise Exception.Create('Defina a agência bancária!');
  end;
end;

procedure TFreeBanco151.ConfiguraModalidadeConta(Modalidade: string);
begin
  if length(Modalidade) = 2 then
    ModalidadeConta := Modalidade[2]
  else
    ModalidadeConta := Modalidade[1];
end;

function TFreeBanco151.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  Result := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') +' '+
  Boleto.cedente.Banco151.ModalidadeConta+' '+
  Padl(Boleto.Cedente.ContaCorrente,7,'0') + ' '+
  Boleto.Cedente.DigitoContaCorrente;
end;

function TFreeBanco151.GetCampoLivre(Boleto: TFreeBoleto): string;
var
  CLivre, D1, D2: string;
  Resto: integer;
  recalc: boolean;
begin
  inherited;
  CLivre := '9' +
    Copy(Padl('99'+Boleto.NossoNumero, 9, '0'), 2, 8) +
    Padl(Boleto.Cedente.Agencia, 4, '0') +
    ModaLidadeConta +
    Padl(Boleto.cedente.ContaCorrente, 6, '0') +
    '151';
  D1 := Modulo10(CLivre);
  repeat
    recalc := true;
    D2 := Modulo11(CLivre + D1, 7, Resto);
    case Resto of
      0: D2 := '0';
      1: begin
          recalc := false;
          if D1 = '9' then
            D1 := '0'
          else
            D1 := IntToStr(StrToInt(D1) + 1);
        end;
    end;
  until recalc;
  Result := CLivre + D1 + D2;
end;

function TFreeBanco151.GetCodigoBanco: string;
begin
  inherited;
  Result := '151';
end;

function TFreeBanco151.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '151-1';
end;

function TFreeBanco151.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
const
  peso: string = '31973197319731319731973';
var
  k, i: integer;
  Num: string;
begin
  inherited;
  Num := Padl(Boleto.Cedente.Agencia, 4, '0') +
    Boleto.Cedente.Banco151.ModalidadeConta +
    Padl(Boleto.Cedente.ContaCorrente, 7, '0') +
    Boleto.Cedente.DigitoContaCorrente +
    Padl('99'+Boleto.NossoNumero, 9, '0');

  k := 0;
  for i := 1 to 23 do
    k := k + (strToInt(Num[i]) * StrToInt(peso[i]));
  k := (k mod 10);
  if k <> 0 then k := 10 - k;
  Result := chr(48 + k);
end;

function TFreeBanco151.GetNomeBanco: string;
begin
  inherited;
  Result := 'NossaCaixa';
end;

function TFreeBanco151.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result :=  Padl('99'+Boleto.NossoNumero, 9, '0') + '-' + GetDigitoNossoNum(Boleto);
end;

procedure TFreeBanco151.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if Carteira = '' then Carteira := 'CIDENT';
    if Aceite = '' then Aceite := 'N';
    ConfiguraModalidadeConta(Boleto.Cedente.Banco151.ModalidadeConta);
  end;
end;

initialization
  RegisterClass(TFreeBanco151);

end.

