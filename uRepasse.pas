unit uRepasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, OleServer,
  DB, ADODB, ComCtrls, DBCtrls, Mask;

type
  TFrmRepasse = class(TForm)
    pnTop: TPanel;
    pnRodape: TPanel;
    pnConsultaPagamentos: TPanel;
    pnConsultaRepasse: TPanel;
    DBGridConsultaPagamentos: TDBGrid;
    DBGridConsultaRepasse: TDBGrid;
    dsConsulta: TDataSource;
    QU_RECEBIMENTOS: TADOQuery;
    btnSair: TBitBtn;
    btnImprime: TBitBtn;
    btnExportaExcel: TBitBtn;
    gbOpcoesTotaisRepasse: TGroupBox;
    gbOpcoes: TGroupBox;
    QU_REPASSE: TADOQuery;
    dsConsultaRepasse: TDataSource;
    dtInicio: TDateTimePicker;
    dtFinal: TDateTimePicker;
    lblTitulo: TLabel;
    dsRepasse: TDataSource;
    btnRecarrega: TBitBtn;
    cbIntervaloData: TCheckBox;
    cbConfigurar: TCheckBox;
    QU_CONSULTA_REPASSE: TADOQuery;
    dsQueryRepasse: TDataSource;
    cbRepasse: TComboBox;
    btnConfirma: TBitBtn;
    btnExcluir: TBitBtn;
    btnAjustar: TBitBtn;
    gbTotaisPagamentos: TGroupBox;
    btnPosicao_Posterior: TBitBtn;
    rsEscolhaRepasse: TRadioGroup;
    btnPosicao_Anterior: TBitBtn;
    Splitter1: TSplitter;
    btnCancelar: TBitBtn;
    rgDesalocaRepasse: TRadioGroup;
    DBVALOR_REPASSE: TDBEdit;
    Label1: TLabel;
    rgConsulta: TRadioGroup;
    Label3: TLabel;
    edTotal: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRecarregaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPosicao_PosteriorClick(Sender: TObject);
    procedure cbRepasseChange(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnPosicao_AnteriorClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure rgConsultaClick(Sender: TObject);
  private
    procedure AbrirArquivos;
    procedure CentralizarForm;
    { Private declarations }
    procedure ExecutaConsulta;
    procedure FecharArquivos;
    function PegaLetraColuna(IntNumber: Integer): String;
    procedure plImprimir;
    procedure plTotalizar;
    procedure plConsultaRepasse;
    procedure plCarregaCombo;
    procedure AlocarRecebimento;
    procedure DesalocaRecebimento;
    procedure DesabilitaControles;
    procedure HabilitaControles;
    { Private declarations }
  public
    { Public declarations }
  end;


  procedure ChamaRepasse;


implementation
Uses
  uFileReport,
  uPesquisa,
  Parametros,
  uFreeReport,
  uFuncoes,
  uDados, Math;

{$R *.dfm}

procedure ChamaRepasse;
var
  FrmRepasse: TFrmRepasse;
Begin
  Try
    FrmRepasse := TFrmRepasse.Create(Application);
    FrmRepasse.ShowModal;
  Finally
    FreeAndNil(FrmRepasse);
  End;
End;


procedure TFrmRepasse.AbrirArquivos;
begin
end;

procedure TFrmRepasse.CentralizarForm;
var
  r   : TRect;
  osv : TOSVersionInfo;
begin
  osv.dwOSVersionInfoSize := sizeof(osv);
  GetVersionEx(osv);
  if    osv.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
        begin
          SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);
          Left := ((r.right - r.left) - Width) div 2;
          Top := ((r.bottom - r.top) - Height) div 2;
        end
  else  begin
          Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
          Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
        end;
end;

procedure TFrmRepasse.ExecutaConsulta;
Var
  liRepasse : Integer;
begin
  If   Trim(cbRepasse.Text) <> '' Then
       liRepasse := StrToInt(Copy(cbRepasse.Text,1,Pos('-',cbRepasse.Text)-1))
  Else liRepasse := 0;
  If   Dados.TB_REPASSE.Locate('IDREPASSE',liRepasse,[]) Then
       Begin
         QU_RECEBIMENTOS.Parameters.AddParameter.Name := 'CREDOR';
         If   cbIntervaloData.Checked Then
              Begin
                QU_RECEBIMENTOS.Parameters.AddParameter.Name := 'DTINICIAL';
                QU_RECEBIMENTOS.Parameters.AddParameter.Name := 'DTFINAL';
              End;
         QU_RECEBIMENTOS.Close;
         If   rgConsulta.ItemIndex = 0 Then
              Begin
                QU_RECEBIMENTOS.SQL.Clear;
                QU_RECEBIMENTOS.SQL.Add(' SELECT ');
              //  QU_RECEBIMENTOS.SQL.Add('     * ');
                QU_RECEBIMENTOS.SQL.Add('     C.NOME_CREDOR, ');
                QU_RECEBIMENTOS.SQL.Add('     D.NOME_DEVEDOR, ');
                QU_RECEBIMENTOS.SQL.Add('     R.RECEBIMENTO, ');
                QU_RECEBIMENTOS.SQL.Add('     R.ACORDO, ');
                QU_RECEBIMENTOS.SQL.Add('     R.PARCELA, ');
                QU_RECEBIMENTOS.SQL.Add('     R.NUMERO_DOCUMENTO, ');
                QU_RECEBIMENTOS.SQL.Add('     R.VALOR, ');
                QU_RECEBIMENTOS.SQL.Add('     R.VALOR_REPASSE, ');
                QU_RECEBIMENTOS.SQL.Add('     R.DATA_PAGAMENTO ');
                QU_RECEBIMENTOS.SQL.Add(' FROM ');
                QU_RECEBIMENTOS.SQL.Add('     RECEBIMENTO R, ');
                QU_RECEBIMENTOS.SQL.Add('     ACORDO A, ');
                QU_RECEBIMENTOS.SQL.Add('     CREDOR C, ');
                QU_RECEBIMENTOS.SQL.Add('     DEVEDOR D ');
                QU_RECEBIMENTOS.SQL.Add(' WHERE ');
                QU_RECEBIMENTOS.SQL.Add('     R.ACORDO = A.IDACORDO ');
                QU_RECEBIMENTOS.SQL.Add(' AND ');
                QU_RECEBIMENTOS.SQL.Add('     A.CREDOR = C.CODIGO_CREDOR ');
                QU_RECEBIMENTOS.SQL.Add(' AND ');
                QU_RECEBIMENTOS.SQL.Add('     A.DEVEDOR = D.CODIGO_DEVEDOR ');
                QU_RECEBIMENTOS.SQL.Add(' AND ');
                QU_RECEBIMENTOS.SQL.Add('     R.PAGO = TRUE ');
                QU_RECEBIMENTOS.SQL.Add(' AND ');
                QU_RECEBIMENTOS.SQL.Add('     (R.IDREPASSE = 0 OR R.IDREPASSE is Null) ');
                QU_RECEBIMENTOS.SQL.Add(' AND ');
                QU_RECEBIMENTOS.SQL.Add('     R.PAGTO_PRE_DATADO = R.CHEQUE_COMPENSADO ');
                QU_RECEBIMENTOS.SQL.Add(' AND ');
                QU_RECEBIMENTOS.SQL.Add('     A.CREDOR = :CREDOR ');
                If   cbIntervaloData.Checked Then
                     Begin
                       QU_RECEBIMENTOS.SQL.Add(' AND ');
                       QU_RECEBIMENTOS.SQL.Add('    R.DATA_PAGAMENTO BETWEEN :DTINICIAL AND :DTFINAL ');
                     End;
                QU_RECEBIMENTOS.Parameters.ParamByName('CREDOR').Value    := Dados.TB_REPASSEIDCREDOR.Value;
                If   cbIntervaloData.Checked Then
                     Begin
                       QU_RECEBIMENTOS.Parameters.ParamByName('DTINICIAL').Value := dtInicio.DateTime;
                       QU_RECEBIMENTOS.Parameters.ParamByName('DTFINAL').Value   := dtFinal.DateTime;
                     End;
                QU_RECEBIMENTOS.Open;
                HabilitaControles;
                plTotalizar;

                If   Not QU_RECEBIMENTOS.Active Then
                     QU_RECEBIMENTOS.Active := True;

              End
         Else
              Begin
                btnConfirma.Caption     := '&Desconfirmar';
                btnConfirma.Enabled     := True;
                btnImprime.Enabled      := True;
                btnExportaExcel.Enabled := True;
              End;

         QU_REPASSE.Parameters.AddParameter.Name := 'PIDREPASSE';
         QU_REPASSE.Close;
         QU_REPASSE.SQL.Clear;
         QU_REPASSE.SQL.Add(' SELECT ');
       //  QU_REPASSE.SQL.Add('     * ');
         QU_REPASSE.SQL.Add('     C.NOME_CREDOR, ');
         QU_REPASSE.SQL.Add('     D.NOME_DEVEDOR, ');
         QU_REPASSE.SQL.Add('     R.RECEBIMENTO, ');
         QU_REPASSE.SQL.Add('     R.ACORDO, ');
         QU_REPASSE.SQL.Add('     R.PARCELA, ');
         QU_REPASSE.SQL.Add('     R.NUMERO_DOCUMENTO, ');
         QU_REPASSE.SQL.Add('     R.VALOR, ');
         QU_REPASSE.SQL.Add('     R.VALOR_REPASSE, ');
         QU_REPASSE.SQL.Add('     R.DATA_PAGAMENTO ');
         QU_REPASSE.SQL.Add(' FROM ');
         QU_REPASSE.SQL.Add('     RECEBIMENTO R, ');
         QU_REPASSE.SQL.Add('     ACORDO A, ');
         QU_REPASSE.SQL.Add('     CREDOR C, ');
         QU_REPASSE.SQL.Add('     DEVEDOR D ');
         QU_REPASSE.SQL.Add(' WHERE ');
         QU_REPASSE.SQL.Add('     R.ACORDO = A.IDACORDO ');
         QU_REPASSE.SQL.Add(' AND ');
         QU_REPASSE.SQL.Add('     A.CREDOR = C.CODIGO_CREDOR ');
         QU_REPASSE.SQL.Add(' AND ');
         QU_REPASSE.SQL.Add('     A.DEVEDOR = D.CODIGO_DEVEDOR ');
         QU_REPASSE.SQL.Add(' AND ');
         QU_REPASSE.SQL.Add('     R.PAGO = TRUE ');
         QU_REPASSE.SQL.Add(' AND ');
         QU_REPASSE.SQL.Add('     R.PAGTO_PRE_DATADO = R.CHEQUE_COMPENSADO ');
         QU_REPASSE.SQL.Add(' AND ');
         QU_REPASSE.SQL.Add('     R.IDREPASSE = :PIDREPASSE ');
         QU_REPASSE.Parameters.ParamByName('PIDREPASSE').Value    := Dados.TB_REPASSEIDREPASSE.Value;
         QU_REPASSE.Open;

         If   Not QU_REPASSE.Active Then
              QU_REPASSE.Active := True;

       End
  Else
       Begin
         QU_RECEBIMENTOS.Close;
         QU_REPASSE.Close;
         DesabilitaControles;
       End;
end;

procedure TFrmRepasse.FecharArquivos;
begin
end;

(******************************************************************************)
function TFrmRepasse.PegaLetraColuna(IntNumber : Integer): String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 256 then
      Result:='IV'
    else
    begin
      if IntNumber > 26 then
      begin
        Result:=Chr(64 + (IntNumber div 26));
        Result:=Result+Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;

procedure TFrmRepasse.plImprimir;
Var
  FFreeReport : TFreeReport;
  FFrDataset  : TfrMyDBDataset;
begin
  Try
    FFreeReport     := TFreeReport.Create(Self);
    FFrDataset      := TfrMyDBDataset.Create(Self);
    FFrDataset.Name := 'FrRepasse';
    If   Not(cbConfigurar.Checked) Then
         Begin
           FFreeReport.Arquivo := SelectFile(TUniqueParametros.GetParametros.DatabaseReport);
           FFreeReport.Visualiza;
         End
    Else
         FFreeReport.Desenhar;
  Finally
    FFreeReport.Free;
    FFrDataset.Free;
  End;
end;

procedure TFrmRepasse.plTotalizar;
Const
  cTamanho = 20;
Var
  ldTotal : Double;
begin
  ldTotal         := 0.00;
  DBGridConsultaPagamentos.DataSource := nil;
  QU_RECEBIMENTOS.First;
  While Not QU_RECEBIMENTOS.Eof Do
     Begin
       ldTotal := ldTotal + QU_RECEBIMENTOS.FieldByName('VALOR_REPASSE').AsFloat;
       QU_RECEBIMENTOS.Next;
     End;
  DBGridConsultaPagamentos.DataSource := dsConsulta;

  edTotal.Text    := Valor_Direita(ldTotal,cTamanho);

end;

procedure TFrmRepasse.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
  DesabilitaControles;
  plCarregaCombo;
end;

procedure TFrmRepasse.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TFrmRepasse.plConsultaRepasse;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'REPASSE';
    FConsulta.DefineCampos(['IDREPASSE','IDCREDOR','DATA_REPASSE','SITUACAO']);
    FConsulta.CampoCondicao := 'IDREPASSE';
    If   FConsulta.Execute Then
         Begin
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TFrmRepasse.btnRecarregaClick(Sender: TObject);
begin
  ExecutaConsulta;
end;

procedure TFrmRepasse.plCarregaCombo;
begin
  cbRepasse.Text := '';
  cbRepasse.Items.Clear;
  QU_CONSULTA_REPASSE.Close;
  QU_CONSULTA_REPASSE.SQL.Clear;
  QU_CONSULTA_REPASSE.SQL.Add(' SELECT IDREPASSE, NOME_CREDOR ');
  QU_CONSULTA_REPASSE.SQL.Add(' FROM REPASSE R, CREDOR C ');
  QU_CONSULTA_REPASSE.SQL.Add(' WHERE R.IDCREDOR = C.CODIGO_CREDOR ');
  Case rgConsulta.ItemIndex of
   0: QU_CONSULTA_REPASSE.SQL.Add(' AND R.SITUACAO = 0 ');
   1: QU_CONSULTA_REPASSE.SQL.Add(' AND R.SITUACAO = 1 ');
  End;
  QU_CONSULTA_REPASSE.Open;
  QU_CONSULTA_REPASSE.First;
  While Not QU_CONSULTA_REPASSE.Eof Do
     Begin
       cbRepasse.Items.Add(IntToStr(QU_CONSULTA_REPASSE.FieldByName('IDREPASSE').AsInteger)+ '-'+
                           QU_CONSULTA_REPASSE.FieldByName('NOME_CREDOR').AsString);
       QU_CONSULTA_REPASSE.Next;
     End;
end;

procedure TFrmRepasse.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRepasse.btnPosicao_PosteriorClick(Sender: TObject);
begin
  AlocarRecebimento;
end;

procedure TFrmRepasse.AlocarRecebimento;
Var
  i : Integer;
begin
   if (DBGridConsultaPagamentos.SelectedRows.Count > 0) then
        begin
          with DBGridConsultaPagamentos.DataSource.DataSet do
               for i:=0 to DBGridConsultaPagamentos.SelectedRows.Count-1 do
               begin
                 GotoBookmark(pointer(DBGridConsultaPagamentos.SelectedRows.Items[i]));

                 Dados.Comando.CommandText := 'UPDATE RECEBIMENTO R SET R.IDREPASSE = ' + IntToStr(Dados.TB_REPASSEIDREPASSE.Value) +
                                              ' WHERE R.RECEBIMENTO = ' + Fields.Fields[2].AsString;
                 Dados.Comando.Execute;

                 Dados.TB_REPASSE.Edit;
                 Dados.TB_REPASSEVALOR_REPASSE.Value := Dados.TB_REPASSEVALOR_REPASSE.Value + Fields.Fields[7].AsFloat;
                 Dados.TB_REPASSE.Post;

               end;
          ExecutaConsulta;
        end;
end;

procedure TFrmRepasse.cbRepasseChange(Sender: TObject);
begin
  ExecutaConsulta;
end;

procedure TFrmRepasse.btnImprimeClick(Sender: TObject);
begin
  plImprimir;
end;

procedure TFrmRepasse.DesalocaRecebimento;
Var
  i : Integer;
begin
   if (DBGridConsultaRepasse.SelectedRows.Count > 0) then
        begin
          with DBGridConsultaRepasse.DataSource.DataSet do
               for i:=0 to DBGridConsultaRepasse.SelectedRows.Count-1 do
               begin
                 GotoBookmark(pointer(DBGridConsultaRepasse.SelectedRows.Items[i]));

                 Dados.Comando.CommandText := 'UPDATE RECEBIMENTO R SET R.IDREPASSE = 0 ' +
                                              ' WHERE R.RECEBIMENTO = ' + Fields.Fields[2].AsString;
                 Dados.Comando.Execute;

                 Dados.TB_REPASSE.Edit;
                 Dados.TB_REPASSEVALOR_REPASSE.Value := Dados.TB_REPASSEVALOR_REPASSE.Value - Fields.Fields[7].AsFloat;
                 Dados.TB_REPASSE.Post;

               end;
          ExecutaConsulta;
        end;
end;

procedure TFrmRepasse.btnPosicao_AnteriorClick(Sender: TObject);
begin
  DesalocaRecebimento;
end;

procedure TFrmRepasse.btnConfirmaClick(Sender: TObject);
begin
  If   Dados.flRetornarQuantRecebimentoRepasse < 1 Then
       Raise Exception.Create('Não existem Itens no Repasse');
  If   MessageBox(Self.Handle,'Confirmar Repasse','Atenção',mb_yesno+mb_iconquestion) = 6 Then
       Begin
         Try
           Dados.TB_REPASSE.Edit;
           Case rgConsulta.ItemIndex of
             0: Dados.TB_REPASSESITUACAO.Value := 1; //Confirmado
             1: Dados.TB_REPASSESITUACAO.Value := 0; //Desconfirma (Em aberto)
           End;
           Dados.TB_REPASSE.Post;
         Except
           Dados.TB_REPASSE.Cancel;
         End;
       End;
  plCarregaCombo;
  ExecutaConsulta;
end;

procedure TFrmRepasse.DesabilitaControles;
begin
  btnImprime.Enabled           := False;
  btnConfirma.Enabled          := False;
  btnExcluir.Enabled           := False;
  btnAjustar.Enabled           := False;
  btnPosicao_Posterior.Enabled := False;
  btnPosicao_Anterior.Enabled  := False;
  btnExportaExcel.Enabled      := False;
  btnCancelar.Enabled          := False;
  btnRecarrega.Enabled         := False;
  edTotal.Text                 := '';
  DBVALOR_REPASSE.DataSource   := Nil;
end;

procedure TFrmRepasse.HabilitaControles;
begin
  btnImprime.Enabled           := True;
  btnConfirma.Enabled          := True;
  btnExcluir.Enabled           := True;
  btnAjustar.Enabled           := True;
  btnPosicao_Posterior.Enabled := True;
  btnPosicao_Anterior.Enabled  := True;
  btnExportaExcel.Enabled      := True;
  btnCancelar.Enabled          := True;
  btnRecarrega.Enabled         := True;
  DBVALOR_REPASSE.DataSource   := dsRepasse;
end;

procedure TFrmRepasse.btnExcluirClick(Sender: TObject);
begin
  If   Dados.flRetornarQuantRecebimentoRepasse >= 1 Then
       Raise Exception.Create('Existem Itens no Repasse');
  If   MessageBox(Self.Handle,'Deseja realmente excluir Repasse','Atenção',mb_yesno+mb_iconquestion) = 6 Then
       Begin
         Try
           Dados.TB_REPASSE.Delete;
         Except
           Dados.TB_REPASSE.Cancel;
         End;
       End;
  plCarregaCombo;
  ExecutaConsulta
end;

procedure TFrmRepasse.btnCancelarClick(Sender: TObject);
begin
  If   Dados.flRetornarQuantRecebimentoRepasse >= 1 Then
       Raise Exception.Create('Existem Itens no Repasse');
  If   MessageBox(Self.Handle,'Confirmar Repasse','Atenção',mb_yesno+mb_iconquestion) = 6 Then
       Begin
         Try
           Dados.TB_REPASSE.Edit;
           Dados.TB_REPASSESITUACAO.Value := 2; //Cancelado
           Dados.TB_REPASSE.Post;
         Except
           Dados.TB_REPASSE.Cancel;
         End;
       End;
  plCarregaCombo;
  ExecutaConsulta;
end;

procedure TFrmRepasse.rgConsultaClick(Sender: TObject);
begin
  plCarregaCombo;
  ExecutaConsulta;
end;

end.
