unit uCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, DBCtrls, Mask, Buttons, Grids,
  ucLayCobranca, ucLayItens_Cobranca,
  ucLayCredor,
  ucLayDevedor,
  ucLayTIPO_SITUACAO,
  ucLayBanco,
  ucLayTipo_Documento,
  ucLayAlines,
  ucLayDepre,
  NumericEdit, SmtLstvw, SBLstV0u,
  DBGrids, dbcgrids, DateUtils, uFuncoes;

type

  TListaItensCobranca = Class
    IdItemCobranca       : LongInt;
    Alines               : Integer;
    Banco_Documento      : Word;
    Cobranca             : LongInt;
    Data_Divida          : TDateTime;
    Item                 : Byte;
    TipoDocumento        : Byte;
    Numero_Documento     : String;
    Emissao_Documento    : TDateTime;
    Observacao           : string;
    Situacao             : Integer;
    Valor_Documento      : Double;
    Vencimento_Documento : TDateTime;
    Valor_Corrigido      : Double;
    DiasEmAtraso         : Integer;
    Deletar              : Boolean; 
  End;

  TfrmCobranca = class(TForm)
    pnTela: TPanel;
    pnCabecalho: TPanel;
    pnRodape: TPanel;
    gbRodape: TGroupBox;
    gbCabecalho: TGroupBox;
    btnSair: TBitBtn;
    btnExcluir: TBitBtn;
    gbItens: TGroupBox;
    pnTop: TPanel;
    pnListView: TPanel;
    gbValorCorrigido: TGroupBox;
    pnValorCor: TPanel;
    gbValor: TGroupBox;
    pnValor: TPanel;
    gbData: TGroupBox;
    DTDATA_CADASTRO: TDateTimePicker;
    gbCredor: TGroupBox;
    pnCredor: TPanel;
    edNomeCredor: TEdit;
    gbDevedor: TGroupBox;
    pnDevedor: TPanel;
    edNomeDevedor: TEdit;
    gbCobranca: TGroupBox;
    pnCobranca: TPanel;
    pnTipoSituacao: TPanel;
    btnDeletarItem: TBitBtn;
    btnAlterarItem: TBitBtn;
    btnConfiguraListView: TBitBtn;
    gbAlines: TGroupBox;
    gbBanco: TGroupBox;
    gbData_Divida: TGroupBox;
    gbEmissaoDocumento: TGroupBox;
    gbItem: TGroupBox;
    gbNumeroDocumento: TGroupBox;
    gbTipoDocumento: TGroupBox;
    gbValorDocumento: TGroupBox;
    gbVencimento: TGroupBox;
    dtDataVencimento: TDateTimePicker;
    dtDataDivida: TDateTimePicker;
    dtEmissaoItem: TDateTimePicker;
    edNumeroDocumento: TEdit;
    pnItem: TPanel;
    pnValorItem: TPanel;
    pnBanco: TPanel;
    pnDescBanco: TPanel;
    pnTipo: TPanel;
    pnDescTipo: TPanel;
    pnAlines: TPanel;
    pnDescAlines: TPanel;
    btnLimpar: TBitBtn;
    btnAdicionarItem: TBitBtn;
    btnGrava: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    btnAlterar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lwItensCobrancaGetPath(var APath: String);
    procedure btnBuscaDevedorClick(Sender : TObject);
    procedure btnBuscaCredorClick(Sender : TObject);
    procedure btnBuscaAlinesClick(Sender : TObject);
    procedure btnBuscaTipoDocumentoClick(Sender : TObject);
    procedure btnBuscaBancoClick(Sender : TObject);
    procedure btnConfiguraListViewClick(Sender: TObject);
    procedure lwItensCobrancaDbClick(Sender : TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FIECobrancaOnExit(Sender : TObject);
    procedure FIEDevedorOnExit(Sender : TObject);
    procedure FIECredorOnExit(Sender : TObject);
    procedure FIEAlinesOnExit(Sender : TObject);
    procedure FIEBancoOnExit(Sender : TObject);
    procedure FIETipoDocumentoOnExit(Sender : TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarItemClick(Sender: TObject);
    procedure btnDeletarItemClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    lyItem                : Byte;
    lbEditarItensCobranca : Boolean;
    llPosicao             : Longint;
    lwItensCobranca       : TSmartListView;
    FIECobranca           : TIntegerEdit;
    FIEDevedor            : TIntegerEdit;
    FIECredor             : TIntegerEdit;
    FIEBanco              : TIntegerEdit;
    FIETipoDocumento      : TIntegerEdit;
    FIEAlines             : TIntegerEdit;
    FFEValor              : TFloatEdit;
    FFEValorCor           : TFloatEdit;
    FFEValorItem          : TFloatEdit;
    Leitura               : Boolean;
    FCobranca             : TCOBRANCA;
    FItensCobranca        : TITENS_COBRANCA;
    FSimplesCobranca      : TSimplesCOBRANCA;
    FSimplesCredor        : TSimplesCREDOR;
    FSimplesDevedor       : TSimplesDEVEDOR;
    FSimplesTSituacao     : TSimplesTIPO_SITUACAO;
    FSimplesItens         : TSimplesITENS_COBRANCA;
    FSimplesBanco         : TSimplesBANCO;
    FSimplesAlines        : TSimplesALINES;
    FSimplesTipoDocumento : TSimplesTIPO_DOCUMENTO;
    FSimplesDepre         : TSimplesDEPRE;
    procedure plCriarBotoes;
    procedure BuscaDevedorNome;
    procedure BuscaCredorNome;
    procedure BuscaBanco;
    procedure BuscaTipoDocumento;
    procedure BuscaAlines;
    procedure plAbrirTabelas;
    procedure FecharTabelas;
    procedure HabilitarControlesItensCobranca(blNovo,
                                              blExcluir,
                                              blAlterar : Boolean);
    procedure plListaAcionamento;
    procedure plCarregaCabecalho;
    procedure plCarregaListViewItensCobranca(lbEdita : Boolean; lstItensCobranca : TListaItensCobranca);
    procedure plHabilitaCabecalho(lbHabilita : Boolean);
    procedure plCarregaItens;
    procedure plCarregarDados;
    procedure plLimparCampos;
    procedure plLimaprCamposItems;
    procedure plLimparListViewItens;
    procedure plExcluirCobranca;
    procedure plGravarCobranca;
    procedure plDeletarCobranca;
    procedure plEditarCobranca;
    procedure plAlterarCobranca;
    function flCorrigirValorByCredor(DiasEmAtraso : Integer; Valor,
        Percentual_Atraso, Multa : Double): Double;
    function flValorCorrigidoByTabDepre(cData : TDateTime; cValor : Double): Double;
  public
    { Public declarations }
  end;

  procedure CallCobranca(Cobranca : LongInt;SomenteLeitura:Boolean);

implementation
Uses
  uPesquisa,
  uGetFunctions,
  uGerarAcordo,
  Parametros,
  Math;

const
 CONST_ValorCorrigido = 'Valor Corrigido';
 CONST_DiasEmAtraso = 'Dias em Atraso';
 CONST_Valor = 'Valor';
 CONST_Vencimento = 'Vencimento';
 CONST_Emissao = 'Emissao';
 CONST_Numero = 'Numero';
 CONST_Documento = 'Documento';
 CONST_Item = 'Item';

{$R *.dfm}

procedure CallCobranca(Cobranca : LongInt;SomenteLeitura:Boolean);
var
  frmCobranca: TfrmCobranca;
Begin
  frmCobranca := TfrmCobranca.Create(Application);
  Try
    frmCobranca.ShowModal;
  Finally
    FreeAndNil(frmCobranca);
  End;
End;

procedure TfrmCobranca.FecharTabelas;
begin
  FSimplesCobranca.Free;
  FSimplesCredor.Free;
  FSimplesDevedor.Free;
  FSimplesTSituacao.Free;
  FSimplesItens.Free;
  FSimplesBanco.Free;
  FSimplesAlines.Free;
  FSimplesTipoDocumento.Free;
  FSimplesDepre.Free;
  FCobranca.Free;
  FItensCobranca.Free;
end;

procedure TfrmCobranca.FIECobrancaOnExit(Sender: TObject);
begin
  If   FIECobranca.IntegerNumber > 0 Then
       plCarregarDados;
end;

procedure TfrmCobranca.FormCreate(Sender: TObject);
begin
  CentralizarForm(Self);
  DTDATA_CADASTRO.DateTime  := Date;
  dtDataVencimento.DateTime := Date;
  dtDataDivida.DateTime     := Date;
  dtEmissaoItem.DateTime    := Date;
  plAbrirTabelas;
end;

procedure TfrmCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FecharTabelas;
end;

procedure TfrmCobranca.btnExcluirClick(Sender: TObject);
begin
   If   MessageDlg('Tem Certeza Que deseja Excluir Este Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
          plExcluirCobranca;
          plLimparCampos;
        End;
end;

procedure TfrmCobranca.btnLimparClick(Sender: TObject);
begin
  plLimparCampos;
end;

procedure TfrmCobranca.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCobranca.HabilitarControlesItensCobranca(blNovo, blExcluir, blAlterar: Boolean);
begin
  btnAdicionarItem.Enabled := blNovo;
  btnDeletarItem.Enabled   := blExcluir;
  btnAlterarItem.Enabled   := blAlterar;
end;

procedure TfrmCobranca.lwItensCobrancaGetPath(var APath: String);
begin
  APath := 'C:\';
end;

procedure TfrmCobranca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       begin
         Perform (CM_DialogKey, VK_TAB, 0);
         key:=#0;
       end;
end;

procedure TfrmCobranca.BuscaDevedorNome;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['CODIGO_DEVEDOR','NOME_DEVEDOR']);
    FConsulta.CampoCondicao := 'NOME_DEVEDOR';
    If   FConsulta.Execute Then
         Begin
           FIEDevedor.IntegerNumber := FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsInteger;
           edNomeDevedor.Text := FConsulta.Consulta.FieldByName('NOME_DEVEDOR').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmCobranca.BuscaAlines;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'ALINES';
    FConsulta.DefineCampos(['MOTIVO','TIPO_ALINIAS','DESCRICAO_ALINIAS']);
    FConsulta.CampoCondicao := 'TIPO_ALINIAS';
    If   FConsulta.Execute Then
         Begin
           FIEAlines.IntegerNumber := FConsulta.Consulta.FieldByName('MOTIVO').AsInteger;
           pnDescAlines.Caption    := FConsulta.Consulta.FieldByName('TIPO_ALINIAS').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmCobranca.BuscaBanco;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'BANCO';
    FConsulta.DefineCampos(['NUMERO_BANCO','NOME_BANCO']);
    FConsulta.CampoCondicao := 'NOME_BANCO';
    If   FConsulta.Execute Then
         Begin
           FIEBanco.IntegerNumber := FConsulta.Consulta.FieldByName('NUMERO_BANCO').AsInteger;
           pnDescBanco.Caption    := FConsulta.Consulta.FieldByName('NOME_BANCO').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmCobranca.BuscaTipoDocumento;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'TIPO_DOCUMENTO';
    FConsulta.DefineCampos(['TIPO_DOCUMENTO','SIGLA_DOCUMENTO','DESCRICAO']);
    FConsulta.CampoCondicao := 'DESCRICAO';
    If   FConsulta.Execute Then
         Begin
           FIETipoDocumento.IntegerNumber := FConsulta.Consulta.FieldByName('TIPO_DOCUMENTO').AsInteger;
           pnDescTipo.Caption             := FConsulta.Consulta.FieldByName('DESCRICAO').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmCobranca.BuscaCredorNome;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'CREDOR';
    FConsulta.DefineCampos(['CODIGO_CREDOR','NOME_CREDOR']);
    FConsulta.CampoCondicao := 'NOME_CREDOR';
    If   FConsulta.Execute Then
         Begin
           FIECredor.IntegerNumber := FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsInteger;
           edNomeCredor.Text       := FConsulta.Consulta.FieldByName('NOME_CREDOR').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmCobranca.plListaAcionamento;
begin
end;

procedure TfrmCobranca.plAbrirTabelas;
begin
  FCobranca             := TCOBRANCA.Create(Self);
  FItensCobranca        := TITENS_COBRANCA.Create(Self);
  FSimplesCobranca      := TSimplesCOBRANCA.Create(Self);
  FSimplesCredor        := TSimplesCREDOR.Create(Self);
  FSimplesDevedor       := TSimplesDEVEDOR.Create(Self);
  FSimplesTSituacao     := TSimplesTIPO_SITUACAO.Create(Self);
  FSimplesItens         := TSimplesITENS_COBRANCA.Create(Self);
  FSimplesBanco         := TSimplesBANCO.Create(Self);
  FSimplesAlines        := TSimplesALINES.Create(Self);
  FSimplesTipoDocumento := TSimplesTIPO_DOCUMENTO.Create(Self);
  FSimplesDepre         := TSimplesDEPRE.Create(Self);
  plCriarBotoes;
  plCarregaCabecalho;
  HabilitarControlesItensCobranca(True,False,False);
end;

procedure TfrmCobranca.plCarregaCabecalho;
begin
  lwItensCobranca.Clear;
  lwItensCobranca.TabularView.ClearColumns;
  lwItensCobranca.TabularView.AddColumn(CONST_Item           , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lwItensCobranca.TabularView.AddColumn(CONST_Documento      , taRightJustify, otAsc, '', True, SmNotSum  , nil, ctString);
  lwItensCobranca.TabularView.AddColumn(CONST_Numero         , taRightJustify, otAsc, '', True, SmNotSum  , nil, ctInteger);
  lwItensCobranca.TabularView.AddColumn(CONST_DiasEmAtraso   , taRightJustify, otAsc, '', True, SmNotSum  , nil, ctInteger);
  lwItensCobranca.TabularView.AddColumn(CONST_ValorCorrigido , taRightJustify, otAsc, '#.##@,@@', True, smFloat , nil, ctFloat);
  lwItensCobranca.TabularView.AddColumn(CONST_Emissao        , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lwItensCobranca.TabularView.AddColumn(CONST_Vencimento     , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lwItensCobranca.TabularView.AddColumn(CONST_Valor          , taRightJustify, otAsc, '#.##@,@@', True, smFloat   , nil, ctFloat);
  lwItensCobranca.TabularView.AddColumn('Banco'              , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);

  lwItensCobranca.AdjustColumnsByName[CONST_Item].ColumnType := ctInteger;
  lwItensCobranca.AdjustColumnsByName[CONST_Documento].ColumnType := ctString;
  lwItensCobranca.AdjustColumnsByName[CONST_Numero].ColumnType := ctInteger;
  lwItensCobranca.AdjustColumnsByName[CONST_Emissao].ColumnType := ctDate;
  lwItensCobranca.AdjustColumnsByName[CONST_Vencimento].ColumnType := ctDate;
  lwItensCobranca.AdjustColumnsByName[CONST_Valor].ColumnType := ctFloat;
  lwItensCobranca.AdjustColumnsByName[CONST_DiasEmAtraso].ColumnType := ctInteger;
  lwItensCobranca.AdjustColumnsByName[CONST_ValorCorrigido].ColumnType := ctFloat;
  lwItensCobranca.AdjustColumnsByName['Banco'].ColumnType := ctString;
  lwItensCobranca.Execute;
end;

procedure TfrmCobranca.plCriarBotoes;
begin
  FIECobranca := TIntegerEdit.Create(Self);
  With FIECobranca Do
    Begin
      Parent      := pnCobranca;
      Name        := 'IECobranca';
      Width       := pnCobranca.ClientWidth;
      OnExit      := FIECobrancaOnExit;
    End;
  FIEDevedor := TIntegerEdit.Create(Self);
  With FIEDevedor Do
    Begin
      Parent      := pnDevedor;
      Name        := 'IEDevedor';
      Width       := pnDevedor.Width;
      ShowButton  := True;
      OnBtnClick  := btnBuscaDevedorClick;
      OnExit      := FIEDevedorOnExit;
    End;
  FIECredor := TIntegerEdit.Create(Self);
  With FIECredor Do
    Begin
      Parent      := pnCredor;
      Name        := 'IECredor';
      Width       := pnCredor.Width;
      ShowButton  := True;
      OnBtnClick  := btnBuscaCredorClick;
      OnExit      := FIECredorOnExit;
    End;
  FIEBanco := TIntegerEdit.Create(Self);
  With FIEBanco Do
    Begin
      Parent      := pnBanco;
      Name        := 'IEBanco';
      Width       := pnBanco.Width;
      ShowButton  := True;
      OnBtnClick  := btnBuscaBancoClick;
      OnExit      := FIEBancoOnExit;
    End;
  FIETipoDocumento := TIntegerEdit.Create(Self);
  With FIETipoDocumento Do
    Begin
      Parent      := pnTipo;
      Name        := 'IETipoDocumento';
      Width       := pnTipo.Width;
      ShowButton  := True;
      OnBtnClick  := btnBuscaTipoDocumentoClick;
      OnExit      := FIETipoDocumentoOnExit;
    End;
  FIEAlines := TIntegerEdit.Create(Self);
  With FIEAlines Do
    Begin
      Parent      := pnAlines;
      Name        := 'IEAlines';
      Width       := pnAlines.Width;
      ShowButton  := True;
      OnBtnClick  := btnBuscaAlinesClick;
      OnExit      := FIEAlinesOnExit;
    End;
  FFEValor := TFloatEdit.Create(Self);
  With FFEValor Do
    Begin
      Parent      := pnValor;
      Name        := 'FEValor';
      Width       := pnValor.ClientWidth;
      Enabled     := False;
    End;
  FFEValorCor := TFloatEdit.Create(Self);
  With FFEValorCor Do
    Begin
      Parent      := pnValorCor;
      Name        := 'FEValorCor';
      Width       := pnValorCor.ClientWidth;
      Enabled     := False;
    End;
   FFEValorItem := TFloatEdit.Create(Self);
   With FFEValorItem Do
    Begin
      Parent      := pnValorItem;
      Name        := 'FEValorItem';
      Width       := pnValorItem.ClientWidth;
    End;
  lwItensCobranca := TSmartListView.Create(Self);
  With lwItensCobranca Do
    Begin
      Align             := alClient;
      Parent            := pnListView;
      Name              := 'lwItens';
      Height            := pnListView.ClientHeight;
      Width             := pnListView.ClientWidth;
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
      OnGetPath         := lwItensCobrancaGetPath;
      Color             := clInfoBk;
      GridLines         := True;
      ReadOnly          := True;
      RowSelect         := True;
      EnableSort        := True;
      EnableFilter      := True;
      EnableSum         := True;
      ShowMainColumns   := False;
      EnablePaintCells  := True;
      OnDblClick        := lwItensCobrancaDbClick;
    End;
end;

procedure TfrmCobranca.btnBuscaDevedorClick(Sender: TObject);
begin
  BuscaDevedorNome;
end;

procedure TfrmCobranca.plCarregarDados;
Var
  lbListaItensCobranca : TListaItensCobranca;
begin
  Try
    lwItensCobranca.Clear;
    FSimplesCobranca.COBRANCA    := FIECobranca.IntegerNumber;
    FSimplesCobranca.CarregaSQL;
    If   FSimplesCobranca.Eof Then
         Raise Exception.Create('Cobrança Inexistente!');
    plHabilitaCabecalho(False);
    Case FSimplesCobranca.SITUACAO of
      0 : Begin
            plHabilitaCabecalho(True);
            HabilitarControlesItensCobranca(True,True,True);
            pnItem.Enabled := True;
          End;
      Else
          Begin
            plHabilitaCabecalho(False);
            HabilitarControlesItensCobranca(False,False,False);
            pnItem.Enabled := False;
          End;
    End;
    FIEDevedor.IntegerNumber        := FSimplesCobranca.DEVEDOR;
    FIECredor.IntegerNumber         := FSimplesCobranca.CREDOR;
    DTDATA_CADASTRO.DateTime        := FSimplesCobranca.DATA_CADASTRO;
    FFEValor.FloatNumber            := FSimplesCobranca.VALOR_DIVIDA;
    FFEValorCor.FloatNumber         := FSimplesCobranca.VALOR_CORRIGIDO;
    FSimplesCredor.CODIGO_CREDOR    := FSimplesCobranca.CREDOR;
    FSimplesCredor.CarregaSQL;
    edNomeCredor.Text               := FSimplesCredor.NOME_CREDOR;
    FSimplesDevedor.CODIGO_DEVEDOR  := FSimplesCobranca.DEVEDOR;
    FSimplesDevedor.CarregaSQL;
    edNomeDevedor.Text              := FSimplesDevedor.NOME_DEVEDOR;
    FSimplesTSituacao.TIPO_SITUACAO := FSimplesCobranca.SITUACAO;
    FSimplesTSituacao.CarregaSQL;
    pnTipoSituacao.Caption          := FSimplesTSituacao.DESCRICAO_SITUACAO;
    FSimplesItens.COBRANCA          := FSimplesCobranca.COBRANCA;
    FSimplesItens.CarregaSQL;
    While Not FSimplesItens.Eof Do
       Begin
         lyItem                                    := FSimplesItens.ITEM;
         lbListaItensCobranca                      := TListaItensCobranca.Create;
         lbListaItensCobranca.IdItemCobranca       := FSimplesItens.IDITEMCOBRANCA;
         lbListaItensCobranca.Alines               := FSimplesItens.ALINES;
         lbListaItensCobranca.Banco_Documento      := FSimplesItens.BANCO_DOCUMENTO;
         lbListaItensCobranca.Cobranca             := FSimplesItens.COBRANCA;
         lbListaItensCobranca.Data_Divida          := FSimplesItens.DATA_DIVIDA;
         lbListaItensCobranca.Item                 := FSimplesItens.ITEM;
         lbListaItensCobranca.TipoDocumento        := FSimplesItens.TIPODOCUMENTO;
         lbListaItensCobranca.Numero_Documento     := FSimplesItens.NUMERO_DOCUMENTO;
         lbListaItensCobranca.Emissao_Documento    := FSimplesItens.EMISSAO_DOCUMENTO;
         lbListaItensCobranca.Observacao           := FSimplesItens.OBSERVACAO;
         lbListaItensCobranca.Situacao             := FSimplesItens.SITUACAO;
         lbListaItensCobranca.Valor_Documento      := FSimplesItens.VALOR_DOCUMENTO;
         lbListaItensCobranca.Vencimento_Documento := FSimplesItens.VENCIMENTO_DOCUMENTO;
         If   FSimplesCobranca.SITUACAO = 0 Then
              Begin
                If   FSimplesItens.VENCIMENTO_DOCUMENTO >= Date Then
                     lbListaItensCobranca.Valor_Corrigido := FSimplesItens.VALOR_DOCUMENTO
                Else
                     Begin
                       lbListaItensCobranca.DiasEmAtraso         := DaysBetween(Date, FSimplesItens.VENCIMENTO_DOCUMENTO);
                       If   FSimplesCredor.APLICAR_DADOS_FINANCEIROS Then
                            lbListaItensCobranca.Valor_Corrigido := flCorrigirValorByCredor(lbListaItensCobranca.DiasEmAtraso,
                                                                                            lbListaItensCobranca.Valor_Documento,
                                                                                            FSimplesCredor.PERCENTUAL_ATRASO,
                                                                                            FSimplesCredor.MULTA)
                       Else lbListaItensCobranca.Valor_Corrigido := flValorCorrigidoByTabDepre(Now,lbListaItensCobranca.Valor_Documento);
                     End;
              End
         Else
              Begin
                lbListaItensCobranca.DiasEmAtraso := 0;
                lbListaItensCobranca.Valor_Corrigido := 0.00;
              End;
         lbListaItensCobranca.Deletar              := False;
         plCarregaListViewItensCobranca(False,lbListaItensCobranca);
         FSimplesItens.Next;
       End;
     lwItensCobranca.Execute;
  Except
      On E: Exception Do
         Begin
           ShowMessage(E.Message);
           FIECobranca.SetFocus;
         End;
  End;
end;

procedure TfrmCobranca.plCarregaListViewItensCobranca(lbEdita: Boolean;
  lstItensCobranca: TListaItensCobranca);
begin
   FSimplesTipoDocumento.TIPO_DOCUMENTO := lstItensCobranca.TipoDocumento;
   FSimplesTipoDocumento.CarregaSQL;

   FSimplesBanco.NUMERO_BANCO := lstItensCobranca.Banco_Documento;
   FSimplesBanco.CarregaSQL;

   If   lbEdita Then
        Begin
          lwItensCobranca.AdjustColumnsByName['Item'      ].Lines[llPosicao] := IntToStr(lstItensCobranca.Item);
          lwItensCobranca.AdjustColumnsByName['Documento' ].Lines[llPosicao] := FSimplesTipoDocumento.DESCRICAO;
          lwItensCobranca.AdjustColumnsByName['Numero'    ].Lines[llPosicao] := lstItensCobranca.Numero_Documento;
          lwItensCobranca.AdjustColumnsByName['Emissao'   ].Lines[llPosicao] := DateToStr(lstItensCobranca.Emissao_Documento);
          lwItensCobranca.AdjustColumnsByName['Vencimento'].Lines[llPosicao] := DateToStr(lstItensCobranca.Vencimento_Documento);
          lwItensCobranca.AdjustColumnsByName['Valor'     ].Lines[llPosicao] := FormatFloat('#,##0.00',lstItensCobranca.Valor_Documento);
          lwItensCobranca.AdjustColumnsByName['Dias em Atraso'].Lines[llPosicao] := IntToStr(lstItensCobranca.DiasEmAtraso);
          lwItensCobranca.AdjustColumnsByName['Valor Corrigido'].Lines[llPosicao] := FormatFloat('#,##0.00',lstItensCobranca.Valor_Corrigido);
          lwItensCobranca.AdjustColumnsByName['Banco'     ].Lines[llPosicao] := FSimplesBanco.NOME_BANCO;
          llPosicao := -1;
          lbEditarItensCobranca := False;
        End
   Else
        Begin
          lwItensCobranca.AdjustColumnsByName['Item'           ].Lines.Add(IntToStr(lstItensCobranca.Item));
          lwItensCobranca.AdjustColumnsByName['Documento'      ].Lines.Add(FSimplesTipoDocumento.DESCRICAO);
          lwItensCobranca.AdjustColumnsByName['Numero'         ].Lines.Add(lstItensCobranca.Numero_Documento);
          lwItensCobranca.AdjustColumnsByName['Emissao'        ].Lines.Add(DateToStr(lstItensCobranca.Emissao_Documento));
          lwItensCobranca.AdjustColumnsByName['Vencimento'     ].Lines.Add(DateToStr(lstItensCobranca.Vencimento_Documento));
          lwItensCobranca.AdjustColumnsByName['Valor'          ].Lines.Add(FormatFloat('#,##0.00',lstItensCobranca.Valor_Documento));
          lwItensCobranca.AdjustColumnsByName['Dias em Atraso' ].Lines.Add(IntToStr(lstItensCobranca.DiasEmAtraso));
          lwItensCobranca.AdjustColumnsByName['Valor Corrigido'].Lines.Add(FormatFloat('#,##0.00',lstItensCobranca.Valor_Corrigido));
          lwItensCobranca.AdjustColumnsByName['Banco'          ].Lines.Add(FSimplesBanco.NOME_BANCO);
          lwItensCobranca.TabularView.Data[lwItensCobranca.TabularView.LinesCount-1] := lstItensCobranca;
        End;
  lwItensCobranca.Execute;
end;

procedure TfrmCobranca.plHabilitaCabecalho(lbHabilita: Boolean);
begin
  FIECobranca.Enabled     := lbHabilita;
  FIEDevedor.Enabled      := lbHabilita;
  FIECredor.Enabled       := lbHabilita;
  DTDATA_CADASTRO.Enabled := lbHabilita;
  FFEValor.Enabled        := lbHabilita;
end;

procedure TfrmCobranca.btnConfiguraListViewClick(Sender: TObject);
begin
  lwItensCobranca.ConfigureView;
end;

procedure TfrmCobranca.lwItensCobrancaDbClick(Sender: TObject);
begin
  If   btnAlterarItem.Enabled Then
       plCarregaItens;
end;

procedure TfrmCobranca.plCarregaItens;
Var
  Li : TListItem;
  ListaItensCobranca : TListaItensCobranca;
begin
  If   Not lbEditarItensCobranca Then
       Begin
          If   lwItensCobranca.TabularView.LinesCount > 0 Then
               Begin
                 Li := lwItensCobranca.Selected;
                 If   (Li <> Nil)
                 And  (Li.Index <  lwItensCobranca.TabularView.LinesCount) Then
                    Begin
                      llPosicao                      := lwItensCobranca.ItemIndex[Li.Index];
                      ListaItensCobranca             := TListaItensCobranca(lwItensCobranca.TabularView.Data[llPosicao]);
                      pnItem.Caption                 := IntToStr(ListaItensCobranca.Item);
                      dtEmissaoItem.DateTime         := ListaItensCobranca.Emissao_Documento;
                      dtDataDivida.DateTime          := ListaItensCobranca.Data_Divida;
                      dtDataVencimento.DateTime      := ListaItensCobranca.Vencimento_Documento;
                      edNumeroDocumento.Text         := ListaItensCobranca.Numero_Documento;
                      FFEValorItem.FloatNumber       := ListaItensCobranca.Valor_Documento;
                      FIEBanco.IntegerNumber         := ListaItensCobranca.Banco_Documento;
                      FSimplesBanco.NUMERO_BANCO     := FIEBanco.IntegerNumber;
                      FSimplesBanco.CarregaSQL;
                      pnDescBanco.Caption            := FSimplesBanco.NOME_BANCO;
                      FIETipoDocumento.IntegerNumber := ListaItensCobranca.TipoDocumento;
                      FSimplesTipoDocumento.TIPO_DOCUMENTO := FIETipoDocumento.IntegerNumber;
                      FSimplesTipoDocumento.CarregaSQL;
                      pnDescTipo.Caption             := FSimplesTipoDocumento.SIGLA_DOCUMENTO + ' - ' +
                                                        FSimplesTipoDocumento.DESCRICAO;
                      FIEAlines.IntegerNumber        := ListaItensCobranca.Alines;
                      FSimplesAlines.MOTIVO          := FIEAlines.IntegerNumber;
                      FSimplesAlines.CarregaSQL;
                      pnAlines.Caption               := FSimplesAlines.TIPO_ALINIAS;
                      pnDescAlines.Caption           := FSimplesAlines.DESCRICAO_ALINIAS; 
                      lbEditarItensCobranca          := True;
                      HabilitarControlesItensCobranca(True,False,False);
                    End;
               End;
       End;
end;

procedure TfrmCobranca.plLimparCampos;
begin
  lyItem                         := 0;
  lbEditarItensCobranca          := False;
  FIECobranca.IntegerNumber      := 0;
  FIEDevedor.IntegerNumber       := 0;
  FIECredor.IntegerNumber        := 0;
  pnTipoSituacao.Caption         := '';
  edNomeDevedor.Text             := '';
  edNomeCredor.Text              := '';
  DTDATA_CADASTRO.DateTime       := Date;
  FFEValor.FloatNumber           := 0.00;
  FFEValorCor.FloatNumber        := 0.00;
  plHabilitaCabecalho(True);
  plLimaprCamposItems;
  plLimparListViewItens;
  FIECobranca.SetFocus;
end;

procedure TfrmCobranca.plExcluirCobranca;
Var
  Indice : Byte;
  lslstItensCobranca : TListaItensCobranca;
begin
  Try
    Try
      FCobranca.Carrega(False);
      If   Not FCobranca.FindBypk_Cobranca(FIECobranca.IntegerNumber) Then
           Raise Exception.Create('Cobrança não encontrada!');
      If   FCobranca.SITUACAO <> 0 Then
           Raise Exception.CreateFmt('Cobrança não pode ser alterada! Motivo : %s',[pnTipoSituacao.Caption]);
      FCobranca.Delete;

      For Indice := 0 to lwItensCobranca.TabularView.LinesCount - 1 Do
         Begin
            FItensCobranca.Carrega(False);
            lslstItensCobranca := TListaItensCobranca(lwItensCobranca.TabularView.Data[Indice]);
            If   (lslstItensCobranca <> Nil)
            And Not(lslstItensCobranca.Deletar) Then
                 Begin
                   If   Not FItensCobranca.FindBypk_IdItemCobranca(lslstItensCobranca.IdItemCobranca) Then
                        Raise Exception.CreateFmt('Erro: Registro não encontrado Item : %d',[lslstItensCobranca.Item]);
                   FItensCobranca.Delete;
                 End;
         End;

      ShowMessage('Dados excluidos com sucesso!');

    Except
      On E: Exception Do
         ShowMessage(e.Message);
    End;
  Finally
    FItensCobranca.Close;
    FCobranca.Close;
  End;
end;

procedure TfrmCobranca.plGravarCobranca;
Var
  Indice : Byte;
  lslstItensCobranca : TListaItensCobranca;
  ldValorCobranca,
  ldValorCorrigido   : Double;
begin
  FCobranca.Carrega(False);
  FCobranca.Insert;
  FCobranca.CREDOR        := FIECredor.IntegerNumber;
  FCobranca.DEVEDOR       := FIEDevedor.IntegerNumber;
  FCobranca.DATA_CADASTRO := DTDATA_CADASTRO.DateTime;
  FCobranca.SITUACAO      := 0;
  FCobranca.VALOR_DIVIDA  := FFEValor.FloatNumber;
  FCobranca.Post;
  ldValorCobranca := 0.00;
  ldValorCorrigido := 0.00;

  FItensCobranca.Carrega(False);
  For Indice := 0 to lwItensCobranca.TabularView.LinesCount - 1 Do
     Begin
        lslstItensCobranca := TListaItensCobranca(lwItensCobranca.TabularView.Data[Indice]);
        If   (lslstItensCobranca <> Nil)
        And  Not(lslstItensCobranca.Deletar) Then
             Begin
               ldValorCobranca                     := ldValorCobranca + lslstItensCobranca.Valor_Documento;
               ldValorCorrigido                    := ldValorCorrigido + lslstItensCobranca.Valor_Corrigido;
               FItensCobranca.Insert;
               FItensCobranca.COBRANCA             := FCobranca.COBRANCA;
               FItensCobranca.ITEM                 := lslstItensCobranca.Item;
               FItensCobranca.TIPODOCUMENTO        := lslstItensCobranca.TipoDocumento;
               FItensCobranca.NUMERO_DOCUMENTO     := lslstItensCobranca.Numero_Documento;
               FItensCobranca.EMISSAO_DOCUMENTO    := lslstItensCobranca.Emissao_Documento;
               FItensCobranca.VENCIMENTO_DOCUMENTO := lslstItensCobranca.Vencimento_Documento;
               FItensCobranca.VALOR_DOCUMENTO      := lslstItensCobranca.Valor_Documento;
               FItensCobranca.SITUACAO             := 0;
               FItensCobranca.ALINES               := lslstItensCobranca.Alines;
               FItensCobranca.BANCO_DOCUMENTO      := lslstItensCobranca.Banco_Documento;
               FItensCobranca.OBSERVACAO           := lslstItensCobranca.Observacao;
               FItensCobranca.DATA_DIVIDA          := lslstItensCobranca.Data_Divida;
               FItensCobranca.Post;
             End;
     End;

  FCobranca.Edit;
  FCobranca.VALOR_DIVIDA  := ldValorCobranca;
  FCobranca.VALOR_CORRIGIDO := ldValorCorrigido;
  FCobranca.Post;

  ShowMessageFmt('Dados gravados com sucesso! Cobrança : %d',[FCobranca.COBRANCA]);

  plLimparCampos;

end;

procedure TfrmCobranca.plLimaprCamposItems;
begin
  lbEditarItensCobranca          := False;
  pnItem.Caption                 := '';
  dtEmissaoItem.DateTime         := Date;
  dtDataDivida.DateTime          := Date;
  dtDataVencimento.DateTime      := Date;
  FFEValorItem.FloatNumber       := 0.00;
  FIEBanco.IntegerNumber         := 0;
  pnDescBanco.Caption            := '';
  FIETipoDocumento.IntegerNumber := 0;
  pnDescTipo.Caption             := '';
  FIEAlines.IntegerNumber        := 0;
  pnAlines.Caption               := '';
  edNumeroDocumento.Text         := '';
  pnDescAlines.Caption           := '';
  HabilitarControlesItensCobranca(True,True,True);
end;

procedure TfrmCobranca.plLimparListViewItens;
Var
  Indice : Byte;
begin
  For Indice := 0 to lwItensCobranca.TabularView.LinesCount - 1 Do
      TListaItensCobranca(lwItensCobranca.TabularView.Data[Indice]).Free;
  lwItensCobranca.Clear;
end;

procedure TfrmCobranca.btnBuscaCredorClick(Sender: TObject);
begin
  BuscaCredorNome;
end;

procedure TfrmCobranca.btnBuscaAlinesClick(Sender: TObject);
begin
  BuscaAlines;
end;

procedure TfrmCobranca.btnBuscaBancoClick(Sender: TObject);
begin
  BuscaBanco;
end;

procedure TfrmCobranca.btnBuscaTipoDocumentoClick(Sender: TObject);
begin
  BuscaTipoDocumento;
end;

procedure TfrmCobranca.btnAdicionarItemClick(Sender: TObject);
Var
  lbListaItensCobranca : TListaItensCobranca;
begin
  If   lbEditarItensCobranca Then
       lbListaItensCobranca                 := TListaItensCobranca(lwItensCobranca.TabularView.Data[llPosicao])
  Else lbListaItensCobranca                 := TListaItensCobranca.Create;
  lbListaItensCobranca.Alines               := FIEAlines.IntegerNumber;
  lbListaItensCobranca.Banco_Documento      := FIEBanco.IntegerNumber;
  lbListaItensCobranca.Cobranca             := FIECobranca.IntegerNumber;
  lbListaItensCobranca.Data_Divida          := dtDataDivida.DateTime;
  If   Not lbEditarItensCobranca Then
       Begin
         Inc(lyItem);
         lbListaItensCobranca.Item          := lyItem;
       End;
  lbListaItensCobranca.TipoDocumento        := FIETipoDocumento.IntegerNumber;
  lbListaItensCobranca.Numero_Documento     := edNumeroDocumento.Text;
  lbListaItensCobranca.Emissao_Documento    := dtEmissaoItem.DateTime;
  lbListaItensCobranca.Observacao           := '';
  lbListaItensCobranca.Situacao             := 0;
  lbListaItensCobranca.Valor_Documento      := FFEValorItem.FloatNumber;
  lbListaItensCobranca.Vencimento_Documento := dtDataVencimento.DateTime;
  lbListaItensCobranca.DiasEmAtraso  := DaysBetween(Date, lbListaItensCobranca.Vencimento_Documento);
  FSimplesCredor.CODIGO_CREDOR := FIECredor.IntegerNumber;
  FSimplesCredor.CarregaSQL;
  If   FSimplesCredor.APLICAR_DADOS_FINANCEIROS Then
       lbListaItensCobranca.Valor_Corrigido := flCorrigirValorByCredor(lbListaItensCobranca.DiasEmAtraso,
                                                                       lbListaItensCobranca.Valor_Documento,
                                                                       FSimplesCredor.PERCENTUAL_ATRASO,
                                                                       FSimplesCredor.MULTA)
  Else lbListaItensCobranca.Valor_Corrigido := flValorCorrigidoByTabDepre(Date,lbListaItensCobranca.Valor_Documento);
  lbListaItensCobranca.Deletar := False;
  plCarregaListViewItensCobranca(lbEditarItensCobranca,lbListaItensCobranca);
  plLimaprCamposItems;
end;

procedure TfrmCobranca.btnGravaClick(Sender: TObject);
begin
  If   FIECobranca.IntegerNumber = 0 Then
       plGravarCobranca
  Else plEditarCobranca;
end;

procedure TfrmCobranca.FormShow(Sender: TObject);
begin
  FIECobranca.SetFocus;
end;

procedure TfrmCobranca.FIEAlinesOnExit(Sender: TObject);
begin
  If   Trim(pnDescAlines.Caption) = '' Then
       Begin
         FSimplesAlines.MOTIVO := FIEAlines.IntegerNumber;
         FSimplesAlines.CarregaSQL;
         pnDescAlines.Caption := FSimplesAlines.TIPO_ALINIAS;
       End;
end;

procedure TfrmCobranca.FIEBancoOnExit(Sender: TObject);
begin
  If   Trim(pnDescBanco.Caption) = '' Then
       Begin
         FSimplesBanco.NUMERO_BANCO := FIEBanco.IntegerNumber;
         FSimplesBanco.CarregaSQL;
         pnDescBanco.Caption := FSimplesBanco.NOME_BANCO;
       End;
end;

procedure TfrmCobranca.FIECredorOnExit(Sender: TObject);
begin
  If   Trim(edNomeCredor.Text) = '' Then
       Begin
         FSimplesCredor.CODIGO_CREDOR := FIECredor.IntegerNumber;
         FSimplesCredor.CarregaSQL;
         edNomeCredor.Text := FSimplesCredor.NOME_CREDOR;
       End;

end;

procedure TfrmCobranca.FIEDevedorOnExit(Sender: TObject);
begin
  If   edNomeDevedor.Text = '' Then
       Begin
         FSimplesDevedor.CODIGO_DEVEDOR := FIEDevedor.IntegerNumber;
         FSimplesDevedor.CarregaSQL;
         edNomeDevedor.Text := FSimplesDevedor.NOME_DEVEDOR;
       End;
end;

procedure TfrmCobranca.FIETipoDocumentoOnExit(Sender: TObject);
begin
  If   Trim(pnDescTipo.Caption) = '' Then
       Begin
         FSimplesTipoDocumento.TIPO_DOCUMENTO := FIETipoDocumento.IntegerNumber;
         FSimplesTipoDocumento.CarregaSQL;
         pnDescTipo.Caption := FSimplesTipoDocumento.SIGLA_DOCUMENTO + ' - ' + FSimplesTipoDocumento.DESCRICAO;
       End;
end;

procedure TfrmCobranca.plDeletarCobranca;
Var
  Li : TListItem;
  lslstItensCobranca : TListaItensCobranca;
  Indice : Byte;
  ldValorCobranca,
  ldValorCorrigido   : Double;
begin
  If   lwItensCobranca.TabularView.LinesCount > 0 Then
       Begin
         Li := lwItensCobranca.Selected;
         If   (Li <> Nil)
         And  (Li.Index < lwItensCobranca.TabularView.LinesCount) Then
            Begin
              If   MessageBox(Self.Handle,'Deseja realmente excluir o item?','Atenção',MB_YESNO+MB_ICONQUESTION) = 6 Then
                   Begin
                     llPosicao := lwItensCobranca.ItemIndex[Li.Index];
                     lslstItensCobranca := TListaItensCobranca(lwItensCobranca.TabularView.Data[llPosicao]);
                     FItensCobranca.Carrega(False);
                     If    FItensCobranca.FindBypk_IdItemCobranca(lslstItensCobranca.IdItemCobranca) Then
                           FItensCobranca.Delete;
                     lwItensCobranca.DeleteEx(Li.Index);
                     lwItensCobranca.Execute;
                     lbEditarItensCobranca := False;
                     llPosicao := -1;
                   End;
            End;
       End;
  ldValorCobranca  := 0.00;
  ldValorCorrigido := 0.00;
  For Indice := 0 to lwItensCobranca.TabularView.LinesCount - 1 Do
     Begin
        lslstItensCobranca := TListaItensCobranca(lwItensCobranca.TabularView.Data[Indice]);
        If   lslstItensCobranca <> Nil Then
             Begin
               ldValorCobranca      := ldValorCobranca + lslstItensCobranca.Valor_Documento;
               ldValorCorrigido     := ldValorCorrigido + lslstItensCobranca.Valor_Corrigido;
             End;
     End;

  FCobranca.Edit;
  FCobranca.VALOR_DIVIDA    := ldValorCobranca;
  FCobranca.VALOR_CORRIGIDO := ldValorCorrigido;
  FCobranca.Post;

  FFEValor.FloatNumber    := ldValorCobranca;
  FFEValorCor.FloatNumber := ldValorCorrigido;

end;

procedure TfrmCobranca.plEditarCobranca;
Var
  Indice : Byte;
  lslstItensCobranca : TListaItensCobranca;
  ldValorCobranca,
  ldValorCorrigido   : Double;
begin
  Try
    FCobranca.Carrega(False);
    If   Not FCobranca.FindBypk_Cobranca(FIECobranca.IntegerNumber) Then
         Raise Exception.Create('Cobrança não encontrada!');
    If   FCobranca.SITUACAO <> 0 Then
         Raise Exception.CreateFmt('Cobrança não pode ser alterada! Motivo : %s',[pnTipoSituacao.Caption]);
    ldValorCobranca := 0.00;
    ldValorCorrigido := 0.00;
    FItensCobranca.Carrega(False);
    For Indice := 0 to lwItensCobranca.TabularView.LinesCount - 1 Do
       Begin
          lslstItensCobranca := TListaItensCobranca(lwItensCobranca.TabularView.Data[Indice]);
          If   lslstItensCobranca <> Nil Then
               Begin
                 If   lslstItensCobranca.Deletar Then
                      Begin
                        If   FItensCobranca.FindBypk_IdItemCobranca(lslstItensCobranca.IdItemCobranca) Then
                             FItensCobranca.Delete;
                      End
                 Else
                      Begin
                        If   Not FItensCobranca.FindBypk_IdItemCobranca(lslstItensCobranca.IdItemCobranca) Then
                             Begin
                                FItensCobranca.Insert;
                                FItensCobranca.ITEM         := lslstItensCobranca.Item;
                                FItensCobranca.COBRANCA     := lslstItensCobranca.Cobranca;
                             End
                        Else FItensCobranca.Edit;
                        FItensCobranca.TIPODOCUMENTO        := lslstItensCobranca.TipoDocumento;
                        FItensCobranca.NUMERO_DOCUMENTO     := lslstItensCobranca.Numero_Documento;
                        FItensCobranca.EMISSAO_DOCUMENTO    := lslstItensCobranca.Emissao_Documento;
                        FItensCobranca.VENCIMENTO_DOCUMENTO := lslstItensCobranca.Vencimento_Documento;
                        FItensCobranca.VALOR_DOCUMENTO      := lslstItensCobranca.Valor_Documento;
                        ldValorCobranca                     := ldValorCobranca + lslstItensCobranca.Valor_Documento;
                        ldValorCorrigido                    := ldValorCorrigido + lslstItensCobranca.Valor_Corrigido;
                        FItensCobranca.SITUACAO             := 0;
                        FItensCobranca.ALINES               := lslstItensCobranca.Alines;
                        FItensCobranca.BANCO_DOCUMENTO      := lslstItensCobranca.Banco_Documento;
                        FItensCobranca.OBSERVACAO           := lslstItensCobranca.Observacao;
                        FItensCobranca.DATA_DIVIDA          := lslstItensCobranca.Data_Divida;
                        FItensCobranca.Post;
                      End;
               End;
       End;

    FCobranca.Edit;
    FCobranca.VALOR_DIVIDA  := ldValorCobranca;
    FCobranca.VALOR_CORRIGIDO := ldValorCorrigido;
    FCobranca.Post;

    ShowMessage('Dados gravados com sucesso!');

    plLimparCampos;

  Except
    On E: Exception Do
       ShowMessage(e.Message);
  End;
end;

procedure TfrmCobranca.btnAlterarItemClick(Sender: TObject);
begin
  If   Trim(pnItem.Caption) = '' Then
       plCarregaItens;
end;

function TfrmCobranca.flCorrigirValorByCredor(DiasEmAtraso : Integer; Valor,
    Percentual_Atraso, Multa : Double): Double;
begin
   Result := Valor + ((Valor * (DiasEmAtraso/100)) * Percentual_Atraso) + (Valor * (Multa/100));
end;

function TfrmCobranca.flValorCorrigidoByTabDepre(cData : TDateTime; cValor :
    Double): Double;
Var
  Multa,
  IndiceDepreAtual,
  ValorCorrigido,
  ValorJuros       : Double;
  TotalMeses       : Integer;
begin
  FSimplesDepre.CarregaSQL;
  FSimplesDepre.Last;
  IndiceDepreAtual := FSimplesDepre.INDICE;
  Multa := cValor * 0.02;
  FSimplesDepre.ANO := YearOf(cData);
  FSimplesDepre.MES := MonthOf(cData);
  FSimplesDepre.CarregaSQL;
  If   Not FSimplesDepre.Eof Then
       Begin
         ValorCorrigido := (cValor + Multa) / FSimplesDepre.INDICE * IndiceDepreAtual;
         TotalMeses     := MonthsBetween(Date,cData)+1;
         ValorJuros     := ValorCorrigido * ((TUniqueParametros.GetParametros.IndiceDEPRE * TotalMeses) / 100);
         Result         := ValorCorrigido + ValorJuros;
       End
  Else Result := 0.00;
end;

procedure TfrmCobranca.btnDeletarItemClick(Sender: TObject);
begin
  plDeletarCobranca;
end;

procedure TfrmCobranca.plAlterarCobranca;
begin
  FSimplesCobranca.COBRANCA := FIECobranca.IntegerNumber;
  FSimplesCobranca.CarregaSQL;

  If   Not FSimplesCobranca.Eof Then
       Begin
          Case FSimplesCobranca.SITUACAO Of
             0 : Begin
                   If   MessageBox(0,'Cobrança aberta, tem certeza que deseja encerra-la?','Alterar Cobrança',MB_YESNO) = 6 Then
                        Begin
                          FCobranca.Carrega(False);
                          FCobranca.FindBypk_Cobranca(FSimplesCobranca.COBRANCA);
                          FCobranca.Edit;
                          FCobranca.SITUACAO := 2;
                          FCobranca.Post;
                          ShowMessage('Dados gravados com sucesso!');
                          plLimparCampos;
                        End;
                 End;
             2 : Begin
                   If   MessageBox(0,'Cobrança encerrada, tem certeza que deseja abrir-la?','Alterar Cobrança',MB_YESNO) = 6 Then
                        Begin
                          FCobranca.Carrega(False);
                          FCobranca.FindBypk_Cobranca(FSimplesCobranca.COBRANCA);
                          FCobranca.Edit;
                          FCobranca.SITUACAO := 0;
                          FCobranca.Post;
                          ShowMessage('Dados gravados com sucesso!');
                          plLimparCampos;
                        End;
                 End;
          End;
       End;
end;

procedure TfrmCobranca.btnAlterarClick(Sender: TObject);
begin
  plAlterarCobranca;
end;

end.

