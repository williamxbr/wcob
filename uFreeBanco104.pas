unit uFreeBanco104;

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBanco104 = class(TFreeClasseBanco)
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

{ TFreeBanco104 }

procedure TFreeBanco104.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if ((Carteira <> '1') and (Carteira <> '8')) then
      raise Exception.Create('Somente as carteiras 1 ou 8 são suportadas!');

    if (Carteira = '1') then
    begin
      if Length(NossoNumero) > 17 then
        raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 17 caracteres!')
      else
        NossoNumero := Padl(NossoNumero, 17, '0');

      if Length(Boleto.Cedente.CodigoCedente) <> 6 then
        raise Exception.Create('O Código do Cedente deve ter 6 caracteres!');

      if Boleto.Cedente.Agencia = '' then
        raise Exception.Create('Defina a agência bancária!');
    end
    else
    begin
      if Length(NossoNumero) > 14 then
        raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 14 caracteres!')
      else
        NossoNumero := Padl(NossoNumero, 14, '0');

      if Length(Boleto.Cedente.CodigoCedente) <> 5 then
        raise Exception.Create('O Código do Cedente deve ter 5 caracteres!');

      if Boleto.Cedente.Agencia = '' then
        raise Exception.Create('Defina a agência bancária!');
    end
  end;
end;

function TFreeBanco104.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
var
  Resto: integer;
  Num, Res: string; D: Char;
begin
  inherited;
  if (Boleto.Carteira = '1') then
  begin
    Num := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') + Boleto.Cedente.CodigoCedente;
    Res := Modulo11(Num, 9, Resto);
    if Length(Res) > 1 then
      D := '0'
    else
      D := Res[1];
    Result := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') + '/' + Boleto.Cedente.CodigoCedente + '-' + D;
  end
  else
    if (Boleto.Carteira = '8') then
    begin
      Num := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') + '870000' + Boleto.Cedente.CodigoCedente;
      Res := Modulo11(Num, 9, Resto);
      if Length(Res) > 1 then
        D := '0'
      else
        D := Res[1];
      Result := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') + '.870.000' + Boleto.Cedente.CodigoCedente
        + '-' + D;
    end
end;

function TFreeBanco104.GetCampoLivre(Boleto: TFreeBoleto): string;
const Filler = '7'; Carteira = '8';
var
  CLivre: string;
begin
  inherited;
  if (Boleto.Carteira = '1') then
    CLivre := '1' + Boleto.Cedente.CodigoCedente + '9' + Boleto.NossoNumero
  else
    if (Boleto.Carteira = '8') then
      CLivre := Boleto.Cedente.CodigoCedente + Padl(Boleto.Cedente.Agencia, 4, '0') + Carteira + Filler + Padl(Boleto.NossoNumero, 14, '0');
  Result := CLivre;
end;

function TFreeBanco104.GetCodigoBanco: string;
begin
  inherited;
  Result := '104';
end;

function TFreeBanco104.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '104-0';
end;

function TFreeBanco104.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
var
  Resto: integer;
  Num, Res: string;
begin
  inherited;
  if (Boleto.Carteira = '1') then
    Num := '9' + Boleto.NossoNumero
  else
    if (Boleto.Carteira = '8') then
      Num := '8' + Padl(Boleto.NossoNumero, 14, '0');
  Res := Modulo11(Num, 9, Resto);
  if Length(Res) > 1 then
    Result := '0'
  else
    Result := Res[1];
end;

function TFreeBanco104.GetNomeBanco: string;
begin
  inherited;
  Result := 'Caixa';
end;

function TFreeBanco104.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  if (Boleto.Carteira = '1') then
    Result := '9' + Boleto.NossoNumero + '-' + GetDigitoNossoNum(Boleto)
  else
    if (Boleto.Carteira = '8') then
      Result := '8' + PadL(Boleto.NossoNumero, 14, '0') + '-' + GetDigitoNossoNum(Boleto);
end;

procedure TFreeBanco104.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if Carteira = '' then Carteira := '1';
    if Aceite = '' then Aceite := 'N';
  end;
end;

initialization
  RegisterClass(TFreeBanco104);

end.

