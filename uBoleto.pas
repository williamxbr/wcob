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
unit uBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uFreeBoleto, uFreeBoletoImage, ExtCtrls;

type
  TFrmBoleto = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    edBanco: TEdit;
    Label2: TLabel;
    edCodCedente: TEdit;
    Agencia: TLabel;
    edAgencia: TEdit;
    Label3: TLabel;
    dtpVencimento: TDateTimePicker;
    Label4: TLabel;
    edValor: TEdit;
    Label5: TLabel;
    edNNum: TEdit;
    Memo1: TMemo;
    Label6: TLabel;
    edContaCorrente: TEdit;
    edDigitoCC: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edCarteira: TEdit;
    Label9: TLabel;
    edModeloCarteira: TEdit;
    Label10: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    edNomeCede: TEdit;
    Label12: TLabel;
    dtpEmissao: TDateTimePicker;
    Label13: TLabel;
    edDocumento: TEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edSacado: TEdit;
    edEndereco: TEdit;
    edUF: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edCep: TEdit;
    Label20: TLabel;
    edCNPJ: TEdit;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Label21: TLabel;
    edConvenio: TEdit;
    Label22: TLabel;
    Bevel2: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FBoleto   : TFreeBoleto;
    ImgBoleto : TFreeBoletoImagem;
    procedure GerarBoleto;
    procedure AdicionarBoleto;
  public
    { Public declarations }
  end;

var
  FrmBoleto: TFrmBoleto;

implementation

{$R *.dfm}

uses TypInfo;


procedure TFrmBoleto.Button1Click(Sender: TObject);
begin
  GerarBoleto;
  memo1.Lines.clear;
  with memo1.lines do
  begin
    Add('AgenCodCedente : ' + FBoleto.DadosGerados.AgencCodigoCedente);
    Add('Nome Banco     : ' + FBoleto.DadosGerados.NomeDoBanco);
    Add('Num. bancario  : ' + FBoleto.DadosGerados.NumeroBancario);
    Add('Digitavel      : ' + FBoleto.DadosGerados.LinhaDigitavel);
    Add('Barras         : ' + FBoleto.DadosGerados.CodigoBarras);
  end;
end;


procedure TFrmBoleto.Button2Click(Sender: TObject);
begin
  ImgBoleto.ShowPreview;
end;

procedure TFrmBoleto.FormCreate(Sender: TObject);
begin
  FBoleto   := TFreeBoleto.create(application);
  ImgBoleto := TFreeBoletoImagem.create(self);
end;

procedure TFrmBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FBoleto.free;
  ImgBoleto.free;
end;

procedure CloneProperties(SourceComp, DestComp: TObject);
var
  Propinfo: PPropInfo;
  Properties: PPropList;
  FCount: Integer;
  FSize: Integer;
  i: Integer;
  PropName: String;
  SourcePropObject: TObject;
  DestPropObject: TObject;
begin
  FCount := GetPropList(SourceComp.ClassInfo, tkAny, nil);
  FSize := FCount * SizeOf(Pointer);
  GetMem(Properties, FSize);
  GetPropList(SourceComp.ClassInfo, tkAny, Properties);
  for i := 0 to FCount-1 do
  begin
    PropName := Properties^[i].Name;
    PropInfo := GetPropInfo(DestComp.ClassInfo, PropName);
    if (PropInfo = nil) or (UpperCase(PropName) = 'NAME') then
      Continue;
    case PropType(SourceComp, PropName) of
      tkInteger,
      tkWChar,
      tkSet,
      tkChar        : SetOrdProp(DestComp,PropName,GetOrdProp(SourceComp,PropName));
      tkString,
      tkLString,
      tkWString     : SetStrProp(DestComp,PropName,GetStrProp(SourceComp,PropName));
      tkEnumeration : SetEnumProp(DestComp,PropName,GetEnumProp(SourceComp,PropName));
      tkFloat       : SetFloatProp(DestComp,PropName,GetFloatProp(SourceComp,PropName));
      tkClass       : begin
                        SourcePropObject := GetObjectProp(SourceComp,PropName);
                        DestPropObject := GetObjectProp(DestComp,PropName);
                        if (SourcePropObject<>nil) and (DestPropObject<>nil)
                        and (SourcePropObject.ClassType.ClassParent.ClassName='TPersistent') then
                          CloneProperties(SourcePropObject,DestPropObject)
                        else
                          SetObjectProp(DestComp,PropName,GetObjectProp(SourceComp,PropName));
                      end;
    end;
  end;
  if Properties <> nil then
    FreeMem(Properties, FSize);
end;

procedure TFrmBoleto.Button3Click(Sender: TObject);
begin
  AdicionarBoleto;
end;

procedure TFrmBoleto.Button4Click(Sender: TObject);
begin
  ImgBoleto.ListaBoletos.Clear;
end;

procedure TFrmBoleto.Button5Click(Sender: TObject);
begin
  Button1Click(Sender);
  Button3Click(Sender);
end;

procedure TFrmBoleto.GerarBoleto;
begin
  FBoleto.LimparTudo;
  FBoleto.Cedente.Agencia       := edAgencia.text;
  FBoleto.Cedente.CodigoBanco   := edBanco.text;
  FBoleto.Moeda                 := '9';
  FBoleto.Cedente.Nome          := edNomeCede.text;
  FBoleto.DataDocumento         := trunc(dtpEmissao.date);
  FBoleto.Documento             := edDocumento.text;
  FBoleto.Vencimento            := dtpVencimento.date;
  FBoleto.Cedente.CodigoCedente := edCodCedente.text;
  FBoleto.Valor                 := StrToFloat(edValor.Text);
  FBoleto.NossoNumero           := edNNum.text;
  FBoleto.Cedente.ContaCorrente := edContaCorrente.text;
  if   edDigitoCC.text <> '' then
       FBoleto.Cedente.DigitoContaCorrente := edDigitoCC.text[1];
  FBoleto.carteira              := edCarteira.text;
  FBoleto.Cedente.Banco151.ModalidadeConta := edModeloCarteira.text;
  FBoleto.Cedente.Banco001.Convenio := edConvenio.text;
  with FBoleto.sacado do
  begin
    Nome     := edSacado.text;
    Endereco := edEndereco.text;
    Bairro   := edBairro.text;
    Cep      := edCep.text;
    Estado   := edUF.text;
    Cidade   := edCidade.text;
    CNPJ_CPF := edCNPJ.text;
  end;
  FBoleto.preparar;
end;

procedure TFrmBoleto.AdicionarBoleto;
var
  XBoleto : TFreeBoleto;
begin
  XBoleto := TFreeBoleto.create(nil);
  CloneProperties(FBoleto,XBoleto);
  ImgBoleto.ListaBoletos.Add(XBoleto);
end;

end.

