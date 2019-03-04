unit uPlano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  SmtLstvw, SBLstV0u,
  ucLayCredor, ucLayCobranca, ucLayCobrador, ucLayChamado,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type

  TListaPlano = Class
    CodigoCredor : Integer;
    Credor       : String;
    Cobrancas    : LongInt;
    Dividas      : Double;
    Aberto       : Double;
    Acordo       : Double;
    Encerrado    : Double;
    Programado   : Double;
    Programar    : Double;
    Alocado      : Double;
    NaoAlocado   : Double;
  End;

  TFrmPlano = class(TForm)
    pnTopo: TPanel;
    pnTela: TPanel;
    pnRodape: TPanel;
    pcPlano: TPageControl;
    tabPlano: TTabSheet;
    pnPlano: TPanel;
    bbExecutar: TBitBtn;
    btnSair: TBitBtn;
    pnOpcoesPlano: TPanel;
    pnGerarParcelasTitulo: TPanel;
    gbEntrada: TGroupBox;
    dtinicio: TDateTimePicker;
    gbValorEntrada: TGroupBox;
    pnValorEntrada: TPanel;
    btnSalvarOpcoes: TBitBtn;
    gbPeriodo: TGroupBox;
    pnPeriodo: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dtfinal: TDateTimePicker;
    ckPorData: TCheckBox;
    btnAlocacao: TBitBtn;
    Panel_Cobrador: TPanel;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    LV_Cobrador: TListView;
    Panel3: TPanel;
    btnSairLvCobrador: TBitBtn;
    btnAlocar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEncerrar: TBitBtn;
    btnGerarChamados: TBitBtn;
    btConf: TBitBtn;
    ckSomenteLocalizado: TCheckBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure bbExecutarClick(Sender: TObject);
    procedure btnSairLvCobradorClick(Sender: TObject);
    procedure btnAlocacaoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnAlocarClick(Sender: TObject);
    procedure btnGerarChamadosClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btConfClick(Sender: TObject);
    procedure btnSalvarOpcoesClick(Sender: TObject);
  private

    FSimplesCredor   : TSimplesCREDOR;
    FSimplesCobranca : TSimplesCOBRANCA;
    FSimplesCobrador : TSimplesCOBRADOR;
    FSimplesChamado  : TSimplesCHAMADO;

    FCobranca : TCOBRANCA;
    FChamado  : TCHAMADO;

    lvPlano : TSmartListView;

    procedure plCriaBotoes;
    procedure plCabecalhoPlano;
    procedure plCarregaDados;
    procedure plCarregaCobrancas(cCredor : Integer; var cTotal : Integer; var
        cDivida, cAberto, cAcordo, cEncerrado, cProgramado, cAprogramar, cAlocado, cNaoAlocado : Double);
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
    procedure plCarregarListView(CListaPlano : TListaPlano);
    procedure plCriaLista;
    procedure plAlocarCobrancas;
    function plAchouChamadoProgramado(cCobranca : Integer) : Boolean;
    function plProgramado(cCredor : Integer) : Double;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure plIniciarPlano;


implementation
Uses
  uAguarde;


{$R *.dfm}

procedure plIniciarPlano;
var
  FrmPlano: TFrmPlano;
Begin
  FrmPlano := TFrmPlano.Create(Application);
  Try
    FrmPlano.ShowModal;
  Finally
    FreeAndNil(FrmPlano);
  End;
End;

procedure TFrmPlano.plCriaBotoes;
begin
  lvPlano := TSmartListView.Create(Self);
  With lvPlano Do
    Begin
      Align             := alClient;
      Parent            := pnPlano;
      Name              := 'lvPlano';
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
      Checkboxes        := True;
    End;
end;

procedure TFrmPlano.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  plCriaBotoes;
  plCabecalhoPlano;
  plCriaLista;
end;

procedure TFrmPlano.plCabecalhoPlano;
begin
  lvPlano.Clear;
  lvPlano.TabularView.ClearColumns;
  lvPlano.TabularView.AddColumn('Credor'    , taLeftJustify  , otAsc, '', True, SmNotSum  , nil, ctString);
  lvPlano.TabularView.AddColumn('Cobrancas' , taRightJustify , otAsc, '', True, smInteger  , nil, ctInteger);
  lvPlano.TabularView.AddColumn('Dividas'   , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Aberto'    , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Acordo'    , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Encerrado' , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Programado', taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Programar' , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Alocado'   , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);
  lvPlano.TabularView.AddColumn('Não Alocado' , taRightJustify , otAsc, '###.###.##@,@@', True, smFloat   , nil, ctFloat);


  lvPlano.AdjustColumnsByName['Credor'      ].ColumnType   := ctString;
  lvPlano.AdjustColumnsByName['Cobrancas'   ].ColumnType   := ctInteger;
  lvPlano.AdjustColumnsByName['Dividas'     ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Aberto'      ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Acordo'      ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Encerrado'   ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Programado'  ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Programar'   ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Alocado'     ].ColumnType   := ctFloat;
  lvPlano.AdjustColumnsByName['Não Alocado' ].ColumnType   := ctFloat;

  lvPlano.Execute;

end;

procedure TFrmPlano.plAbrirTabelas;
begin
  FSimplesCredor   := TSimplesCREDOR.Create(Self);
  FSimplesCobranca := TSimplesCOBRANCA.Create(Self);
  FSimplesCobrador := TSimplesCOBRADOR.Create(Self);
  FSimplesChamado  := TSimplesCHAMADO.Create(Self);

  FCobranca := TCOBRANCA.Create(Self);
  FChamado  := TCHAMADO.Create(Self);
end;

procedure TFrmPlano.plFecharTabelas;
begin
  FSimplesCredor.Free;
  FSimplesCobranca.Free;
  FSimplesCobrador.Free;
  FSimplesChamado.Free;

  FCobranca.Free;
  FChamado.Free;
end;

procedure TFrmPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  plFecharTabelas;
end;

procedure TFrmPlano.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPlano.plCarregaDados;
Var
  llTotal : Integer;
  ldDivida,
  ldAberto,
  ldAcordo,
  ldEncerrado,
  ldProgramado,
  ldAprogramar,
  ldAlocado,
  ldNaoAlocado : Double;
  FListaPlano : TListaPlano;
  Indice      : Integer;
begin
  Indice := 0;
  ShowWait('Aguarde:');
  HabilitaCancelamentoWait;
  lvPlano.Clear;
  FSimplesCredor.plOrdenarPor(credorInd_Nome_Credor);
  FSimplesCredor.CarregaSQL;
  FSimplesCredor.First;
  While Not(FSimplesCredor.Eof)
    And Not(CancelouWait) Do
    Begin
      plCarregaCobrancas(FSimplesCredor.CODIGO_CREDOR,llTotal,ldDivida,ldAberto,ldAcordo,ldEncerrado,ldProgramado,ldAprogramar,ldAlocado,ldNaoAlocado);

      MensWait('Aguarde: '+ FSimplesCredor.NOME_CREDOR);
      FListaPlano              := TListaPlano.Create;
      FListaPlano.CodigoCredor := FSimplesCredor.CODIGO_CREDOR;
      FListaPlano.Credor       := FSimplesCredor.NOME_CREDOR;
      FListaPlano.Cobrancas    := llTotal;
      FListaPlano.Dividas      := ldDivida;
      FListaPlano.Aberto       := ldAberto;
      FListaPlano.Acordo       := ldAcordo;
      FListaPlano.Encerrado    := ldEncerrado;
      FListaPlano.Programado   := plProgramado(FSimplesCredor.CODIGO_CREDOR);
      FListaPlano.Programar    := ldAberto+ldAcordo-FListaPlano.Programado;
      FListaPlano.Alocado      := ldAlocado;
      FListaPlano.NaoAlocado   := ldNaoAlocado;

      plCarregarListView(FListaPlano);
      Inc(Indice);
      GaugeWait(Round((Indice / FSimplesCredor.RecordCount) * 100));

      FSimplesCredor.Next;
    End;
  lvPlano.Execute;
  HideWait;
end;

procedure TFrmPlano.bbExecutarClick(Sender: TObject);
begin
  plCarregaDados;
end;

procedure TFrmPlano.plCarregaCobrancas(cCredor : Integer; var cTotal : Integer;
    var cDivida, cAberto, cAcordo, cEncerrado, cProgramado, cAprogramar, cAlocado, cNaoAlocado :
    Double);
begin
  cTotal      := 0;
  cDivida     := 0.00;
  cAberto     := 0.00;
  cAcordo     := 0.00;
  cEncerrado  := 0.00;
  cProgramado := 0.00;
  cAprogramar := 0.00;
  cAlocado    := 0.00;
  cNaoAlocado := 0.00;

  FSimplesCobranca.CREDOR := cCredor;
  FSimplesCobranca.CarregaSQL;
  While Not(FSimplesCobranca.Eof) Do
    Begin
      cDivida := cDivida + FSimplesCobranca.VALOR_DIVIDA;
      Case FSimplesCobranca.SITUACAO of
        0 : Begin
              cAberto := cAberto + FSimplesCobranca.VALOR_DIVIDA;
//              If   Not plAchouChamadoProgramado(FSimplesCobranca.COBRANCA) Then
//                   cAprogramar := cAprogramar + FSimplesCobranca.VALOR_DIVIDA
//              Else cProgramado := cProgramado + FSimplesCobranca.VALOR_DIVIDA;
              If   FSimplesCobranca.COBRADOR = 0 Then
                   cNaoAlocado := cNaoAlocado + FSimplesCobranca.VALOR_DIVIDA
              Else cAlocado    := cAlocado + FSimplesCobranca.VALOR_DIVIDA;
            End;
        1 : Begin
              cAcordo := cAcordo + FSimplesCobranca.VALOR_DIVIDA;
//              If   Not plAchouChamadoProgramado(FSimplesCobranca.COBRANCA) Then
//                   cAprogramar := cAprogramar + FSimplesCobranca.VALOR_DIVIDA
//              Else cProgramado := cProgramado + FSimplesCobranca.VALOR_DIVIDA;
              If   FSimplesCobranca.COBRADOR = 0 Then
                   cNaoAlocado := cNaoAlocado + FSimplesCobranca.VALOR_DIVIDA
              Else cAlocado    := cAlocado + FSimplesCobranca.VALOR_DIVIDA;
            End;
      Else
        cEncerrado := cEncerrado + FSimplesCobranca.VALOR_DIVIDA;
      End;
      FSimplesCobranca.Next;
    End;
  cTotal := FSimplesCobranca.RecordCount;
end;

procedure TFrmPlano.plCarregarListView(CListaPlano : TListaPlano);
begin
  lvPlano.AdjustColumnsByName['Credor'     ].Lines.Add(CListaPlano.Credor);
  lvPlano.AdjustColumnsByName['Cobrancas'  ].Lines.Add(IntToStr(CListaPlano.Cobrancas));
  lvPlano.AdjustColumnsByName['Dividas'    ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Dividas));
  lvPlano.AdjustColumnsByName['Aberto'     ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Aberto));
  lvPlano.AdjustColumnsByName['Acordo'     ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Acordo));
  lvPlano.AdjustColumnsByName['Encerrado'  ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Encerrado));
  lvPlano.AdjustColumnsByName['Programado' ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Programado));
  lvPlano.AdjustColumnsByName['Programar'  ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Programar));
  lvPlano.AdjustColumnsByName['Alocado'    ].Lines.Add(FormatFloat('#,##0.00',CListaPlano.Alocado));
  lvPlano.AdjustColumnsByName['Não Alocado'].Lines.Add(FormatFloat('#,##0.00',CListaPlano.NaoAlocado));
  lvPlano.TabularView.Data[lvPlano.TabularView.LinesCount-1] := CListaPlano;
end;

procedure TFrmPlano.btnSairLvCobradorClick(Sender: TObject);
begin
  Panel_Cobrador.Visible := False;
end;

procedure TFrmPlano.btnAlocacaoClick(Sender: TObject);
begin
  Panel_Cobrador.Visible := True;
end;

procedure TFrmPlano.plCriaLista;
Var
  ListItem : TListItem;
begin
  LV_Cobrador.Clear;
  FSimplesCobrador.CarregaSQL;
  FSimplesCobrador.First;
  While Not FSimplesCobrador.Eof Do
     Begin
       If   FSimplesCobrador.ATIVO Then
            Begin
              ListItem := LV_Cobrador.Items.Add;
              ListItem.Caption := IntToStr(FSimplesCobrador.IDCOBRADOR);
              ListItem.SubItems.Add(FSimplesCobrador.NOME_COBRADOR);
            End;  
       FSimplesCobrador.Next;
     End;
end;

procedure TFrmPlano.SpeedButton2Click(Sender: TObject);
begin
  Panel_Cobrador.Visible := False;
end;

procedure TFrmPlano.plAlocarCobrancas;
Var
  Ind           : LongInt;
  IndCobrador   : Longint;
  IndPlano      : LongInt;
  AchouCobrador : Boolean;
  FListaPlano   : TListaPlano;
begin
  ShowWait('Aguarde.............................................................................');
  TitleWait('Alocação Cobranca');
  HabilitaCancelamentoWait;
  Try
    For IndPlano := 0 to lvPlano.TabularView.LinesCount - 1 Do
        If   lvPlano.Items.Item[IndPlano].Checked Then
             Begin
               FListaPlano := TListaPlano(lvPlano.TabularView.Data[IndPlano]);
               AchouCobrador := False;
               For Ind := 0 to LV_Cobrador.Items.Count - 1 Do
                   If   LV_Cobrador.Items.Item[Ind].Checked Then
                        AchouCobrador := True;
               Ind := 0;
               IndCobrador := 0;
               If   Not AchouCobrador Then
                    Raise Exception.Create('É necessario marcar no minimo um cobrador!');
               If   LV_Cobrador.Items.Item[IndCobrador].Checked = False Then
                    Begin
                      Repeat
                        Inc(IndCobrador);
                        If  IndCobrador = LV_Cobrador.Items.Count Then
                            IndCobrador := 0;
                      Until LV_Cobrador.Items.Item[IndCobrador].Checked = True;
                    End;
             FCOBRANCA.Carrega(False);
             FSimplesCobranca.plBetween('SITUACAO',0,1);
             FSimplesCobranca.CREDOR   := FListaPlano.CodigoCredor;
             FSimplesCobranca.COBRADOR := 0;
             FSimplesCobranca.CarregaSQL;
             While Not(FSimplesCobranca.Eof)
               And Not(CancelouWait) Do
                Begin
                  If   FCOBRANCA.FindBypk_Cobranca(FSimplesCobranca.COBRANCA) Then
                       Begin
                         FCOBRANCA.Edit;
                         FCOBRANCA.COBRADOR := StrToInt(LV_Cobrador.Items[IndCobrador].Caption);
                         FCOBRANCA.Post;
                         Repeat
                           Inc(IndCobrador);
                           If  IndCobrador = LV_Cobrador.Items.Count Then
                               IndCobrador := 0;
                         Until LV_Cobrador.Items.Item[IndCobrador].Checked = True;
                       End;
                  Inc(Ind);
                  MensWait('Aguarde...' + IntToStr(Ind) +' de ' + IntToStr(FSimplesCobranca.RecordCount));
                  GaugeWait(Round((Ind / FSimplesCobranca.RecordCount) * 100));
                  FSimplesCobranca.Next;
                End;
             End;
  Except
    On E: Exception Do
       Begin
         HideWait;
         ShowMessage(E.Message);
       End;
  End;
  HideWait;
end;

procedure TFrmPlano.btnAlocarClick(Sender: TObject);
begin
 plAlocarCobrancas;
end;

procedure TFrmPlano.btnGerarChamadosClick(Sender: TObject);
Var
  Ind           : LongInt;
  IndPlano      : LongInt;
  FListaPlano   : TListaPlano;
begin
  if   MessageDlg('Gerar chamados das cobranças?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
         Ind := 0;
         FChamado.Carrega(False);
         ShowWait('Aguarde.............................................................................');
         TitleWait('Programando Cobrancas - Gerando Chamados');
         HabilitaCancelamentoWait;
         Try
           For IndPlano := 0 to lvPlano.TabularView.LinesCount - 1 Do
               If   lvPlano.Items.Item[IndPlano].Checked Then
                    Begin
                      FListaPlano := TListaPlano(lvPlano.TabularView.Data[IndPlano]);
                      FSimplesCobranca.CREDOR   := FListaPlano.CodigoCredor;
                      FSimplesCobranca.plBetween('SITUACAO',0,1);
                      FSimplesCobranca.CarregaSQL;
                      While Not(FSimplesCobranca.Eof)
                        And Not(CancelouWait) Do
                          Begin
                            If   FSimplesCobranca.COBRADOR > 0 Then
                              Begin
                                FChamado.Insert;
                                FChamado.IDCOBRADOR             := FSimplesCobranca.COBRADOR;
                                FChamado.IDCREDOR               := FSimplesCobranca.CREDOR;
                                FChamado.IDDEVEDOR              := FSimplesCobranca.DEVEDOR;
                                FChamado.IDCOBRANCA             := FSimplesCobranca.COBRANCA;
                                FChamado.IDACORDO               := 0;
                                FChamado.SITUACAO               := 0;
                                FChamado.TIPO_CHAMADO           := 0;
                                FChamado.Post;
                              End;
                            Inc(Ind);
                            MensWait('Aguarde...' + IntToStr(Ind) +' de ' + IntToStr(FSimplesCobranca.RecordCount));
                            GaugeWait(Round((Ind / FSimplesCobranca.RecordCount) * 100));
                            FSimplesCobranca.Next;
                          End;
                    End;
         Except
           On E: Exception Do
              Begin
                HideWait;
                ShowMessage(E.Message);
              End;
         End;
         HideWait;
      end;
end;

function TFrmPlano.plAchouChamadoProgramado(cCobranca: Integer): Boolean;
begin
  Result := False;
  FSimplesChamado.IDCHAMADO := cCobranca;
  FSimplesChamado.SITUACAO  := 0;
  FSimplesChamado.CarregaSQL;
  Result := Not FSimplesChamado.Eof;
  If   FSimplesChamado.Eof Then
     Begin
       FSimplesChamado.IDCHAMADO := cCobranca;
       FSimplesChamado.SITUACAO  := 1;
       FSimplesChamado.CarregaSQL;
       Result := Not FSimplesChamado.Eof;
     End;
end;

procedure TFrmPlano.btnCancelarClick(Sender: TObject);
Var
  Ind           : LongInt;
  IndPlano      : LongInt;
  FListaPlano   : TListaPlano;
begin
  if   MessageDlg('Deseja excluir os chamados dos itens selecionados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
         FChamado.Carrega(False);
         ShowWait('Aguarde.............................................................................');
         TitleWait('Aguarde...: Deletando Chamados');
         HabilitaCancelamentoWait;
         Try
           For IndPlano := 0 to lvPlano.TabularView.LinesCount - 1 Do
               If   lvPlano.Items.Item[IndPlano].Checked Then
                    Begin
                      Ind := 0;
                      FListaPlano := TListaPlano(lvPlano.TabularView.Data[IndPlano]);
                      FSimplesCobranca.CREDOR   := FListaPlano.CodigoCredor;
                      FSimplesCobranca.plBetween('SITUACAO',0,1);
                      FSimplesCobranca.CarregaSQL;
                      While Not(FSimplesCobranca.Eof)
                        And Not(CancelouWait) Do
                          Begin
                            If   FSimplesCobranca.COBRADOR > 0 Then
                              Begin
                                FSimplesChamado.IDCOBRANCA := FSimplesCobranca.COBRANCA;
                                FSimplesChamado.SITUACAO   := 0;
                                FSimplesChamado.CarregaSQL;
                                While Not FSimplesChamado.Eof Do
                                Begin
                                  FChamado.FindBypk_IdChamado(FSimplesChamado.IDCHAMADO);
                                  FChamado.Delete;
                                  FSimplesChamado.Next;
                                End;
                              End;
                            Inc(Ind);
                            MensWait('Aguarde...' + FSimplesCredor.NOME_CREDOR + ' ' + IntToStr(Ind) +' de ' + IntToStr(FSimplesCobranca.RecordCount));
                            GaugeWait(Round((Ind / FSimplesCobranca.RecordCount) * 100));
                            FSimplesCobranca.Next;
                          End;
                    End;
         Except
           On E: Exception Do
              Begin
                HideWait;
                ShowMessage(E.Message);
              End;
         End;
         HideWait;
       End;
end;

function TFrmPlano.plProgramado(cCredor: Integer): Double;
begin
  Result := 0;
  FSimplesChamado.IDCREDOR := cCredor;
  FSimplesChamado.SITUACAO := 0;
  FSimplesChamado.CarregaSQL;
  While Not FSimplesChamado.Eof Do
  Begin
     FSimplesCobranca.COBRANCA := FSimplesChamado.IDCOBRANCA;
     FSimplesCobranca.CarregaSQL;
     Result := Result + FSimplesCobranca.VALOR_DIVIDA;
     FSimplesChamado.Next;
  End;
end;

procedure TFrmPlano.btConfClick(Sender: TObject);
begin
  pnOpcoesPlano.Visible := True;
end;

procedure TFrmPlano.btnSalvarOpcoesClick(Sender: TObject);
begin
  pnOpcoesPlano.Visible := False;
end;

end.
