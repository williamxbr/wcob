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

unit uFreeBanco237; // BRADESCO

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type                          
  TFreeBanco237 = class(TFreeClasseBanco)
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

{ TFreeBanco237 }

{*******************************************************************}
{* Método ChecarDadosIniciais(Boleto: TFreeBoleto)                  *}
{*******************************************************************}
{* Rotina executada no início da fase de preparação do boleto      *}
{* Serve para validar se os dados inseridos no TFreeBoleto estão no *}
{* formato correto, ver se os campos obrigatórios foram            *}
{* preenchidos, etc.                                               *}
{*******************************************************************}

procedure TFreeBanco237.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Length(NossoNumero) > 11 then
      raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 11 caracteres!')
    else
      if Length(NossoNumero) < 11 then
        NossoNumero := Padl(NossoNumero, 11, '0');

    if Length(Cedente.ContaCorrente) > 7 then
      raise Exception.Create('A conta corrente não pode ter mais que 7 dígitos!')
    else
      if Length(Cedente.ContaCorrente) < 7 then
        Cedente.ContaCorrente := Padl(Cedente.ContaCorrente, 7, '0');

    if Length(Cedente.Agencia) > 4 then
      raise Exception.Create('A agência deve ter 4 dígitos!')
    else
      if Length(Cedente.Agencia) < 4 then
        Cedente.Agencia := Padl(Cedente.Agencia, 4, '0');

    if Length(Carteira) <> 2 then
      raise Exception.Create('A carteira deve possuir 2 dígitos!')
  end;
end;

{*******************************************************************}
{* Método FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;   *}
{*******************************************************************}
{* Formata o string que é usado no preenchimento do campo          *}
{* Agencia/Codigo do Cedente nos boletos                           *}
{*******************************************************************}

function TFreeBanco237.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Copy(Boleto.Cedente.Agencia, 1, 4) + '/' + // não coloquei o digito da agencia
    Boleto.Cedente.ContaCorrente + '-' + Boleto.Cedente.DigitoContaCorrente;
end;

{*******************************************************************}
{* Método GetCampoLivre(Boleto: TFreeBoleto): string;               *}
{*******************************************************************}
{* Monta o Campo Livre, que varia de banco para banco.             *}
{*******************************************************************}

function TFreeBanco237.GetCampoLivre(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.Cedente.Agencia +
    Boleto.Carteira +
    Boleto.NossoNumero +
    Boleto.cedente.ContaCorrente +
    '0';
end;

{*******************************************************************}
{* Método GetCodigoBanco: string;                                  *}
{*******************************************************************}
{* Retorna o código nacional do banco                              *}
{*******************************************************************}

function TFreeBanco237.GetCodigoBanco: string;
begin
  inherited;
  Result := '237'; // 237 é o código do BRADESCO
end;

{*******************************************************************}
{* Método GetCodigoBancoComDigito: string;                         *}
{*******************************************************************}
{* Retorna o código nacional do banco + digito                     *}
{*******************************************************************}

function TFreeBanco237.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '237-2'; // Bradesco
end;

{*******************************************************************}
{* Metodo GetDigitoNossoNum(Boleto: TFreeBoleto): char;             *}
{*******************************************************************}
{* Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBanco237.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
var
  Num: string; resto: integer; digito: string;
begin
  inherited;
  Num := Boleto.Carteira + Boleto.NossoNumero;

  Digito := Modulo11(Num, 7, resto);
  if resto = 1 then
    Digito := 'P'
  else
    if resto = 0 then
      Digito := '0';
  Result := Digito[1];

end;

{*******************************************************************}
{* Método GetNomeBanco: string;                                    *}
{*******************************************************************}
{* Retorna o nome do banco, impresso no topo do formulário do      *}
{* boleto                                                          *}
{*******************************************************************}

function TFreeBanco237.GetNomeBanco: string;
begin
  inherited;
  Result := 'Bradesco';
end;

{*******************************************************************}
{* Método GetNumeroBancario(Boleto: TFreeBoleto): string;           *}
{*******************************************************************}
{* Formata o string que é mostrado no boleto impresso no campo     *}
{* Nosso Numero. Cada banco formata isso de uma maneira diferente  *}
{*******************************************************************}

function TFreeBanco237.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Boleto.Carteira + '/' + Boleto.NossoNumero + '-'+GetDigitoNossoNum(Boleto);
end;

{*******************************************************************}
{* Método InicializaDadosPadroes(Boleto: TFreeBoleto);              *}
{*******************************************************************}
{* Inicializa alguns campos com os valores padrões, caso não tenham*}
{* sido especificados no objeto FreeBoleto                          *}
{*******************************************************************}

procedure TFreeBanco237.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if EspecieDoc = '' then EspecieDoc := 'DM'; //Duplicata Mercantil
    if Aceite = '' then Aceite := 'N';
    if Carteira = '' then Carteira := '06'; // Sem registro
  end;
end;

initialization
  RegisterClass(TFreeBanco237);

end.

