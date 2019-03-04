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
unit uFreeBoleto;

interface

uses
  SysUtils, Classes, Controls, Contnrs;

const
  constLinhasInstrucaoBoleto = 7;

type
  EFreeBoleto = class(Exception);

  // Para geração dos dados do boleto, alguns bancos utilizam informações
  // específicas. Para simplificar a visualização e configuração dessas
  // informações, deve ser criada uma classe do tipo TCamposBancoXXX que
  // deve conter apenas os campos necessários para o banco XXX. Depois de
  // criada a classe, deve ser inserida como uma propriedade da classe
  // TCedente

  TCamposBanco151 = class(TPersistent)
  private
    fModalidadeConta: string; // Apenas o Banco 151 precisa da informação Modelo de Carteira
  public
    procedure Limpar;
  published
    property ModalidadeConta: string read fModalidadeConta write fModalidadeConta; // Apenas o Banco 151 precisa da informação Modelo de Carteira
  end;

  TCamposBanco001 = class(TPersistent)
  private
    fConvenio: string; // Apenas o Banco do Brasil precisa da informação
  public
    procedure Limpar;
  published
    property Convenio: string read fConvenio write fConvenio;
  end;

  // Classe com os dados do cedente

  TCedente = class(TPersistent)
  private
    fNome: string;
    fCodigoBanco: string;
    fAgencia: shortstring;
    fCodigoCedente: string;
    fContaCorrente: string;
    fDigitoContaCorrente: char;
    fBanco151: TCamposBanco151;
    fBanco001: TCamposBanco001;
  public
    procedure Limpar;
    constructor create;
    destructor Destroy; override;
  published
    property Nome: string read fNome write fNome;
    property CodigoBanco: string read fCodigoBanco write fCodigoBanco;
    property Agencia: shortstring read fAgencia write fAgencia;
    property CodigoCedente: string read fCodigoCedente write fCodigoCedente;
    property ContaCorrente: string read fContaCorrente write fContaCorrente;
    property DigitoContaCorrente: char read fDigitoContaCorrente write fDigitoContaCorrente;
    property Banco151: TCamposBanco151 read fBanco151 write fBanco151;
    property Banco001: TCamposBanco001 read fBanco001 write fBanco001;
  end;

  // Tipo de pessoa (Física ou Jurídica)

  TPessoa = (pFisica, pJuridica);

  // Informações sobre o sacado

  TSacado = class(TPersistent)
  private
    fNome: string;
    fEndereco: string;
    fBairro: string;
    fCidade: string;
    fEstado: string;
    fCep: string;
    fPessoa: TPessoa;
    fCNPJ_CPF: string;
  public
    procedure Limpar;
  published
    property Nome: string read fNome write fNome;
    property Endereco: string read fEndereco write fEndereco;
    property Bairro: string read fBairro write fBairro;
    property Cidade: string read fCidade write fCidade;
    property Estado: string read fEstado write fEstado;
    property Cep: string read fCep write fCep;
    property Pessoa: TPessoa read fPessoa write fPessoa;
    property CNPJ_CPF: string read fCNPJ_CPF write fCNPJ_CPF;
  end;

  // A classe DadosGerados contém as informações geradas para o boleto
  // Essa classe é uma propriedade do componente FreeBoleto. Os valores
  // das propriedades são atribuidos quando o método Preparar do FreeBoleto
  // é chamado.

  TDadosGerados = class
  public
    LinhaDigitavel: string;
    CodigoBarras: string;
    AgencCodigoCedente: string;
    NomeDoBanco: string;
    NumeroBancario: string;
    CodigoBancoComDigito: string;
    procedure Limpar;
  end;

  // Classe base para os bancos... ver a implementação mais abaixo

  TFreeClasseBanco = class;

  // Componente FreeBoleto. Através dele é que será gerado os dados
  // do boleto.

  TFreeBoleto = class(TComponent)
  private
    FVencimento: TDate;
    FCedente: TCedente;
    FSacado: TSacado;
    FDadosGerados: TDadosGerados;
    FMoeda: char;
    FValor: Currency;
    FBanco: TFreeClasseBanco;
    FNossoNumero: string;
    FCampoLivre: string;
    FDataDocumento: TDate;
    FDocumento: string;
    FEspecie: string;
    FEspecieDoc: string;
    FAceite: string;
    FCarteira: string;
    FMensagem: TStrings;
    FInstrucoes: TStrings;
    FLocalPagamento: string;
    FUsoDoBanco: string;
    procedure MontaCodigoDeBarras;
    procedure MontaLinhaDigitavel;
    function GetFatorVencto: string;
    procedure SetInstrucoes(const Value: TStrings);
    procedure SetMensagem(const Value: TStrings);
  public
    property DadosGerados: TDadosGerados read FDadosGerados write FDadosGerados;
    procedure Limpar;
    procedure LimparTudo;
    procedure Preparar;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Cedente: TCedente read FCedente write FCedente;
    property Sacado: TSacado read FSacado write FSacado;
    property Vencimento: TDate read FVencimento write FVencimento;
    property Moeda: char read FMoeda write FMoeda default '9';
    property Valor: Currency read FValor write FValor;
    property NossoNumero: string read FNossoNumero write FNossoNumero;
    {Dados Opcionais}
    property LocalPagamento: string read FLocalPagamento write FLocalPagamento;
    property DataDocumento: TDate read FDataDocumento write FDataDocumento; // Opcional
    property Documento: string read FDocumento write FDocumento; // Opcional
    property Especie: string read FEspecie write FEspecie; // Opcional
    property EspecieDoc: string read FEspecieDoc write FEspecieDoc; // Opcional
    property Aceite: string read FAceite write FAceite; // Opcional
    property Carteira: string read FCarteira write FCarteira; // Obrigatorio no caso do Itau
    property Instrucoes: TStrings read FInstrucoes write SetInstrucoes;
    property Mensagem: TStrings read FMensagem write SetMensagem;
    property UsoDoBanco: string read FUsoDobanco write FUsoDobanco;
  end;

  TFreeBoletoList = class
  private
    List: TObjectList;
    function GetItem(Index: Integer): TFreeBoleto;
    procedure SetItem(Index: Integer; const Value: TFreeBoleto);
    function GetCountItems:Integer;
  public
    constructor Create(AOwnObjects: Boolean = True);
    destructor Destroy; override;
    property Items[Index: Integer]: TFreeBoleto read GetItem write SetItem; default;
    property Count:Integer read GetCountItems;
    function Add(AObject: TFreeBoleto): Integer; overload;
    function Add: TFreeBoleto; overload;
    procedure Delete(Index: Integer);
    procedure Clear;
  end;

  // Implementação da classe base para os bancos
  TFreeClasseBanco = class(TPersistent)
  published
    function GetCampoLivre(Boleto: TFreeBoleto): string; virtual; abstract;
    function GetCodigoBanco: string; virtual; abstract;
    function GetCodigoBancoComDigito: string; virtual; abstract;
    function FormataAgencCodigoCedente(Boleto: TFreeBoleto): string; virtual; abstract;
    function GetDigitoNossoNum(Boleto: TFreeBoleto): char; virtual; abstract;
    function GetNumeroBancario(Boleto: TFreeBoleto): string; virtual; abstract;
    function GetNomeBanco: string; virtual; abstract;
    procedure ChecarDadosIniciais(Boleto: TFreeBoleto); virtual;
    procedure InicializaDadosPadroes(Boleto: TFreeBoleto); virtual; abstract;
  end;

  // Necessario para o funcionamento correto do GetClass e criação dinamica
  // de classes para cada banco

  TFreeClasseBancoClass = class of TFreeClasseBanco;

procedure Register;

implementation

uses
  uFuncAux, uFreeBanco033, uFreeBanco104, uFreeBanco341, uFreeBanco151,
  uFreeBanco237, uFreeBanco409, uFreeBanco356, uFreeBanco001, uFreeBanco353;

{ TFreeBoleto }

{*******************************************************************}
{* Construtor do componente FreeBoleto.                            *}
{*******************************************************************}

constructor TFreeBoleto.Create(AOwner: TComponent);
begin
  inherited;
  FDadosGerados := TDadosGerados.create;
  FCedente := TCedente.create;
  FSacado := TSacado.create;
  FInstrucoes := TStringList.Create;
  FMensagem := TStringList.Create;
  FMoeda := '9';
end;

{*******************************************************************}
{* Destructor do componente FreeBoleto                             *}
{*******************************************************************}

destructor TFreeBoleto.Destroy;
begin
  FDadosGerados.free;
  FCedente.free;
  FSacado.free;
  FInstrucoes.Free;
  FMensagem.Free;
  inherited;
end;

{*******************************************************************}
{* GetFatorVencto: string;                                         *}
{*******************************************************************}
{* O fator de vencimento é a diferença da data de vencimento e     *}
{* o dia 7 de Outubro de 1997                                      *}
{*******************************************************************}

function TFreeBoleto.GetFatorVencto: string;
var
  FatVencto: LongInt;
begin
  if FVencimento < EncodeDate(1997, 10, 7) then
    raise EFreeBoleto.create('O vencimento do boleto deve ser superior à 7-Outubro-1997');
  FatVencto := Abs(Trunc(FVencimento) - Trunc(EncodeDate(1997, 10, 7)));
  Result := PadL(IntToStr(FatVencto), 4, '0');
end;

{*******************************************************************}
{* MontaCodigoDeBarras;                                            *}
{*******************************************************************}
{* Função responsável por montar o código de barras e guarda-lo no *}
{* campo correspondente em DadosGerados.                           *}
{*******************************************************************}

procedure TFreeBoleto.MontaCodigoDeBarras;
begin
  FCampoLivre := FBanco.GetCampoLivre(self);

  FDadosGerados.CodigoBarras :=
    FCedente.CodigoBanco + // Identificacao do CodigoBanco (3 posicoes)
  FMoeda + // Identificacao da Moeda
  '0' + // Digito auto-verificador (por enquanto é zero)
  GetFatorVencto + // Fator de vencimento (4 posicoes)
  Padl(IntToStr(Trunc(FValor * 100)), 10, '0') + // Valor do titulo (10 posicoes)
  FCampoLivre;

  // Especifica o digito auto-verificador
  FDadosGerados.CodigoBarras[5] := CalcDigVerificador(FDadosGerados.CodigoBarras);
end;

{*******************************************************************}
{* MontaLinhaDigitavel;                                            *}
{*******************************************************************}
{* Função responsável por montar a linha digitável. Deve ser       *}
{* após o Código de Barras ter sido calculado.                     *}
{*******************************************************************}

procedure TFreeBoleto.MontaLinhaDigitavel;
var
  c1, c2, c3, c4, c5: string;
begin
  c1 := Cedente.CodigoBanco + FMoeda + Copy(FCampoLivre, 1, 5);
  c1 := c1 + Modulo10(c1);
  Insert('.', c1, 6);

  c2 := Copy(FCampoLivre, 6, 10);
  c2 := c2 + Modulo10(c2);
  Insert('.', c2, 6);

  c3 := Copy(FCampoLivre, 16, 10);
  c3 := c3 + Modulo10(c3);
  Insert('.', c3, 6);

  c4 := FDadosGerados.CodigoBarras[5];
  c5 := Copy(FDadosGerados.CodigoBarras, 6, 14);

  DadosGerados.LinhaDigitavel := c1 + ' ' + c2 + ' ' + c3 + ' ' + c4 + ' ' + c5;
end;

{*******************************************************************}
{* Preparar;                                                       *}
{*******************************************************************}
{* A função Preparar executa as operações necessárias para gerar   *}
{* as informações do boleto, como linha digitavel, barras, etc., ou*}
{* seja, as informações retornadas pela propriedade DadosGerados   *}
{* Sempre que alguma informação do boleto for alterada, deve ser   *}
{* executada para atualizar esses dados gerados.                   *}
{*******************************************************************}

procedure TFreeBoleto.Preparar;
var
  ClasseBanco: TFreeClasseBancoClass;
begin
  ClasseBanco := TFreeClasseBancoClass(GetClass('TFreeBanco' + Padl(FCedente.CodigoBanco, 3, '0')));
  if ClasseBanco <> nil then
  begin
    FBanco := ClasseBanco.Create;
    try
      FBanco.ChecarDadosIniciais(Self);
      FBanco.InicializaDadosPadroes(Self);
      MontaCodigoDeBarras;
      MontaLinhaDigitavel;
      {Monta restante dos dados gerados pela montagem do boleto}
      DadosGerados.AgencCodigoCedente := FBanco.FormataAgencCodigoCedente(self);
      DadosGerados.NumeroBancario := FBanco.GetNumeroBancario(Self);
      DadosGerados.NomeDoBanco := FBanco.GetNomeBanco;
      DadosGerados.CodigoBancoComDigito := FBanco.GetCodigoBancoComDigito;
    finally
      FreeAndNil(FBanco);
    end;
  end
  else
  begin
    raise EFreeBoleto.Create('Classe não definida para o banco "' + FCedente.CodigoBanco + '"');
  end;
end;

{*******************************************************************}
{* Limpar;                                                          *}
{*******************************************************************}
{* Limpa as informações do boleto, conservando os dados do cedente.*}
{*******************************************************************}

procedure TFreeBoleto.Limpar;
begin
  FInstrucoes.Clear;
  FDadosGerados.Limpar;
  FBanco := nil;
  FVencimento := 0;
  FMoeda := '9';
  FValor := 0;
  FNossoNumero := '';
  FCampoLivre := '';

  DataDocumento := 0;
  Documento := '';
  Especie := '';
  EspecieDoc := '';
  Aceite := '';
  Carteira := '';
end;

{*******************************************************************}
{* LimparTudo                                                       *}
{*******************************************************************}
{* Limpa as informações do boleto, inclusive os dados do cedente e *}
{* sacado.                                                         *}
{*******************************************************************}

procedure TFreeBoleto.LimparTudo;
begin
  Limpar;
  FCedente.Limpar;
  FSacado.Limpar;
end;

{ TCedente }

{*******************************************************************}
{* Limpar;                                                         *}
{*******************************************************************}
{* Limpa as informações de cedente                                 *}
{*******************************************************************}

procedure TCedente.Limpar;
begin
  Nome := '';
  Agencia := '';
  CodigoBanco := '';
  CodigoCedente := '';
  ContaCorrente := '';
  DigitoContaCorrente := #0;
  Banco151.Limpar;
  Banco001.Limpar;
end;

{ TSacado }

{*******************************************************************}
{* Limpar;                                                         *}
{*******************************************************************}
{* Limpa as informações de sacado                                  *}
{*******************************************************************}

procedure TSacado.Limpar;
begin
  Nome := '';
  Endereco := '';
  Bairro := '';
  Cidade := '';
  Estado := '';
  Cep := '';
  Pessoa := pJuridica;
  CNPJ_CPF := '';
end;

{ TDadosGerados }

{*******************************************************************}
{* Limpar;                                                         *}
{*******************************************************************}
{* Limpa as informações geradas pelo boleto                        *}
{*******************************************************************}

procedure TDadosGerados.Limpar;
begin
  LinhaDigitavel := '';
  CodigoBarras := '';
  AgencCodigoCedente := '';
  NomeDoBanco := '';
  NumeroBancario := '';
end;

{*******************************************************************}
{* Constructor da classe TCedente                                  *}
{*******************************************************************}

constructor TCedente.create;
begin
  Banco151 := TCamposBanco151.create;
  Banco001 := TCamposBanco001.create;
end;

{*******************************************************************}
{* Destructor da classe TCedente                                   *}
{*******************************************************************}

destructor TCedente.destroy;
begin
  Banco151.free;
  Banco001.free;
  inherited;
end;

{ TFreeClasseBanco }

procedure TFreeClasseBanco.ChecarDadosIniciais(Boleto: TFreeBoleto);
begin
  with Boleto do
  begin
    if NossoNumero = '' then
      raise EFreeBoleto.Create('Nosso Número não informado!');

    if Vencimento = 0 then
      raise EFreeBoleto.Create('Data de vencimento não informada!');

    if valor = 0 then
      raise EFreeBoleto.Create('Valor do boleto não informado!');

    if Instrucoes.Count > constLinhasInstrucaoBoleto then
      raise EFreeBoleto.CreateFmt('Instruções não pode ter mais de %d linhas', [constLinhasInstrucaoBoleto]);
  end;
end;

{ TCamposBanco151 }

procedure TCamposBanco151.Limpar;
begin
  ModalidadeConta := '';
end;

procedure Register;
begin
  RegisterComponents('FreeBoleto', [TFreeBoleto]);
end;

procedure TFreeBoleto.SetInstrucoes(const Value: TStrings);
begin
  if Assigned(FInstrucoes) then
    FInstrucoes.Assign(Value)
  else
    FInstrucoes := Value;
end;

procedure TFreeBoleto.SetMensagem(const Value: TStrings);
begin
  if Assigned(FMensagem) then
    FMensagem.Assign(Value)
  else
    FMensagem := Value;
end;

{ TFreeBoletoList }

function TFreeBoletoList.GetItem(Index: Integer): TFreeBoleto;
begin
  Result := TFreeBoleto(List[Index]);
end;

procedure TFreeBoletoList.SetItem(Index: Integer;
  const Value: TFreeBoleto);
begin
  List[Index] := Value;
end;

constructor TFreeBoletoList.Create(AOwnObjects: Boolean = True);
begin
  List := TObjectList.Create(AOwnObjects);
end;

function TFreeBoletoList.Add(AObject: TFreeBoleto): Integer;
begin
  Result := List.Add(AObject);
end;

destructor TFreeBoletoList.Destroy;
begin
  List.Free;
  inherited;
end;

procedure TFreeBoletoList.Delete(Index: Integer);
begin
  List.Delete(Index);
end;

function TFreeBoletoList.Add: TFreeBoleto;
begin
  Result := TFreeBoleto.Create(nil);
  Add(Result);
end;

procedure TFreeBoletoList.Clear;
begin
  List.Clear;
end;

function TFreeBoletoList.GetCountItems: Integer;
begin
  Result:=List.Count;
end;

{ TCamposBanco001 }

procedure TCamposBanco001.Limpar;
begin
  Convenio:='';
end;

end.

