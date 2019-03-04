unit uRelChamadosCobrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ADODB, uFreeReport,
  SmtLstvw, SBLstV0u, NumericEdit,
  uclayCobrador, uLayMemChamadosCobrador, uclayChamado, ucLayCredor, uclayDevedor,
  uclayCobranca, ucLayAcionamento, ucLayTelefones,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  OleServer;

Const
  cFileReport = 'Chamados_Cobrador.frf';

type
  TFrmRelChamadosCobrador = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnImprime: TBitBtn;
    btnSair: TBitBtn;
    cbConfigurar: TCheckBox;
    gbOpcoes: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    gbCobrador: TGroupBox;
    gbChamadosCobrador: TGroupBox;
    ListBox1: TListBox;
    btExportaExcel: TBitBtn;
    procedure btnImprimeClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpInicialChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private

    FFreeReport   : TFreeReport;
    FChamado      : TAdoQuery;
    dsChamado     : TDataSource;
    FrChamado     : TfrMyDBDataset;

    FSCobrador    : TSimplesCOBRADOR;
    FSChamado     : TSimplesCHAMADO;
    FSCobranca    : TSimplesCOBRANCA;
    FSCredor      : TSimplesCREDOR;
    FSDevedor     : TSimplesDEVEDOR;
    FSAcionamento : TSimplesACIONAMENTO;
    FSTelefones   : TSimplesTELEFONES;
    FMemChamadosCobrador : TMemChamadosCobrador;

    lvChamadosCobrador : TSmartListView;


    { Private declarations }
    procedure plProcuraCobrador;
    procedure plCarregaCobrador;
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
    procedure plComponentes;
    procedure plCarregaCabListView;
    procedure plCarregarChamados(cCobrador : Integer);
    procedure plCarregaListView;
  public
    { Public declarations }

  end;

  Procedure RelChamadosCobrador;


implementation
Uses
  uAguarde,
  uGetFunctions,
  Parametros,
  uPesquisa;

{$R *.dfm}

Procedure RelChamadosCobrador;
var
  FrmRelChamadosCobrador: TFrmRelChamadosCobrador;
Begin
  FrmRelChamadosCobrador := TFrmRelChamadosCobrador.Create(Application);
  Try
    FrmRelChamadosCobrador.ShowModal;
  Finally
    FrmRelChamadosCobrador.Free;
  End;
End;

procedure TFrmRelChamadosCobrador.btnImprimeClick(Sender: TObject);
begin
  Try
     FFreeReport.plAdicionaVariavel('vCobrador',Trim(ListBox1.Items.Strings[ListBox1.ItemIndex]));
     FFreeReport.plAdicionaVariavel('vDataInicio',DateToStr(dtpInicial.Date));
     FFreeReport.plAdicionaVariavel('vDataFinal',DateToStr(dtpFinal.Date));


     If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + cFileReport)
     And  Not(cbConfigurar.Checked)Then
          Begin
            FFreeReport.Arquivo := TUniqueParametros.GetParametros.DatabaseReport + cFileReport;
            FFreeReport.Visualiza;
          End
     Else
          FFreeReport.Desenhar;

  Except
    On E: Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TFrmRelChamadosCobrador.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelChamadosCobrador.plProcuraCobrador;
Var
  FConsulta : TFrmPesquisa;
begin
end;

procedure TFrmRelChamadosCobrador.FormCreate(Sender: TObject);
begin
  dtpInicial.DateTime := Date;
  dtpFinal.DateTime   := Date;
  cbConfigurar.Enabled := TUniqueParametros.GetParametros.Privilegiado;


  plAbrirTabelas;
  plComponentes;
  plCarregaCobrador;
  plCarregaCabListView;

end;

procedure TFrmRelChamadosCobrador.dtpInicialChange(Sender: TObject);
begin
  dtpFinal.DateTime := dtpInicial.DateTime;
end;

procedure TFrmRelChamadosCobrador.FormDestroy(Sender: TObject);
begin
  plFecharTabelas;
end;

procedure TFrmRelChamadosCobrador.plCarregaCobrador;
begin
   FSCobrador.plOrdenarPor(cobradorInd_Usuario);
   FSCobrador.CarregaSQL;
   While Not FSCobrador.Eof Do
   Begin
     If   FSCobrador.ATIVO Then
          ListBox1.Items.Add(FSCobrador.NOME_COBRADOR);
     FSCobrador.Next;
   End;
end;

procedure TFrmRelChamadosCobrador.plAbrirTabelas;
begin
  FSCobrador    := TSimplesCOBRADOR.Create(Self);
  FSChamado     := TSimplesCHAMADO.Create(Self);
  FSCobranca    := TSimplesCOBRANCA.Create(Self);
  FSCredor      := TSimplesCREDOR.Create(Self);
  FSDevedor     := TSimplesDEVEDOR.Create(Self);
  FSAcionamento := TSimplesACIONAMENTO.Create(Self);
  FSTelefones   := TSimplesTELEFONES.Create(Self);
  FMemChamadosCobrador := TMemChamadosCobrador.Create(Self);

  FFreeReport   := TFreeReport.Create(Self);
  dsChamado     := TDataSource.Create(Self);

  FrChamado      := TfrMyDBDataset.Create(Self);
  FrChamado.Name := 'FrChamado';
  FrChamado.DataSource := dsChamado;

  dsChamado.DataSet := FMemChamadosCobrador;
end;

procedure TFrmRelChamadosCobrador.plFecharTabelas;
begin
  FSCobrador.Free;
  FSChamado.Free;
  FSCobranca.Free;
  FSCredor.Free;
  FSDevedor.Free;
  FSAcionamento.Free;
  FMemChamadosCobrador.Free;
  FreeAndNil(dsChamado);
  FreeAndNil(FChamado);
  FreeAndNil(FrChamado);
  FreeAndNil(FFreeReport);
end;

procedure TFrmRelChamadosCobrador.plComponentes;
begin
  lvChamadosCobrador := TSmartListView.Create(Self);
  With lvChamadosCobrador Do
    Begin
      Align             := alClient;
      Parent            := gbChamadosCobrador;
      Name              := 'lvChamadosCobrador';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
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

procedure TFrmRelChamadosCobrador.plCarregaCabListView;
begin
  lvChamadosCobrador.Clear;
  lvChamadosCobrador.TabularView.ClearColumns;
  lvChamadosCobrador.TabularView.AddColumn('Chamado'     , taRightJustify , otAsc, '', True, smInteger , nil, ctInteger);
  lvChamadosCobrador.TabularView.AddColumn('Nome Credor' , taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);
  lvChamadosCobrador.TabularView.AddColumn('Nome Devedor', taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);
  lvChamadosCobrador.TabularView.AddColumn('Cobranca'    , taRightJustify , otAsc, '', True, SmNotSum  , nil, ctInteger);
  lvChamadosCobrador.TabularView.AddColumn('Valor'       , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat  , nil, ctFloat);
  lvChamadosCobrador.TabularView.AddColumn('Tipo'        , taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);
  lvChamadosCobrador.TabularView.AddColumn('Inicio'      , taCenter       , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvChamadosCobrador.TabularView.AddColumn('Final'       , taCenter       , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvChamadosCobrador.TabularView.AddColumn('Tempo'       , taRightJustify , otAsc, '', True, SmNotSum  , nil, ctInteger);
  lvChamadosCobrador.TabularView.AddColumn('Acionamento' , taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);
  lvChamadosCobrador.TabularView.AddColumn('Telefone'    , taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);

  lvChamadosCobrador.AdjustColumnsByName['Chamado'      ].ColumnType := ctInteger;
  lvChamadosCobrador.AdjustColumnsByName['Nome Credor'  ].ColumnType := ctInteger;
  lvChamadosCobrador.AdjustColumnsByName['Nome Devedor' ].ColumnType := ctString;
  lvChamadosCobrador.AdjustColumnsByName['Cobranca'     ].ColumnType := ctInteger;
  lvChamadosCobrador.AdjustColumnsByName['Valor'        ].ColumnType := ctFloat;
  lvChamadosCobrador.AdjustColumnsByName['Tipo'         ].ColumnType := ctString;
  lvChamadosCobrador.AdjustColumnsByName['Inicio'       ].ColumnType := ctDate;
  lvChamadosCobrador.AdjustColumnsByName['Final'        ].ColumnType := ctDate;
  lvChamadosCobrador.AdjustColumnsByName['Tempo'        ].ColumnType := ctInteger;
  lvChamadosCobrador.AdjustColumnsByName['Acionamento'  ].ColumnType := ctString;
  lvChamadosCobrador.AdjustColumnsByName['Telefone'     ].ColumnType := ctString;

  lvChamadosCobrador.Execute;
end;

procedure TFrmRelChamadosCobrador.ListBox1Click(Sender: TObject);
begin
  If   ListBox1.Selected[ListBox1.ItemIndex] Then
       Begin
         FSCobrador.CarregaSQL;
         While Not FSCobrador.Eof Do
         Begin
           If  Trim(FSCobrador.NOME_COBRADOR) = Trim(ListBox1.Items.Strings[ListBox1.ItemIndex]) Then
               Begin
                 plCarregarChamados(FSCobrador.IDCOBRADOR);
                 Break;
               End;
           FSCobrador.Next;
         End;
       End;
  plCarregaListView;
end;

procedure TFrmRelChamadosCobrador.plCarregarChamados(cCobrador : Integer);
Var
  Ind : Integer;
begin
  Ind := 0;
  FMemChamadosCobrador.EmptyDataSet;
  ShowWait('Aguarde:                                                      ');
  HabilitaCancelamentoWait;
  FSChamado.IDCOBRADOR := cCobrador;
  FSChamado.SITUACAO := 2;
  FSChamado.plBetween('HORA_INICIO_CONFIRMADA',dtpInicial.DateTime,dtpFinal.DateTime+1);
  FSChamado.CarregaSQL;
  While Not FSChamado.Eof
    and Not(CancelouWait) do
    Begin
      Try
        Inc(Ind);
        FSCredor.CODIGO_CREDOR := FSChamado.IDCREDOR;
        FSCredor.CarregaSQL;

        FSDevedor.CODIGO_DEVEDOR := FSChamado.IDDEVEDOR;
        FSDevedor.CarregaSQL;

        FSCobranca.COBRANCA := FSChamado.IDCOBRANCA;
        FSCobranca.CarregaSQL;

        FSAcionamento.IDCHAMADO := FSChamado.IDCHAMADO;
        FSAcionamento.CarregaSQL;

        MensWait('Aguarde...' + IntToStr(Ind) +' de ' + IntToStr(FSChamado.RecordCount));
        GaugeWait(Round((Ind / FSChamado.RecordCount) * 100));


        If   FSAcionamento.Eof Then
             Begin
               FMemChamadosCobrador.Insert;
               FMemChamadosCobrador.IDCHAMADO    := FSChamado.IDCHAMADO;
               FMemChamadosCobrador.NOME_CREDOR  := FSCredor.NOME_CREDOR;
               FMemChamadosCobrador.NOME_DEVEDOR := FSDevedor.NOME_DEVEDOR;
               Case FSChamado.TIPO_CHAMADO of
                 0 : FMemChamadosCobrador.TIPO  := 'PROGRAMADO';
                 1 : FMemChamadosCobrador.TIPO  := 'PROMESSA';
                 2 : FMemChamadosCobrador.TIPO  := 'LIVRE';
               End;
               FMemChamadosCobrador.IDCOBRANCA   := FSCobranca.COBRANCA;
               FMemChamadosCobrador.VALOR_DIVIDA := FSCobranca.VALOR_DIVIDA;
               FMemChamadosCobrador.TEMPO_INICIO := FSChamado.HORA_INICIO_CONFIRMADA;
               FMemChamadosCobrador.TEMPO_FINAL  := FSChamado.HORA_FINAL_CONFIRMADA;
               FMemChamadosCobrador.TEMPO        := 0;
               FMemChamadosCobrador.Post;
             End;

        While Not FSAcionamento.Eof Do
             Begin
               FMemChamadosCobrador.Insert;
               FMemChamadosCobrador.IDCHAMADO    := FSChamado.IDCHAMADO;
               FMemChamadosCobrador.NOME_CREDOR  := FSCredor.NOME_CREDOR;
               FMemChamadosCobrador.NOME_DEVEDOR := FSDevedor.NOME_DEVEDOR;
               Case FSChamado.TIPO_CHAMADO of
                 0 : FMemChamadosCobrador.TIPO  := 'PROGRAMADO';
                 1 : FMemChamadosCobrador.TIPO  := 'PROMESSA';
                 2 : FMemChamadosCobrador.TIPO  := 'LIVRE';
               End;
               FMemChamadosCobrador.IDCOBRANCA   := FSCobranca.COBRANCA;
               FMemChamadosCobrador.VALOR_DIVIDA := FSCobranca.VALOR_DIVIDA;
               FMemChamadosCobrador.TEMPO_INICIO := FSChamado.HORA_INICIO_CONFIRMADA;
               FMemChamadosCobrador.TEMPO_FINAL  := FSChamado.HORA_FINAL_CONFIRMADA;
               FMemChamadosCobrador.TEMPO        := 0;
               FMemChamadosCobrador.HISTORICO    := FSAcionamento.HISTORICO;
               FSTelefones.ITEM_TELEFONE         := FSAcionamento.IDTELEFONE;
               FSTelefones.CarregaSQL;
               FMemChamadosCobrador.TELEFONE     := FSTelefones.NUMERO_TELEFONE;
               FMemChamadosCobrador.Post;
               FSAcionamento.Next;
             End;
      Except
        FMemChamadosCobrador.Cancel;
      End;
      FSChamado.Next;
    End;
  HideWait;
end;

procedure TFrmRelChamadosCobrador.plCarregaListView;
begin
  lvChamadosCobrador.Clear;
  FMemChamadosCobrador.IndexFieldNames := 'INICIO';
  FMemChamadosCobrador.First;
  While Not FMemChamadosCobrador.Eof Do
    Begin
      lvChamadosCobrador.AdjustColumnsByName['Chamado'      ].Lines.Add(IntToStr(FMemChamadosCobrador.IDCHAMADO));
      lvChamadosCobrador.AdjustColumnsByName['Nome Credor'  ].Lines.Add(FMemChamadosCobrador.NOME_CREDOR);
      lvChamadosCobrador.AdjustColumnsByName['Nome Devedor' ].Lines.Add(FMemChamadosCobrador.NOME_DEVEDOR);
      lvChamadosCobrador.AdjustColumnsByName['Cobranca'     ].Lines.Add(IntToStr(FMemChamadosCobrador.IDCOBRANCA));
      lvChamadosCobrador.AdjustColumnsByName['Valor'        ].Lines.Add(FloatToStr(FMemChamadosCobrador.VALOR_DIVIDA));
      lvChamadosCobrador.AdjustColumnsByName['Tipo'         ].Lines.Add(FMemChamadosCobrador.TIPO);
      lvChamadosCobrador.AdjustColumnsByName['Inicio'       ].Lines.Add(DateTimeToStr(FMemChamadosCobrador.TEMPO_INICIO));
      lvChamadosCobrador.AdjustColumnsByName['Final'        ].Lines.Add(DateTimeToStr(FMemChamadosCobrador.TEMPO_FINAL));
      lvChamadosCobrador.AdjustColumnsByName['Tempo'        ].Lines.Add(IntToStr(FMemChamadosCobrador.TEMPO));
      lvChamadosCobrador.AdjustColumnsByName['Acionamento'  ].Lines.Add(FMemChamadosCobrador.HISTORICO);
      lvChamadosCobrador.AdjustColumnsByName['Telefone'     ].Lines.Add(FMemChamadosCobrador.TELEFONE);
      FMemChamadosCobrador.Next;
    End;
  lvChamadosCobrador.Execute;
end;

end.
