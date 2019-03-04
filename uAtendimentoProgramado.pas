unit uAtendimentoProgramado;

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
  ucLayChamado,
  Buttons, ExtCtrls;

type
  TFrmAtendimentoProgramado = class(TForm)
    pnTop: TPanel;
    lblTop: TLabel;
    pnRodape: TPanel;
    btnSair: TBitBtn;
    pnTela: TPanel;
    btnChamado: TBitBtn;
    pnPromessas: TPanel;
    Splitter1: TSplitter;
    gbPromessas: TGroupBox;
    btnPromessas: TBitBtn;
    ttAvisaPromessa: TTimer;
    lblAtencao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure lvGetPath(var APath: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnChamadoClick(Sender: TObject);
    procedure ttAvisaPromessaTimer(Sender: TObject);
    procedure btnPromessasClick(Sender: TObject);
  private
    { Private declarations }

    FSCobrador     : TSimplesCOBRADOR;
    FSCredor       : TSimplesCREDOR;
    FSCobranca     : TSimplesCOBRANCA;
    FSDevedor      : TSimplesDEVEDOR;
    FSTipoSituacao : TSimplesTIPO_SITUACAO;
    FSChamado      : TSimplesCHAMADO;

    lvCobrancasProgramadas : TSmartListView;
    lvCobrancasPromessas   : TSmartListView;

    procedure plCarregaCabCobrancas;
    procedure plCarregaCabCobrancasPromessas;
    procedure plCriaBotoes;
    procedure plFecharTabelas;
    procedure plAbrirTabelas;
    procedure plCarregarCobrancas;
    procedure plCarregarPromessas;
    procedure plCarregarChamado;
    procedure plAbrirPromessa;
    procedure plVerificarPromessas;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure AtendimentoSequencial;

implementation
Uses
  uAguarde,
  uPesquisa,
  uGetFunctions,
  Parametros,
  uAtende;

{$R *.dfm}

procedure AtendimentoSequencial;
var
  FrmAtendimentoProgramado: TFrmAtendimentoProgramado;
Begin
  FrmAtendimentoProgramado := TFrmAtendimentoProgramado.Create(Application);
  Try
    FrmAtendimentoProgramado.ShowModal;
  Finally
    FreeAndNil(FrmAtendimentoProgramado);
  End;
End;

procedure TFrmAtendimentoProgramado.plFecharTabelas;
begin
  FSCobrador.Free;
  FSCredor.Free;
  FSCobranca.Free;
  FSDevedor.Free;
  FSTipoSituacao.Free;
  FSChamado.Free;
end;

procedure TFrmAtendimentoProgramado.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  CentralizarForm(Self);
  plCriaBotoes;
  plCarregaCabCobrancas;
  plCarregarCobrancas;
  plCarregaCabCobrancasPromessas;
  plCarregarPromessas;
  plVerificarPromessas;
end;

procedure TFrmAtendimentoProgramado.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtendimentoProgramado.lvGetPath(var APath: String);
begin
  APath := 'C:\';
end;

procedure TFrmAtendimentoProgramado.plCarregaCabCobrancas;
begin
  lvCobrancasProgramadas.Clear;
  lvCobrancasProgramadas.TabularView.ClearColumns;
  lvCobrancasProgramadas.TabularView.AddColumn('Chamado'    , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasProgramadas.TabularView.AddColumn('Cobranca'    , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasProgramadas.TabularView.AddColumn('Credor'      , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasProgramadas.TabularView.AddColumn('Nome Credor' , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasProgramadas.TabularView.AddColumn('Devedor'     , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasProgramadas.TabularView.AddColumn('Nome Devedor', taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasProgramadas.TabularView.AddColumn('Data'        , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvCobrancasProgramadas.TabularView.AddColumn('Valor'       , taRightJustify, otAsc, '###.###.##@,@@', True, smFloat  , nil, ctFloat);
  lvCobrancasProgramadas.TabularView.AddColumn('Cobrador'    , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasProgramadas.TabularView.AddColumn('Situação'    , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasProgramadas.TabularView.AddColumn('Localizado'  , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);

  lvCobrancasProgramadas.AdjustColumnsByName['Chamado'     ].ColumnType := ctInteger;
  lvCobrancasProgramadas.AdjustColumnsByName['Cobranca'    ].ColumnType := ctInteger;
  lvCobrancasProgramadas.AdjustColumnsByName['Credor'      ].ColumnType := ctInteger;
  lvCobrancasProgramadas.AdjustColumnsByName['Nome Credor' ].ColumnType := ctString;
  lvCobrancasProgramadas.AdjustColumnsByName['Devedor'     ].ColumnType := ctInteger;
  lvCobrancasProgramadas.AdjustColumnsByName['Nome Devedor'].ColumnType := ctString;
  lvCobrancasProgramadas.AdjustColumnsByName['Data'        ].ColumnType := ctDate;
  lvCobrancasProgramadas.AdjustColumnsByName['Valor'       ].ColumnType := ctFloat;
  lvCobrancasProgramadas.AdjustColumnsByName['Cobrador'    ].ColumnType := ctString;
  lvCobrancasProgramadas.AdjustColumnsByName['Situação'    ].ColumnType := ctString;
  lvCobrancasProgramadas.AdjustColumnsByName['Localizado'  ].ColumnType := ctString;

  lvCobrancasProgramadas.Execute;

end;

procedure TFrmAtendimentoProgramado.plCriaBotoes;
begin
  lvCobrancasProgramadas := TSmartListView.Create(Self);
  With lvCobrancasProgramadas Do
    Begin
      Align             := alClient;
      Parent            := pnTela;
      Name              := 'lvCobrancasProgramadas';
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
  lvCobrancasPromessas := TSmartListView.Create(Self);
  With lvCobrancasPromessas Do
    Begin
      Align             := alClient;
      Parent            := gbPromessas;
      Name              := 'lvCobrancasPromessas';
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
end;

procedure TFrmAtendimentoProgramado.plAbrirTabelas;
begin
  FSCobrador     := TSimplesCOBRADOR.Create(Self);
  FSCredor       := TSimplesCREDOR.Create(Self);
  FSCobranca     := TSimplesCOBRANCA.Create(Self);
  FSDevedor      := TSimplesDEVEDOR.Create(Self);
  FSTipoSituacao := TSimplesTIPO_SITUACAO.Create(Self);
  FSChamado      := TSimplesCHAMADO.Create(Self);
end;

procedure TFrmAtendimentoProgramado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  plFecharTabelas;
end;

procedure TFrmAtendimentoProgramado.plCarregarCobrancas;
Var
  Indice : Integer;
begin
  lvCobrancasProgramadas.Clear;
  ShowWait('Aguarde: Carregando Cobranças....................................................');
  TitleWait('Atendimento Programado');
  HabilitaCancelamentoWait;

  Indice := 0;
  FSChamado.IDCOBRADOR   := TUniqueParametros.GetParametros.IDCobrador;
  FSChamado.SITUACAO     := 1;
  FSChamado.TIPO_CHAMADO := 0;
  FSChamado.CarregaSQL;
  While Not(FSChamado.Eof)
    And Not(CancelouWait) Do
    Begin
      FSCobranca.COBRANCA := FSChamado.IDCOBRANCA;
      FSCobranca.CarregaSQL;
      Inc(Indice);
      MensWait('Aguarde: Carregando Cobranças em Aberto...' + IntToStr(Indice) +' de ' + IntToStr(FSChamado.RecordCount));
      GaugeWait(Round((Indice / FSChamado.RecordCount) * 100));
      lvCobrancasProgramadas.AdjustColumnsByName['Chamado'].Lines.Add(IntToStr(FSChamado.IDCHAMADO));
      lvCobrancasProgramadas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSCobranca.COBRANCA));
      lvCobrancasProgramadas.AdjustColumnsByName['Credor'].Lines.Add(IntToStr(FSCobranca.CREDOR));
      FSCredor.CODIGO_CREDOR := FSCobranca.CREDOR;
      FSCredor.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Nome Credor'  ].Lines.Add(FSCredor.NOME_CREDOR);
      lvCobrancasProgramadas.AdjustColumnsByName['Devedor'].Lines.Add(IntToStr(FSCobranca.DEVEDOR));
      FSDevedor.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
      FSDevedor.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Nome Devedor' ].Lines.Add(FSDevedor.NOME_DEVEDOR);
      lvCobrancasProgramadas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSCobranca.DATA_CADASTRO));
      lvCobrancasProgramadas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSCobranca.VALOR_DIVIDA));
      If   FSDevedor.EH_LOCALIZADO Then
           lvCobrancasProgramadas.AdjustColumnsByName['Localizado'].Lines.Add('Sim')
      Else lvCobrancasProgramadas.AdjustColumnsByName['Localizado'].Lines.Add('Não');
      FSCobrador.IDCOBRADOR := FSCobranca.COBRADOR;
      FSCobrador.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Cobrador'].Lines.Add(FSCobrador.NOME_COBRADOR);
      FSTipoSituacao.TIPO_SITUACAO := FSCobranca.SITUACAO;
      FSTipoSituacao.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Situação'].Lines.Add(FSTipoSituacao.DESCRICAO_SITUACAO);
      FSChamado.Next;
    End;

  Indice := 0;  
  FSChamado.IDCOBRADOR   := TUniqueParametros.GetParametros.IDCobrador;
  FSChamado.SITUACAO     := 0;
  FSChamado.TIPO_CHAMADO := 0;
  FSChamado.CarregaSQL;
  While Not(FSChamado.Eof)
    And Not(CancelouWait) Do
    Begin
      FSCobranca.COBRANCA := FSChamado.IDCOBRANCA;
      FSCobranca.CarregaSQL;
      Inc(Indice);
      MensWait('Aguarde: Carregando Cobranças Programado...' + IntToStr(Indice) +' de ' + IntToStr(FSChamado.RecordCount));
      GaugeWait(Round((Indice / FSChamado.RecordCount) * 100));
      lvCobrancasProgramadas.AdjustColumnsByName['Chamado'].Lines.Add(IntToStr(FSChamado.IDCHAMADO));
      lvCobrancasProgramadas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSCobranca.COBRANCA));
      lvCobrancasProgramadas.AdjustColumnsByName['Credor'].Lines.Add(IntToStr(FSCobranca.CREDOR));
      FSCredor.CODIGO_CREDOR := FSCobranca.CREDOR;
      FSCredor.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Nome Credor'  ].Lines.Add(FSCredor.NOME_CREDOR);
      lvCobrancasProgramadas.AdjustColumnsByName['Devedor'].Lines.Add(IntToStr(FSCobranca.DEVEDOR));
      FSDevedor.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
      FSDevedor.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Nome Devedor' ].Lines.Add(FSDevedor.NOME_DEVEDOR);
      lvCobrancasProgramadas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSCobranca.DATA_CADASTRO));
      lvCobrancasProgramadas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSCobranca.VALOR_DIVIDA));
      If   FSDevedor.EH_LOCALIZADO Then
           lvCobrancasProgramadas.AdjustColumnsByName['Localizado'].Lines.Add('Sim')
      Else lvCobrancasProgramadas.AdjustColumnsByName['Localizado'].Lines.Add('Não');
      FSCobrador.IDCOBRADOR := FSCobranca.COBRADOR;
      FSCobrador.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Cobrador'].Lines.Add(FSCobrador.NOME_COBRADOR);
      FSTipoSituacao.TIPO_SITUACAO := FSCobranca.SITUACAO;
      FSTipoSituacao.CarregaSQL;
      lvCobrancasProgramadas.AdjustColumnsByName['Situação'].Lines.Add(FSTipoSituacao.DESCRICAO_SITUACAO);
      If    Indice > 20 Then
            Break;
      FSChamado.Next;
    End;
  lvCobrancasProgramadas.Execute;
  HideWait;
end;

procedure TFrmAtendimentoProgramado.plCarregarChamado;
begin
  If   lvCobrancasProgramadas.TabularView.LinesCount > 0 Then
       ChamadoProgramado(StrToInt(lvCobrancasProgramadas.AdjustColumnsByName['Chamado'].Lines[lvCobrancasProgramadas.ItemIndex[0]]));
end;

procedure TFrmAtendimentoProgramado.btnChamadoClick(Sender: TObject);
begin
  plCarregarChamado;
  plCarregarCobrancas;
  plCarregarPromessas;
end;

procedure TFrmAtendimentoProgramado.plCarregaCabCobrancasPromessas;
begin
  lvCobrancasPromessas.Clear;
  lvCobrancasPromessas.TabularView.ClearColumns;
  lvCobrancasPromessas.TabularView.AddColumn('Chamado'    , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasPromessas.TabularView.AddColumn('Cobranca'    , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasPromessas.TabularView.AddColumn('Credor'      , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasPromessas.TabularView.AddColumn('Nome Credor' , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasPromessas.TabularView.AddColumn('Devedor'     , taRightJustify, otAsc, '', True, smNotSum , nil, ctInteger);
  lvCobrancasPromessas.TabularView.AddColumn('Nome Devedor', taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasPromessas.TabularView.AddColumn('Data'        , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);
  lvCobrancasPromessas.TabularView.AddColumn('Valor'       , taRightJustify, otAsc, '###.###.##@,@@', True, smFloat  , nil, ctFloat);
  lvCobrancasPromessas.TabularView.AddColumn('Cobrador'    , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasPromessas.TabularView.AddColumn('Situação'    , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasPromessas.TabularView.AddColumn('Localizado'  , taLeftJustify , otAsc, '', True, SmNotSum  , nil, ctString);
  lvCobrancasPromessas.TabularView.AddColumn('Programado'  , taCenter      , otAsc, '', True, SmNotSum  , nil, ctDate);


  lvCobrancasPromessas.AdjustColumnsByName['Chamado'     ].ColumnType := ctInteger;
  lvCobrancasPromessas.AdjustColumnsByName['Cobranca'    ].ColumnType := ctInteger;
  lvCobrancasPromessas.AdjustColumnsByName['Credor'      ].ColumnType := ctInteger;
  lvCobrancasPromessas.AdjustColumnsByName['Nome Credor' ].ColumnType := ctString;
  lvCobrancasPromessas.AdjustColumnsByName['Devedor'     ].ColumnType := ctInteger;
  lvCobrancasPromessas.AdjustColumnsByName['Nome Devedor'].ColumnType := ctString;
  lvCobrancasPromessas.AdjustColumnsByName['Data'        ].ColumnType := ctDate;
  lvCobrancasPromessas.AdjustColumnsByName['Valor'       ].ColumnType := ctFloat;
  lvCobrancasPromessas.AdjustColumnsByName['Cobrador'    ].ColumnType := ctString;
  lvCobrancasPromessas.AdjustColumnsByName['Situação'    ].ColumnType := ctString;
  lvCobrancasPromessas.AdjustColumnsByName['Localizado'  ].ColumnType := ctString;
  lvCobrancasPromessas.AdjustColumnsByName['Programado'  ].ColumnType := ctDate;

  lvCobrancasPromessas.Execute;
end;

procedure TFrmAtendimentoProgramado.plCarregarPromessas;
Var
  Indice : Integer;
begin
  lvCobrancasPromessas.Clear;
  ShowWait('Aguarde: Carregando Promessas....................................................');
  TitleWait('Atendimento Programado');
  HabilitaCancelamentoWait;

  Indice := 0;
  FSChamado.IDCOBRADOR   := TUniqueParametros.GetParametros.IDCobrador;
  FSChamado.SITUACAO     := 1;
  FSChamado.TIPO_CHAMADO := 1;
  FSChamado.CarregaSQL;
  While Not(FSChamado.Eof)
    And Not(CancelouWait) Do
    Begin
      FSCobranca.COBRANCA := FSChamado.IDCOBRANCA;
      FSCobranca.CarregaSQL;
      Inc(Indice);
      MensWait('Aguarde: Carregando Promessas.........' + IntToStr(Indice) +' de ' + IntToStr(FSChamado.RecordCount));
      GaugeWait(Round((Indice / FSChamado.RecordCount) * 100));
      lvCobrancasPromessas.AdjustColumnsByName['Chamado'].Lines.Add(IntToStr(FSChamado.IDCHAMADO));
      lvCobrancasPromessas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSCobranca.COBRANCA));
      lvCobrancasPromessas.AdjustColumnsByName['Credor'].Lines.Add(IntToStr(FSCobranca.CREDOR));
      FSCredor.CODIGO_CREDOR := FSCobranca.CREDOR;
      FSCredor.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Nome Credor'  ].Lines.Add(FSCredor.NOME_CREDOR);
      lvCobrancasPromessas.AdjustColumnsByName['Devedor'].Lines.Add(IntToStr(FSCobranca.DEVEDOR));
      FSDevedor.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
      FSDevedor.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Nome Devedor' ].Lines.Add(FSDevedor.NOME_DEVEDOR);
      lvCobrancasPromessas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSCobranca.DATA_CADASTRO));
      lvCobrancasPromessas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSCobranca.VALOR_DIVIDA));
      If   FSDevedor.EH_LOCALIZADO Then
           lvCobrancasPromessas.AdjustColumnsByName['Localizado'].Lines.Add('Sim')
      Else lvCobrancasPromessas.AdjustColumnsByName['Localizado'].Lines.Add('Não');
      FSCobrador.IDCOBRADOR := FSCobranca.COBRADOR;
      FSCobrador.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Cobrador'].Lines.Add(FSCobrador.NOME_COBRADOR);
      FSTipoSituacao.TIPO_SITUACAO := FSCobranca.SITUACAO;
      FSTipoSituacao.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Situação'].Lines.Add(FSTipoSituacao.DESCRICAO_SITUACAO);
      lvCobrancasPromessas.AdjustColumnsByName['Programado'].Lines.Add(DateTimeToStr(FSChamado.HORA_INICIO_PROGRAMADA));
      If    Indice > 20 Then
            Break;
      FSChamado.Next;
    End;

  Indice := 0;
  FSChamado.IDCOBRADOR   := TUniqueParametros.GetParametros.IDCobrador;
  FSChamado.SITUACAO     := 0;
  FSChamado.TIPO_CHAMADO := 1;
  FSChamado.CarregaSQL;
  While Not(FSChamado.Eof)
    And Not(CancelouWait) Do
    Begin
      FSCobranca.COBRANCA := FSChamado.IDCOBRANCA;
      FSCobranca.CarregaSQL;
      Inc(Indice);
      MensWait('Aguarde: Carregando Promessas.........' + IntToStr(Indice) +' de ' + IntToStr(FSChamado.RecordCount));
      GaugeWait(Round((Indice / FSChamado.RecordCount) * 100));
      lvCobrancasPromessas.AdjustColumnsByName['Chamado'].Lines.Add(IntToStr(FSChamado.IDCHAMADO));
      lvCobrancasPromessas.AdjustColumnsByName['Cobranca'].Lines.Add(IntToStr(FSCobranca.COBRANCA));
      lvCobrancasPromessas.AdjustColumnsByName['Credor'].Lines.Add(IntToStr(FSCobranca.CREDOR));
      FSCredor.CODIGO_CREDOR := FSCobranca.CREDOR;
      FSCredor.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Nome Credor'  ].Lines.Add(FSCredor.NOME_CREDOR);
      lvCobrancasPromessas.AdjustColumnsByName['Devedor'].Lines.Add(IntToStr(FSCobranca.DEVEDOR));
      FSDevedor.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
      FSDevedor.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Nome Devedor' ].Lines.Add(FSDevedor.NOME_DEVEDOR);
      lvCobrancasPromessas.AdjustColumnsByName['Data'    ].Lines.Add(DateToStr(FSCobranca.DATA_CADASTRO));
      lvCobrancasPromessas.AdjustColumnsByName['Valor'   ].Lines.Add(FormatFloat('#,##0.00',FSCobranca.VALOR_DIVIDA));
      If   FSDevedor.EH_LOCALIZADO Then
           lvCobrancasPromessas.AdjustColumnsByName['Localizado'].Lines.Add('Sim')
      Else lvCobrancasPromessas.AdjustColumnsByName['Localizado'].Lines.Add('Não');
      FSCobrador.IDCOBRADOR := FSCobranca.COBRADOR;
      FSCobrador.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Cobrador'].Lines.Add(FSCobrador.NOME_COBRADOR);
      FSTipoSituacao.TIPO_SITUACAO := FSCobranca.SITUACAO;
      FSTipoSituacao.CarregaSQL;
      lvCobrancasPromessas.AdjustColumnsByName['Situação'].Lines.Add(FSTipoSituacao.DESCRICAO_SITUACAO);
      lvCobrancasPromessas.AdjustColumnsByName['Programado'].Lines.Add(DateTimeToStr(FSChamado.HORA_INICIO_PROGRAMADA));
      If    Indice > 20 Then
            Break;
      FSChamado.Next;
    End;

  lvCobrancasPromessas.Execute;
  HideWait;
end;

procedure TFrmAtendimentoProgramado.plAbrirPromessa;
begin
  If   lvCobrancasPromessas.TabularView.LinesCount > 0 Then
       ChamadoProgramado(StrToInt(lvCobrancasPromessas.AdjustColumnsByName['Chamado'].Lines[lvCobrancasPromessas.ItemIndex[0]]));
end;

procedure TFrmAtendimentoProgramado.ttAvisaPromessaTimer(Sender: TObject);
begin
  (*TODO: extracted code
  FSChamado.IDCOBRADOR   := TUniqueParametros.GetParametros.IDCobrador;
  FSChamado.SITUACAO     := 0;
  FSChamado.TIPO_CHAMADO := 1;
  FSChamado.CarregaSQL;
  FSChamado.First;
  If   Not(FSChamado.Eof)
  And  (FSChamado.HORA_INICIO_PROGRAMADA < Now) Then
  Begin
     btnChamado.Enabled := False;
     lblAtencao.Visible := True;
  End
  else
  begin
     btnChamado.Enabled := True;
     lblAtencao.Visible := False;
  end;
  *)
  plVerificarPromessas;
end;

procedure TFrmAtendimentoProgramado.btnPromessasClick(Sender: TObject);
begin
  plAbrirPromessa;
  plCarregarCobrancas;
  plCarregarPromessas;
end;

procedure TFrmAtendimentoProgramado.plVerificarPromessas;
begin
 FSChamado.IDCOBRADOR   := TUniqueParametros.GetParametros.IDCobrador;
 FSChamado.SITUACAO     := 0;
 FSChamado.TIPO_CHAMADO := 1;
 FSChamado.CarregaSQL;
 FSChamado.First;
 If   Not(FSChamado.Eof)
 And  (FSChamado.HORA_INICIO_PROGRAMADA < Now) Then
 Begin
    btnChamado.Enabled := False;
    lblAtencao.Visible := True;
 End
 else
 begin
    btnChamado.Enabled := True;
    lblAtencao.Visible := False;
 end;
end;

end.
