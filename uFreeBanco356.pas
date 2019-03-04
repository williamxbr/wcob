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

{*******************************************************************}
{* Unit modelo que deve ser utilizada para a criação das classes   *}
{* para tratamento dos bancos.                                     *}
{*                                                                 *}
{* Utilize essa unit como base para um novo banco.                 *}
{*                                                                 *}
{*******************************************************************}

unit uFreeBanco356; // REAL

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBanco356 = class(TFreeClasseBanco)
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

{ TFreeBanco356 }

{*******************************************************************}
{* Método ChecarDadosIniciais(Boleto: TFreeBoleto)                  *}
{*******************************************************************}
{* Rotina executada no início da fase de preparação do boleto      *}
{* Serve para validar se os dados inseridos no TFreeBoleto estão no *}
{* formato correto, ver se os campos obrigatórios foram            *}
{* preenchidos, etc.                                               *}
{*******************************************************************}

procedure TFreeBanco356.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  // Testando apenas com cobrança SEM REGISTRO

  inherited;
  with Boleto do
  begin
    if Length(NossoNumero) > 13 then
      raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 13 caracteres!')
    else if Length(NossoNumero) < 13 then
      NossoNumero := Padl(NossoNumero, 13, '0');

    if Length(Cedente.ContaCorrente) <> 7 then
      raise Exception.Create('A conta corrente deve ter 7 caracteres!');

//    if trim(Cedente.DigitoContaCorrente) = '' then
//      raise Exception.Create('Especifique o dígito da ContaCorrente!');

    if Cedente.Agencia = '' then
      raise Exception.Create('Defina a agência bancária!')
    else if length(Cedente.Agencia) < 4 then
      Cedente.Agencia := Padl(Cedente.Agencia, 4, '0')
    else if length(Cedente.Agencia) > 4 then
      raise Exception.Create('O número da agência não pode ser maior que 4 dígitos!');

  end;
end;

{*******************************************************************}
{* Método FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;   *}
{*******************************************************************}
{* Formata o string que é usado no preenchimento do campo          *}
{* Agencia/Codigo do Cedente nos boletos                           *}
{*******************************************************************}

function TFreeBanco356.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.Cedente.Agencia + '/' +
    Boleto.Cedente.ContaCorrente + '/' +
    Modulo10(Boleto.NossoNumero + Boleto.Cedente.Agencia + Boleto.Cedente.ContaCorrente);
end;

{*******************************************************************}
{* Método GetCampoLivre(Boleto: TFreeBoleto): string;               *}
{*******************************************************************}
{* Monta o Campo Livre, que varia de banco para banco.             *}
{*******************************************************************}

function TFreeBanco356.GetCampoLivre(Boleto: TFreeBoleto): string;
begin
  inherited;
  with Boleto do
    Result := Cedente.Agencia + Cedente.ContaCorrente + GetDigitoNossoNum(Boleto)+NossoNumero;
  {
  Como exemplo, veja a implementação nas units dos outros bancos
  }
end;

{*******************************************************************}
{* Método GetCodigoBanco: string;                                  *}
{*******************************************************************}
{* Retorna o código nacional do banco                              *}
{*******************************************************************}

function TFreeBanco356.GetCodigoBanco: string;
begin
  inherited;
  Result := '356'; // REAL
end;

{*******************************************************************}
{* Método GetCodigoBancoComDigito: string;                         *}
{*******************************************************************}
{* Retorna o código nacional do banco + digito                     *}
{*******************************************************************}

function TFreeBanco356.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '356-5'; // REAL
end;

{*******************************************************************}
{* Metodo GetDigitoNossoNum(Boleto: TFreeBoleto): char;             *}
{*******************************************************************}
{* Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBanco356.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
begin
  inherited;
  Result := Modulo10(Boleto.NossoNumero + Boleto.Cedente.Agencia + Boleto.Cedente.ContaCorrente)[1];
end;

{*******************************************************************}
{* Método GetNomeBanco: string;                                    *}
{*******************************************************************}
{* Retorna o nome do banco, impresso no topo do formulário do      *}
{* boleto                                                          *}
{*******************************************************************}

function TFreeBanco356.GetNomeBanco: string;
begin
  inherited;
  Result := 'Real';
end;

{*******************************************************************}
{* Método GetNumeroBancario(Boleto: TFreeBoleto): string;           *}
{*******************************************************************}
{* Formata o string que é mostrado no boleto impresso no campo     *}
{* Nosso Numero. Cada banco formata isso de uma maneira diferente  *}
{*******************************************************************}

function TFreeBanco356.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.NossoNumero;
end;

{*******************************************************************}
{* Método InicializaDadosPadroes(Boleto: TFreeBoleto);              *}
{*******************************************************************}
{* Inicializa alguns campos com os valores padrões, caso não tenham*}
{* sido especificados no objeto FreeBoleto                          *}
{*******************************************************************}

procedure TFreeBanco356.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if EspecieDoc = '' then EspecieDoc := '57'; //Sem Registro
    if Aceite = '' then Aceite := 'A';
    if Carteira = '' then Carteira := '20'; // Cobrança SIMPLES
  end;
end;

initialization
  RegisterClass(TFreeBanco356); // REAL

end.

