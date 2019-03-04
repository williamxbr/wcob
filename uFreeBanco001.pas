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

unit uFreeBanco001; // BANCO DO BRASIL

// Atenção, essa unit está preparada para trabalhar com a carteira 18 e convenios de 6 digitos.
// Adaptações podem ser feitas para suportar as outras carteiras/convenios, basta entender a
// documentação "podre" que o BB oferece.

interface

uses classes, SysUtils, uFreeBoleto, uFuncAux;

type
  TFreeBanco001 = class(TFreeClasseBanco)
  private
    function GetModulo11BB(str: string; base: integer): char; // Substitua "BASE" pelo codigo do banco (3 digitos)
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

{ TFreeBanco001 }

{*******************************************************************}
{* Método ChecarDadosIniciais(Boleto: TFreeBoleto)                  *}
{*******************************************************************}
{* Rotina executada no início da fase de preparação do boleto      *}
{* Serve para validar se os dados inseridos no TFreeBoleto estão no *}
{* formato correto, ver se os campos obrigatórios foram            *}
{* preenchidos, etc.                                               *}
{*******************************************************************}

procedure TFreeBanco001.ChecarDadosIniciais(Boleto: TFreeBoleto);
var
  TamanhoConvenio: Integer;
begin
  inherited;
  with Boleto do
  begin
    TamanhoConvenio := Length(Cedente.Banco001.Convenio);
    if (TamanhoConvenio = 4) and (Length(NossoNumero) > 7) then
      raise EFreeBoleto.Create('O tamanho do NossoNúmero não pode ser maior que 7 caracteres!')
    else
      if ((TamanhoConvenio = 6) or (TamanhoConvenio = 7)) and (Length(NossoNumero) > 10) then
        raise EFreeBoleto.Create('O tamanho do NossoNúmero não pode ser maior que 10 caracteres!');

    if Cedente.Banco001.Convenio = '' then
      raise EFreeBoleto.Create('É necessário informar o convênio!')
    else
      if TamanhoConvenio > 7 then
        raise EFreeBoleto.Create('UNIT preparada apenas para convenios de até 7 dígitos!');
  end;
end;

{*******************************************************************}
{* Método FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;   *}
{*******************************************************************}
{* Formata o string que é usado no preenchimento do campo          *}
{* Agencia/Codigo do Cedente nos boletos                           *}
{*******************************************************************}

function TFreeBanco001.FormataAgencCodigoCedente(Boleto: TFreeBoleto): string;
begin
  inherited;
  Result := Copy(Boleto.Cedente.Agencia, 1, 4) + '/' + Boleto.Cedente.CodigoCedente + '-' + GetModulo11BB(Boleto.Cedente.CodigoCedente,9);
end;

{*******************************************************************}
{* Método GetCampoLivre(Boleto: TFreeBoleto): string;               *}
{*******************************************************************}
{* Monta o Campo Livre, que varia de banco para banco.             *}
{*******************************************************************}

function TFreeBanco001.GetCampoLivre(Boleto: TFreeBoleto): string;
var x: string;
begin
  inherited;
  x := '';
  with Boleto, cedente, banco001 do
  begin
    if Length(Convenio) = 4 then
      Result := Padl(Convenio, 4, '0') + Padl(NossoNumero, 7, '0') + Agencia + CodigoCedente + Carteira
    else
      if (Length(Convenio) = 6) then
        Result := Padl(Convenio, 6, '0') + Padl(NossoNumero, 17, '0') + '21' // 21 indica que o N.N. tem 17 dígitos
      else
        if Length(Convenio) = 7 then
          Result := '000000' + Padl(Convenio, 7, '0') + Padl(NossoNumero, 10, '0') + Carteira;
  end;
end;

{*******************************************************************}
{* Método GetCodigoBanco: string;                                  *}
{*******************************************************************}
{* Retorna o código nacional do banco                              *}
{*******************************************************************}

function TFreeBanco001.GetCodigoBanco: string;
begin
  inherited;
  Result := '001'; // BANCO DO BRASIL
end;

{*******************************************************************}
{* Método GetCodigoBancoComDigito: string;                         *}
{*******************************************************************}
{* Retorna o código nacional do banco + digito                     *}
{*******************************************************************}

function TFreeBanco001.GetCodigoBancoComDigito: string;
begin
  inherited;
  Result := '001-9'; // BANCO DO BRASIL
end;

{*******************************************************************}
{* Metodo GetDigitoNossoNum(Boleto: TFreeBoleto): char;             *}
{*******************************************************************}
{* Calcula o digito do nosso numero. A formula de calculo muda de  *}
{* banco para banco.                                               *}
{*******************************************************************}

function TFreeBanco001.GetModulo11BB(str:string; base:integer): char;
var digito:string; resto:integer;
begin
  digito := Modulo11(str, base, resto);
  if resto = 10 then
    Result := 'X'
  else
    Result := digito[1];
end;

function TFreeBanco001.GetDigitoNossoNum(Boleto: TFreeBoleto): char;
var x: string;
begin
  inherited;
  x := Padl(Boleto.cedente.banco001.convenio, 6, '0') + Padl(Boleto.NossoNumero, 5, '0');
  Result:=GetModulo11BB(x,9);
end;

{*******************************************************************}
{* Método GetNomeBanco: string;                                    *}
{*******************************************************************}
{* Retorna o nome do banco, impresso no topo do formulário do      *}
{* boleto                                                          *}
{*******************************************************************}

function TFreeBanco001.GetNomeBanco: string;
begin
  inherited;
  Result := 'Banco Brasil';
end;

{*******************************************************************}
{* Método GetNumeroBancario(Boleto: TFreeBoleto): string;           *}
{*******************************************************************}
{* Formata o string que é mostrado no boleto impresso no campo     *}
{* Nosso Numero. Cada banco formata isso de uma maneira diferente  *}
{*******************************************************************}

function TFreeBanco001.GetNumeroBancario(Boleto: TFreeBoleto): string;
begin
  inherited;
  if (Length(Boleto.Cedente.Banco001.Convenio) = 6) then // Quando o convênio tem 6 dígitos o N.N. não possui dígito verificador
    Result := Padl(Boleto.cedente.banco001.convenio, 6, '0') + Padl(Boleto.NossoNumero, 11, '0')
  else
    Result := Padl(Boleto.cedente.banco001.convenio, 6, '0') + Padl(Boleto.NossoNumero, 5, '0') + '-' + GetDigitoNossoNum(Boleto);
end;

{*******************************************************************}
{* Método InicializaDadosPadroes(Boleto: TFreeBoleto);              *}
{*******************************************************************}
{* Inicializa alguns campos com os valores padrões, caso não tenham*}
{* sido especificados no objeto FreeBoleto                          *}
{*******************************************************************}

procedure TFreeBanco001.InicializaDadosPadroes(Boleto: TFreeBoleto);
begin
  inherited;
  with Boleto do
  begin
    if Especie = '' then Especie := 'R$';
    if Aceite = '' then Aceite := 'N';
    if Carteira = '' then Carteira := '18'; // Sem registro
  end;
end;

initialization
  RegisterClass(TFreeBanco001); // Banco do Brasil

end.

