unit uBaixaRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Buttons, ComCtrls, Mask, DBCtrls,
  ADODB,
  ucLayAcordo,
  ucLayRecebimento,
  ucLayParametros,
  ucLayRecibo,
  ucLayDevedor,
  ucLayCredor,
  ucLayTipo_Documento,
  uLayMemRecibo,
  ucLayItens_Cobranca,
  NumericEdit,
  Menus, Grids, DBGrids;

type
  TFrmBaixaRecebimento = class(TForm)
    pnTop: TPanel;
    pnTela: TPanel;
    pnRodape: TPanel;
    gbBaixaRecebimento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblBaixa: TLabel;
    dsRecebimento: TDataSource;
    dsAcordo: TDataSource;
    DBACORDO: TDBEdit;
    DBPARCELA: TDBEdit;
    DBVALOR: TDBEdit;
    dtPagamento: TDateTimePicker;
    DBVALOR_REPASSE: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    btnBaixa: TBitBtn;
    btnSair: TBitBtn;
    sbLocaliza: TSpeedButton;
    DBOBSERVACAO: TDBMemo;
    Label8: TLabel;
    dsRecibo: TDataSource;
    btnGerarRecibo: TBitBtn;
    pnGerarRecibo: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    BitBtn1: TBitBtn;
    btnRecibo: TBitBtn;
    Panel1: TPanel;
    DBGridRecibo: TDBGrid;
    ckConfigurar: TCheckBox;
    ppReimprimir: TPopupMenu;
    mnuReimprimirRecibo: TMenuItem;
    mnuConfigurarRecibo: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    btnChequeDevolvido: TBitBtn;
    pnValorPrincipal: TPanel;
    pnEncargos: TPanel;
    pnMulta: TPanel;
    pnHonorarios: TPanel;
    pnTotalRecebido: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure btnReciboClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarReciboClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mnuReimprimirReciboClick(Sender: TObject);
    procedure mnuConfigurarReciboClick(Sender: TObject);
    procedure dsRecebimentoDataChange(Sender: TObject; Field: TField);
    procedure btnChequeDevolvidoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure plTotaliza(Sender : TObject);
  private
    XAcordo          : TACORDO;
    XRecebimento     : TRECEBIMENTO;
    XRecibo          : TRECIBO;
    XParametros      : TPARAMETROS;
    XDevedor         : TDEVEDOR;
    XCredor          : TCREDOR;
    XTipoDocumento   : TTIPO_DOCUMENTO;
    QItens_Cobranca  : TSimplesITENS_COBRANCA;
    FEValorPrincipal : TFloatEdit;
    FEEncargos       : TFloatEdit;
    FEMulta          : TFloatEdit;
    FEHonorarios     : TFloatEdit;
    FETotalRecebido  : TFloatEdit;

    procedure plAbrirArquivos;
    procedure plFecharArquivos;
    procedure plCriarBotoes;
  public
    procedure plImprimirRecibo(Configura : Boolean);
    { Public declarations }
  end;


  Procedure BaixarRecebimento(IdRecebimento : Integer = 0);


implementation
Uses
  Parametros,
  uFreeReport,
  uFuncoes;

{$R *.dfm}

Procedure BaixarRecebimento(IdRecebimento : Integer = 0);
var
  FrmBaixaRecebimento: TFrmBaixaRecebimento;
Begin
  FrmBaixaRecebimento := TFrmBaixaRecebimento.Create(Application);
  Try
    FrmBaixaRecebimento.sbLocaliza.Visible := False;
    If   Not(FrmBaixaRecebimento.XRecebimento.Locate('RECEBIMENTO',IdRecebimento,[loCaseInsensitive])) Then
         Raise Exception.Create('Não foi possivel localizar a parcela!');
    If   FrmBaixaRecebimento.XRecebimento.PAGO Then
         Begin
          // FrmBaixaRecebimento.dtPagamento.Date           := FrmBaixaRecebimento.XRecebimento.DATA_PAGAMENTO;
           FrmBaixaRecebimento.gbBaixaRecebimento.Enabled := False;
         End;
    FrmBaixaRecebimento.btnChequeDevolvido.Enabled := FrmBaixaRecebimento.XRecebimento.PAGO;
    FrmBaixaRecebimento.btnGerarRecibo.Enabled     := FrmBaixaRecebimento.XRecebimento.PAGO;
    FrmBaixaRecebimento.ShowModal;
  Finally
    FreeAndNil(FrmBaixaRecebimento);
  End;
End;

procedure TFrmBaixaRecebimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBaixaRecebimento.btnBaixaClick(Sender: TObject);
begin
  If   XRecebimento.VALOR_REPASSE = 0.00 Then
       ShowMessage('Valor informar o Valor do Repasse!')
  Else Begin
         If   (XRecebimento.State <> dsEdit) Then
              XRecebimento.Edit;
         XRecebimento.DATA_PAGAMENTO := dtPagamento.DateTime;
         XRecebimento.PAGO           := True;
         XRecebimento.Post;
         pnGerarRecibo.Visible := True;
       End;
end;

procedure TFrmBaixaRecebimento.btnReciboClick(Sender: TObject);
begin
  pnGerarRecibo.Visible := False;
  If   FETotalRecebido.FloatNumber <> 0.00 Then
       Begin
         Try
           XRecibo.Insert;
           XRecibo.NUMERO_RECIBO   := TUniqueParametros.GetParametros.UltimoRecibo + 1;
           XRecibo.IDRECEBIMENTO   := XRecebimento.RECEBIMENTO;
           XRecibo.VALOR_PRINCIPAL := FETotalRecebido.FloatNumber;
           XRecibo.ENCARGOS        := FEEncargos.FloatNumber;
           XRecibo.MULTA           := FEMulta.FloatNumber;
           XRecibo.HONORARIOS      := FEHonorarios.FloatNumber;
           XRecibo.Post;
           plImprimirRecibo(ckConfigurar.Checked);
           XParametros.Locate('ID',0,[]);
           XParametros.Edit;
           XParametros.ULTIMO_NUM_RECIBO := XRecibo.NUMERO_RECIBO;
           XParametros.Post;
           TUniqueParametros.GetParametros.UltimoRecibo := XRecibo.NUMERO_RECIBO;
         Except
           On E: Exception Do
              Begin
                Case  XRecibo.State of
                  dsInsert : XRecibo.Cancel;
                End;
                Case  XParametros.State of
                  dsEdit   : XParametros.Cancel;
                End;
                ShowMessage(E.Message);
              End;
         End;
       End;
end;

procedure TFrmBaixaRecebimento.FormCreate(Sender: TObject);
begin
  plAbrirArquivos;
  ckConfigurar.Visible := TUniqueParametros.GetParametros.Privilegiado;
  dtPagamento.DateTime := Date;
  pnGerarRecibo.Top    := Trunc((Self.Height / 2) - (pnGerarRecibo.Height / 2));
  pnGerarRecibo.Left   := Trunc((Self.Width / 2) - (pnGerarRecibo.Width / 2));
  plCriarBotoes;
end;

procedure TFrmBaixaRecebimento.btnGerarReciboClick(Sender: TObject);
begin
  pnGerarRecibo.Visible := True;
end;

procedure TFrmBaixaRecebimento.BitBtn1Click(Sender: TObject);
begin
  pnGerarRecibo.Visible := False;
end;

procedure TFrmBaixaRecebimento.mnuReimprimirReciboClick(Sender: TObject);
begin
  If   DBGridRecibo.Fields[0].Value <> 0 Then
       plImprimirRecibo(False);
end;

procedure TFrmBaixaRecebimento.mnuConfigurarReciboClick(Sender: TObject);
begin
  If   DBGridRecibo.Fields[0].Value <> 0 Then
       plImprimirRecibo(True);
end;

procedure TFrmBaixaRecebimento.dsRecebimentoDataChange(Sender: TObject;
  Field: TField);
begin
  If   XRecebimento <> Nil Then
       Begin
         If   XRecebimento.PAGO Then
              Begin
                btnGerarRecibo.Enabled := True;
                btnBaixa.Enabled       := False;
              End
         Else
              Begin
                btnGerarRecibo.Enabled := False;
                btnBaixa.Enabled       := True;
              End
       End;
end;

procedure TFrmBaixaRecebimento.btnChequeDevolvidoClick(Sender: TObject);
begin
   if   MessageDlg('Cancelar o pagamento desse cheque?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
          XRecebimento.Edit;
          XRecebimento.PAGO := False;
          XRecebimento.Post;
        End;
end;

procedure TFrmBaixaRecebimento.plImprimirRecibo(Configura : Boolean);
Var
  Report     : TFreeReport;
  FDataset   : TfrMyDBDataset;
  FMemRecibo : TMemRecibo;

  function plDescricaoDivida: string;
  Begin
    QItens_Cobranca.ClearFields;
    QItens_Cobranca.COBRANCA := XAcordo.COBRANCA;
    QItens_Cobranca.CarregaSQL;
    QItens_Cobranca.First;
    While Not QItens_Cobranca.Eof Do
      Begin
        Result := Result + DateToStr(QItens_Cobranca.VENCIMENTO_DOCUMENTO)+' ';
        QItens_Cobranca.Next;
       End;
  End;

begin
  FMemRecibo       := TMemRecibo.Create(Self);
  Report           := TFreeReport.Create(Self);
  FDataset         := TfrMyDBDataset.Create(Self);
  FDataset.Name    := 'FrRecibo';
  FDataset.DataSet := FMemRecibo;
  Try
    XDevedor.Locate('CODIGO_DEVEDOR', XAcordo.DEVEDOR,[]);
    FMemRecibo.Insert;
    FMemRecibo.NUMERO          := XRecibo.NUMERO_RECIBO;
    FMemRecibo.VALOR           := XRecibo.VALOR_PRINCIPAL+
                                  XRecibo.ENCARGOS+
                                  XRecibo.MULTA+
                                  XRecibo.HONORARIOS;
    FMemRecibo.DEVEDOR         := XDevedor.NOME_DEVEDOR;
    FMemRecibo.CNPJ_DEVEDOR    := XDevedor.CNPJ_CPF;
    FMemRecibo.CREDOR          := XCredor.NOME_CREDOR;
    FMemRecibo.DOCUMENTO       := XRecebimento.NUMERO_DOCUMENTO;
    FMemRecibo.PERIODO         := plDescricaoDivida;
    FMemRecibo.EH_INTEGRAL     := False;
    FMemRecibo.VALOR_EXTENSO   := ValorExtenso(FMemRecibo.VALOR);
    FMemRecibo.VALOR_PRINCIPAL := XRecibo.VALOR_PRINCIPAL;
    FMemRecibo.PARCELA         := IntToStr(XRecebimento.PARCELA)+'/'+IntToStr(XAcordo.PRESTACOES);
    FMemRecibo.OBSERVACAO      := XRecebimento.OBSERVACAO;
    FMemRecibo.VALOR_DIVIDA    := XAcordo.VALOR_DIVIDA;
    FMemRecibo.ENCARGOS        := XRecibo.ENCARGOS;
    FMemRecibo.MULTA           := XRecibo.MULTA;
    FMemRecibo.HONORARIOS      := XRecibo.HONORARIOS;
    FMemRecibo.TOTAL_RECEBIDO  := FMemRecibo.VALOR_PRINCIPAL +
                                  FMemRecibo.ENCARGOS +
                                  FMemRecibo.MULTA +
                                  FMemRecibo.HONORARIOS;
    FMemRecibo.DATA_PAGAMENTO  := XRecebimento.DATA_PAGAMENTO;
    FMemRecibo.VENCIMENTO      := XRecebimento.VENCIMENTO;
    If   XTipoDocumento.Locate('TIPO_DOCUMENTO',XRecebimento.TIPODOCUMENTO,[]) Then
         FMemRecibo.TIPO_DOCUMENTO := XTipoDocumento.DESCRICAO;
    FMemRecibo.BANCO            := XRecebimento.BANCO;
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

procedure TFrmBaixaRecebimento.plTotaliza(Sender : TObject);
begin
  FETotalRecebido.FloatNumber := FEValorPrincipal.FloatNumber+
                                 FEEncargos.FloatNumber+
                                 FEMulta.FloatNumber+
                                 FEHonorarios.FloatNumber;

end;

procedure TFrmBaixaRecebimento.plAbrirArquivos;
begin
  XAcordo        := TACORDO.Create(Self);
  XAcordo.Carrega(False);
  XRecebimento   := TRECEBIMENTO.Create(Self);
  XRecebimento.Carrega(False);
  XRecibo        := TRECIBO.Create(Self);
  XRecibo.Carrega(False);
  XParametros    := TPARAMETROS.Create(Self);
  XParametros.Carrega(False);
  XDevedor       := TDEVEDOR.Create(Self);
  XDevedor.Carrega(False);
  XCredor        := TCREDOR.Create(Self);
  XCredor.Carrega(False);
  XTipoDocumento := TTIPO_DOCUMENTO.Create(Self);
  XTipoDocumento.Carrega(False);

  dsRecebimento.DataSet   := XRecebimento;
  dsAcordo.DataSet        := XAcordo;
  dsRecibo.DataSet        := XRecibo;
  XRecibo.IndexFieldNames := 'IDRECEBIMENTO';
  XRecibo.MasterSource    := dsRecebimento;
  XRecibo.MasterFields    := 'RECEBIMENTO';
end;

procedure TFrmBaixaRecebimento.plFecharArquivos;
begin
  XAcordo.Free;
  XRecebimento.Free;
  XRecibo.Free;
  XParametros.Free;
  XDevedor.Free;
  XCredor.Free;
  XTipoDocumento.Free;
end;

procedure TFrmBaixaRecebimento.FormDestroy(Sender: TObject);
begin
  plFecharArquivos;
end;

procedure TFrmBaixaRecebimento.plCriarBotoes;
begin
  FEValorPrincipal := TFloatEdit.Create(Self);
  With FEValorPrincipal Do
    Begin
      Visible     := False;
      Parent      := pnValorPrincipal;
      Name        := 'FEValorPrincipal';
      Height      := pnValorPrincipal.Height;
      Width       := pnValorPrincipal.Width;
      Visible     := True;
      FloatNumber := 0.00;
      OnEnter     := plTotaliza;
      OnExit      := plTotaliza;
    End;
  FEEncargos := TFloatEdit.Create(Self);
  With FEEncargos Do
    Begin
      Visible     := False;
      Parent      := pnEncargos;
      Name        := 'FEEncargos';
      Height      := pnEncargos.Height;
      Width       := pnEncargos.Width;
      Visible     := True;
      FloatNumber := 0.00;
      OnEnter     := plTotaliza;
      OnExit      := plTotaliza;
    End;
  FEMulta := TFloatEdit.Create(Self);
  With FEMulta Do
    Begin
      Visible     := False;
      Parent      := pnMulta;
      Name        := 'FEMulta';
      Height      := pnMulta.Height;
      Width       := pnMulta.Width;
      Visible     := True;
      FloatNumber := 0.00;
      OnEnter     := plTotaliza;
      OnExit      := plTotaliza;
    End;
  FEHonorarios := TFloatEdit.Create(Self);
  With FEHonorarios Do
    Begin
      Visible     := False;
      Parent      := pnHonorarios;
      Name        := 'FEHonorarios';
      Height      := pnHonorarios.Height;
      Width       := pnHonorarios.Width;
      Visible     := True;
      FloatNumber := 0.00;
      OnEnter     := plTotaliza;
      OnExit      := plTotaliza;
    End;
  FETotalRecebido := TFloatEdit.Create(Self);
  With FETotalRecebido Do
    Begin
      Visible     := False;
      Parent      := pnTotalRecebido;
      Name        := 'FETotalRecebido';
      Height      := pnTotalRecebido.Height;
      Width       := pnTotalRecebido.Width;
      Visible     := True;
      FloatNumber := 0.00;
    End;
end;

end.
