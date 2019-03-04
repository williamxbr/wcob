unit uPlanejamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Mask, dbcgrids, Grids, DBGrids, ComCtrls,
  ucLayCobranca, ucLayCobrador, ucLayCredor, ucLayDevedor, ucLayChamado,
  SmtLstvw, SBLstV0u,
  NumericEdit,
  Buttons, ExtCtrls;

type
  TfrmPlanejamento = class(TForm)
    pnTop: TPanel;
    lblTop: TLabel;
    pnRodape: TPanel;
    btnSair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gbCobrancasAlocadas: TGroupBox;
    btnCarregarCobrancas: TBitBtn;
    btnDesalocar: TBitBtn;
    pnOpcoes: TPanel;
    gbOpcoes: TGroupBox;
    lblInicio: TLabel;
    lblFinal: TLabel;
    cbData: TCheckBox;
    dtDataInicial: TDateTimePicker;
    dtDataFinal: TDateTimePicker;
    gbCobranca: TGroupBox;
    pnDesCobranca: TPanel;
    rgSituacao: TRadioGroup;
    pnListaCobradores: TPanel;
    gbConsultaCobCobrador: TGroupBox;
    ListView1: TListView;
    gbCredor: TGroupBox;
    pnCredor: TPanel;
    gbDevedor: TGroupBox;
    pnDevedor: TPanel;
    gbCobrador: TGroupBox;
    pnCobrador: TPanel;
    Splitter1: TSplitter;
    btnAlocacao: TBitBtn;
    gblvCobrancasNaoAlocadas: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDesalocarClick(Sender: TObject);
    procedure cbDataClick(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure FormDestroy(Sender: TObject);
    procedure lvGetPath(var APath: String);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCarregarCobrancasClick(Sender: TObject);
    procedure ieCobradorBtnClick(Sender : TObject);
    procedure ieDevedorBtnClick(Sender : TObject);
    procedure ieCredorBtnClick(Sender : TObject);
    procedure btnAlocacaoClick(Sender: TObject);
  private
    { Private declarations }
    FCOBRANCA                    : TCOBRANCA;
    FCHAMADO                     : TCHAMADO;
    FSimplesCobrador             : TSimplesCOBRADOR;
    FSimplesCredor               : TSimplesCREDOR;
    FSimplesDevedor              : TSimplesDEVEDOR;
    FSimplesCobrancasNaoAlocadas : TSimplesCOBRANCA;
    FSimplesCobrancasAlocadas    : TSimplesCOBRANCA;
    FSimplesChamado              : TSimplesCHAMADO;

    lvCobrancas                  : TSmartListView;
    lvCobrancasAlocadas          : TSmartListView;
    lvCobradores                 : TSmartListView;

    ieDesCobranca                : TIntegerEdit;
    ieCredor                     : TIntegerEdit;
    ieDevedor                    : TIntegerEdit;
    ieCobrador                   : TIntegerEdit;


    procedure AbrirTabelas;
    procedure FecharTabelas;
    function  PesquisarCredor : Integer;
    function  PesquisarCobrador : Integer;
    function  PesquisarDevedor : Integer;
    procedure plCarregarPendentes;
    procedure plCarregarCobrancasAlocadas;
    procedure plCarregarTotalporCobrador;
    procedure plCriaLista;
    procedure plCriaBotoes;
    procedure plCarregaCabCobrancas;
    procedure plCarregaCabCobrancasAlocadas;
    procedure plCarregarCabCobradores;
    procedure plImprimeCobrancaCobrador(Configura : Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure Planejamento;


implementation
Uses
  uAguarde,
  uPesquisa,
  uFreeReport,
  Parametros,
  uGetFunctions;

{$R *.dfm}

procedure Planejamento;
var
  frmPlanejamento: TfrmPlanejamento;
Begin
  frmPlanejamento := TfrmPlanejamento.Create(Application);
  Try
    frmPlanejamento.ShowModal;
  Finally
    FreeAndNil(frmPlanejamento);
  End;
End;

procedure TfrmPlanejamento.AbrirTabelas;
begin
  FCOBRANCA                    := TCOBRANCA.Create(Self);
  FCHAMADO                     := TCHAMADO.Create(Self);
  FSimplesCobrador             := TSimplesCOBRADOR.Create(Self);
  FSimplesCredor               := TSimplesCREDOR.Create(Self);
  FSimplesDevedor              := TSimplesDEVEDOR.Create(Self);
  FSimplesCobrancasAlocadas    := TSimplesCOBRANCA.Create(Self);
  FSimplesCobrancasNaoAlocadas := TSimplesCOBRANCA.Create(Self);
  FSimplesChamado              := TSimplesCHAMADO.Create(Self);
  plCriaBotoes;
  plCarregaCabCobrancas;
  plCarregaCabCobrancasAlocadas;
  plCarregarCabCobradores;
  plCarregarTotalporCobrador;
end;

procedure TfrmPlanejamento.FecharTabelas;
begin
  FCOBRANCA.Free;
  FCHAMADO.Free;
  FSimplesCobrador.Free;
  FSimplesCredor.Free;
  FSimplesDevedor.Free;
  FSimplesCobrancasAlocadas.Free;
  FSimplesCobrancasNaoAlocadas.Free;
  FSimplesChamado.Free;
end;

procedure TfrmPlanejamento.FormCreate(Sender: TObject);
begin
  AbrirTabelas;
  CentralizarForm(Self);
  plCriaLista;
end;

procedure TfrmPlanejamento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanejamento.btnDesalocarClick(Sender: TObject);
Var
  Ind  : Integer;
begin
  If   MessageDlg('Tem certeza que gostaria de desalocar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
       Begin
          Try
            ShowWait('Aguarde.............................................................................');
            TitleWait('Desalocação Cobranca');
            HabilitaCancelamentoWait;
            Ind := 0;
            FCOBRANCA.Carrega(False);
            FCHAMADO.Carrega(False);
            FSimplesCobrancasAlocadas.First;
            While Not(FSimplesCobrancasAlocadas.Eof)
              And Not(CancelouWait) Do
               Begin
                 If   FCOBRANCA.FindBypk_Cobranca(FSimplesCobrancasAlocadas.COBRANCA) Then
                      Begin
                        FCOBRANCA.Edit;
                        FCOBRANCA.COBRADOR := 0;
                        FCOBRANCA.Post;
                        FSimplesChamado.IDCOBRANCA := FSimplesCobrancasAlocadas.COBRANCA;
                        FSimplesChamado.SITUACAO   := 0;
                        FSimplesChamado.TIPO_CHAMADO := 0;
                        FSimplesChamado.CarregaSQL;
                        While Not(FSimplesChamado.Eof) Do
                        Begin
                          If   FCHAMADO.FindBypk_IdChamado(FSimplesChamado.IDCHAMADO) Then
                               FCHAMADO.Delete;
                          FSimplesChamado.Next;     
                        End;
                      End;
                 Inc(Ind);
                 MensWait('Aguarde...' + IntToStr(Ind) +' de ' + IntToStr(FSimplesCobrancasAlocadas.RecordCount));
                 GaugeWait(Round((Ind / FSimplesCobrancasAlocadas.RecordCount) * 100));
                 Application.ProcessMessages;
                 FSimplesCobrancasAlocadas.Next;
               End;
          Except
            On E: Exception Do
               ShowMessage(E.Message);
          End;
          HideWait;
          lvCobrancasAlocadas.Clear;
          plCarregarTotalporCobrador;
       End;
end;

function TfrmPlanejamento.PesquisarCredor : Integer;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'CREDOR';
    FConsulta.DefineCampos(['CODIGO_CREDOR','NOME_CREDOR']);
    FConsulta.CampoCondicao := 'NOME_CREDOR';
    If   FConsulta.Execute Then
         Result := FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmPlanejamento.plCarregarPendentes;
begin
  ShowWait('Aguarde.............................................................................');
  TitleWait('Cobrancas');
  HabilitaCancelamentoWait;

  FSimplesCobrancasNaoAlocadas.COBRADOR := 0;

  If   ieDesCobranca.IntegerNumber > 0 Then
       FSimplesCobrancasNaoAlocadas.COBRANCA := ieDesCobranca.IntegerNumber;

  If   ieCredor.IntegerNumber > 0 Then
       FSimplesCobrancasNaoAlocadas.CREDOR := ieCredor.IntegerNumber;

  If   ieDevedor.IntegerNumber > 0 Then
       FSimplesCobrancasNaoAlocadas.DEVEDOR := ieDevedor.IntegerNumber;

  If   cbData.Checked Then
       FSimplesCobrancasNaoAlocadas.plBetween('DATA_CADASTRO',dtDataInicial.DateTime,dtDataFinal.DateTime);

  FSimplesCobrancasNaoAlocadas.CarregaSQL;
  lvCobrancas.Clear;
  While Not(FSimplesCobrancasNaoAlocadas.Eof)
    And Not(CancelouWait) Do
    Begin
      MensWait('Cobrança : ' + IntToStr(FSimplesCobrancasNaoAlocadas.COBRANCA) + ' de ' + IntToStr(FSimplesCobrancasNaoAlocadas.RecordCount));
      lvCobrancas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSimplesCobrancasNaoAlocadas.COBRANCA));
      FSimplesCredor.CODIGO_CREDOR := FSimplesCobrancasNaoAlocadas.CREDOR;
      FSimplesCredor.CarregaSQL;
      lvCobrancas.AdjustColumnsByName['Credor'  ].Lines.Add(FSimplesCredor.NOME_CREDOR);
      FSimplesDevedor.CODIGO_DEVEDOR := FSimplesCobrancasNaoAlocadas.DEVEDOR;
      FSimplesDevedor.CarregaSQL;
      lvCobrancas.AdjustColumnsByName['Devedor' ].Lines.Add(FSimplesDevedor.NOME_DEVEDOR);
      lvCobrancas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSimplesCobrancasNaoAlocadas.DATA_CADASTRO));
      lvCobrancas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSimplesCobrancasNaoAlocadas.VALOR_DIVIDA));
      FSimplesCobrancasNaoAlocadas.Next;
    End;
  lvCobrancas.Execute;
  HideWait;
end;

procedure TfrmPlanejamento.plCriaLista;
Var
  ListItem : TListItem;
begin
  ListView1.Clear;
  FSimplesCobrador.CarregaSQL;
  FSimplesCobrador.First;
  While Not FSimplesCobrador.Eof Do
     Begin
       If   FSimplesCobrador.ATIVO Then
            Begin
              ListItem := ListView1.Items.Add;
              ListItem.Caption := IntToStr(FSimplesCobrador.IDCOBRADOR);
              ListItem.SubItems.Add(FSimplesCobrador.NOME_COBRADOR);
            End;  
       FSimplesCobrador.Next;
     End;
end;

procedure TfrmPlanejamento.plCarregarCobrancasAlocadas;
begin
  ShowWait('Aguarde.............................................................................');
  TitleWait('Cobrancas Alocadas');
  HabilitaCancelamentoWait;
  Case rgSituacao.ItemIndex of
    0 : FSimplesCobrancasAlocadas.plBetween('SITUACAO',0,1);
    1 : FSimplesCobrancasAlocadas.SITUACAO := 0;
    2 : FSimplesCobrancasAlocadas.SITUACAO := 1;
  End;

  If   ieDesCobranca.IntegerNumber > 0 Then
       FSimplesCobrancasAlocadas.COBRANCA := ieDesCobranca.IntegerNumber
  Else
       Begin

         If   ieCredor.IntegerNumber > 0  Then
              FSimplesCobrancasAlocadas.CREDOR := ieCredor.IntegerNumber;

         If   cbData.Checked Then
              FSimplesCobrancasAlocadas.plBetween('DATA_CADASTRO',dtDataInicial.DateTime,dtDataFinal.DateTime);
       End;

  If   ieCobrador.IntegerNumber > 0 Then
       FSimplesCobrancasAlocadas.COBRADOR := ieCobrador.IntegerNumber
  Else FSimplesCobrancasAlocadas.plBetween('COBRADOR',1,999);

  FSimplesCobrancasAlocadas.CarregaSQL;

  lvCobrancasAlocadas.Clear;
  While Not(FSimplesCobrancasAlocadas.Eof)
    And Not(CancelouWait) Do
    Begin
      MensWait('Cobrança : ' + IntToStr(FSimplesCobrancasAlocadas.COBRANCA));
      lvCobrancasAlocadas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSimplesCobrancasAlocadas.COBRANCA));
      FSimplesCredor.CODIGO_CREDOR := FSimplesCobrancasAlocadas.CREDOR;
      FSimplesCredor.CarregaSQL;
      lvCobrancasAlocadas.AdjustColumnsByName['Credor'  ].Lines.Add(FSimplesCredor.NOME_CREDOR);
      FSimplesDevedor.CODIGO_DEVEDOR := FSimplesCobrancasAlocadas.DEVEDOR;
      FSimplesDevedor.CarregaSQL;
      lvCobrancasAlocadas.AdjustColumnsByName['Devedor' ].Lines.Add(FSimplesDevedor.NOME_DEVEDOR);
      lvCobrancasAlocadas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSimplesCobrancasAlocadas.DATA_CADASTRO));
      lvCobrancasAlocadas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSimplesCobrancasAlocadas.VALOR_DIVIDA));
      FSimplesCobrancasAlocadas.Next;
    End;
  lvCobrancasAlocadas.Execute;
  HideWait;
end;

function TfrmPlanejamento.PesquisarCobrador: Integer;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'COBRADOR';
    FConsulta.DefineCampos(['IDCOBRADOR','NOME_COBRADOR']);
    FConsulta.CampoCondicao := 'NOME_COBRADOR';
    If   FConsulta.Execute Then
         Result := FConsulta.Consulta.FieldByName('IDCOBRADOR').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmPlanejamento.cbDataClick(Sender: TObject);
begin
  dtDataInicial.Enabled := cbData.Checked;
  dtDataFinal.Enabled   := cbData.Checked;
end;

procedure TfrmPlanejamento.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
Var
  Indice : Byte;
begin
  If   Column.Index = 0 Then
       Begin
         For Indice := 0 to ListView1.Items.Count - 1 Do
             ListView1.Items.Item[Indice].Checked := Not ListView1.Items.Item[Indice].Checked;
       End;
end;

function TfrmPlanejamento.PesquisarDevedor: Integer;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['CODIGO_DEVEDOR','NOME_DEVEDOR']);
    FConsulta.CampoCondicao := 'NOME_DEVEDOR';
    If   FConsulta.Execute Then
         Result := FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmPlanejamento.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmPlanejamento.plImprimeCobrancaCobrador(Configura : Boolean);
Var
  FFreeReport : TFreeReport;
begin
  Try
   FFreeReport.Arquivo := TUniqueParametros.GetParametros.DatabaseReport + 'CobrancasCobrador.frf';
   If   Configura Then
        FFreeReport.Desenhar
   Else FFreeReport.Visualiza;
  Finally
   FFreeReport.Free;
  End;
end;

procedure TfrmPlanejamento.plCriaBotoes;
begin
  lvCobrancas := TSmartListView.Create(Self);
  With lvCobrancas Do
    Begin
      Align             := alClient;
      Parent            := gblvCobrancasNaoAlocadas;
      Name              := 'lvCobrancas';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
      OnGetPath         := lvGetPath;
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
  lvCobrancasAlocadas := TSmartListView.Create(Self);
  With lvCobrancasAlocadas Do
    Begin
      Align             := alClient;
      Parent            := gbCobrancasAlocadas;
      Name              := 'lvCobrancasAlocadas';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
      OnGetPath         := lvGetPath;
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
  lvCobradores := TSmartListView.Create(Self);
  With lvCobradores Do
    Begin
      Align             := alClient;
      Parent            := gbConsultaCobCobrador;
      Name              := 'lvCobradores';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
      OnGetPath         := lvGetPath;
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
  ieDesCobranca := TIntegerEdit.Create(Self);
  With ieDesCobranca Do
    Begin
      Parent     := pnDesCobranca;
      Name       := 'ieDesCobranca';
      Align      := alClient;
    End;
  ieCredor       := TIntegerEdit.Create(Self);
  With ieCredor Do
    Begin
      Parent     := pnCredor;
      Name       := 'ieCredor';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := ieCredorBtnClick;
    End;
  ieDevedor       := TIntegerEdit.Create(Self);
  With ieDevedor Do
    Begin
      Parent     := pnDevedor;
      Name       := 'ieDevedor';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := ieDevedorBtnClick;
    End;
  ieCobrador      := TIntegerEdit.Create(Self);
  With ieCobrador Do
    Begin
      Parent     := pnCobrador;
      Name       := 'ieCobrador';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := ieCobradorBtnClick;
    End;
end;

procedure TfrmPlanejamento.lvGetPath(var APath: String);
begin
  APath := 'C:\';
end;

procedure TfrmPlanejamento.plCarregaCabCobrancas;
begin
  lvCobrancas.Clear;
  lvCobrancas.TabularView.ClearColumns;
  lvCobrancas.TabularView.AddColumn('Cobranca', taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancas.TabularView.AddColumn('Credor'  , taLeftJustify, otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancas.TabularView.AddColumn('Devedor' , taLeftJustify, otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancas.TabularView.AddColumn('Data'    , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvCobrancas.TabularView.AddColumn('Valor'   , taRightJustify      , otAsc, '###.##@,@@', True, smFloat  , nil, ctFloat);

  lvCobrancas.AdjustColumnsByName['Cobranca'].ColumnType := ctInteger;
  lvCobrancas.AdjustColumnsByName['Credor'  ].ColumnType := ctString;
  lvCobrancas.AdjustColumnsByName['Devedor' ].ColumnType := ctString;
  lvCobrancas.AdjustColumnsByName['Data'    ].ColumnType := ctDate;
  lvCobrancas.AdjustColumnsByName['Valor'   ].ColumnType := ctFloat;

  lvCobrancas.Execute;

end;

procedure TfrmPlanejamento.plCarregaCabCobrancasAlocadas;
begin
  lvCobrancasAlocadas.Clear;
  lvCobrancasAlocadas.TabularView.ClearColumns;
  lvCobrancasAlocadas.TabularView.AddColumn('Cobranca', taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasAlocadas.TabularView.AddColumn('Credor'  , taLeftJustify, otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasAlocadas.TabularView.AddColumn('Devedor' , taLeftJustify, otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasAlocadas.TabularView.AddColumn('Data'    , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvCobrancasAlocadas.TabularView.AddColumn('Valor'   , taRightJustify      , otAsc, '###.##@,@@', True, smFloat  , nil, ctFloat);

  lvCobrancasAlocadas.AdjustColumnsByName['Cobranca'].ColumnType := ctInteger;
  lvCobrancasAlocadas.AdjustColumnsByName['Credor'  ].ColumnType := ctString;
  lvCobrancasAlocadas.AdjustColumnsByName['Devedor' ].ColumnType := ctString;
  lvCobrancasAlocadas.AdjustColumnsByName['Data'    ].ColumnType := ctDate;
  lvCobrancasAlocadas.AdjustColumnsByName['Valor'   ].ColumnType := ctFloat;

  lvCobrancasAlocadas.Execute;

end;

procedure TfrmPlanejamento.plCarregarCabCobradores;
begin
  lvCobradores.Clear;
  lvCobradores.TabularView.ClearColumns;
  lvCobradores.TabularView.AddColumn('Cobrador'  , taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobradores.TabularView.AddColumn('Cobrancas' , taRightJustify , otAsc, '', True, SmNotSum  , nil, ctInteger);
  lvCobradores.TabularView.AddColumn('Valor'     , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat  , nil, ctFloat);

  lvCobradores.AdjustColumnsByName['Cobrador'  ].ColumnType := ctString;
  lvCobradores.AdjustColumnsByName['Cobrancas' ].ColumnType := ctInteger;
  lvCobradores.AdjustColumnsByName['Valor'     ].ColumnType := ctFloat;

  lvCobradores.Execute;
end;

procedure TfrmPlanejamento.plCarregarTotalporCobrador;
Var
  ldValorTotal : Double;
begin
  lvCobradores.Clear;
  FSimplesCobrador.CarregaSQL;
  FSimplesCobrador.First;
  While Not(FSimplesCobrador.Eof) Do
    Begin
      ldValorTotal := 0.00;
      If   FSimplesCobrador.ATIVO Then
           Begin
             FSimplesCobrancasAlocadas.SITUACAO := 0;
             FSimplesCobrancasAlocadas.COBRADOR := FSimplesCobrador.IDCOBRADOR;
             FSimplesCobrancasAlocadas.CarregaSQL;
             While Not(FSimplesCobrancasAlocadas.Eof) Do
                Begin
                  ldValorTotal := ldValorTotal + FSimplesCobrancasAlocadas.VALOR_DIVIDA;
                  FSimplesCobrancasAlocadas.Next;
                End;
             lvCobradores.AdjustColumnsByName['Cobrador'].Lines.Add(FSimplesCobrador.NOME_COBRADOR);
             lvCobradores.AdjustColumnsByName['Cobrancas'].Lines.Add(IntToStr(FSimplesCobrancasAlocadas.RecordCount));
             lvCobradores.AdjustColumnsByName['Valor'].Lines.Add(FormatFloat('#,##0.00',ldValorTotal));
           End;
      FSimplesCobrador.Next;
    End;
  lvCobradores.Execute;
end;

procedure TfrmPlanejamento.PageControl1Change(Sender: TObject);
begin
  btnAlocacao.Enabled   :=  PageControl1.ActivePage = TabSheet1;
  btnDesalocar.Enabled  :=  PageControl1.ActivePage = TabSheet2;
  gbCobrador.Enabled    :=  PageControl1.ActivePage = TabSheet2;
end;

procedure TfrmPlanejamento.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage  :=  TabSheet1;
  btnAlocacao.Enabled      :=  PageControl1.ActivePage = TabSheet1;
  btnDesalocar.Enabled     :=  PageControl1.ActivePage = TabSheet2;
  gbCobrador.Enabled       :=  PageControl1.ActivePage = TabSheet2;
end;

procedure TfrmPlanejamento.btnCarregarCobrancasClick(Sender: TObject);
begin
  If   PageControl1.ActivePage = TabSheet1 Then
       plCarregarPendentes;

  If   PageControl1.ActivePage = TabSheet2 Then
       Begin
         If   rgSituacao.ItemIndex = -1 Then
              ShowMessage('Favor escolher uma situação!')
         Else plCarregarCobrancasAlocadas;
       End;
end;

procedure TfrmPlanejamento.ieCobradorBtnClick(Sender: TObject);
begin
  ieCobrador.IntegerNumber := PesquisarCobrador;
end;

procedure TfrmPlanejamento.ieCredorBtnClick(Sender: TObject);
begin
  ieCredor.IntegerNumber := PesquisarCredor;
end;

procedure TfrmPlanejamento.ieDevedorBtnClick(Sender: TObject);
begin
  ieDevedor.IntegerNumber := PesquisarDevedor;
end;

procedure TfrmPlanejamento.btnAlocacaoClick(Sender: TObject);
Var
  Ind           : LongInt;
  IndCobrador   : Longint;
  AchouCobrador : Boolean;
begin
  ShowWait('Aguarde.............................................................................');
  TitleWait('Alocação Cobranca');
  HabilitaCancelamentoWait;
  Try
    AchouCobrador := False;
    For Ind := 0 to ListView1.Items.Count - 1 Do
        Begin
          If   ListView1.Items.Item[Ind].Checked Then
               AchouCobrador := True
        End;
    IndCobrador := 0;
    If   Not AchouCobrador Then
         Raise Exception.Create('É necessario marcar no minimo um cobrador!');
    If   ListView1.Items.Item[IndCobrador].Checked = False Then
         Begin
           Repeat
             Inc(IndCobrador);
             If  IndCobrador = ListView1.Items.Count Then
                 IndCobrador := 0;
           Until ListView1.Items.Item[IndCobrador].Checked = True;
         End;
    Ind := 0;

    FCOBRANCA.Carrega(False);
    FSimplesCobrancasNaoAlocadas.First;
    While Not(FSimplesCobrancasNaoAlocadas.Eof)
      And Not(CancelouWait) Do
       Begin
         If   FCOBRANCA.FindBypk_Cobranca(FSimplesCobrancasNaoAlocadas.COBRANCA) Then
              Begin
                FCOBRANCA.Edit;
                FCOBRANCA.COBRADOR := StrToInt(ListView1.Items[IndCobrador].Caption);
                FCOBRANCA.Post;
                Repeat
                  Inc(IndCobrador);
                  If  IndCobrador = ListView1.Items.Count Then
                      IndCobrador := 0;
                Until ListView1.Items.Item[IndCobrador].Checked = True;
              End;
         Inc(Ind);
         MensWait('Aguarde...' + IntToStr(Ind) +' de ' + IntToStr(FSimplesCobrancasNaoAlocadas.RecordCount));
         GaugeWait(Round((Ind / FSimplesCobrancasNaoAlocadas.RecordCount) * 100));
         pnRodape.Repaint;
         Application.ProcessMessages;
         FSimplesCobrancasNaoAlocadas.Next;
       End;
       
  Except
    On E: Exception Do
       Begin
         HideWait;
         ShowMessage(E.Message);
       End;
  End;
  HideWait;
  lvCobrancas.Clear;
  plCarregarTotalporCobrador;
end;

end.
