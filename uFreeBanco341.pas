unit uFreeBanco341;

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBanco341 = class(TFreeClasseBanco)
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

{ TFreeBanco341 }

// ATENCAO!!!! Não foi testado com carteiras especiais (ex: 198, etc)

{*******************************************************************}
{* Rotina executada no início da fase de preparaçõa do boleto      *}
{* Serve para validar se os dados inseridos no TFreeBoleto estão no *}
{* formato correto, campos obrigatorios, etc                       *}
{*******************************************************************}

procedure TFreeBanco341.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Length(NossoNumero) > 8 then
      raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 7 caracteres!')
    else
      NossoNumero := Padl(NossoNumero,8,'0');


    if Length(Boleto.Cedente.ContaCorrente) <> 5 then
      raise Exception.Create('A conta corrente deve ter 5 caracteres!');

    if trim(Boleto.Cedente.DigitoContaCorrente) = '' then
      raise Exception.Create('Especifique o dígito da ContaCorrente!');

    if Boleto.Cedente.Agencia = '' then
      raise Exception.Create('Defina a agência bancária!');

    if Length(Boleto.Carteira) <> 3 then
      raise Exception.Create('A carteira deve ter 3 caracteres!');

    if (Pos(Boleto.Carteira, '106 107 122 142 143 195 196 198') <> 0) and
      (trim(Boleto.Cedente.CodigoCedente) = '') then
      raise Exception.Create('Para a carteira ' + Boleto.carteira + ' é necessário definir o código do cedente!');

  end;
end;

{*******************************************************************}
{* Formata o string que é usado no preenchimento do campo          *}
{* Agencia/Codigo do Cedente nos boletos                           *}
{*******************************************************************}

function TFreeBanco341.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.Cedente.Agencia + '/' + Boleto.Cedente.ContaCorrente + '-' + Boleto.Cedente.DigitoContaCorrente;
end;

{*******************************************************************}
{* Monta o Campo Livre, que varia de banco para banco              *}
{*******************************************************************}

function TFreeBanco341.GetCampoLivre(Boleto: TFreeBoleto): string;
const Filler: string = '00';
var
  CLivre: string;
begin
  inherited;
  if Pos(Boleto.Carteira, '106 107 122 142 143 195 196 198') = 0 then
  begin
    Clivre := Boleto.Carteira + Padl(Boleto.NossoNumero, 8, '0') +
      GetDigitoNossoNum(Boleto) +
      Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') +
      Padl(Boleto.Cedente.ContaCorrente, 5, '0') +
      Boleto.Cedente.DigitoContaCorrente +
      '000';
  end
  else
  begin
    Clivre := Boleto.Carteira + Padl(Boleto.NossoNumero, 8, '0') +
      Padl(Boleto.Documento, 7, '0') +
      Padl(Boleto.cedente.CodigoCedente, 5, '0');
    CLivre := CLivre + Modulo10(CLivre) + '0';
  end;

  Result := CLivre;
end;

{*******************************************************************}
{* Retorna o código nacional do banco                              *}
{*******************************************************************}

function TFreeBanco341.GetCodigoBanco: string;
begin
  inherited;
  Result := '341';
end;

{*******************************************************************}
{* Retorna o código nacional do banco + digito                     *}
{*******************************************************************}

function TFreeBanco341.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '341-7';
end;

{*******************************************************************}
{* Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBanco341.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
var
  Num: string;
begin
  inherited;
  if Pos(boleto.carteira, '126 131 146 150 168') <> 0 then
  begin
    Num := Padl(Boleto.Carteira, 3, '0') +
      Padl(Boleto.NossoNumero, 8, '0');
  end
  else
  begin
    Num := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 4, '0') +
      Padl(Boleto.cedente.ContaCorrente, 5, '0') +
      Padl(Boleto.Carteira, 3, '0') +
      Padl(Boleto.NossoNumero, 8, '0');
  end;
  Result := Modulo10(Num)[1];
end;

{*******************************************************************}
{* Retorna o nome do banco, impresso no topo Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBanco341.GetNomeBanco: string;
begin
  inherited;
  Result := 'Itau';
end;

{*******************************************************************}
{* Formata o string que é mostrado no boleto impresso no campo     *}
{* Nosso Numero. Cada banco formata isso de uma maneira diferente  *}
{*******************************************************************}

function TFreeBanco341.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.carteira + '/' + Padl(Boleto.NossoNumero, 8, '0') + '-' + GetDigitoNossoNum(Boleto);
end;

{*******************************************************************}
{* Inicializa alguns campos com os valores padrões, caso não tenham*}
{* sido especificados no objeto FreeBoleto                         *}
{*******************************************************************}

procedure TFreeBanco341.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if EspecieDoc = '' then EspecieDoc := 'DP';
    if Aceite = '' then Aceite := 'N';
  end;
end;

initialization
  RegisterClass(TFreeBanco341);

end.

