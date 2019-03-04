
unit uAtende;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, Mask, DBCtrls, Buttons,
  AdoDb, ucLayTipo_Situacao,
  ucLayCobranca,
  ucLayCredor,
  ucLayDevedor,
  ucLayEnderecos,
  ucLayItens_Cobranca,
  ucLayTipo_Documento,
  ucLayTelefones,
  ucLayBanco,
  ucLayAcionamento,
  ucLayRecebimento,
  uclayAcordo,
  uclayChamado,
  ucLayDepre,
  ImgList, ToolWin, Grids;

type

  enumFinalizarChamado =(eFinalizar,ePromessa,eProgramado);

  TfrmAtende = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnTela: TPanel;
    gbCobranca: TGroupBox;
    gbDevedor: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    stCobranca: TStaticText;
    stCredor: TStaticText;
    stDataCadastro: TStaticText;
    stValorDivida: TStaticText;
    Label5: TLabel;
    btnSair: TBitBtn;
    Panel6: TPanel;
    Label7: TLabel;
    Splitter6: TSplitter;
    stValorCorrigido: TStaticText;
    Label8: TLabel;
    stSituacao: TStaticText;
    Label9: TLabel;
    Timer1: TTimer;
    Label10: TLabel;
    dtDataInicial: TDateTimePicker;
    bbAjustarProdDep: TBitBtn;
    btnProgramar: TBitBtn;
    btnGerarPromessa: TBitBtn;
    btnGerarAcordo: TBitBtn;
    btnDesconfirma: TBitBtn;
    sbtnBuscaDevedor: TSpeedButton;
    btnAcionamento: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    lblRG: TLabel;
    stCodigoDevedor: TStaticText;
    stNomeDevedor: TStaticText;
    stInscricaoFederal: TStaticText;
    stRG: TStaticText;
    pcItens: TPageControl;
    tsItensCobranca: TTabSheet;
    lstItensCobranca: TListView;
    tsItensAcordo: TTabSheet;
    lstItensAcordo: TListView;
    tsEnderecos: TTabSheet;
    lstEnderecos: TListView;
    tsTelefones: TTabSheet;
    lstTelefones: TListView;
    tsAcordos: TTabSheet;
    lstOutrasDividas: TListView;
    tsAcionamentos: TTabSheet;
    lstAcionamento: TListView;
    rgOpcoesView: TRadioGroup;
    stLocalizado: TStaticText;
    lblLocalizado: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgOpcoesViewClick(Sender: TObject);
    procedure lstItensAcordoCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lstAcionamentoCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure sbtnBuscaDevedorClick(Sender: TObject);
    procedure lstEnderecosCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstOutrasDividasDblClick(Sender: TObject);
    procedure bbAjustarProdDepClick(Sender: TObject);
    procedure btnDesconfirmaClick(Sender: TObject);
    procedure btnAcionamentoClick(Sender: TObject);
    procedure btnProgramarClick(Sender: TObject);
    procedure btnGerarPromessaClick(Sender: TObject);
  private
    { Private declarations }
    liCobranca      : Integer;
    liDevedor       : Integer;
    liChamado       : Integer;
    HoraInicio      : TDateTime;
    QCOBRANCA       : TSimplesCOBRANCA;
    QCREDOR         : TSimplesCREDOR;
    QDEVEDOR        : TSimplesDEVEDOR;
    QENDERECOS      : TSimplesENDERECOS;
    QTipoSituacao   : TSimplesTIPO_SITUACAO;
    QITENS_COBRANCA : TSimplesITENS_COBRANCA;
    QBANCO          : TSimplesBANCO;
    QTipoDocumento  : TSimplesTIPO_DOCUMENTO;
    QTELEFONES      : TSimplesTELEFONES;
    QACIONAMENTO    : TSimplesACIONAMENTO;
    QRECEBIMENTO    : TSimplesRECEBIMENTO;
    QACORDO         : TSimplesACORDO;
    QDEPRE          : TSimplesDEPRE;
    QCHAMADO        : TSimplesCHAMADO;
    FChamado        : TCHAMADO;

    procedure plCarregaCobranca;
    procedure plCarregaDevedor;
    procedure plCarregaItensCobrancas;
    procedure plCarregaTelefones;
    procedure plCarregaEnderecos;
    procedure plCarregaAcionamentos;
    procedure plCarregaOutrasDividas;
    procedure plCarregaItensAcordo;
    procedure plTratarLinhasAcionamento(lbOcultar : Boolean);
    function  flValorCorrigido(const liCobranca : Integer; const liItemCobranca : Integer; cData : TDateTime) : Double;
    function flValorCorrigidoByTabDepre(cData : TDateTime; cValor : Double): Double;
    procedure plGerarChamado;
    procedure plFecharChamado(Tipo : enumFinalizarChamado);
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
    procedure plCarregarChamado;
    function flExisteAcionamento: Boolean;
  public
    { Public declarations }
  end;

  procedure Chamado(const ciCobranca : Integer; const ciDevedor : Integer);
  procedure ChamadoProgramado(const ciChamado : Integer);

implementation
Uses
  uGetFunctions,
  uInserirAcionamento,
  uPropostas,
  Parametros,
  uDevedor,
  uConsultaAcordo,
  uCalendario,
  MaskUtils, DateUtils;

{$R *.dfm}

procedure Chamado(const ciCobranca : Integer; const ciDevedor : Integer);
Var
  frmAtende: TfrmAtende;
Begin
  frmAtende := TfrmAtende.Create(Application);
  Try
    frmAtende.liCobranca := ciCobranca;
    frmAtende.liDevedor  := ciDevedor;
    frmAtende.plCarregaCobranca;
    frmAtende.plCarregaDevedor;
    frmAtende.plGerarChamado;
    frmAtende.ShowModal;
  Finally
    frmAtende.Free;
  End;
End;

procedure ChamadoProgramado(const ciChamado : Integer);
Var
  frmAtende: TfrmAtende;
Begin
  frmAtende := TfrmAtende.Create(Application);
  Try
    frmAtende.liChamado := ciChamado;
    frmAtende.plCarregarChamado;
    frmAtende.plCarregaCobranca;
    frmAtende.plCarregaDevedor;
    frmAtende.ShowModal;
  Finally
    frmAtende.Free;
  End;
End;


{ TfrmAtende }

procedure TfrmAtende.plCarregaCobranca;
begin
  QCOBRANCA.COBRANCA := liCobranca;
  QCOBRANCA.CarregaSQL;
  QCREDOR.CODIGO_CREDOR := QCOBRANCA.CREDOR;
  QCREDOR.CarregaSQL;
  stCobranca.Caption     := IntToStr(QCOBRANCA.COBRANCA);
  stCredor.Caption       := QCREDOR.NOME_CREDOR;
  stDataCadastro.Caption := DateToStr(QCOBRANCA.DATA_CADASTRO);
  stValorDivida.Caption  := FormatFloat('#,##0.00',QCOBRANCA.VALOR_DIVIDA);
  QTipoSituacao.TIPO_SITUACAO := QCOBRANCA.SITUACAO;
  QTipoSituacao.CarregaSQL;
  stSituacao.Caption     := QTipoSituacao.DESCRICAO_SITUACAO;
  If   QTipoSituacao.SITUACAO = 2 Then
       btnAcionamento.Enabled := False
  Else btnAcionamento.Enabled := True;
  plCarregaItensCobrancas;
  plCarregaItensAcordo;
  plCarregaAcionamentos;
end;

procedure TfrmAtende.plCarregaDevedor;
begin
  QDEVEDOR.CODIGO_DEVEDOR := liDevedor;
  QDEVEDOR.CarregaSQL;
  stCodigoDevedor.Caption    := IntToStr(QDEVEDOR.CODIGO_DEVEDOR);
  stNomeDevedor.Caption      := QDEVEDOR.NOME_DEVEDOR;
  stInscricaoFederal.Caption := QDEVEDOR.CNPJ_CPF;
  stRG.Caption               := QDEVEDOR.IDENTIDADE;
  If   QDEVEDOR.EH_LOCALIZADO Then
       stLocalizado.Caption := 'Sim'
  Else stLocalizado.Caption := 'Não';
  plCarregaEnderecos;
  plCarregaTelefones;
  plCarregaOutrasDividas;
end;

procedure TfrmAtende.plCarregaEnderecos;
Var
  ListItem : TListItem;

  function fsPrincipal : String;
  Begin
    Result := '';
    If   QDEVEDOR.ENDERECO_PRINCIPAL =
         QENDERECOS.NUMERO_ENDERECO Then
         Result := ' (Principal)';
  End;

begin
  lstEnderecos.Clear;
  QENDERECOS.CODIGO_DEVEDOR := QDEVEDOR.CODIGO_DEVEDOR;
  QENDERECOS.CarregaSQL;
  QENDERECOS.First;
  While Not QENDERECOS.Eof Do
     Begin
       ListItem := lstEnderecos.Items.Add;
       ListItem.Caption := QENDERECOS.REFERENCIA_ENDERECO;
       ListItem.SubItems.Add(QENDERECOS.ENDERECO+', '+
                             QENDERECOS.NUMERO+'  '+
                             QENDERECOS.COMPLEMENTO);
       ListItem.SubItems.Add(QENDERECOS.BAIRRO);
       ListItem.SubItems.Add(QENDERECOS.CIDADE);
       ListItem.SubItems.Add(QENDERECOS.ESTADO);
       ListItem.SubItems.Add(QENDERECOS.CEP);
       QENDERECOS.Next;
     End;
end;


procedure TfrmAtende.plCarregaItensCobrancas;
Var
  ListItem : TListItem;
  ldValorCorrigido,
  ldValorTotalCorrigido,
  ldValorTotal : Double;

begin
  ldValorTotal          := 0.00;
  ldValorCorrigido      := 0.00;
  ldValorTotalCorrigido := 0.00;
  lstItensCobranca.Clear;
  QITENS_COBRANCA.COBRANCA := QCOBRANCA.COBRANCA;
  QITENS_COBRANCA.CarregaSQL;
  QITENS_COBRANCA.First;
  While Not QITENS_COBRANCA.Eof Do
     Begin

       QTipoDocumento.TIPO_DOCUMENTO := QITENS_COBRANCA.TIPODOCUMENTO;
       QTipoDocumento.CarregaSQL;

       QBANCO.NUMERO_BANCO := QITENS_COBRANCA.BANCO_DOCUMENTO;
       QBANCO.CarregaSQL;

       ldValorTotal := ldValorTotal + QITENS_COBRANCA.VALOR_DOCUMENTO;
       ListItem := lstItensCobranca.Items.Add;
       ListItem.Caption := IntToStr(QITENS_COBRANCA.ITEM);
       ListItem.SubItems.Add(QTipoDocumento.SIGLA_DOCUMENTO + ' - ' +
                             QITENS_COBRANCA.NUMERO_DOCUMENTO + ' - ' +
                             QBANCO.NOME_BANCO + ' - ' +
                             IntToStr(QITENS_COBRANCA.ALINES));

       ListItem.SubItems.Add(DateToStr(QITENS_COBRANCA.VENCIMENTO_DOCUMENTO));
       ListItem.SubItems.Add(FormatFloat('#,##0.00', QITENS_COBRANCA.VALOR_DOCUMENTO));
       If   QITENS_COBRANCA.VENCIMENTO_DOCUMENTO >= Date Then
            ldValorCorrigido := QITENS_COBRANCA.VALOR_DOCUMENTO
       Else     
            ldValorCorrigido := flValorCorrigido(QITENS_COBRANCA.COBRANCA,
                                                 QITENS_COBRANCA.ITEM,
                                                 dtDataInicial.DateTime);
       ListItem.SubItems.Add(FormatFloat('#,##0.00', ldValorCorrigido));
       ldValorTotalCorrigido := ldValorTotalCorrigido + ldValorCorrigido;
       QITENS_COBRANCA.Next;
     End;
  If   ldValorTotal > 0.00 Then
       Begin
         ListItem := lstItensCobranca.Items.Add;
         ListItem.Caption := 'Total';
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add(FormatFloat('#,##0.00',ldValorTotal));
         ListItem.SubItems.Add(FormatFloat('#,##0.00',ldValorTotalCorrigido));
       End;
  stValorCorrigido.Caption := FormatFloat('#,##0.00',ldValorTotalCorrigido);
end;

procedure TfrmAtende.plCarregaTelefones;
Var
  ListItem    : TListItem;
begin
  lstTelefones.Clear;
  QTELEFONES.CODIGO_DEVEDOR := QDEVEDOR.CODIGO_DEVEDOR;
  QTELEFONES.CarregaSQL;
  QTELEFONES.First;
  While Not  QTELEFONES.Eof Do
     Begin
       ListItem := lstTelefones.Items.Add;
       ListItem.Caption := QTELEFONES.REFERENCIA_TELEFONE;
       ListItem.SubItems.Add(QTELEFONES.DDD);
       ListItem.SubItems.Add(QTELEFONES.NUMERO_TELEFONE);
       QTELEFONES.Next;
     End;
end;

procedure TfrmAtende.plCarregaAcionamentos;
Var
  ListItem : TListItem;
begin
  lstAcionamento.Clear;
  QACIONAMENTO.plOrdenarPor(acionamentoInd_Cobranca);
  QACIONAMENTO.COBRANCA := QCOBRANCA.COBRANCA;
  QACIONAMENTO.plOrdenarPor(acionamentoPK_IDACIONAMENTO);
  QACIONAMENTO.CarregaSQL;
  QACIONAMENTO.First;
  While Not QACIONAMENTO.Eof Do
     Begin
       QTELEFONES.ITEM_TELEFONE := QACIONAMENTO.IDTELEFONE;
       QTELEFONES.CarregaSQL;
       Case rgOpcoesView.ItemIndex of
         0 : Begin
               ListItem := lstAcionamento.Items.Add;
               ListItem.Caption := DateToStr(QACIONAMENTO.DATA_ACIONAMENTO);
               ListItem.SubItems.Add(QACIONAMENTO.USUARIO_INCLUSAO);
               ListItem.SubItems.Add(QTELEFONES.NUMERO_TELEFONE);
               ListItem.SubItems.Add(QACIONAMENTO.HISTORICO);
             End;
         1 : Begin
               If   TUniqueParametros.GetParametros.Usuario = QACIONAMENTO.USUARIO_INCLUSAO Then
                    Begin
                      ListItem := lstAcionamento.Items.Add;
                      ListItem.Caption := DateToStr(QACIONAMENTO.DATA_ACIONAMENTO);
                      ListItem.SubItems.Add(QACIONAMENTO.USUARIO_INCLUSAO);
                      ListItem.SubItems.Add(QTELEFONES.NUMERO_TELEFONE);
                      ListItem.SubItems.Add(QACIONAMENTO.HISTORICO);
                    End;
             End;
       End;
       QACIONAMENTO.Next;
     End;
end;

procedure TfrmAtende.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtende.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  CentralizarForm(Self);
  dtDataInicial.DateTime := Now;
end;

procedure TfrmAtende.plTratarLinhasAcionamento(lbOcultar: Boolean);
begin
end;

procedure TfrmAtende.rgOpcoesViewClick(Sender: TObject);
begin
  plCarregaAcionamentos;
end;

procedure TfrmAtende.plCarregaItensAcordo;
Var
  ListItem : TListItem;
  ldValorPago,
  ldValorAtraso,
  ldValorEmAberto,
  ldValorTotal : Double;
begin

  ldValorTotal    := 0.00;
  ldValorPago     := 0.00;
  ldValorAtraso   := 0.00;
  ldValorEmAberto := 0.00;

  lstItensAcordo.Clear;
  QRECEBIMENTO.COBRANCA := QCOBRANCA.COBRANCA;
  QRECEBIMENTO.CarregaSQL;
  While Not QRECEBIMENTO.Eof Do
     Begin
       ldValorTotal := ldValorTotal + QRECEBIMENTO.VALOR;
       ListItem := lstItensAcordo.Items.Add;
       ListItem.Caption := IntToStr(QRECEBIMENTO.PARCELA);
       QTipoDocumento.TIPO_DOCUMENTO := QRECEBIMENTO.TIPODOCUMENTO;
       QTipoDocumento.CarregaSQL;
       ListItem.SubItems.Add(QTipoDocumento.SIGLA_DOCUMENTO + ' - ' +
                             QRECEBIMENTO.NUMERO_DOCUMENTO);
       ListItem.SubItems.Add(DateToStr(QRECEBIMENTO.VENCIMENTO));
       ListItem.SubItems.Add(FormatFloat('#,##0.00',QRECEBIMENTO.VALOR));
       If   QRECEBIMENTO.PAGO Then
            Begin
              ldValorPago := ldValorPago + QRECEBIMENTO.VALOR;
              ListItem.SubItems.Add('Pago');
            End
       Else
            If   QRECEBIMENTO.VENCIMENTO >= Date Then
                 Begin
                   ldValorEmAberto := ldValorEmAberto + QRECEBIMENTO.VALOR;
                   ListItem.SubItems.Add('Em Aberto');
                 End
            Else
                 Begin
                   ldValorAtraso := ldValorAtraso + QRECEBIMENTO.VALOR;
                   ListItem.SubItems.Add('Atraso');
                 End;
       QRECEBIMENTO.Next;
     End;
  If   ldValorTotal > 0.00 Then
       Begin
         ListItem := lstItensAcordo.Items.Add;
         ListItem.Caption := 'Total';
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add(FormatFloat('#,##0.00',ldValorTotal));
         ListItem.SubItems.Add('');

         ListItem := lstItensAcordo.Items.Add;
         ListItem.Caption := '';
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add('');

         ListItem := lstItensAcordo.Items.Add;
         ListItem.Caption := '';
         ListItem.SubItems.Add('Pago');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add(FormatFloat('#,##0.00',ldValorPago));
         ListItem.SubItems.Add('');

         ListItem := lstItensAcordo.Items.Add;
         ListItem.Caption := '';
         ListItem.SubItems.Add('Em Aberto');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add(FormatFloat('#,##0.00',ldValorEmAberto));
         ListItem.SubItems.Add('');

         ListItem := lstItensAcordo.Items.Add;
         ListItem.Caption := '';
         ListItem.SubItems.Add('Atrasado');
         ListItem.SubItems.Add('');
         ListItem.SubItems.Add(FormatFloat('#,##0.00',ldValorAtraso));
         ListItem.SubItems.Add('');

       End;
end;

procedure TfrmAtende.plCarregaOutrasDividas;
Var
  ListItem : TListItem;
begin
  lstOutrasDividas.Clear;
  QCOBRANCA.DEVEDOR := liDevedor;
  QCOBRANCA.CarregaSQL;
  QCOBRANCA.First;
  While Not QCOBRANCA.Eof Do
    Begin
      If   (QCOBRANCA.COBRANCA <> liCobranca)
      And  (QCOBRANCA.SITUACAO <> 1) Then
           Begin
             ListItem := lstOutrasDividas.Items.Add;
             Case QCOBRANCA.SITUACAO of
               0 : ListItem.Caption := 'Cob - Aberto';
               2 : ListItem.Caption := 'Cob - Encerrado';
             End;
             ListItem.SubItems.Add(IntToStr(QCOBRANCA.COBRANCA));
             QCREDOR.CODIGO_CREDOR := QCOBRANCA.CREDOR;
             QCREDOR.CarregaSQL;
             ListItem.SubItems.Add(QCREDOR.NOME_CREDOR);
             ListItem.SubItems.Add(FormatFloat('#,##0.00',QCOBRANCA.VALOR_DIVIDA));
             ListItem.SubItems.Add('');
           End;
      QCOBRANCA.Next;
    End;
  QACORDO.DEVEDOR := liDevedor;
  QACORDO.CarregaSQL;
  While Not QACORDO.Eof Do
    Begin
      ListItem := lstOutrasDividas.Items.Add;
      ListItem.Caption := 'Acordo';
      ListItem.SubItems.Add(IntToStr(QACORDO.IDACORDO));
      QCREDOR.CODIGO_CREDOR := QACORDO.CREDOR;
      QCREDOR.CarregaSQL;
      ListItem.SubItems.Add(QCREDOR.NOME_CREDOR);
      ListItem.SubItems.Add(FormatFloat('#,##0.00',QACORDO.VALOR_CORRIGIDO));
      ListItem.SubItems.Add('');
      QACORDO.Next;
    End;
end;

procedure TfrmAtende.lstItensAcordoCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  with lstItensAcordo.Canvas.Brush do
  begin
    If  Item.SubItems.Strings[3] = 'Atraso' Then
//    if (Item.SubItems mod 2) = 0 then
      Color := clYellow
    else
      Color := clWhite;
  end;
end;

procedure TfrmAtende.lstAcionamentoCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  with lstAcionamento.Canvas.Brush do
  begin
    if (Item.Index mod 2) = 0 then
      Color := clYellow
    else
      Color := clWhite;
  end;

end;

function TfrmAtende.flValorCorrigido(const liCobranca,
  liItemCobranca: Integer; cData : TDateTime): Double;
Var
  DiasEmAtraso : Integer;
begin
  DiasEmAtraso := DaysBetween(cData, QITENS_COBRANCA.VENCIMENTO_DOCUMENTO);
  If   QCREDOR.APLICAR_DADOS_FINANCEIROS Then
       Result := QITENS_COBRANCA.VALOR_DOCUMENTO +
                 ((QITENS_COBRANCA.VALOR_DOCUMENTO * (DiasEmAtraso/100)) * QCREDOR.PERCENTUAL_ATRASO) +
                  (QITENS_COBRANCA.VALOR_DOCUMENTO * (QCREDOR.MULTA/100))
  Else Result := flValorCorrigidoByTabDepre(QITENS_COBRANCA.VENCIMENTO_DOCUMENTO,
                                                  QITENS_COBRANCA.VALOR_DOCUMENTO);
end;

procedure TfrmAtende.sbtnBuscaDevedorClick(Sender: TObject);
begin
  CallDevedor(liDevedor);
  plCarregaDevedor;
end;

procedure TfrmAtende.lstEnderecosCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  with lstEnderecos.Canvas.Brush do
  begin
    If   AnsiPos('Principal',Item.Caption) <> 0 Then
         Color := clYellow
    else
         Color := clWhite;
  end;
end;

procedure TfrmAtende.plGerarChamado;
begin
  Try
    If   TUniqueParametros.GetParametros.EhCobrador Then
         Begin
           FChamado.Carrega(False);
           QCHAMADO.IDCOBRANCA   := liCobranca;
           QCHAMADO.SITUACAO     := 0;
           QCHAMADO.CarregaSQL;

           FChamado.Insert;
           FChamado.IDCOBRADOR             := TUniqueParametros.GetParametros.IDCobrador;
           FChamado.IDCREDOR               := QCOBRANCA.CREDOR;
           FChamado.IDDEVEDOR              := liDevedor;
           FChamado.IDCOBRANCA             := liCobranca;
           FChamado.IDACORDO               := 0;
           FChamado.TIPO_CHAMADO           := 2; //Livre
           FChamado.SITUACAO               := 0;
           FChamado.HORA_INICIO_CONFIRMADA := Now;
           FChamado.SITUACAO               := 1;
           FChamado.Post;

           liChamado                       := FChamado.IDCHAMADO;
           HoraInicio                      := FChamado.HORA_INICIO_CONFIRMADA;
         End
    Else liChamado := 0;
  Except
    FChamado.Cancel;
  End;
end;

procedure TfrmAtende.Timer1Timer(Sender: TObject);
begin
  If   TUniqueParametros.GetParametros.EhCobrador Then
       Begin
         Label10.Caption := ' Chamado no. : ' + IntToStr(liChamado) +
                            ' Inicio : ' + DateTimeToStr(HoraInicio) +
                            ' Tempo : ' + IntToStr(HoursBetween(Now,HoraInicio)) + ':'
                                        + IntToStr(MinutesBetween(Now,HoraInicio)) + ':'
                                        + IntToStr(SecondsBetween(Now,HoraInicio));
       End;
end;

procedure TfrmAtende.plFecharChamado(Tipo : enumFinalizarChamado);
begin
  QCOBRANCA.COBRANCA := liCobranca;
  QCOBRANCA.CarregaSQL;
  FChamado.Carrega(False);
  Try
    If   TUniqueParametros.GetParametros.EhCobrador Then
         Begin
           If   FChamado.Locate('IDCHAMADO',liChamado,[]) Then
                Begin
                  FChamado.Edit;
                  FChamado.HORA_FINAL_CONFIRMADA := Now;
                  FChamado.SITUACAO := 2;
                  FChamado.Post;
                End;
         End;

     Case Tipo of
       eProgramado : Begin
                       FChamado.Insert;
                       FChamado.IDCOBRADOR             := TUniqueParametros.GetParametros.IDCobrador;
                       FChamado.IDCREDOR               := QCOBRANCA.CREDOR;
                       FChamado.IDDEVEDOR              := liDevedor;
                       FChamado.IDCOBRANCA             := liCobranca;
                       FChamado.IDACORDO               := 0;
                       FChamado.SITUACAO               := 0;
                       FChamado.TIPO_CHAMADO           := 0; //Normal
                       FChamado.Post;
                     End;
       ePromessa   : Begin
                       FChamado.Insert;
                       FChamado.IDCOBRADOR             := TUniqueParametros.GetParametros.IDCobrador;
                       FChamado.IDCREDOR               := QCOBRANCA.CREDOR;
                       FChamado.IDDEVEDOR              := liDevedor;
                       FChamado.IDCOBRANCA             := liCobranca;
                       FChamado.IDACORDO               := 0;
                       FChamado.SITUACAO               := 0;
                       FChamado.TIPO_CHAMADO           := 1;
                       FChamado.HORA_INICIO_PROGRAMADA := flRetornarData;
                       FChamado.Post;
                     End;
     End;
    Close;
  Except
    On E: Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmAtende.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  plFecharTabelas;
end;

procedure TfrmAtende.lstOutrasDividasDblClick(Sender: TObject);
Var
  SelectItem : TListItem;
begin
  SelectItem := lstOutrasDividas.Selected;
  If   Trim(SelectItem.Caption) = 'Acordo' Then
       plConsultaAcordo(StrToInt(SelectItem.SubItems.Strings[0]));
end;

procedure TfrmAtende.bbAjustarProdDepClick(Sender: TObject);
begin
  plCarregaItensCobrancas;
end;

function TfrmAtende.flValorCorrigidoByTabDepre(cData : TDateTime; cValor :
    Double): Double;
Var
  Multa,
  IndiceDepreAtual,
  ValorCorrigido,
  ValorJuros       : Double;
  TotalMeses       : Integer;
begin
  QDEPRE.CarregaSQL;
  QDEPRE.Last;
  IndiceDepreAtual := QDEPRE.INDICE;
  Multa := cValor * 0.02;
  QDEPRE.ANO := YearOf(cData);
  QDEPRE.MES := MonthOf(cData);
  QDEPRE.CarregaSQL;
  If   Not QDEPRE.Eof Then
       Begin
         ValorCorrigido := (cValor + Multa) / QDEPRE.INDICE * IndiceDepreAtual;
         TotalMeses     := MonthsBetween(Date,cData)+1;
         ValorJuros     := ValorCorrigido * ((TUniqueParametros.GetParametros.IndiceDEPRE * TotalMeses) / 100);
         Result         := ValorCorrigido + ValorJuros;
       End
  Else Result := 0.00;
end;

procedure TfrmAtende.plAbrirTabelas;
begin
  QCOBRANCA       := TSimplesCOBRANCA.Create(Self);
  QCREDOR         := TSimplesCREDOR.Create(Self);
  QDEVEDOR        := TSimplesDEVEDOR.Create(Self);
  QENDERECOS      := TSimplesENDERECOS.Create(Self);
  QTipoSituacao   := TSimplesTIPO_SITUACAO.Create(Self);
  QITENS_COBRANCA := TSimplesITENS_COBRANCA.Create(Self);
  QBANCO          := TSimplesBANCO.Create(Self);
  QTipoDocumento  := TSimplesTIPO_DOCUMENTO.Create(Self);
  QTELEFONES      := TSimplesTELEFONES.Create(Self);
  QACIONAMENTO    := TSimplesACIONAMENTO.Create(Self);
  QRECEBIMENTO    := TSimplesRECEBIMENTO.Create(Self);
  QACORDO         := TSimplesACORDO.Create(Self);
  QDEPRE          := TSimplesDEPRE.Create(Self);
  QCHAMADO        := TSimplesCHAMADO.Create(Self);
  FChamado        := TCHAMADO.Create(Self);
end;

procedure TfrmAtende.plFecharTabelas;
begin
  QCOBRANCA.Free;
  QCREDOR.Free;
  QDEVEDOR.Free;
  QENDERECOS.Free;
  QTipoSituacao.Free;
  QITENS_COBRANCA.Free;
  QBANCO.Free;
  QTipoDocumento.Free;
  QTELEFONES.Free;
  QACIONAMENTO.Free;
  QRECEBIMENTO.Free;
  QACORDO.Free;
  QDEPRE.Free;
  QCHAMADO.Free;
  FChamado.Free;
end;

procedure TfrmAtende.btnDesconfirmaClick(Sender: TObject);
begin
  plFecharChamado(eFinalizar);
end;

procedure TfrmAtende.plCarregarChamado;
begin
  Try
    If   TUniqueParametros.GetParametros.EhCobrador Then
         Begin
           FChamado.Carrega(False);
           QCHAMADO.IDCHAMADO   := liChamado;
           QCHAMADO.CarregaSQL;

           If   FChamado.FindBypk_IdChamado(QCHAMADO.IDCHAMADO) Then
                Begin
                  FChamado.Edit;
                  liCobranca     := FChamado.IDCOBRANCA;
                  liDevedor      := FChamado.IDDEVEDOR;
                End
           Else
                Begin
                  FChamado.Insert;
                  FChamado.IDCOBRADOR             := TUniqueParametros.GetParametros.IDCobrador;
                  FChamado.IDCREDOR               := QCOBRANCA.CREDOR;
                  FChamado.IDDEVEDOR              := liDevedor;
                  FChamado.IDCOBRANCA             := liCobranca;
                  FChamado.IDACORDO               := 0;
                  FChamado.TIPO_CHAMADO           := 2; //Livre
                  FChamado.SITUACAO               := 0;
                End;

           If   FChamado.SITUACAO = 0 Then
                Begin
                  FChamado.HORA_INICIO_CONFIRMADA := Now;
                  FChamado.SITUACAO               := 1;
                End;
           FChamado.Post;

           liChamado                       := FChamado.IDCHAMADO;
           HoraInicio                      := FChamado.HORA_INICIO_CONFIRMADA;
         End
    Else liChamado := 0;
  Except
    FChamado.Cancel;
  End;
end;

procedure TfrmAtende.btnAcionamentoClick(Sender: TObject);
begin
  CallInserirAcionamento(liCobranca,liChamado);
  plCarregaAcionamentos;
end;

function TfrmAtende.flExisteAcionamento: Boolean;
begin
  QACIONAMENTO.IDCHAMADO := liChamado;
  QACIONAMENTO.CarregaSQL;
  Result := Not QACIONAMENTO.Eof;
end;

procedure TfrmAtende.btnProgramarClick(Sender: TObject);
begin
  plFecharChamado(eProgramado);
end;

procedure TfrmAtende.btnGerarPromessaClick(Sender: TObject);
begin
  plFecharChamado(ePromessa);
end;

end.
