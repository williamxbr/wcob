unit uAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB,
  uFreeBoleto,
  uFreeBoletoImage,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  ucLayAcordo, ucLayRecebimento, ucLayCredor, ucLayDevedor, ucLayCobrador,
  ucLayCobranca, ucLayItens_Cobranca, ucLayEnderecos, ucLayTelefones,
  ucLayBoleto, ucLayTipo_Documento, ucLayBanco, ucLayRecibo,
  ucLayTipo_Situacao, ucLayParametros,
  NumericEdit, Menus, DBCtrls,
  SmtLstvw, SBLstV0u,
  Mask, ADODB, uCobranca, RLBoleto, RLFilters, RLPDFFilter;

type

  TListaRecebimento = class
    RECEBIMENTO        : LongInt;
    ACORDO             : Integer;
    COBRANCA           : LongInt;
    PARCELA            : Integer;
    VENCIMENTO         : TDateTime;
    SITUACAO           : Byte;
    VALOR              : Double;
    COMISSAO           : Double;
    VALOR_REPASSE      : Double;
    TIPODOCUMENTO      : Byte;
    NUMERO_DOCUMENTO   : string;
    PAGO               : Boolean;
    DATA_PAGAMENTO     : TDateTime;
    OBSERVACAO         : string;
    COBRADOR           : Integer;
    PROMESSA_PAGAMENTO : TDateTime;
    PAGTO_PRE_DATADO   : Boolean;
    VENCIMENTO_REAL    : TDateTime;
    JUROS              : Double;
    CHEQUE_COMPENSADO  : Boolean;
    BANCO              : Integer;
    IDREPASSE          : LongInt;
    NUMERO_BOLETO      : LongInt;
  End;

  TListaRecibo = Class
   Numero_Recibo   : LongInt;
   Encargos        : Double;
   Honorarios      : Double;
   IdRecebimento   : LongInt;
   Multa           : Double;
   Valor_Principal : Double;
   Situacao        : Byte;  
  End;

  TfrmAcordo = class(TForm)
    pnTop: TPanel;
    pnTela: TPanel;
    pnRodape: TPanel;
    btnSair: TBitBtn;
    Label1: TLabel;
    btnImprime: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    pmLocalizar: TPopupMenu;
    Credor1: TMenuItem;
    Devedor1: TMenuItem;
    Documento1: TMenuItem;
    Valor1: TMenuItem;
    btnBoleto: TBitBtn;
    gbCabecalho: TGroupBox;
    Shape1: TShape;
    gbAcordo: TGroupBox;
    pnAcordo: TPanel;
    gbCobranca: TGroupBox;
    pnCobranca: TPanel;
    gbDivida: TGroupBox;
    pnDivida: TPanel;
    gbValorAcordo: TGroupBox;
    pnValorAcordo: TPanel;
    gbParcelas: TGroupBox;
    pnParcelas: TPanel;
    pnlvAcordo: TPanel;
    gbCredor: TGroupBox;
    lblCredor: TLabel;
    gbDevedor: TGroupBox;
    lblDevedor: TLabel;
    gbSituacao: TGroupBox;
    lblSituacao: TLabel;
    pnItens: TPanel;
    gbItens: TGroupBox;
    btnLimpar: TBitBtn;
    gbParcela: TGroupBox;
    pnParcela: TPanel;
    gbVencimento: TGroupBox;
    dtVencimento: TDateTimePicker;
    gbValor: TGroupBox;
    pnValorItem: TPanel;
    gbValorRepasse: TGroupBox;
    pnRepasse: TPanel;
    ckPago: TCheckBox;
    gbPagamento: TGroupBox;
    dtPagamento: TDateTimePicker;
    ckPreDatado: TCheckBox;
    gbTipoDocumento: TGroupBox;
    pnTipoDoc: TPanel;
    pnDescTipo: TPanel;
    gbNumeroDocumento: TGroupBox;
    edNumeroDocumento: TEdit;
    ckChequeCompensado: TCheckBox;
    gbBanco: TGroupBox;
    pnBanco: TPanel;
    pnDescBanco: TPanel;
    btnAdicionarItem: TBitBtn;
    btnDeletarItem: TBitBtn;
    btnAlterarItem: TBitBtn;
    btnConfiguraListView: TBitBtn;
    mmObservacoes: TMemo;
    pnRecibo: TPanel;
    gbRecibo: TGroupBox;
    Splitter1: TSplitter;
    ckConfigurar: TCheckBox;
    gbValorRecibo: TGroupBox;
    pnValorRecibo: TPanel;
    gbEncargosRecibo: TGroupBox;
    pnEncargosRecibo: TPanel;
    gbMultaRecibo: TGroupBox;
    pnMultaRecibo: TPanel;
    GroupBox1: TGroupBox;
    pnHonorariosRecibo: TPanel;
    gbTotalRecibo: TGroupBox;
    pnTotalRecibo: TPanel;
    btnAdicionaRecibo: TBitBtn;
    btnDeletaRecibo: TBitBtn;
    pnGerarParcelas: TPanel;
    pnGerarParcelasTitulo: TPanel;
    gbEntrada: TGroupBox;
    gbValorEntrada: TGroupBox;
    dtVencimentoEntrada: TDateTimePicker;
    pnValorEntrada: TPanel;
    btnGerarOMs: TBitBtn;
    gbPeriodo: TGroupBox;
    pnPeriodo: TPanel;
    btnImpriirRecibo: TBitBtn;
    RLBTitulo1: TRLBTitulo;
    RLPDFFilter1: TRLPDFFilter;
    ckCarne: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Devedor1Click(Sender: TObject);
    procedure Credor1Click(Sender: TObject);
    procedure Valor1Click(Sender: TObject);
    procedure btnBoletoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lvItensAcordoGetPath(var APath: String);
    procedure ieAcordoOnExit(Sender: TObject);
    procedure ieCobrancaBtnClick(Sender: TObject);
    procedure lvItensAcordoDbClick(Sender : TObject);
    procedure lvItensAcordoClick(Sender : TObject);
    procedure btnAlterarItemClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnConfiguraListViewClick(Sender: TObject);
    procedure lvReciboGetPath(var APath: String);
    procedure ckPagoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure btnProcuraAcordo(Sender : TObject);
    procedure plTotalRecibo(Sender : TObject);
    procedure plCarregaDadosCobranca(Sender : TObject);
    procedure plMostrarGeracaoParcelas(Sender : TObject);
    procedure btnGerarOMsClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAdicionaReciboClick(Sender: TObject);
    procedure btnImpriirReciboClick(Sender: TObject);
  private
    { Private declarations }

    lbEditaRecebimento    : Boolean;
    llPosicao             : LongInt;
    llPosicaoRecibo       : LongInt;
    llIdRecebimento       : LongInt;

    ieAcordo              : TIntegerEdit;
    ieCobranca            : TIntegerEdit;
    ieParcelas            : TIntegerEdit;
    iePeriodo             : TIntegerEdit;

    ieParcela             : TIntegerEdit;
    ieTipoDocumento       : TIntegerEdit;
    ieBanco               : TIntegerEdit;

    feDivida              : TFloatEdit;
    feValor               : TFloatEdit;
    feValorItem           : TFloatEdit;
    feValorRepasse        : TFloatEdit;
    feValorRecibo         : TFloatEdit;
    feEncargosRecibo      : TFloatEdit;
    feMultaRecibo         : TFloatEdit;
    feHonorariosRecibo    : TFloatEdit;
    feValorTotalRecibo    : TFloatEdit;
    feValorEntrada        : TFloatEdit;


    lvItensAcordo         : TSmartListView;
    lvRecibo              : TSmartListView;

    FAcordo               : TACORDO;
    FRecebimento          : TRECEBIMENTO;
    FCobranca             : TCOBRANCA;
    FItensCobranca        : TITENS_COBRANCA;
    FBoleto               : TBOLETO;
    FRecibo               : TRECIBO;
    FParametros           : TPARAMETROS;

    FSimplesAcordo        : TSimplesACORDO;
    FSimplesRecebimento   : TSimplesRECEBIMENTO;
    FSimplesCredor        : TSimplesCREDOR;
    FSimplesDevedor       : TSimplesDEVEDOR;
    FSimplesCobrador      : TSimplesCOBRADOR;
    FSimplesCobranca      : TSimplesCOBRANCA;
    FSimplesItensCobranca : TSimplesITENS_COBRANCA;
    FSimplesEnderecos     : TSimplesENDERECOS;
    FSimplesTelefones     : TSimplesTELEFONES;
    FSimplesBoleto        : TSimplesBOLETO;
    FSimplesTipoDocumento : TSimplesTIPO_DOCUMENTO;
    FSimplesBanco         : TSimplesBANCO;
    FSimplesRecibo        : TSimplesRECIBO;
    FSimplesTipo_Situacao : TSimplesTIPO_SITUACAO;

    FGeraBoleto           : TFreeBoleto;
    ImgBoleto             : TFreeBoletoImagem;
    procedure plCriaBotoes;
    procedure AbrirArquivos;
    procedure AdicionarBoleto;
    procedure BuscaAcordoporDocumento;
    procedure BuscaAcordoporCredor;
    procedure BuscaAcordoporDevedor;
    procedure BuscaAcordoporValor;
    procedure FecharArquivos;
    procedure ExcluirAcordo;
    procedure GerarBoleto(cInstrucoes : String);
    procedure HabilitarControlesItensCobranca(blNovo, blExcluir, blAlterar :
        Boolean);
    procedure plImprimirAcordo;
    procedure VerificaPagamento;
    procedure plGerarCobranca;
    procedure plCarregaAcordo;
    procedure plCarregaCabecalho;
    procedure plCarregaCabRecibo;
    procedure plCarregaItens;
    procedure plCarregaListViewAcordo(lbEdita : Boolean; lstRecebimento :
        TListaRecebimento);
    procedure plConsultaCobranca;
    procedure plHabilitaCabecalho(lbHabilita : Boolean);
    procedure plLimparCampos;
    procedure plLimparCamposItens;
    procedure plLimparCamposRecibo;
    procedure plMostrarRecibo;
    procedure plCarregaRecibo;
    procedure plGravaItem;
    procedure plGerarParcelas;
    procedure plGravaAcordo;
    procedure plGravarRecibo;
    procedure plGravarRecebimentos;
    procedure plImprimirRecibo(Configura : Boolean; IdRecibo : LongInt);
    procedure plGeraImpressaoRecibo(lbConfigura : Boolean);
  public
    { Public declarations }
  end;


  Procedure CallGerarAcordo;


implementation
Uses
   uGetFunctions,
   uFuncoes,
   uPesquisa,
   uLayMemAcordo,
   uLayMemRecibo,
   uInserirInstrucoesBoleto,
   Parametros,
   uBaixaRecebimento,
   uFreeReport,
   Math;

{$R *.dfm}

procedure CallGerarAcordo;
var
  frmAcordo: TfrmAcordo;
Begin
  frmAcordo := TfrmAcordo.Create(Application);
  Try
    frmAcordo.ShowModal;
  Finally
    FreeAndNil(frmAcordo);
  End;
End;


procedure TfrmAcordo.AbrirArquivos;
begin
  FAcordo               := TACORDO.Create(Self);
  FRecebimento          := TRECEBIMENTO.Create(Self);
  FCobranca             := TCOBRANCA.Create(Self);
  FItensCobranca        := TITENS_COBRANCA.Create(Self);
  FBoleto               := TBOLETO.Create(Self);
  FRecibo               := TRECIBO.Create(Self);
  FParametros           := TPARAMETROS.Create(Self);
  FSimplesAcordo        := TSimplesACORDO.Create(Self);
  FSimplesRecebimento   := TSimplesRECEBIMENTO.Create(Self);;
  FSimplesCredor        := TSimplesCREDOR.Create(Self);
  FSimplesDevedor       := TSimplesDEVEDOR.Create(Self);
  FSimplesCobrador      := TSimplesCOBRADOR.Create(Self);
  FSimplesCobranca      := TSimplesCOBRANCA.Create(Self);
  FSimplesItensCobranca := TSimplesITENS_COBRANCA.Create(Self);
  FSimplesEnderecos     := TSimplesENDERECOS.Create(Self);
  FSimplesTelefones     := TSimplesTELEFONES.Create(Self);
  FSimplesBoleto        := TSimplesBOLETO.Create(Self);
  FSimplesTipoDocumento := TSimplesTIPO_DOCUMENTO.Create(Self);
  FSimplesBanco         := TSimplesBANCO.Create(Self);
  FSimplesRecibo        := TSimplesRECIBO.Create(Self);
  FSimplesTipo_Situacao := TSimplesTIPO_SITUACAO.Create(Self);
  FGeraBoleto           := TFreeBoleto.create(application);
  ImgBoleto             := TFreeBoletoImagem.create(self);
  plCriaBotoes;
  plCarregaCabecalho;
  plCarregaCabRecibo;
end;

procedure TfrmAcordo.AdicionarBoleto;
var
  XGeraBoleto : TFreeBoleto;
begin
  XGeraBoleto := TFreeBoleto.create(nil);
  CloneProperties(FGeraBoleto,XGeraBoleto);
  ImgBoleto.ListaBoletos.Add(XGeraBoleto);
end;

procedure TfrmAcordo.FecharArquivos;
begin
  FAcordo.Free;
  FRecebimento.Free;
  FCobranca.Free;
  FItensCobranca.Free;
  FBoleto.Free;
  FRecibo.Free;
  FParametros.Free;
  FSimplesAcordo.Free;
  FSimplesRecebimento.Free;
  FSimplesCredor.Free;
  FSimplesDevedor.Free;
  FSimplesCobrador.Free;
  FSimplesCobranca.Free;
  FSimplesItensCobranca.Free;
  FSimplesEnderecos.Free;
  FSimplesTelefones.Free;
  FSimplesBoleto.Free;
  FSimplesTipoDocumento.Free;
  FSimplesBanco.Free;
  FSimplesRecibo.Free;
  FSimplesTipo_Situacao.Free;
  FGeraBoleto.Free;
  ImgBoleto.Free;
end;

procedure TfrmAcordo.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
  CentralizarForm(Self);
  ckConfigurar.Visible := TUniqueParametros.GetParametros.Privilegiado;
end;

procedure TfrmAcordo.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TfrmAcordo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAcordo.btnImprimeClick(Sender: TObject);
begin
  plImprimirAcordo;
end;

procedure TfrmAcordo.btnExcluirClick(Sender: TObject);
begin
  if   MessageDlg('Tem Certeza Que deseja Excluir Este Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       ExcluirAcordo;
end;

procedure TfrmAcordo.BuscaAcordoporDocumento;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'RECEBIMENTO';
    FConsulta.DefineCampos(['NUMERO_DOCUMENTO','ACORDO', 'PARCELA']);
    FConsulta.CampoCondicao := 'NUMERO_DOCUMENTO';
    If   FConsulta.Execute Then
         ieAcordo.IntegerNumber := FConsulta.Consulta.FieldByName('ACORDO').AsVariant;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmAcordo.ExcluirAcordo;
begin
  Try
    VerificaPagamento;
    FCobranca.Carrega(False);
    If   FCobranca.FindBypk_Cobranca(ieCobranca.IntegerNumber) Then
         Begin
           FCobranca.Edit;
           FCobranca.SITUACAO := 0;
           FCobranca.Post;
           FAcordo.Carrega(False);
           If   FAcordo.FindBypk_IdAcordo(ieAcordo.IntegerNumber) Then
                FAcordo.Delete;
           FSimplesRecebimento.ACORDO := ieAcordo.IntegerNumber;
           FSimplesRecebimento.CarregaSQL;
           FRecebimento.Carrega(False);
           While Not FSimplesRecebimento.Eof Do
             Begin
               If   FRecebimento.FindBypk_Recebimento(FSimplesRecebimento.RECEBIMENTO) Then
                    FRecebimento.Delete;
               FSimplesRecebimento.Next;
             End;
         End;
    ShowMessage('Acordo excluido com sucesso!');
    plLimparCampos;
  Except
    On E: Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmAcordo.VerificaPagamento;
begin
  FSimplesRecebimento.ACORDO := ieAcordo.IntegerNumber;
  FSimplesRecebimento.CarregaSQL;
  While Not FSimplesRecebimento.Eof Do
    Begin
      If   FSimplesRecebimento.PAGO Then
           Raise Exception.Create('Existe parcela paga, Acordo não pode ser excluido!');
      FSimplesRecebimento.Next;
    End;
end;

procedure TfrmAcordo.Documento1Click(Sender: TObject);
begin
  BuscaAcordoporDocumento;
end;

procedure TfrmAcordo.BuscaAcordoporCredor;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'ACORDO';
    FConsulta.DefineCampos(['IDACORDO', 'COBRANCA', 'CREDOR']);
    FConsulta.CampoCondicao := 'CREDOR';
    If   FConsulta.Execute Then
         ieAcordo.IntegerNumber := FConsulta.Consulta.FieldByName('IDACORDO').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmAcordo.BuscaAcordoporDevedor;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'ACORDO';
    FConsulta.DefineCampos(['IDACORDO', 'COBRANCA', 'DEVEDOR']);
    FConsulta.CampoCondicao := 'DEVEDOR';
    If   FConsulta.Execute Then
         ieAcordo.IntegerNumber := FConsulta.Consulta.FieldByName('IDACORDO').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmAcordo.BuscaAcordoporValor;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'RECEBIMENTO';
    FConsulta.DefineCampos(['NUMERO_DOCUMENTO','ACORDO', 'PARCELA', 'VENCIMENTO', 'VALOR']);
    FConsulta.CampoCondicao := 'VALOR';
    FConsulta.TipoCampo := eNumero;
    If   FConsulta.Execute Then
         ieAcordo.IntegerNumber := FConsulta.Consulta.FieldByName('IDACORDO').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmAcordo.Devedor1Click(Sender: TObject);
begin
  BuscaAcordoporDevedor;
end;

procedure TfrmAcordo.Credor1Click(Sender: TObject);
begin
  BuscaAcordoporCredor;
end;

procedure TfrmAcordo.GerarBoleto(cInstrucoes : String);
begin
  FSimplesAcordo.IDACORDO := ieAcordo.IntegerNumber;
  FSimplesAcordo.CarregaSQL;

  FSimplesDevedor.CODIGO_DEVEDOR := FSimplesAcordo.DEVEDOR;
  FSimplesDevedor.CarregaSQL;

  FSimplesEnderecos.NUMERO_ENDERECO := FSimplesDevedor.ENDERECO_PRINCIPAL;
  FSimplesEnderecos.CarregaSQL;

  FSimplesTelefones.ITEM_TELEFONE := FSimplesDevedor.TELEFONE_PRINCIPAL;
  FSimplesTelefones.CarregaSQL;

  FSimplesCredor.CODIGO_CREDOR := FSimplesAcordo.CREDOR;
  FSimplesCredor.CarregaSQL;

  If   Not(FSimplesCredor.GERAR_BOLETOS) Then
       Begin
         FSimplesCredor.CODIGO_CREDOR := TUniqueParametros.GetParametros.EmpresaIdCredor;
         FSimplesCredor.CarregaSQL;
       End;

  If   Not(FSimplesCredor.GERAR_BOLETOS) Then
       Raise Exception.CreateFmt('Credor s% não habilitado para gerar boleto',[FSimplesCredor.NOME_CREDOR]);

  FBoleto.Carrega(False);
  FBoleto.FindByInd_IdCredor(FSimplesCredor.CODIGO_CREDOR);

  If ckCarne.Checked then
  begin
    RLBTitulo1.BoletoLayout                        := blCarne;
    RLBTitulo1.DataProcessamento                   := Date;
    RLBTitulo1.Cedente.ContaBancaria.Banco.Codigo  := FBoleto.BANCO;
    RLBTitulo1.Cedente.ContaBancaria.CodigoAgencia := FBoleto.AGENCIA;
//    RLBTitulo1.Cedente.ContaBancaria.DigitoAgencia := FBoleto. Trim(Edit2.Text);
    RLBTitulo1.Cedente.ContaBancaria.NumeroConta   := FBoleto.CONTA_CORRENTE;
    RLBTitulo1.Cedente.ContaBancaria.DigitoConta   := FBoleto.DIGITO[1];
    RLBTitulo1.Cedente.CodigoCedente               := FBoleto.CEDENTE;
//    RLBTitulo1.Cedente.DigitoCodigoCedente         := Trim(Edit6.Text);
    RLBTitulo1.Carteira                            := FBoleto.CARTEIRA;
    RLBTitulo1.Cedente.ContaBancaria.Convenio      := FBoleto.CONVENIO;
    RLBTitulo1.Cedente.ContaBancaria.NomeCliente   := FSimplesCredor.RAZAO_SOCIAL;
    RLBTitulo1.Cedente.TipoInscricao               := tiPessoaJuridica;
    RLBTitulo1.Cedente.NumeroCPFCGC                := FSimplesCredor.CNPJ_CPF;
    RLBTitulo1.Cedente.Nome                        := FSimplesCredor.RAZAO_SOCIAL;
    //dados do sacado
    RLBTitulo1.Sacado.Nome                         := FSimplesDevedor.NOME_DEVEDOR;
    case FSimplesDevedor.TIPO_DEVEDOR of
      0: RLBTitulo1.Sacado.TipoInscricao           := tiPessoaFisica;
      1: RLBTitulo1.Sacado.TipoInscricao           := tiPessoaJuridica;
    end;
    RLBTitulo1.Sacado.NumeroCPFCGC                 := FSimplesDevedor.CNPJ_CPF;
    RLBTitulo1.Sacado.Endereco.Rua                 := FSimplesEnderecos.ENDERECO;
    RLBTitulo1.Sacado.Endereco.CEP                 := FSimplesEnderecos.CEP;
    RLBTitulo1.Sacado.Endereco.Cidade              := FSimplesEnderecos.CIDADE;
    RLBTitulo1.Sacado.Endereco.Estado              := FSimplesEnderecos.ESTADO;
    If   (FSimplesRecebimento.NUMERO_BOLETO = 0)
    Or   (FSimplesRecebimento.NUMERO_BOLETO = Null) Then
         Begin
           FBoleto.Edit;
           FBoleto.NOSSO_NUMERO := FBoleto.NOSSO_NUMERO + 1;
           FBoleto.Post;

           FRecebimento.Carrega(False);
           If   FRecebimento.FindBypk_Recebimento(FSimplesRecebimento.RECEBIMENTO) Then
                Begin
                  FRecebimento.Edit;
                  FRecebimento.NUMERO_BOLETO    := FBoleto.NOSSO_NUMERO;
                  FRecebimento.NUMERO_DOCUMENTO := IntToStr(FBoleto.NOSSO_NUMERO);
                  FRecebimento.TIPODOCUMENTO    := 20;
                  FRecebimento.Post;
                End;
         End;
    //dados da cobranca
    RLBTitulo1.NossoNumero                         := IntToStr(FSimplesRecebimento.NUMERO_BOLETO);
    RLBTitulo1.ValorDocumento                      := FSimplesRecebimento.VALOR;
    RLBTitulo1.DataDocumento                       := Date;
    RLBTitulo1.DataVencimento                      := FSimplesRecebimento.VENCIMENTO;
    RLBTitulo1.NumeroDocumento                     := FSimplesRecebimento.NUMERO_DOCUMENTO;
    RLBTitulo1.Instrucoes.Text                     := cInstrucoes;
    RLBTitulo1.InsertRecord;
  end
  else
  begin
    FGeraBoleto.LimparTudo;
    FGeraBoleto.Cedente.Agencia       := FBoleto.AGENCIA;
    FGeraBoleto.Cedente.CodigoBanco   := FBoleto.BANCO;
    FGeraBoleto.Moeda                 := '9'; //Fixo Real
    FGeraBoleto.Cedente.Nome          := FSimplesCredor.RAZAO_SOCIAL;
    FGeraBoleto.DataDocumento         := Trunc(FSimplesAcordo.DATA_INCLUSAO);
    FGeraBoleto.Documento             := FSimplesRecebimento.NUMERO_DOCUMENTO;
    FGeraBoleto.Vencimento            := FSimplesRecebimento.VENCIMENTO;
    FGeraBoleto.Cedente.CodigoCedente := FBoleto.CEDENTE;
    FGeraBoleto.Valor                 := FSimplesRecebimento.VALOR;
    If   (FSimplesRecebimento.NUMERO_BOLETO = 0)
    Or   (FSimplesRecebimento.NUMERO_BOLETO = Null) Then
         Begin
           FBoleto.Edit;
           FBoleto.NOSSO_NUMERO := FBoleto.NOSSO_NUMERO + 1;
           FBoleto.Post;

           FRecebimento.Carrega(False);
           If   FRecebimento.FindBypk_Recebimento(FSimplesRecebimento.RECEBIMENTO) Then
                Begin
                  FRecebimento.Edit;
                  FRecebimento.NUMERO_BOLETO := FBoleto.NOSSO_NUMERO;
                  FRecebimento.NUMERO_DOCUMENTO := IntToStr(FBoleto.NOSSO_NUMERO);
                  FRecebimento.TIPODOCUMENTO := 20;
                  FRecebimento.Post;
                End;
         End;
    FGeraBoleto.NossoNumero                      := IntToStr(FSimplesRecebimento.NUMERO_BOLETO);
    FGeraBoleto.Cedente.ContaCorrente            := FBoleto.CONTA_CORRENTE;
    FGeraBoleto.Cedente.DigitoContaCorrente      := FBoleto.DIGITO[1];
    FGeraBoleto.carteira                         := FBoleto.CARTEIRA;
    FGeraBoleto.Cedente.Banco151.ModalidadeConta := FBoleto.MODALIDADE;
    FGeraBoleto.Cedente.Banco001.Convenio        := FBoleto.CONVENIO;
    with FGeraBoleto.sacado do
      begin
        Nome     := FSimplesDevedor.NOME_DEVEDOR;
        Endereco := FSimplesEnderecos.ENDERECO;
        Bairro   := FSimplesEnderecos.BAIRRO;
        Cep      := FSimplesEnderecos.CEP;
        Estado   := FSimplesEnderecos.ESTADO;
        Cidade   := FSimplesEnderecos.CIDADE;
        CNPJ_CPF := FSimplesDevedor.CNPJ_CPF;
      end;
    FGeraBoleto.Instrucoes.Text := cInstrucoes;
    FGeraBoleto.preparar;
    AdicionarBoleto;
  end;
end;

procedure TfrmAcordo.Valor1Click(Sender: TObject);
begin
  BuscaAcordoporValor;
end;

procedure TfrmAcordo.btnBoletoClick(Sender: TObject);
Var
  lsInstrucoes : String;
begin
  lsInstrucoes := InserirInstrucoes;
  Try
    FSimplesRecebimento.ACORDO := ieAcordo.IntegerNumber;
    FSimplesRecebimento.CarregaSQL;
    While Not FSimplesRecebimento.Eof Do
      Begin
        If   Not(FSimplesRecebimento.PAGO) Then
               GerarBoleto(lsInstrucoes);
        FSimplesRecebimento.Next;
      End;
    if   ckCarne.Checked then
         RLBTitulo1.PreviewModal
    else ImgBoleto.ShowPreview;
  Except
    On E : Exception Do
       ShowMessage(E.Message);
  End
end;

procedure TfrmAcordo.plGerarCobranca;
Var
  liItem : Byte;
begin
   liItem := 0;
   FCobranca.Insert;
   FCobranca.CREDOR          := FAcordo.CREDOR;
   FCobranca.DEVEDOR         := FAcordo.DEVEDOR;
   FCobranca.DATA_CADASTRO   := Date;
   FCobranca.SITUACAO        := 0;
   FCobranca.COBRADOR        := 0;
   FCobranca.VALOR_DIVIDA    := FAcordo.VALOR_DIVIDA;
   FCobranca.DATA_DIVIDA     := FAcordo.DATA_ACORDO;
   FCobranca.VALOR_CORRIGIDO := 0.00;
   FCobranca.Post;
   FRecebimento.First;
   While Not(FRecebimento.Eof) Do
      Begin
         If   Not(FRecebimento.PAGO) Then
              Begin
                Inc(liItem);
                FItensCobranca.Insert;
                FItensCobranca.COBRANCA             := FCobranca.COBRANCA;
                FItensCobranca.ITEM                 := liItem;
                FItensCobranca.TIPODOCUMENTO        := FRecebimento.TIPODOCUMENTO;
                FItensCobranca.NUMERO_DOCUMENTO     := FRecebimento.NUMERO_DOCUMENTO;
                FItensCobranca.EMISSAO_DOCUMENTO    := FAcordo.DATA_ACORDO;
                FItensCobranca.VENCIMENTO_DOCUMENTO := FRecebimento.VENCIMENTO;
                FItensCobranca.VALOR_DOCUMENTO      := FRecebimento.VALOR;
                FItensCobranca.SITUACAO             := 0;
                FItensCobranca.ALINES               := 0;
                FItensCobranca.DATA_DIVIDA          := FAcordo.DATA_ACORDO;
                FItensCobranca.OBSERVACAO           := 'Cobrança Gerada pelo Acordo no. ' + IntToStr(FAcordo.IDACORDO) + ' Cancelado ';
                FItensCobranca.Post;
              End
         Else
              Begin
                FCobranca.Edit;
                FCobranca.VALOR_DIVIDA := FCobranca.VALOR_DIVIDA - FRecebimento.VALOR;
                FCobranca.Post;
              End;
         FRecebimento.Next;
      End;
   ShowMessage('Acordo cancelado, Cobranca ' + IntToStr(FCobranca.COBRANCA) + ' gerada ');
end;

procedure TfrmAcordo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
(*
    CanClose := True;
    If   (dsAcordo.State in [dsEdit,dsInsert])
    Or   (dsAcordo.State in [dsEdit,dsInsert]) Then
         Begin
           ShowMessage('Registro em edição, por favor confirme!');
           CanClose := False;
         End;
*)
end;

procedure TfrmAcordo.HabilitarControlesItensCobranca(blNovo, blExcluir,
    blAlterar: Boolean);
begin
  btnAdicionarItem.Enabled := blNovo;
  btnDeletarItem.Enabled   := blExcluir;
  btnAlterarItem.Enabled   := blAlterar;
end;

procedure TfrmAcordo.lvItensAcordoGetPath(var APath: String);
begin
  APath := 'C:\';
end;

procedure TfrmAcordo.plImprimirAcordo;
Var
  FMemAcordo   : TMemAcordo;
  FMemParcelas : TMemParcelas;
  Report       : TFreeReport;
  FrAcordo     : TfrMyDBDataset;
  FrParcelas   : TfrMyDBDataset;

  procedure plPosicionaTabelas;
  Begin
     FSimplesAcordo.IDACORDO := ieAcordo.IntegerNumber;
     FSimplesAcordo.CarregaSQL;
     If   FSimplesAcordo.Eof Then
          Raise Exception.Create('Acordo não encotrado! Por favor reinforme!');

     FSimplesCredor.CODIGO_CREDOR := FSimplesAcordo.CREDOR;
     FSimplesCredor.CarregaSQL;
     If   FSimplesCredor.Eof Then
          Raise Exception.Create('Credor não encotrado!');

     FSimplesDevedor.CODIGO_DEVEDOR := FSimplesAcordo.DEVEDOR;
     FSimplesDevedor.CarregaSQL;
     If   FSimplesDevedor.Eof Then
          Raise Exception.Create('Devedor não encontrado');

     FSimplesEnderecos.NUMERO_ENDERECO := FSimplesDevedor.ENDERECO_PRINCIPAL;
     FSimplesEnderecos.CarregaSQL;
     If   FSimplesEnderecos.Eof Then
          Raise Exception.Create('Endereço principal do devedor não encontrado!');

     FSimplesTelefones.ITEM_TELEFONE := FSimplesDevedor.TELEFONE_PRINCIPAL;
     FSimplesTelefones.CarregaSQL;

     FSimplesCobranca.COBRANCA := FSimplesAcordo.COBRANCA;
     FSimplesCobranca.CarregaSQL;

  End;

  procedure plDescricaoDivida;
  Begin
    FSimplesItensCobranca.COBRANCA := FSimplesCobranca.COBRANCA;
    FSimplesItensCobranca.CarregaSQL;
    While Not FSimplesItensCobranca.Eof Do
      Begin
        If   FSimplesItensCobranca.TIPODOCUMENTO = 1 Then
             Begin
               FMemAcordo.DIVIDAS := FMemAcordo.DIVIDAS + 'CH NO. '+FSimplesItensCobranca.NUMERO_DOCUMENTO+', ';
             End
        Else
             Begin
               FMemAcordo.DIVIDAS := FMemAcordo.DIVIDAS + DateToStr(FSimplesItensCobranca.VENCIMENTO_DOCUMENTO)+', ';
               FSimplesTipoDocumento.TIPO_DOCUMENTO := FSimplesItensCobranca.TIPODOCUMENTO;
               FSimplesTipoDocumento.CarregaSQL;
               If   Not FSimplesTipoDocumento.Eof Then
                    FMemAcordo.DIVIDAS := FMemAcordo.DIVIDAS + ' ('+FSimplesTipoDocumento.SIGLA_DOCUMENTO+') ';
             End;
        FSimplesItensCobranca.Next;
      End;
  End;

begin
  FMemAcordo   := TMemAcordo.Create(Self);
  FMemParcelas := TMemParcelas.Create(Self);
  Report       := TFreeReport.Create(Self);
  FrAcordo     := TfrMyDBDataset.Create(Self);
  FrAcordo.Name := 'FrAcordo';
  FrParcelas   := TfrMyDBDataset.Create(Self);
  FrParcelas.Name := 'FrParcelas';
  Try
    plPosicionaTabelas;
    FrAcordo.DataSet   := FMemAcordo;
    FrParcelas.DataSet := FMemParcelas;
    FMemAcordo.Close;
    FMemAcordo.Open;
    FMemAcordo.Insert;
    FMemAcordo.ACORDO          := FSimplesAcordo.IDACORDO;
    FMemAcordo.CREDOR_NOME     := FSimplesCredor.RAZAO_SOCIAL;
    FMemAcordo.CREDOR_CNPJ     := FSimplesCredor.CNPJ_CPF;
    FMemAcordo.CREDOR_ENDERECO := FSimplesCredor.ENDERECO+', '+
                                  FSimplesCredor.NUMERO+' - '+
                                  FSimplesCredor.BAIRRO;
    FMemAcordo.CREDOR_CIDADE   := FSimplesCredor.CIDADE;
    FMemAcordo.CREDOR_ESTADO   := FSimplesCredor.ESTADO;

    FMemAcordo.DEVEDOR_NOME     := FSimplesDevedor.NOME_DEVEDOR;
    FMemAcordo.DEVEDOR_CPF      := FSimplesDevedor.CNPJ_CPF;
    FMemAcordo.DEVEDOR_RG       := FSimplesDevedor.IDENTIDADE;
    FMemAcordo.DEVEDOR_FONE     := FSimplesTelefones.NUMERO_TELEFONE;
    FMemAcordo.DEVEDOR_ENDERECO := FSimplesEnderecos.ENDERECO+', '+
                                   FSimplesEnderecos.NUMERO+' - '+
                                   FSimplesEnderecos.BAIRRO;
    FMemAcordo.DEVEDOR_CIDADE   := FSimplesEnderecos.CIDADE;
    FMemAcordo.DEVEDOR_CEP      := FSimplesEnderecos.CEP;
    FMemAcordo.DEVEDOR_ESTADO   := FSimplesEnderecos.ESTADO;
    plDescricaoDivida;
    FMemAcordo.VALOR_DIVIDA    := FSimplesAcordo.VALOR_DIVIDA;
    FMemAcordo.VALOR_CORRIGIDO := FSimplesAcordo.VALOR_CORRIGIDO;
    FMemAcordo.PARCELA         := FSimplesAcordo.PRESTACOES;
    FMemAcordo.EXTENSO_VALOR_TOTAL  := ValorExtenso(FMemAcordo.VALOR_CORRIGIDO);
    FMemAcordo.Post;

    FMemParcelas.Close;
    FMemParcelas.Open;

    FSimplesRecebimento.ACORDO := FSimplesAcordo.IDACORDO;
    FSimplesRecebimento.CarregaSQL;
    While  Not FSimplesRecebimento.Eof Do
      Begin
        FMemParcelas.Insert;
        FMemParcelas.ACORDO         := FMemAcordo.ACORDO;
        FMemParcelas.PARCELAS       := IntToStr(FSimplesRecebimento.PARCELA) + '/' + IntToStr(FSimplesAcordo.PRESTACOES);
        FMemParcelas.VALOR_PARCELAS := FSimplesRecebimento.VALOR;
        FMemParcelas.DATA_PAGAMENTO := FSimplesRecebimento.VENCIMENTO;
        FMemParcelas.Post;
        FSimplesRecebimento.Next;
      End;

      If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'Acordo.frf') Then
           Begin
             Report.Arquivo :=  TUniqueParametros.GetParametros.DatabaseReport + 'Acordo.frf';
             If   ckConfigurar.Checked Then
                  Report.Desenhar
             Else Report.Visualiza;
           End
      Else Report.Desenhar;
  Finally
    FreeAndNil(FrAcordo);
    FreeAndNil(FrParcelas);
    FreeAndNil(FMemAcordo);
    FreeAndNil(FMemParcelas);
    FreeAndNil(Report);
  End;
end;

procedure TfrmAcordo.plCriaBotoes;
begin
  ieAcordo := TIntegerEdit.Create(Self);
  With ieAcordo Do
    Begin
      Parent     := pnAcordo;
      Name       := 'ieAcordo';
      Align      := alClient;
      OnExit     := ieAcordoOnExit;
      ShowButton := True;
      OnBtnClick := btnProcuraAcordo;
    End;
  ieCobranca := TIntegerEdit.Create(Self);
  With ieCobranca Do
    Begin
      Parent     := pnCobranca;
      Name       := 'ieCobranca';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := ieCobrancaBtnClick;
      OnExit     := plCarregaDadosCobranca;
    End;
  ieParcelas := TIntegerEdit.Create(Self);
  With ieParcelas Do
    Begin
      Parent  := pnParcelas;
      Name    := 'ieParcelas';
      Align   := alClient;
      OnExit  := plMostrarGeracaoParcelas;
    End;
  ieParcela := TIntegerEdit.Create(Self);
  With ieParcela Do
    Begin
      Parent := pnParcela;
      Name   := 'ieParcela';
      Align  := alClient;
    End;
  ieTipoDocumento := TIntegerEdit.Create(Self);
  With ieTipoDocumento Do
    Begin
      Parent := pnTipoDoc;
      Name   := 'ieTipoDoc';
      Align  := alClient;
    End;
  ieBanco := TIntegerEdit.Create(Self);
  With ieBanco Do
    Begin
      Parent := pnBanco;
      Name   := 'ieBanco';
      Align  := alClient;
    End;
  iePeriodo := TIntegerEdit.Create(Self);
  With iePeriodo Do
    Begin
      Parent := pnPeriodo;
      Name   := 'iePeriodo';
      Align  := alClient;  
    End;
  feDivida := TFloatEdit.Create(Self);
  With feDivida Do
    Begin
      Parent := pnDivida;
      Name   := 'feDivida';
      Align  := alClient;
    End;
  feValor  := TFloatEdit.Create(Self);
  With feValor Do
    Begin
      Parent := pnValorAcordo;
      Name   := 'feValor';
      Align  := alClient;
    End;
  feValorItem  := TFloatEdit.Create(Self);
  With feValorItem Do
    Begin
      Parent := pnValorItem;
      Name   := 'feValorItem';
      Align  := alClient;
    End;
  feValorRepasse  := TFloatEdit.Create(Self);
  With feValorRepasse Do
    Begin
      Parent := pnRepasse;
      Name   := 'feValorRepasse';
      Align  := alClient;
    End;
  feValorRecibo  := TFloatEdit.Create(Self);
  With feValorRecibo Do
    Begin
      Parent   := pnValorRecibo;
      Name     := 'feValorRecibo';
      Align    := alClient;
      OnChange := plTotalRecibo;
    End;
  feValorTotalRecibo  := TFloatEdit.Create(Self);
  With feValorTotalRecibo Do
    Begin
      Parent   := pnTotalRecibo;
      Name     := 'feValorTotalRecibo';
      Align    := alClient;
    End;
  feEncargosRecibo  := TFloatEdit.Create(Self);
  With feEncargosRecibo Do
    Begin
      Parent   := pnEncargosRecibo;
      Name     := 'feEncargosRecibo';
      Align    := alClient;
      OnChange := plTotalRecibo;
    End;
  feMultaRecibo  := TFloatEdit.Create(Self);
  With feMultaRecibo Do
    Begin
      Parent   := pnMultaRecibo;
      Name     := 'feMultaRecibo';
      Align    := alClient;
      OnChange := plTotalRecibo;
    End;
  feHonorariosRecibo  := TFloatEdit.Create(Self);
  With feHonorariosRecibo Do
    Begin
      Parent   := pnHonorariosRecibo;
      Name     := 'feHonorariosRecibo';
      Align    := alClient;
      OnChange := plTotalRecibo;
    End;
  feValorEntrada := TFloatEdit.Create(Self);
  With  feValorEntrada Do
    Begin
      Parent   := pnValorEntrada;
      Name     := 'feValorEntrada';
      Align    := alClient;
    End;

  lvItensAcordo := TSmartListView.Create(Self);
  With lvItensAcordo Do
    Begin
      Align             := alClient;
      Parent            := pnlvAcordo;
      Name              := 'lvItensAcordo';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
      OnGetPath         := lvItensAcordoGetPath;
      Color             := clInfoBk;
      GridLines         := True;
      ReadOnly          := True;
      RowSelect         := True;
      EnableSort        := True;
      EnableFilter      := True;
      EnableSum         := True;
      ShowMainColumns   := False;
      EnablePaintCells  := True;
      Checkboxes        := True;
      OnDblClick        := lvItensAcordoDbClick;
      OnClick           := lvItensAcordoClick;
    End;
  lvRecibo := TSmartListView.Create(Self);
  With lvRecibo Do
    Begin
      Align             := alClient;
      Parent            := pnRecibo;
      Name              := 'lvRecibo';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
      OnGetPath         := lvReciboGetPath;
      Color             := clInfoBk;
      GridLines         := True;
      ReadOnly          := True;
      RowSelect         := True;
      EnableSort        := True;
      EnableFilter      := True;
      EnableSum         := True;
      ShowMainColumns   := False;
      EnablePaintCells  := True;
    End;
end;

procedure TfrmAcordo.ieAcordoOnExit(Sender: TObject);
begin
  If   ieAcordo.IntegerNumber <> 0 Then
       plCarregaAcordo;
end;

procedure TfrmAcordo.plCarregaAcordo;
Var
  lstListaRecebimento : TListaRecebimento;
begin
  Try
    lvItensAcordo.Clear;
    FSimplesAcordo.IDACORDO := ieAcordo.IntegerNumber;
    FSimplesAcordo.CarregaSQL;
    If   FSimplesAcordo.Eof Then
         Raise Exception.Create('Acordo Inexistente!');

    ieCobranca.IntegerNumber := FSimplesAcordo.COBRANCA;
    ieParcelas.IntegerNumber := FSimplesAcordo.PRESTACOES;
    feDivida.FloatNumber     := FSimplesAcordo.VALOR_DIVIDA;
    feValor.FloatNumber      := FSimplesAcordo.VALOR_CORRIGIDO;
    Case FSimplesAcordo.STATUS of
      0: lblSituacao.Caption := 'Acordo Gerado';
      1: lblSituacao.Caption := 'Acordo Confirmado';
    End;

    FSimplesCredor.CODIGO_CREDOR := FSimplesAcordo.CREDOR;
    FSimplesCredor.CarregaSQL;

    lblCredor.Caption := IntToStr(FSimplesCredor.CODIGO_CREDOR) + ' - ' +
                         FSimplesCredor.NOME_CREDOR;

    FSimplesDevedor.CODIGO_DEVEDOR := FSimplesAcordo.DEVEDOR;
    FSimplesDevedor.CarregaSQL;

    lblDevedor.Caption := IntToStr(FSimplesDevedor.CODIGO_DEVEDOR) + ' - ' +
                          FSimplesDevedor.NOME_DEVEDOR;

    FSimplesRecebimento.ACORDO := FSimplesAcordo.IDACORDO;
    FSimplesRecebimento.CarregaSQL;
    While Not FSimplesRecebimento.Eof Do
       Begin
         lstListaRecebimento                    := TListaRecebimento.Create;
         lstListaRecebimento.RECEBIMENTO        := FSimplesRecebimento.RECEBIMENTO;
         lstListaRecebimento.ACORDO             := FSimplesRecebimento.ACORDO;
         lstListaRecebimento.COBRANCA           := FSimplesRecebimento.COBRANCA;
         lstListaRecebimento.PARCELA            := FSimplesRecebimento.PARCELA;
         lstListaRecebimento.VENCIMENTO         := FSimplesRecebimento.VENCIMENTO;
         lstListaRecebimento.SITUACAO           := FSimplesRecebimento.SITUACAO;
         lstListaRecebimento.VALOR              := FSimplesRecebimento.VALOR;
         lstListaRecebimento.COMISSAO           := FSimplesRecebimento.COMISSAO;
         lstListaRecebimento.VALOR_REPASSE      := FSimplesRecebimento.VALOR_REPASSE;
         lstListaRecebimento.TIPODOCUMENTO      := FSimplesRecebimento.TIPODOCUMENTO;
         lstListaRecebimento.NUMERO_DOCUMENTO   := FSimplesRecebimento.NUMERO_DOCUMENTO;
         lstListaRecebimento.PAGO               := FSimplesRecebimento.PAGO;
         lstListaRecebimento.DATA_PAGAMENTO     := FSimplesRecebimento.DATA_PAGAMENTO;
         lstListaRecebimento.OBSERVACAO         := FSimplesRecebimento.OBSERVACAO;
         lstListaRecebimento.COBRADOR           := FSimplesRecebimento.COBRADOR;
         lstListaRecebimento.PROMESSA_PAGAMENTO := FSimplesRecebimento.PROMESSA_PAGAMENTO;
         lstListaRecebimento.PAGTO_PRE_DATADO   := FSimplesRecebimento.PAGTO_PRE_DATADO;
         lstListaRecebimento.VENCIMENTO_REAL    := FSimplesRecebimento.VENCIMENTO_REAL;
         lstListaRecebimento.JUROS              := FSimplesRecebimento.JUROS;
         lstListaRecebimento.CHEQUE_COMPENSADO  := FSimplesRecebimento.CHEQUE_COMPENSADO;
         lstListaRecebimento.BANCO              := FSimplesRecebimento.BANCO;
         lstListaRecebimento.IDREPASSE          := FSimplesRecebimento.IDREPASSE;
         lstListaRecebimento.NUMERO_BOLETO      := FSimplesRecebimento.NUMERO_BOLETO;
         plCarregaListViewAcordo(False,lstListaRecebimento);
         FSimplesRecebimento.Next;
       End;
    gbCabecalho.Enabled := False;
  Except
    On E: Exception Do
       Begin
         ieAcordo.SetFocus;
         ShowMessage(E.Message);
       End;
  End;
end;

procedure TfrmAcordo.plCarregaCabecalho;
begin
  lvItensAcordo.Clear;
  lvItensAcordo.TabularView.ClearColumns;
  lvItensAcordo.TabularView.AddColumn('Parcela'     , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvItensAcordo.TabularView.AddColumn('Vencimento'  , taRightJustify, otAsc, '', True, SmNotSum  , nil, ctDate);
  lvItensAcordo.TabularView.AddColumn('Valor'       , taRightJustify, otAsc, '###.##@,@@', True, smFloat  , nil, ctFloat);
  lvItensAcordo.TabularView.AddColumn('Documento'   , taCenter      , otAsc, '', True, SmNotSum  , nil, ctString);
  lvItensAcordo.TabularView.AddColumn('Numero'      , taCenter      , otAsc, '', True, SmNotSum  , nil, ctInteger);
  lvItensAcordo.TabularView.AddColumn('Pago'        , taRightJustify, otAsc, '', True, smNotSum   , nil, ctString);
  lvItensAcordo.TabularView.AddColumn('Pagamento'   , taRightJustify, otAsc, '', True, smNotSum   , nil, ctDate);

  lvItensAcordo.AdjustColumnsByName['Parcela'   ].ColumnType := ctInteger;
  lvItensAcordo.AdjustColumnsByName['Vencimento'].ColumnType := ctDate;
  lvItensAcordo.AdjustColumnsByName['Valor'     ].ColumnType := ctFloat;
  lvItensAcordo.AdjustColumnsByName['Documento' ].ColumnType := ctString;
  lvItensAcordo.AdjustColumnsByName['Numero'    ].ColumnType := ctInteger;
  lvItensAcordo.AdjustColumnsByName['Pago'      ].ColumnType := ctString;
  lvItensAcordo.AdjustColumnsByName['Pagamento' ].ColumnType := ctDate;

  lvItensAcordo.Execute;
end;

procedure TfrmAcordo.ieCobrancaBtnClick(Sender: TObject);
begin
  plConsultaCobranca;
end;

procedure TfrmAcordo.plCarregaListViewAcordo(lbEdita : Boolean; lstRecebimento
    : TListaRecebimento);
begin
   FSimplesTipoDocumento.TIPO_DOCUMENTO := lstRecebimento.TIPODOCUMENTO;
   FSimplesTipoDocumento.CarregaSQL;
   If   lbEdita Then
        Begin
          lvItensAcordo.AdjustColumnsByName['Parcela'   ].Lines[llPosicao] := IntToStr(lstRecebimento.PARCELA);
          lvItensAcordo.AdjustColumnsByName['Vencimento'].Lines[llPosicao] := DateToStr(lstRecebimento.VENCIMENTO);
          lvItensAcordo.AdjustColumnsByName['Valor'     ].Lines[llPosicao] := FormatFloat('#,##0.00',lstRecebimento.VALOR);
          lvItensAcordo.AdjustColumnsByName['Documento' ].Lines[llPosicao] := FSimplesTipoDocumento.DESCRICAO;
          lvItensAcordo.AdjustColumnsByName['Numero'    ].Lines[llPosicao] := lstRecebimento.NUMERO_DOCUMENTO;
          lvItensAcordo.TabularView.Checked[llPosicao] := lstRecebimento.PAGO;
          If   lstRecebimento.PAGO Then
               lvItensAcordo.AdjustColumnsByName['Pago'      ].Lines[llPosicao] := 'Sim'
          Else lvItensAcordo.AdjustColumnsByName['Pago'      ].Lines[llPosicao] := 'Não';
          If   lstRecebimento.DATA_PAGAMENTO <> 0 Then
               lvItensAcordo.AdjustColumnsByName['Pagamento' ].Lines[llPosicao] := DateToStr(lstRecebimento.DATA_PAGAMENTO);
          llPosicao := -1;
          lbEditaRecebimento := False;
        End
   Else
        Begin
          lvItensAcordo.AdjustColumnsByName['Parcela'   ].Lines.Add(IntToStr(lstRecebimento.PARCELA));
          lvItensAcordo.AdjustColumnsByName['Vencimento'].Lines.Add(DateToStr(lstRecebimento.VENCIMENTO));
          lvItensAcordo.AdjustColumnsByName['Valor'     ].Lines.Add(FormatFloat('#,##0.00',lstRecebimento.VALOR));
          lvItensAcordo.AdjustColumnsByName['Documento' ].Lines.Add(FSimplesTipoDocumento.DESCRICAO);
          lvItensAcordo.AdjustColumnsByName['Numero'    ].Lines.Add(lstRecebimento.NUMERO_DOCUMENTO);
          lvItensAcordo.TabularView.Checked[lvItensAcordo.TabularView.LinesCount-1] := lstRecebimento.PAGO;
          If   lstRecebimento.PAGO Then
               lvItensAcordo.AdjustColumnsByName['Pago'      ].Lines.Add('Sim')
          Else lvItensAcordo.AdjustColumnsByName['Pago'      ].Lines.Add('Não');
          If   lstRecebimento.DATA_PAGAMENTO <> 0 Then
               lvItensAcordo.AdjustColumnsByName['Pagamento' ].Lines.Add(DateToStr(lstRecebimento.DATA_PAGAMENTO))
          Else lvItensAcordo.AdjustColumnsByName['Pagamento' ].Lines.Add('');
          lvItensAcordo.TabularView.Data[lvItensAcordo.TabularView.LinesCount-1] := lstRecebimento;
        End;
  lvItensAcordo.Execute;
end;

procedure TfrmAcordo.plConsultaCobranca;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'COBRANCA';
    FConsulta.DefineCampos(['COBRANCA','CREDOR','DEVEDOR','DATA_CADASTRO']);
    FConsulta.CampoCondicao := 'COBRANCA';
    If   FConsulta.Execute Then
         Begin
           ieCobranca.IntegerNumber := FConsulta.Consulta.FieldByName('COBRANCA').AsInteger;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmAcordo.plHabilitaCabecalho(lbHabilita: Boolean);
begin
  ieAcordo.Enabled   := lbHabilita;
  ieCobranca.Enabled := lbHabilita;
  feDivida.Enabled   := lbHabilita;
  feValor.Enabled    := lbHabilita;
  ieParcelas.Enabled := lbHabilita;
end;

procedure TfrmAcordo.lvItensAcordoDbClick(Sender : TObject);
begin
  If   btnAdicionarItem.Enabled Then
       plCarregaItens;
end;

procedure TfrmAcordo.plCarregaItens;
Var
  Li : TListItem;
  ListaRecebimento : TListaRecebimento;
begin
  If   Not lbEditaRecebimento Then
       Begin
          If   lvItensAcordo.TabularView.LinesCount > 0 Then
               Begin
                 Li := lvItensAcordo.Selected;
                 If   (Li <> Nil)
                 And  (Li.Index <  lvItensAcordo.TabularView.LinesCount) Then
                    Begin
                      llPosicao                            := lvItensAcordo.ItemIndex[Li.Index];
                      ListaRecebimento                     := TListaRecebimento(lvItensAcordo.TabularView.Data[llPosicao]);
                      ieParcela.IntegerNumber              := ListaRecebimento.PARCELA;
                      dtVencimento.DateTime                := ListaRecebimento.VENCIMENTO;
                      feValorItem.FloatNumber              := ListaRecebimento.VALOR;
                      feValorRepasse.FloatNumber           := ListaRecebimento.VALOR_REPASSE;
                      ieTipoDocumento.IntegerNumber        := ListaRecebimento.TIPODOCUMENTO;
                      edNumeroDocumento.Text               := ListaRecebimento.NUMERO_DOCUMENTO;
                      ckPago.Checked                       := ListaRecebimento.PAGO;
                      dtPagamento.Enabled                  := ListaRecebimento.PAGO;
                      dtPagamento.DateTime                 := ListaRecebimento.DATA_PAGAMENTO;
                      ckPreDatado.Checked                  := ListaRecebimento.PAGTO_PRE_DATADO;
                      ckChequeCompensado.Checked           := ListaRecebimento.CHEQUE_COMPENSADO;
                      ieBanco.IntegerNumber                := ListaRecebimento.BANCO;
                      FSimplesBanco.NUMERO_BANCO           := ieBanco.IntegerNumber;
                      FSimplesBanco.CarregaSQL;
                      pnDescBanco.Caption                  := FSimplesBanco.NOME_BANCO;
                      FSimplesTipoDocumento.TIPO_DOCUMENTO := ieTipoDocumento.IntegerNumber;
                      FSimplesTipoDocumento.CarregaSQL;
                      pnDescTipo.Caption                   := FSimplesTipoDocumento.DESCRICAO;
                      lbEditaRecebimento                   := True;
                      HabilitarControlesItensCobranca(True,False,False);
                    End;
               End;
       End;
end;

procedure TfrmAcordo.btnAlterarItemClick(Sender: TObject);
begin
  plCarregaItens;
end;

procedure TfrmAcordo.plLimparCampos;
begin
 ieAcordo.IntegerNumber        := 0;
 ieCobranca.IntegerNumber      := 0;
 ieParcelas.IntegerNumber      := 0;
 feDivida.FloatNumber          := 0.00;
 feValor.FloatNumber           := 0.00;
 plLimparCamposItens;
 lvItensAcordo.Clear;
 pnRecibo.Visible              := False;
 Splitter1.Visible             := False;
 gbCabecalho.Enabled           := True;
end;

procedure TfrmAcordo.btnLimparClick(Sender: TObject);
begin
  plLimparCampos;
end;

procedure TfrmAcordo.plLimparCamposItens;
begin
 ieParcela.IntegerNumber       := 0;
 ieTipoDocumento.IntegerNumber := 0;
 ieBanco.IntegerNumber         := 0;
 feValorItem.FloatNumber       := 0.00;
 feValorRepasse.FloatNumber    := 0.00;
 edNumeroDocumento.Text        := '';
 dtVencimento.DateTime         := Now;
 dtPagamento.DateTime          := Now;
 ckPago.Checked                := False;
 ckPreDatado.Checked           := False;
 ckChequeCompensado.Checked    := False;
end;

procedure TfrmAcordo.btnConfiguraListViewClick(Sender: TObject);
begin
  lvItensAcordo.ConfigureView;
end;

procedure TfrmAcordo.lvItensAcordoClick(Sender: TObject);
begin
  plMostrarRecibo;
end;

procedure TfrmAcordo.lvReciboGetPath(var APath: String);
begin
  APath := 'C:\';
end;

procedure TfrmAcordo.plMostrarRecibo;
Var
  Li : TListItem;
begin
  If   lvItensAcordo.TabularView.LinesCount > 0 Then
       Begin
         Li := lvItensAcordo.Selected;
         If   (Li <> Nil)
         And  (Li.Index <  lvItensAcordo.TabularView.LinesCount) Then
              Begin
                llIdRecebimento   := TListaRecebimento(lvItensAcordo.TabularView.Data[lvItensAcordo.ItemIndex[Li.Index]]).RECEBIMENTO;
                FSimplesRecebimento.RECEBIMENTO := llIdRecebimento;
                FSimplesRecebimento.CarregaSQL;
                If   Not(FSimplesRecebimento.Eof) Then
                     Begin
                       pnRecibo.Visible  := FSimplesRecebimento.PAGO;
                       Splitter1.Visible := FSimplesRecebimento.PAGO;
                       plCarregaRecibo;
                     End
                Else
                     Begin
                       pnRecibo.Visible  := FSimplesRecebimento.PAGO;
                       Splitter1.Visible := FSimplesRecebimento.PAGO;
                     End;
              End;
       End
  Else pnRecibo.Visible := False;
end;

procedure TfrmAcordo.plCarregaCabRecibo;
begin
  lvRecibo.Clear;
  lvRecibo.TabularView.ClearColumns;

  lvRecibo.TabularView.AddColumn('Recibo'     , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvRecibo.TabularView.AddColumn('Valor'      , taRightJustify, otAsc, '', True, smFloat  , nil, ctFloat);
  lvRecibo.TabularView.AddColumn('Encargos'   , taRightJustify, otAsc, '', True, smFloat  , nil, ctFloat);
  lvRecibo.TabularView.AddColumn('Multas'     , taRightJustify, otAsc, '', True, smFloat  , nil, ctFloat);
  lvRecibo.TabularView.AddColumn('Honorarios' , taRightJustify, otAsc, '', True, smFloat  , nil, ctFloat);

  lvRecibo.AdjustColumnsByName['Recibo'    ].ColumnType := ctInteger;
  lvRecibo.AdjustColumnsByName['Valor'     ].ColumnType := ctFloat;
  lvRecibo.AdjustColumnsByName['Encargos'  ].ColumnType := ctFloat;
  lvRecibo.AdjustColumnsByName['Multas'    ].ColumnType := ctFloat;
  lvRecibo.AdjustColumnsByName['Honorarios'].ColumnType := ctFloat;

  lvRecibo.Execute;
end;

procedure TfrmAcordo.plCarregaRecibo;
Var
  Li : TListItem;
  ListaRecibo : TListaRecibo;
begin
  plLimparCamposRecibo;
  lvRecibo.Clear;
  FSimplesRecibo.IDRECEBIMENTO := llIdRecebimento;
  FSimplesRecibo.CarregaSQL;
  While Not FSimplesRecibo.Eof Do
    Begin
      ListaRecibo := TListaRecibo.Create;
      ListaRecibo.Numero_Recibo   := FSimplesRecibo.NUMERO_RECIBO;
      ListaRecibo.Encargos        := FSimplesRecibo.ENCARGOS;
      ListaRecibo.Honorarios      := FSimplesRecibo.HONORARIOS;
      ListaRecibo.IdRecebimento   := FSimplesRecibo.IDRECEBIMENTO;
      ListaRecibo.Multa           := FSimplesRecibo.MULTA;
      ListaRecibo.Valor_Principal := FSimplesRecibo.VALOR_PRINCIPAL;
      ListaRecibo.Situacao        := FSimplesRecibo.SITUACAO;
      lvRecibo.AdjustColumnsByName['Recibo'    ].Lines.Add(IntToStr(ListaRecibo.Numero_Recibo));
      lvRecibo.AdjustColumnsByName['Valor'     ].Lines.Add(FormatFloat('#,##0.00',ListaRecibo.Valor_Principal));
      lvRecibo.AdjustColumnsByName['Encargos'  ].Lines.Add(FormatFloat('#,##0.00',ListaRecibo.Encargos));
      lvRecibo.AdjustColumnsByName['Multas'    ].Lines.Add(FormatFloat('#,##0.00',ListaRecibo.Multa));
      lvRecibo.AdjustColumnsByName['Honorarios'].Lines.Add(FormatFloat('#,##0.00',ListaRecibo.Honorarios));
      lvRecibo.TabularView.Data[lvRecibo.TabularView.LinesCount-1] := ListaRecibo;
      lvRecibo.Execute;
      FSimplesRecibo.Next;
    End;
end;

procedure TfrmAcordo.ckPagoClick(Sender: TObject);
begin
  dtPagamento.Enabled := ckPago.Checked;
  dtPagamento.Date    := Date; 
end;

procedure TfrmAcordo.btnAdicionarItemClick(Sender: TObject);
begin
  plGravaItem;
end;

procedure TfrmAcordo.plGravaItem;
Var
  ListaRecebimento : TListaRecebimento;
begin
  If   lbEditaRecebimento Then
       ListaRecebimento   := TListaRecebimento(lvItensAcordo.TabularView.Data[llPosicao])
  Else ListaRecebimento   := TListaRecebimento.Create;
  ListaRecebimento.PARCELA           := ieParcela.IntegerNumber;
  ListaRecebimento.VENCIMENTO        := dtVencimento.DateTime;
  ListaRecebimento.SITUACAO          := 0;
  ListaRecebimento.VALOR             := feValorItem.FloatNumber;
  ListaRecebimento.VALOR_REPASSE     := feValorRepasse.FloatNumber;
  ListaRecebimento.TIPODOCUMENTO     := ieTipoDocumento.IntegerNumber;
  ListaRecebimento.NUMERO_DOCUMENTO  := edNumeroDocumento.Text;
  ListaRecebimento.PAGO              := ckPago.Checked;
  ListaRecebimento.DATA_PAGAMENTO    := dtPagamento.DateTime;
  ListaRecebimento.OBSERVACAO        := mmObservacoes.Lines.Text;
  ListaRecebimento.PAGTO_PRE_DATADO  := ckPreDatado.Checked;
  ListaRecebimento.CHEQUE_COMPENSADO := ckChequeCompensado.Checked;
  plCarregaListViewAcordo(lbEditaRecebimento,ListaRecebimento);
  plLimparCamposItens;
end;

procedure TfrmAcordo.btnProcuraAcordo(Sender: TObject);
Var
  X,Y : Integer;
begin
  X := Self.Left + ieAcordo.Left + ieAcordo.Width;
  Y := Self.Top + ieAcordo.Top + ieAcordo.Height;
  pmLocalizar.AutoPopup := False;
  pmLocalizar.Popup(X,Y);
end;

procedure TfrmAcordo.plTotalRecibo(Sender: TObject);
begin
  feValorTotalRecibo.FloatNumber := feValorRecibo.FloatNumber +
                                    feEncargosRecibo.FloatNumber +
                                    feMultaRecibo.FloatNumber +
                                    feHonorariosRecibo.FloatNumber;

end;

procedure TfrmAcordo.plCarregaDadosCobranca(Sender: TObject);
begin
  Try
    FSimplesCobranca.COBRANCA := ieCobranca.IntegerNumber;
    FSimplesCobranca.CarregaSQL;
    If   FSimplesCobranca.Eof Then
         Raise Exception.Create('Cobrança Inexistente');
    If   FSimplesCobranca.SITUACAO <> 0 Then
         Begin
           FSimplesTipo_Situacao.TIPO_SITUACAO := FSimplesCobranca.SITUACAO;
           FSimplesTipo_Situacao.CarregaSQL;
           Raise Exception.CreateFmt('Cobrança não pode gerar Acordo. Motivo : %s',[FSimplesTipo_Situacao.DESCRICAO_SITUACAO]);
         End;
    If   MessageBox(Self.Handle,'Valor Corrigido?','Atenção',MB_YESNO+MB_ICONQUESTION) = 6 Then
         feDivida.FloatNumber := FSimplesCobranca.VALOR_CORRIGIDO
    Else feDivida.FloatNumber := FSimplesCobranca.VALOR_DIVIDA;
    feValor.FloatNumber := feDivida.FloatNumber;
    FSimplesCredor.CODIGO_CREDOR := FSimplesCobranca.CREDOR;
    FSimplesCredor.CarregaSQL;

    lblCredor.Caption := IntToStr(FSimplesCredor.CODIGO_CREDOR) + ' - ' +
                         FSimplesCredor.NOME_CREDOR;

    FSimplesDevedor.CODIGO_DEVEDOR := FSimplesCobranca.DEVEDOR;
    FSimplesDevedor.CarregaSQL;

    lblDevedor.Caption := IntToStr(FSimplesDevedor.CODIGO_DEVEDOR) + ' - ' +
                          FSimplesDevedor.NOME_DEVEDOR;

  Except
    On E : Exception Do
       Begin
         ShowMessage(E.Message);
         ieCobranca.SetFocus;
       End;
  End;
end;

procedure TfrmAcordo.plMostrarGeracaoParcelas(Sender: TObject);
begin
  pnGerarParcelas.Visible := True;
end;

procedure TfrmAcordo.btnGerarOMsClick(Sender: TObject);
begin
  plGerarParcelas;
  pnGerarParcelas.Visible := False;
end;

procedure TfrmAcordo.plGerarParcelas;
Var
  Indice : Byte;
  lstListaRecebimento : TListaRecebimento;
  ValorParcela : Double;
  Vencimento   : TDateTime;
begin
  Try
    lvItensAcordo.Clear;
    If   feValor.FloatNumber <= 0.00 Then
         Raise Exception.Create('Erro: Valor');
    If   ieParcelas.IntegerNumber <= 0 Then
         Raise Exception.Create('Erro: Parcelas');
    If   iePeriodo.IntegerNumber <= 0 Then
         Raise Exception.Create('Erro: Periodo');
    For Indice := 1 to ieParcelas.IntegerNumber Do
      Begin
         lstListaRecebimento := TListaRecebimento.Create;
         lstListaRecebimento.COBRANCA := FSimplesCobranca.COBRANCA;
         lstListaRecebimento.PARCELA  := Indice;
         If   Indice = 1 Then
              Begin
                lstListaRecebimento.VENCIMENTO := dtVencimentoEntrada.DateTime;
                lstListaRecebimento.VALOR      := feValorEntrada.FloatNumber;
              End
         Else
              Begin
                ValorParcela := ((feValor.FloatNumber-feValorEntrada.FloatNumber) / (ieParcelas.IntegerNumber - 1));
                lstListaRecebimento.VENCIMENTO := CalcularProximoVencimento(Vencimento,iePeriodo.IntegerNumber);
                lstListaRecebimento.VALOR := ValorParcela;
              End;
         lstListaRecebimento.COBRADOR := FSimplesCobranca.COBRADOR;
         Vencimento := lstListaRecebimento.VENCIMENTO;
         plCarregaListViewAcordo(False,lstListaRecebimento);
      End;
  Except
    On E : Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmAcordo.btnGravarClick(Sender: TObject);
begin
  If   ieAcordo.IntegerNumber = 0 Then
       plGravaAcordo
  Else plGravarRecebimentos;
end;

procedure TfrmAcordo.plGravaAcordo;
Var
  Indice : Byte;
  ListaItem : TListaRecebimento;
begin
  Try
    FSimplesCobranca.COBRANCA := ieCobranca.IntegerNumber;
    FSimplesCobranca.CarregaSQL;
    FAcordo.Carrega(False);
    FAcordo.Insert;
    FAcordo.COBRANCA        := FSimplesCobranca.COBRANCA;
    FAcordo.CREDOR          := FSimplesCobranca.CREDOR;
    FAcordo.DEVEDOR         := FSimplesCobranca.DEVEDOR;
    FAcordo.VALOR_DIVIDA    := feDivida.FloatNumber;
    FAcordo.VALOR_CORRIGIDO := feValor.FloatNumber;
    FAcordo.STATUS          := 1;
    FAcordo.PRESTACOES      := ieParcelas.IntegerNumber;
    FAcordo.PERIODO         := iePeriodo.IntegerNumber;
    FAcordo.COBRADOR        := FSimplesCobranca.COBRADOR;
    FAcordo.VALOR_ENTRADA   := feValorEntrada.FloatNumber;
    FAcordo.DATA_ACORDO     := Date;
    FAcordo.Post;
    FRecebimento.Carrega(False);
    For Indice := 0 To lvItensAcordo.TabularView.LinesCount - 1 Do
        Begin
          ListaItem := TListaRecebimento(lvItensAcordo.TabularView.Data[Indice]);
          If  (ListaItem <> Nil) Then
             Begin
               FRecebimento.Insert;
               FRecebimento.ACORDO            := FAcordo.IDACORDO;
               FRecebimento.COBRANCA          := FAcordo.COBRANCA;
               FRecebimento.PARCELA           := ListaItem.PARCELA;
               FRecebimento.VENCIMENTO        := ListaItem.VENCIMENTO;
               FRecebimento.VALOR             := ListaItem.VALOR;
               FRecebimento.SITUACAO          := ListaItem.SITUACAO;
               FRecebimento.TIPODOCUMENTO     := ListaItem.TIPODOCUMENTO;
               FRecebimento.COBRADOR          := ListaItem.COBRADOR;
               FRecebimento.NUMERO_DOCUMENTO  := ListaItem.NUMERO_DOCUMENTO;
               FRecebimento.PAGO              := ListaItem.PAGO;
               FRecebimento.DATA_PAGAMENTO    := ListaItem.DATA_PAGAMENTO;
               FRecebimento.OBSERVACAO        := ListaItem.OBSERVACAO;
               FRecebimento.PAGTO_PRE_DATADO  := ListaItem.PAGTO_PRE_DATADO;
               FRecebimento.VENCIMENTO_REAL   := ListaItem.VENCIMENTO_REAL;
               FRecebimento.JUROS             := ListaItem.JUROS;
               FRecebimento.CHEQUE_COMPENSADO := ListaItem.CHEQUE_COMPENSADO;
               FRecebimento.BANCO             := ListaItem.BANCO;
               FRecebimento.Post;
             End;
        End;
    FCobranca.Carrega(False);
    FCobranca.FindBypk_Cobranca(FSimplesCobranca.COBRANCA);
    FCobranca.Edit;
    FCobranca.SITUACAO := 1;
    FCobranca.Post;
    plLimparCampos;
    ieAcordo.IntegerNumber := FAcordo.IDACORDO;
  Except
    On E: Exception Do
       ShowMessage(e.Message);
  End;
end;

procedure TfrmAcordo.plLimparCamposRecibo;
begin
  feValorRecibo.FloatNumber      := 0.00;
  feEncargosRecibo.FloatNumber   := 0.00;
  feMultaRecibo.FloatNumber      := 0.00;
  feHonorariosRecibo.FloatNumber := 0.00;
  feValorTotalRecibo.FloatNumber := 0.00;
end;

procedure TfrmAcordo.btnAdicionaReciboClick(Sender: TObject);
begin
  plGravarRecibo;
end;

procedure TfrmAcordo.plGravarRecibo;
begin
  FRecibo.Carrega(False);
  FParametros.Carrega(False);
  Try
    FRecibo.Insert;
    FRecibo.IDRECEBIMENTO   := llIdRecebimento;
    FRecibo.NUMERO_RECIBO   := TUniqueParametros.GetParametros.UltimoRecibo + 1;
    FRecibo.VALOR_PRINCIPAL := feValorRecibo.FloatNumber;
    FRecibo.ENCARGOS        := feEncargosRecibo.FloatNumber;
    FRecibo.MULTA           := feMultaRecibo.FloatNumber;
    FRecibo.HONORARIOS      := feHonorariosRecibo.FloatNumber;
    FRecibo.Post;
    FParametros.FindBypk_Id(0);
    FParametros.Edit;
    FParametros.ULTIMO_NUM_RECIBO := TUniqueParametros.GetParametros.UltimoRecibo + 1;
    FParametros.Post;
    TUniqueParametros.GetParametros.UltimoRecibo := FParametros.ULTIMO_NUM_RECIBO;
    plCarregaRecibo;
  Except
    FRecibo.Cancel;
    FParametros.Cancel;
  End;
end;

procedure TfrmAcordo.plGravarRecebimentos;
Var
  Indice    : Byte;
  ListaItem : TListaRecebimento;
begin
  Try
    FRecebimento.Carrega(False);
    For Indice := 0 to lvItensAcordo.TabularView.LinesCount - 1 Do
        Begin
          ListaItem := TListaRecebimento(lvItensAcordo.TabularView.Data[Indice]);
          If   ListaItem <> Nil Then
               Begin
                 If   FRecebimento.FindBypk_Recebimento(ListaItem.RECEBIMENTO) Then
                      Begin
                        FRecebimento.Edit;
                        FRecebimento.VENCIMENTO    := ListaItem.VENCIMENTO;
                        FRecebimento.VALOR         := ListaItem.VALOR;
                        FRecebimento.COMISSAO      := ListaItem.COMISSAO;
                        FRecebimento.VALOR_REPASSE := ListaItem.VALOR_REPASSE;
                        FRecebimento.NUMERO_DOCUMENTO := ListaItem.NUMERO_DOCUMENTO;
                        FRecebimento.TIPODOCUMENTO := ListaItem.TIPODOCUMENTO;
                        FRecebimento.PAGO          := ListaItem.PAGO;
                        FRecebimento.DATA_PAGAMENTO := ListaItem.DATA_PAGAMENTO;
                        FRecebimento.PAGTO_PRE_DATADO := ListaItem.PAGTO_PRE_DATADO;
                        FRecebimento.CHEQUE_COMPENSADO := ListaItem.CHEQUE_COMPENSADO;
                        FRecebimento.Post;
                      End;
               End;
        End;
    plLimparCampos;
    ieAcordo.SetFocus;
  Except
    On E: Exception Do
       Begin
         FRecebimento.Cancel;
         ShowMessage(E.Message);
       End;
  End;
end;

procedure TfrmAcordo.plImprimirRecibo(Configura : Boolean; IdRecibo : LongInt);
Var
  Report     : TFreeReport;
  FDataset   : TfrMyDBDataset;
  FMemRecibo : TMemRecibo;

  function plDescricaoDivida: string;
  Begin
    FSimplesItensCobranca.COBRANCA := FSimplesAcordo.COBRANCA;
    FSimplesItensCobranca.CarregaSQL;
    While Not FSimplesItensCobranca.Eof Do
      Begin
        Result := Result + DateToStr(FSimplesItensCobranca.VENCIMENTO_DOCUMENTO)+' ';
        FSimplesItensCobranca.Next;
       End;
  End;

begin
  FSimplesRecibo.NUMERO_RECIBO := IdRecibo;
  FSimplesRecibo.CarregaSQL;

  FSimplesRecebimento.RECEBIMENTO := FSimplesRecibo.IDRECEBIMENTO;
  FSimplesRecebimento.CarregaSQL;

  FSimplesAcordo.IDACORDO := FSimplesRecebimento.ACORDO;
  FSimplesAcordo.CarregaSQL;

  FSimplesDevedor.CODIGO_DEVEDOR := FSimplesAcordo.DEVEDOR;
  FSimplesDevedor.CarregaSQL;

  FSimplesCredor.CODIGO_CREDOR   := FSimplesAcordo.CREDOR;
  FSimplesCredor.CarregaSQL;

  FMemRecibo       := TMemRecibo.Create(Self);
  Report           := TFreeReport.Create(Self);
  FDataset         := TfrMyDBDataset.Create(Self);
  FDataset.Name    := 'FrRecibo';
  FDataset.DataSet := FMemRecibo;
  Try
    FMemRecibo.Insert;
    FMemRecibo.NUMERO          := FSimplesRecibo.NUMERO_RECIBO;
    FMemRecibo.VALOR           := FSimplesRecibo.VALOR_PRINCIPAL+
                                  FSimplesRecibo.ENCARGOS+
                                  FSimplesRecibo.MULTA+
                                  FSimplesRecibo.HONORARIOS;
    FMemRecibo.DEVEDOR         := FSimplesDevedor.NOME_DEVEDOR;
    FMemRecibo.CNPJ_DEVEDOR    := FSimplesDevedor.CNPJ_CPF;
    FMemRecibo.CREDOR          := FSimplesCredor.NOME_CREDOR;
    FMemRecibo.DOCUMENTO       := FSimplesRecebimento.NUMERO_DOCUMENTO;
    FMemRecibo.PERIODO         := plDescricaoDivida;
    FMemRecibo.EH_INTEGRAL     := False;
    FMemRecibo.VALOR_EXTENSO   := ValorExtenso(FMemRecibo.VALOR);
    FMemRecibo.VALOR_PRINCIPAL := FSimplesRecibo.VALOR_PRINCIPAL;
    FMemRecibo.PARCELA         := IntToStr(FSimplesRecebimento.PARCELA)+'/'+IntToStr(FSimplesAcordo.PRESTACOES);
    FMemRecibo.OBSERVACAO      := FSimplesRecebimento.OBSERVACAO;
    FMemRecibo.VALOR_DIVIDA    := FSimplesAcordo.VALOR_DIVIDA;
    FMemRecibo.ENCARGOS        := FSimplesRecibo.ENCARGOS;
    FMemRecibo.MULTA           := FSimplesRecibo.MULTA;
    FMemRecibo.HONORARIOS      := FSimplesRecibo.HONORARIOS;
    FMemRecibo.TOTAL_RECEBIDO  := FMemRecibo.VALOR_PRINCIPAL +
                                  FMemRecibo.ENCARGOS +
                                  FMemRecibo.MULTA +
                                  FMemRecibo.HONORARIOS;
    FMemRecibo.DATA_PAGAMENTO  := FSimplesRecebimento.DATA_PAGAMENTO;
    FMemRecibo.VENCIMENTO      := FSimplesRecebimento.VENCIMENTO;
    FSimplesTipoDocumento.TIPO_DOCUMENTO := FSimplesRecebimento.TIPODOCUMENTO;
    FSimplesTipoDocumento.CarregaSQL;
    FMemRecibo.TIPO_DOCUMENTO  := FSimplesTipoDocumento.DESCRICAO;
    FMemRecibo.BANCO           := FSimplesRecebimento.BANCO;
    FMemRecibo.Post;
    If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'Recibo.frf') Then
         Begin
           Report.Arquivo := TUniqueParametros.GetParametros.DatabaseReport + 'Recibo.frf';
           If   Configura Then
                Report.Desenhar
           Else Report.Visualiza;
         End
    Else
         Report.Desenhar;
  Finally
    Report.Free;
    FDataset.Free;
    FMemRecibo.Free;
  End;
end;

procedure TfrmAcordo.btnImpriirReciboClick(Sender: TObject);
begin
  plGeraImpressaoRecibo(ckConfigurar.Checked);
end;

procedure TfrmAcordo.plGeraImpressaoRecibo(lbConfigura : Boolean);
Var
  Li : TListItem;
  ListaRecibo : TListaRecibo;
begin
  If   lvRecibo.TabularView.LinesCount > 0 Then
       Begin
         Li := lvRecibo.Selected;
         If   (Li <> Nil)
         And  (Li.Index < lvRecibo.TabularView.LinesCount) Then
            Begin
              llPosicaoRecibo   := lvRecibo.ItemIndex[Li.Index];
              ListaRecibo       := TListaRecibo(lvRecibo.TabularView.Data[llPosicaoRecibo]);
              plImprimirRecibo(lbConfigura,ListaRecibo.Numero_Recibo);
            End;
       End;
end;

end.
