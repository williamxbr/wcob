(*******************************************************************)
(* FreeBOLETO                                                      *)
(*******************************************************************)
(* Autor original: Carlos H. Cantu                                 *)
(*                                                                 *)
(* LICENÇA                                                         *)
(*                                                                 *)
(*    1. O FreeBoleto pode ser distribuído e utilizado livremente  *)
(*       com qualquer tipo de projeto, comercial ou não.           *)
(*    2. Componentes derivados do código do FreeBoleto não podem   *)
(*       ser vendidos e devem manter os créditos originais, e devem*)
(*       estar compatíveis com essa licença.                       *)
(*    3. Qualquer alteração ou melhoria no código do FreeBoleto    *)
(*       deve ser enviada ao autor para ser avaliada e, se         *)
(*       possível, incorporada ao código oficial do componente.    *)
(*    4. A inclusão do suporte de novos bancos ao FreeBoleto deve  *)
(*       ser notificada ao autor, enviando juntamente o código da  *)
(*       unit do banco em questão. A criação de uma nova unit de   *)
(*       suporte a um novo banco deverá ser feita em conjunto com  *)
(*       a criação dos testes unitários (DUNITs) necessários para  *)
(*       garantir o correto funcionamento das rotinas.             *)
(*    5. O autor não se responsabiliza por qualquer dano ou        *)
(*       qualquer outro tipo de problema originado pela utilização *)
(*       desse componente, se isentando de qualquer                *)
(*       responsabilidade sobre a utilização do mesmo.             *)
(*                                                                 *)
(* Mais informações sobre a licença e utilização estão no arquivo  *)
(* Leiame.html, que deve ser distribuído com todas as versões      *)
(* componente.                                                     *)
(*                                                                 *)
(*******************************************************************)

unit uFreeBanco409; //  UNIBANCO

interface

uses classes,
  SysUtils,
  uFreeBoleto,
  uFuncAux;

type
  TFreeBanco409 = class(TFreeClasseBanco)
  private
    function Modulo11Unibanco(Valor: string): string;
    function SuperDigitoNossoNumero(NossoNumeroComDigito: string): string;
    function NossoNumeroComDigito(NossoNumero: string): string;
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

{ TFreeBanco409 }

{*******************************************************************}
{* Método ChecarDadosIniciais(Boleto: TFreeBoleto)                  *}
{*******************************************************************}
{* Rotina executada no início da fase de preparação do boleto      *}
{* Serve para validar se os dados inseridos no TFreeBoleto estão no *}
{* formato correto, ver se os campos obrigatórios foram            *}
{* preenchidos, etc.                                               *}
{*******************************************************************}

procedure TFreeBanco409.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Length(NossoNumero) > 10 then
      raise EFreeBoleto.Create('O tamanho do NossoNúmero não pode ser maior que 10 caracteres!')
    else
      if Length(NossoNumero) < 10 then
        NossoNumero := Padl(NossoNumero, 10, '0');

    if Length(Cedente.ContaCorrente) > 6 then
      raise EFreeBoleto.Create('A conta corrente não pode ter mais que 6 dígitos!')
    else
      if Length(Cedente.ContaCorrente) < 6 then
        NossoNumero := Padl(Cedente.ContaCorrente, 6, '0');

    if Length(Cedente.Agencia) > 4 then
      raise EFreeBoleto.Create('A agência deve ter 4 dígitos!')
    else
      if Length(Cedente.Agencia) < 4 then
        Cedente.Agencia := Padl(Cedente.Agencia, 4, '0');

    if Length(Carteira) <> 1 then
      raise EFreeBoleto.Create('A carteira deve possuir 1 dígito!')
  end;
end;

{*******************************************************************}
{* Método FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;   *}
{*******************************************************************}
{* Formata o string que é usado no preenchimento do campo          *}
{* Agencia/Codigo do Cedente nos boletos                           *}
{*******************************************************************}

function TFreeBanco409.NossoNumeroComDigito(NossoNumero: string): string;
begin
  NossoNumero := Padl(NossoNumero, 10, '0');
  Result := NossoNumero + Modulo11Unibanco(NossoNumero);
end;

function TFreeBanco409.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.Cedente.Agencia + '/' + Boleto.Cedente.ContaCorrente + '-' +
    Boleto.Cedente.DigitoContaCorrente;
end;

{*******************************************************************}
{* Método GetCampoLivre(Boleto: TFreeBoleto): string;               *}
{*******************************************************************}
{* Monta o Campo Livre, que varia de banco para banco.             *}
{*******************************************************************}

function TFreeBanco409.GetCampoLivre(Boleto: TFreeBoleto): string;
var
  NossoNumero: string;
begin
  inherited;
  if Boleto.Carteira = '1' then
  begin
    Result := '5' + // CVT
    boleto.Cedente.CodigoCedente + // Codigo do cedente + digito
    '00' + Padl(boleto.NossoNumero, 15, '0');
  end
  else
    if (Boleto.Carteira = '4') then
    begin
      NossoNumero := NossoNumeroComDigito(Boleto.NossoNumero);
      Result := '04' +
        FormatDateTime('yymmdd', Boleto.Vencimento) +
        Boleto.Cedente.Agencia + Modulo11Unibanco(Boleto.Cedente.Agencia) +
        NossoNumero + SuperDigitoNossoNumero(NossoNumero);
    end;
end;

{*******************************************************************}
{* Método GetCodigoBanco: string;                                  *}
{*******************************************************************}
{* Retorna o código nacional do banco                              *}
{*******************************************************************}

function TFreeBanco409.GetCodigoBanco: string;
begin
  inherited;
  Result := '409'; // UNIBANCO
end;

{*******************************************************************}
{* Método GetCodigoBancoComDigito: string;                         *}
{*******************************************************************}
{* Retorna o código nacional do banco + digito                     *}
{*******************************************************************}

function TFreeBanco409.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '409-0'; // UNIBANCO
end;

{*******************************************************************}
{* Metodo GetDigitoNossoNum(Boleto: TFreeBoleto): char;             *}
{*******************************************************************}
{* Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBanco409.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
var
  resto: integer;
  digito: string;
begin
  inherited;
  digito := Modulo11(Boleto.NossoNumero, 9, resto);
  if (resto = 10) or (resto = 0) then
    Result := '0'
  else
    result := digito[1];
end;

{*******************************************************************}
{* Método GetNomeBanco: string;                                    *}
{*******************************************************************}
{* Retorna o nome do banco, impresso no topo do formulário do      *}
{* boleto                                                          *}
{*******************************************************************}

function TFreeBanco409.GetNomeBanco: string;
begin
  inherited;
  Result := 'Unibanco';
end;

{*******************************************************************}
{* Método GetNumeroBancario(Boleto: TFreeBoleto): string;           *}
{*******************************************************************}
{* Formata o string que é mostrado no boleto impresso no campo     *}
{* Nosso Numero. Cada banco formata isso de uma maneira diferente  *}
{*******************************************************************}

function TFreeBanco409.GetNumeroBancario(Boleto: TFreeBoleto): string;
var
  NossoNumero, SuperDigito: string;
begin
  inherited;
  if Boleto.Carteira = '1' then
    Result := Boleto.NossoNumero + '-' + GetDigitoNossoNum(Boleto)
  else
    if (Boleto.Carteira = '4') then
    begin
      NossoNumero := NossoNumeroComDigito(Boleto.NossoNumero);
      SuperDigito := SuperDigitoNossoNumero(NossoNumero);
      Insert('-', NossoNumero, Length(NossoNumero));
      Result := '1/' + NossoNumero + '/' + SuperDigito;
    end;
end;

{*******************************************************************}
{* Método InicializaDadosPadroes(Boleto: TFreeBoleto);              *}
{*******************************************************************}
{* Inicializa alguns campos com os valores padrões, caso não tenham*}
{* sido especificados no objeto FreeBoleto                          *}
{*******************************************************************}

procedure TFreeBanco409.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if EspecieDoc = '' then EspecieDoc := 'RC';
    if Aceite = '' then Aceite := 'N';
    if Carteira = '' then Carteira := '1'; // Cobrança SIMPLES
  end;
end;

function TFreeBanco409.Modulo11Unibanco(Valor: string): string;
var
  Somatoria, P, Peso, i, Resto, Base: integer;
begin
  Base := 9;
  Peso := 2;
  Somatoria := 0;
  for i := Length(Valor) downto 1 do
  begin
    P := StrToInt(Valor[i]) * Peso;
    Inc(Somatoria, P);

    if Peso < Base then
      Inc(Peso, 1)
    else
      Peso := 2;
  end;

  Somatoria := Somatoria * 10;
  Resto := Somatoria mod 11;

  if (Resto = 0) or (Resto = 10) then
    Result := '0'
  else
    Result := IntToStr(Resto);
end;

function TFreeBanco409.SuperDigitoNossoNumero(NossoNumeroComDigito: string): string;
begin
  Result := Modulo11Unibanco('1' + NossoNumeroComDigito);
end;

initialization
  RegisterClass(TFreeBanco409); // UNIBANCO

end.
