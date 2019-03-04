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

unit uFreeBancoBASE; // Substitua "BASE" pelo codigo do banco (3 digitos)

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBancoBASE = class(TFreeClasseBanco) // Substitua "BASE" pelo codigo do banco (3 digitos)
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

{ TFreeBancoBASE }

{*******************************************************************}
{* Método ChecarDadosIniciais(Boleto: TFreeBoleto)                  *}
{*******************************************************************}
{* Rotina executada no início da fase de preparação do boleto      *}
{* Serve para validar se os dados inseridos no TFreeBoleto estão no *}
{* formato correto, ver se os campos obrigatórios foram            *}
{* preenchidos, etc.                                               *}
{*******************************************************************}

procedure TFreeBancoBASE.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  inherited;
  { Exemplo...
    with Boleto do
    begin
      if Length(NossoNumero) > 8 then
        raise Exception.Create('O tamanho do NossoNúmero não pode ser maior que 7 caracteres!');

      etc, etc...
    end;
  }
end;

{*******************************************************************}
{* Método FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;   *}
{*******************************************************************}
{* Formata o string que é usado no preenchimento do campo          *}
{* Agencia/Codigo do Cedente nos boletos                           *}
{*******************************************************************}

function TFreeBancoBASE.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  {
    Exemplo:
    Result := Copy(Boleto.Cedente.CodigoCedente, 1, 3) + '.' +
    Copy(Boleto.Cedente.CodigoCedente, 4, 2) + '.' +
    Copy(Boleto.Cedente.CodigoCedente, 6, 5) + '.' +
    Copy(Boleto.Cedente.CodigoCedente, 11, 1);
  }
end;

{*******************************************************************}
{* Método GetCampoLivre(Boleto: TFreeBoleto): string;               *}
{*******************************************************************}
{* Monta o Campo Livre, que varia de banco para banco.             *}
{*******************************************************************}

function TFreeBancoBASE.GetCampoLivre(Boleto: TFreeBoleto): string;
begin
  inherited;
  {
  Como exemplo, veja a implementação nas units dos outros bancos
  }
end;

{*******************************************************************}
{* Método GetCodigoBanco: string;                                  *}
{*******************************************************************}
{* Retorna o código nacional do banco                              *}
{*******************************************************************}

function TFreeBancoBASE.GetCodigoBanco: string;
begin
  inherited;
  {
  Exemplo:
  Result := '033'; // 033 é o código do BANESPA S/A
  }
end;

{*******************************************************************}
{* Método GetCodigoBancoComDigito: string;                         *}
{*******************************************************************}
{* Retorna o código nacional do banco + digito                     *}
{*******************************************************************}

function TFreeBancoBASE.GetCodigoBancoComDigito: string;
begin
  inherited;
  {
  Exemplo:
  Result := '033-7'; // Banespa
  }
end;

{*******************************************************************}
{* Metodo GetDigitoNossoNum(Boleto: TFreeBoleto): char;             *}
{*******************************************************************}
{* Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBancoBASE.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
begin
  inherited;
  {
  Exemplo:
  Verifique o método nas units dos outros bancos já prontos
  }
end;

{*******************************************************************}
{* Método GetNomeBanco: string;                                    *}
{*******************************************************************}
{* Retorna o nome do banco, impresso no topo do formulário do      *}
{* boleto                                                          *}
{*******************************************************************}

function TFreeBancoBASE.GetNomeBanco: string;
begin
  inherited;
  {
  Exemplo:
  Result := 'Banespa';
  }
end;

{*******************************************************************}
{* Método GetNumeroBancario(Boleto: TFreeBoleto): string;           *}
{*******************************************************************}
{* Formata o string que é mostrado no boleto impresso no campo     *}
{* Nosso Numero. Cada banco formata isso de uma maneira diferente  *}
{*******************************************************************}

function TFreeBancoBASE.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  {
  Exemplo:
  Result := Padl(IntToStr(StrToInt(Boleto.Cedente.Agencia)), 3, '0') + ' ' + Padl(Boleto.NossoNumero,7,'0') + '-' + GetDigitoNossoNum(Boleto);
  }
end;

{*******************************************************************}
{* Método InicializaDadosPadroes(Boleto: TFreeBoleto);              *}
{*******************************************************************}
{* Inicializa alguns campos com os valores padrões, caso não tenham*}
{* sido especificados no objeto FreeBoleto                          *}
{*******************************************************************}

procedure TFreeBancoBASE.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  {
  Exemplo:
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if EspecieDoc = '' then EspecieDoc := 'DM - CI';
    if Aceite = '' then Aceite := 'N';
    if Carteira = '' then Carteira := 'COB';
  end;
  }
end;

initialization
  RegisterClass(TFreeBancoBASE); // Substitua "BASE" pelo codigo do banco (3 digitos)

end.

