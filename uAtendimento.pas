unit uAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Mask, dbcgrids, Grids, DBGrids, ComCtrls,
  SmtLstvw, SBLstV0u, NumericEdit,
  ucLayCobrador,
  ucLayDevedor,
  ucLayCobranca,
  ucLayCredor,
  ucLayTipo_Situacao,
  Buttons, ExtCtrls;

type
  TfrmAtendimento = class(TForm)
    pnTop: TPanel;
    lblTop: TLabel;
    pnRodape: TPanel;
    btnSair: TBitBtn;
    pnTela: TPanel;
    gbOpcoes: TGroupBox;
    gbCobrador: TGroupBox;
    pnDescCobrador: TPanel;
    gbCredor: TGroupBox;
    pnCredor: TPanel;
    pnDescCredor: TPanel;
    gbDevedor: TGroupBox;
    pnDevedor: TPanel;
    pnDescDevedor: TPanel;
    pnCobrador: TPanel;
    lblDescCobrador: TLabel;
    lblDescCredor: TLabel;
    lblDescDevedor: TLabel;
    btnCarregar: TBitBtn;
    ckPendentes: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure lvGetPath(var APath: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnProcuraCobrador(Sender : TObject);
    procedure btnProcuraCredor(Sender : TObject);
    procedure btnProcuraDevedor(Sender : TObject);
    procedure ieCobradorOnExit(Sender : TObject);
    procedure ieCredorOnExit(Sender : TObject);
    procedure ieDevedorOnExit(Sender : TObject);
    procedure lvCobrancaDbClick(Sender : TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    FSCobrador : TSimplesCOBRADOR;
    FSCredor   : TSimplesCREDOR;
    FSCobranca : TSimplesCOBRANCA;
    FSDevedor  : TSimplesDEVEDOR;
    FSTipoSituacao : TSimplesTIPO_SITUACAO;

    lvCobrancasAlocadas : TSmartListView;
    ieCredor   : TIntegerEdit;
    ieDevedor  : TIntegerEdit;
    ieCobrador : TIntegerEdit; 

    Receptivo : Boolean;
    procedure plCarregaCabCobrancas;
    procedure plCriaBotoes;
    procedure plFecharTabelas;
    procedure plAbrirTabelas;
    procedure plCarregarCobrancas;
    procedure plProcuraCobrador;
    procedure plProcuraDevedor;
    procedure plProcuraCredor;
    procedure plCarregarChamado;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure AtendimentoLivre;


implementation
Uses
  uAguarde,
  uPesquisa,
  uGetFunctions,
  Parametros,
  uAtende;

{$R *.dfm}

procedure AtendimentoLivre;
var
  frmAtendimento: TfrmAtendimento;
Begin
  frmAtendimento := TfrmAtendimento.Create(Application);
  Try
    frmAtendimento.ShowModal;
  Finally
    FreeAndNil(frmAtendimento);
  End;
End;

procedure TfrmAtendimento.plFecharTabelas;
begin
  FSCobrador.Free;
  FSCredor.Free;
  FSCobranca.Free;
  FSDevedor.Free;
  FSTipoSituacao.Free;
end;

procedure TfrmAtendimento.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  CentralizarForm(Self);
  plCriaBotoes;
  plCarregaCabCobrancas;
end;

procedure TfrmAtendimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtendimento.lvGetPath(var APath: String);
begin
  APath := 'C:\';
end;

procedure TfrmAtendimento.plCarregaCabCobrancas;
begin
  lvCobrancasAlocadas.Clear;
  lvCobrancasAlocadas.TabularView.ClearColumns;
  lvCobrancasAlocadas.TabularView.AddColumn('Cobranca'    , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasAlocadas.TabularView.AddColumn('Credor'      , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasAlocadas.TabularView.AddColumn('Nome Credor' , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasAlocadas.TabularView.AddColumn('Devedor'     , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasAlocadas.TabularView.AddColumn('Nome Devedor', taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasAlocadas.TabularView.AddColumn('Data'        , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvCobrancasAlocadas.TabularView.AddColumn('Valor'       , taRightJustify, otAsc, '###.###.##@,@@', True, smFloat  , nil, ctFloat);
  lvCobrancasAlocadas.TabularView.AddColumn('Cobrador'    , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasAlocadas.TabularView.AddColumn('Situação'    , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasAlocadas.TabularView.AddColumn('Localizado'  , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);

  lvCobrancasAlocadas.AdjustColumnsByName['Cobranca'    ].ColumnType := ctInteger;
  lvCobrancasAlocadas.AdjustColumnsByName['Credor'      ].ColumnType := ctInteger;
  lvCobrancasAlocadas.AdjustColumnsByName['Nome Credor' ].ColumnType := ctString;
  lvCobrancasAlocadas.AdjustColumnsByName['Devedor'     ].ColumnType := ctInteger;
  lvCobrancasAlocadas.AdjustColumnsByName['Nome Devedor'].ColumnType := ctString;
  lvCobrancasAlocadas.AdjustColumnsByName['Data'        ].ColumnType := ctDate;
  lvCobrancasAlocadas.AdjustColumnsByName['Valor'       ].ColumnType := ctFloat;
  lvCobrancasAlocadas.AdjustColumnsByName['Cobrador'    ].ColumnType := ctString;
  lvCobrancasAlocadas.AdjustColumnsByName['Situação'    ].ColumnType := ctString;
  lvCobrancasAlocadas.AdjustColumnsByName['Localizado'  ].ColumnType := ctString;

  lvCobrancasAlocadas.Execute;

end;

procedure TfrmAtendimento.plCriaBotoes;
begin
  lvCobrancasAlocadas := TSmartListView.Create(Self);
  With lvCobrancasAlocadas Do
    Begin
      Align             := alClient;
      Parent            := pnTela;
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
      OnDblClick        := lvCobrancaDbClick;
    End;
  ieCobrador := TIntegerEdit.Create(Self);
  With ieCobrador Do
    Begin
      Parent     := pnCobrador;
      Name       := 'ieCobrador';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := btnProcuraCobrador;
      OnExit     := ieCobradorOnExit;
    End;
  ieCredor := TIntegerEdit.Create(Self);
  With ieCredor Do
    Begin
      Parent     := pnCredor;
      Name       := 'ieCredor';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := btnProcuraCredor;
      OnExit     := ieCredorOnExit;
    End;
  ieDevedor := TIntegerEdit.Create(Self);
  With ieDevedor Do
    Begin
      Parent     := pnDevedor;
      Name       := 'ieDevedor';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := btnProcuraDevedor;
      OnExit     := ieDevedorOnExit;
    End;
end;

procedure TfrmAtendimento.plAbrirTabelas;
begin
  FSCobrador := TSimplesCOBRADOR.Create(Self);
  FSCredor   := TSimplesCREDOR.Create(Self);
  FSCobranca := TSimplesCOBRANCA.Create(Self);
  FSDevedor  := TSimplesDEVEDOR.Create(Self);
  FSTipoSituacao := TSimplesTIPO_SITUACAO.Create(Self);
end;

procedure TfrmAtendimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  plFecharTabelas;
end;

procedure TfrmAtendimento.plCarregarCobrancas;
Var
  Indice : Integer;
begin
  Indice := 0;
  lvCobrancasAlocadas.Clear;
  ShowWait('Aguarde...');
  TitleWait('Atendimento');
  HabilitaCancelamentoWait;

  If   ckPendentes.Checked Then
       FSCobranca.SITUACAO := 0;

  If   ieCobrador.IntegerNumber <> 0 Then
       FSCobranca.COBRADOR := ieCobrador.IntegerNumber;

  If   ieCredor.IntegerNumber <> 0 Then
       FSCobranca.CREDOR := ieCredor.IntegerNumber;

  If   ieDevedor.IntegerNumber <> 0 Then
       FSCobranca.DEVEDOR := ieDevedor.IntegerNumber;
  
  FSCobranca.CarregaSQL;

  While Not(FSCobranca.Eof)
    And Not(CancelouWait) Do
    Begin
      Inc(Indice);
      MensWait('Aguarde...' + IntToStr(Indice) +' de ' + IntToStr(FSCobranca.RecordCount));
      GaugeWait(Round((Indice / FSCobranca.RecordCount) * 100));
      lvCobrancasAlocadas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSCobranca.COBRANCA));
      lvCobrancasAlocadas.AdjustColumnsByName['Credor'].Lines.Add(IntToStr(FSCobranca.CREDOR));
      FSCredor.CODIGO_CREDOR := FSCobranca.CREDOR;
      FSCredor.CarregaSQL;
      lvCobrancasAlocadas.AdjustColumnsByName['Nome Credor'  ].Lines.Add(FSCredor.NOME_CREDOR);
      lvCobrancasAlocadas.AdjustColumnsByName['Devedor'].Lines.Add(IntToStr(FSCobranca.DEVEDOR));
      FSDevedor.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
      FSDevedor.CarregaSQL;
      lvCobrancasAlocadas.AdjustColumnsByName['Nome Devedor' ].Lines.Add(FSDevedor.NOME_DEVEDOR);
      lvCobrancasAlocadas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSCobranca.DATA_CADASTRO));
      lvCobrancasAlocadas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSCobranca.VALOR_DIVIDA));
      If   FSDevedor.EH_LOCALIZADO Then
           lvCobrancasAlocadas.AdjustColumnsByName['Localizado'].Lines.Add('Sim')
      Else lvCobrancasAlocadas.AdjustColumnsByName['Localizado'].Lines.Add('Não'); 
      FSCobrador.IDCOBRADOR := FSCobranca.COBRADOR;
      FSCobrador.CarregaSQL;
      lvCobrancasAlocadas.AdjustColumnsByName['Cobrador'].Lines.Add(FSCobrador.NOME_COBRADOR);
      FSTipoSituacao.TIPO_SITUACAO := FSCobranca.SITUACAO;
      FSTipoSituacao.CarregaSQL;
      lvCobrancasAlocadas.AdjustColumnsByName['Situação'].Lines.Add(FSTipoSituacao.DESCRICAO_SITUACAO);
      FSCobranca.Next;
    End;
  lvCobrancasAlocadas.Execute;
  HideWait;
end;

procedure TfrmAtendimento.plProcuraCobrador;
Var
  FPesquisa : TFrmPesquisa;
begin
  FPesquisa := TFrmPesquisa.Create(Application);
  Try
    FPesquisa.Tabela := 'COBRADOR';
    FPesquisa.DefineCampos(['IDCOBRADOR','NOME_COBRADOR']);
    FPesquisa.CampoCondicao := 'NOME_COBRADOR';
    If   FPesquisa.Execute Then
         Begin
           ieCobrador.IntegerNumber := FPesquisa.Consulta.FieldByName('IDCOBRADOR').AsInteger;
           lblDescCobrador.Caption  := FPesquisa.Consulta.FieldByName('NOME_COBRADOR').AsString;
         End;
  Finally
    FPesquisa.Free;
  End;
end;

procedure TfrmAtendimento.plProcuraCredor;
Var
  FPesquisa : TFrmPesquisa;
begin
  FPesquisa := TFrmPesquisa.Create(Application);
  Try
    FPesquisa.Tabela := 'CREDOR';
    FPesquisa.DefineCampos(['CODIGO_CREDOR','NOME_CREDOR']);
    FPesquisa.CampoCondicao := 'NOME_CREDOR';
    If   FPesquisa.Execute Then
         Begin
           ieCredor.IntegerNumber := FPesquisa.Consulta.FieldByName('CODIGO_CREDOR').AsInteger;
           lblDescCredor.Caption  := FPesquisa.Consulta.FieldByName('NOME_CREDOR').AsString;
         End;
  Finally
    FPesquisa.Free;
  End;
end;

procedure TfrmAtendimento.plProcuraDevedor;
Var
  FPesquisa : TFrmPesquisa;
begin
  FPesquisa := TFrmPesquisa.Create(Application);
  Try
    FPesquisa.Tabela := 'DEVEDOR';
    FPesquisa.DefineCampos(['CODIGO_DEVEDOR','NOME_DEVEDOR']);
    FPesquisa.CampoCondicao := 'NOME_DEVEDOR';
    If   FPesquisa.Execute Then
         Begin
           ieDevedor.IntegerNumber := FPesquisa.Consulta.FieldByName('CODIGO_DEVEDOR').AsInteger;
           lblDescDevedor.Caption  := FPesquisa.Consulta.FieldByName('NOME_DEVEDOR').AsString;
         End;
  Finally
    FPesquisa.Free;
  End;
end;

procedure TfrmAtendimento.btnCarregarClick(Sender: TObject);
begin
  plCarregarCobrancas;
end;

procedure TfrmAtendimento.btnProcuraCobrador(Sender: TObject);
begin
  plProcuraCobrador;
end;

procedure TfrmAtendimento.btnProcuraCredor(Sender: TObject);
begin
  plProcuraCredor;
end;

procedure TfrmAtendimento.btnProcuraDevedor(Sender: TObject);
begin
  plProcuraDevedor;
end;

procedure TfrmAtendimento.ieCobradorOnExit(Sender: TObject);
begin
  FSCobrador.IDCOBRADOR := ieCobrador.IntegerNumber;
  FSCobrador.CarregaSQL;
  lblDescCobrador.Caption := FSCobrador.NOME_COBRADOR;
end;

procedure TfrmAtendimento.ieCredorOnExit(Sender: TObject);
begin
  FSCredor.CODIGO_CREDOR := ieCredor.IntegerNumber;
  FSCredor.CarregaSQL;
  lblDescCredor.Caption := FSCredor.NOME_CREDOR;
end;

procedure TfrmAtendimento.ieDevedorOnExit(Sender: TObject);
begin
  FSDevedor.CODIGO_DEVEDOR := ieDevedor.IntegerNumber;
  FSDevedor.CarregaSQL;
  lblDescDevedor.Caption := FSDevedor.NOME_DEVEDOR;
end;

procedure TfrmAtendimento.plCarregarChamado;
Var
  Li : TListItem;
begin
  If   lvCobrancasAlocadas.TabularView.LinesCount > 0 Then
       Begin
         Li := lvCobrancasAlocadas.Selected;
         If   (Li <> Nil)
         And  (Li.Index <  lvCobrancasAlocadas.TabularView.LinesCount) Then
               Chamado(StrToInt(lvCobrancasAlocadas.AdjustColumnsByName['Cobranca'].Lines[lvCobrancasAlocadas.ItemIndex[Li.Index]]),
                       StrToInt(lvCobrancasAlocadas.AdjustColumnsByName['Devedor'].Lines[lvCobrancasAlocadas.ItemIndex[Li.Index]]));
       End;
end;

procedure TfrmAtendimento.lvCobrancaDbClick(Sender: TObject);
begin
  plCarregarChamado;
end;

procedure TfrmAtendimento.FormShow(Sender: TObject);
begin
  ieCredor.SetFocus;
end;

end.
