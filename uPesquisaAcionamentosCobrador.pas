unit uPesquisaAcionamentosCobrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB, Buttons,
  uFreeReport, uFuncoes,
  ComCtrls, OleServer, ExcelXP, Mask, DBCtrls;

type
  TFrmPesquisaAcionamentosCobrador = class(TForm)
    pnRodape: TPanel;
    pnTop: TPanel;
    pnGrid: TPanel;
    pnCabecalho: TPanel;
    lblPesquisa: TLabel;
    edNomeCobrador: TEdit;
    DBGridConsulta: TDBGrid;
    ADOQueryPesquisa: TADOQuery;
    dsConsulta: TDataSource;
    btnSair: TBitBtn;
    edCobrador: TEdit;
    sbBusca: TSpeedButton;
    btnImprime: TBitBtn;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnExecutarConsulta: TSpeedButton;
    btExportaExcel: TBitBtn;
    cbConfigurar: TCheckBox;
    GroupBox1: TGroupBox;
    edTotal: TEdit;
    edPagos: TEdit;
    edNaoPagos: TEdit;
    Label3: TLabel;
    lblNaoPagos: TLabel;
    Label4: TLabel;
    procedure edNomeCobradorKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);
    procedure edCobradorExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExecutarConsultaClick(Sender: TObject);
    procedure btExportaExcelClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecutaConsulta;
    procedure AbrirArquivos;
    procedure ExpExcel(Dataset: TDataSet; ArqNome: OleVariant);
    procedure FecharArquivos;
    function PegaLetraColuna(IntNumber: Integer): String;
    procedure plImprimir;
    procedure plTotalizar;
  public
    { Public declarations }
  end;


  Procedure ConsultaRecebimentoCredor;


implementation
Uses
  Parametros,
  uPesquisa,
  uDados;

{$R *.dfm}

{ TFrmPesquisa }

Procedure ConsultaRecebimentoCredor;
Var
  FrmPesquisaRecebimentoCredor : TFrmPesquisaRecebimentoCredor;
Begin
  FrmPesquisaRecebimentoCredor := TFrmPesquisaRecebimentoCredor.Create(Application);
  Try
    FrmPesquisaRecebimentoCredor.ShowModal;
  Finally
    FreeAndNil(FrmPesquisaRecebimentoCredor);
  End;
End;

procedure TFrmPesquisaAcionamentosCobrador.ExecutaConsulta;
begin
  ADOQueryPesquisa.Close;
  If   Trim(edCredor.Text) <> '' Then
       Begin
         ADOQueryPesquisa.Parameters.AddParameter.Name := 'CREDOR';
         If   Not rgData.ItemIndex = 0 Then
              Begin
                ADOQueryPesquisa.Parameters.AddParameter.Name := 'DTINICIAL';
                ADOQueryPesquisa.Parameters.AddParameter.Name := 'DTFINAL';
              End;
         ADOQueryPesquisa.Close;
         ADOQueryPesquisa.SQL.Clear;
         ADOQueryPesquisa.SQL.Add(' SELECT ');
         ADOQueryPesquisa.SQL.Add('     * ');
(*
         ADOQueryPesquisa.SQL.Add('     C.NOME_CREDOR, ');
         ADOQueryPesquisa.SQL.Add('     D.NOME_DEVEDOR, ');
         ADOQueryPesquisa.SQL.Add('     R.ACORDO, ');
         ADOQueryPesquisa.SQL.Add('     R.PARCELA, ');
         ADOQueryPesquisa.SQL.Add('     R.NUMERO_DOCUMENTO, ');
         ADOQueryPesquisa.SQL.Add('     R.VALOR, ');
         ADOQueryPesquisa.SQL.Add('     R.VALOR_REPASSE, ');
         ADOQueryPesquisa.SQL.Add('     R.DATA_PAGAMENTO ');
*)
         ADOQueryPesquisa.SQL.Add(' FROM ');
         ADOQueryPesquisa.SQL.Add('     RECEBIMENTO R, ');
         ADOQueryPesquisa.SQL.Add('     ACORDO A, ');
         ADOQueryPesquisa.SQL.Add('     CREDOR C, ');
         ADOQueryPesquisa.SQL.Add('     DEVEDOR D ');
         ADOQueryPesquisa.SQL.Add(' WHERE ');
         ADOQueryPesquisa.SQL.Add('     R.ACORDO = A.IDACORDO ');
         ADOQueryPesquisa.SQL.Add(' AND ');
         ADOQueryPesquisa.SQL.Add('     A.CREDOR = C.CODIGO_CREDOR ');
         ADOQueryPesquisa.SQL.Add(' AND ');
         ADOQueryPesquisa.SQL.Add('     A.DEVEDOR = D.CODIGO_DEVEDOR ');
         Case rgOpcoes.ItemIndex of
           1: Begin
                ADOQueryPesquisa.SQL.Add(' AND ');
                ADOQueryPesquisa.SQL.Add('     R.PAGO = TRUE ');
              End;
           2: Begin
                ADOQueryPesquisa.SQL.Add(' AND ');
                ADOQueryPesquisa.SQL.Add('     R.PAGO = FALSE ');
              End;
         End;
         ADOQueryPesquisa.SQL.Add(' AND ');
         ADOQueryPesquisa.SQL.Add('     A.CREDOR = :CREDOR ');
         If   Not rgData.ItemIndex = 0 Then
              Begin
                ADOQueryPesquisa.SQL.Add(' AND ');
                ADOQueryPesquisa.SQL.Add('    R.DATA_PAGAMENTO BETWEEN :DTINICIAL AND :DTFINAL ');
              End;
         ADOQueryPesquisa.Parameters.ParamByName('CREDOR').Value    := edCredor.Text;
         If   Not rgData.ItemIndex = 0 Then
              Begin
                ADOQueryPesquisa.Parameters.ParamByName('DTINICIAL').Value := dtInicio.DateTime;
                ADOQueryPesquisa.Parameters.ParamByName('DTFINAL').Value   := dtFim.DateTime;
              End;
         ADOQueryPesquisa.Open;

         If   Not ADOQueryPesquisa.Active Then
              ADOQueryPesquisa.Active := True;
         plTotalizar;     
       End;
end;

procedure TFrmPesquisaAcionamentosCobrador.edNomeCobradorKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       ExecutaConsulta;
end;

procedure TFrmPesquisaAcionamentosCobrador.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisaAcionamentosCobrador.FormCreate(Sender: TObject);
begin
  CentralizarForm;
  AbrirArquivos;
  dtInicio.Date := Date;
  dtFim.Date    := Date;
end;

procedure TFrmPesquisaAcionamentosCobrador.sbBuscaClick(Sender: TObject);
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'COBRADOR';
    FConsulta.DefineCampos(['IDCOBRADOR','NOME_COBRADOR']);
    FConsulta.CampoCondicao := 'NOME_COBRADOR';
    If   FConsulta.Execute Then
         Begin
           edCobrador.Text     := FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsVariant;
           edNomeCobrador.Text := FConsulta.Consulta.FieldByName('NOME_CREDOR').AsVariant;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TFrmPesquisaAcionamentosCobrador.edCobradorExit(Sender: TObject);
begin
  If   Trim(edCredor.Text) <> '' Then
       Begin
         If   Not Dados.TB_CREDOR.Locate('CODIGO_CREDOR',StrToInt(edCredor.Text),[loPartialKey]) Then
              ShowMessage('Registro não encontrado')
         Else edNomeCredor.Text := Dados.TB_CREDORNOME_CREDOR.Value;
       End;
end;

procedure TFrmPesquisaAcionamentosCobrador.AbrirArquivos;
begin
  HabilitaTabelas(True);
end;

procedure TFrmPesquisaAcionamentosCobrador.FecharArquivos;
begin
  HabilitaTabelas(False);
end;

procedure TFrmPesquisaAcionamentosCobrador.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TFrmPesquisaAcionamentosCobrador.btnExecutarConsultaClick(
  Sender: TObject);
begin
  ExecutaConsulta;
end;

(******************************************************************************)
procedure TFrmPesquisaAcionamentosCobrador.ExpExcel(Dataset : TDataSet; ArqNome :
    OleVariant);
var
  NumLinha, NumColuna, LCID  : Integer;
  StrCell                    : String;
  // Criado Vaviaveis by Gustavo
  AdtoMru, CreateBck, ROREcommended : OleVariant;

begin
  LCID := GetUserDefaultLCID;
  with Excel do
  begin
    Connect;
    try
      Visible[LCID] := True;
      Workbooks.Add(EmptyParam, LCID);
      NumLinha := 1;

    (* Aqui pega o nome dos CAMPOS do Dataset *)
      with Dataset do
      begin
        for NumColuna := 1 to Fields.Count do
        begin
          StrCell := PegaLetraColuna(NumColuna) + IntToStr(NumLinha);

          (* Usa "DisplayLabel" das colunas para preencher as células ou "FieldName" *)
          // Alterado Parametro do Range .. by Gustavo
          if Fields[NumColuna - 1].DisplayLabel <> '' then
            Range[StrCell,StrCell].Value2 := Fields[NumColuna - 1].DisplayLabel
          else
            Range[StrCell,StrCell].Value2 := Fields[NumColuna - 1].FieldName;

        end;
      end;

      NumLinha := 2;

      with Dataset do
      begin
        First;
        while not Eof do
        begin
          for NumColuna := 1 to Fields.Count do
          begin
            StrCell := PegaLetraColuna(NumColuna) + IntToStr(NumLinha);
            // Alterado Parametro do Range .. by Gustavo
            if (Fields.Fields[NumColuna - 1].DataType = ftDate) or (Fields.Fields[NumColuna - 1].DataType = ftDateTime) then
               // Tratamento de Datas .. by Gustavo
               if (not Fields.Fields[NumColuna - 1].IsNull) then
                  Range[StrCell, StrCell].Value2 := DateToStr(Fields.Fields[NumColuna - 1].AsDateTime)
               else
                   Range[StrCell, StrCell].Value2 := ''
            else
                Range[StrCell, StrCell].Value2 := Fields.Fields[NumColuna - 1].Value;
          end;
          Next;
          Inc(NumLinha);
        end;
      end;
      Range['A1', StrCell].EntireColumn.Autofit;
      // Atribuido Valor as variaveis by Gustavo
      AdtoMru       := False;
      CreateBck     := False;
      ROREcommended := False;
      // Alterado Parametros .. by Gustavo
      ActiveWorkbook.SaveAs(ArqNome, xlnormal, EmptyParam, EmptyParam, ROREcommended, CreateBck, xlNoChange, xlUserResolution, AdtoMru, Emptyparam, emptyparam,emptyparam, lcid);
      Quit;
    finally
      Disconnect;
    end;
  end;
end;

(******************************************************************************)
function TFrmPesquisaAcionamentosCobrador.PegaLetraColuna(IntNumber : Integer):
    String;
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

procedure TFrmPesquisaAcionamentosCobrador.btExportaExcelClick(
  Sender: TObject);
begin
  ExpExcel(ADOQueryPesquisa, TParametros.GetParametros.DatabaseWork + 'PesquisaRecebimentoCredor.xls');
end;

procedure TFrmPesquisaAcionamentosCobrador.btnImprimeClick(Sender: TObject);
begin
  plImprimir;
end;

procedure TFrmPesquisaAcionamentosCobrador.plImprimir;
Const
  strReportFile  = 'Recebimento_Credor.frf';
Var
  FFreeReport : TFreeReport;
begin
  Try
    FFreeReport           := TFreeReport.Create;
    FFreeReport.BaseDados := ADOQueryPesquisa;
    If   FileExists(TParametros.GetParametros.DatabaseReport + strReportFile)
    And  Not(cbConfigurar.Checked)Then
         Begin
           FFreeReport.Arquivo := TParametros.GetParametros.DatabaseReport + strReportFile;
           FFreeReport.Visualiza;
         End
    Else
         FFreeReport.Desenhar;
  Finally
    FFreeReport.Free;
  End;
end;

procedure TFrmPesquisaAcionamentosCobrador.plTotalizar;
Const
  cTamanho = 25;
Var
  ldTotal,
  ldTotalPagos,
  ldTotalNaoPagos : Double;
begin
  ldTotal         := 0.00;
  ldTotalPagos    := 0.00;
  ldTotalNaoPagos := 0.00;
  DBGridConsulta.DataSource := nil;
  ADOQueryPesquisa.First;
  While Not ADOQueryPesquisa.Eof Do
     Begin
       ldTotal := ldTotal + ADOQueryPesquisa.FieldByName('VALOR').AsFloat;
       If   ADOQueryPesquisa.FieldByName('PAGO').AsBoolean
       And  (ADOQueryPesquisa.FieldByName('PAGTO_PRE_DATADO').AsBoolean = ADOQueryPesquisa.FieldByName('CHEQUE_COMPENSADO').AsBoolean) Then
            ldTotalPagos    := ldTotalPagos + ADOQueryPesquisa.FieldByName('VALOR').AsFloat
       Else ldTotalNaoPagos := ldTotalNaoPagos + ADOQueryPesquisa.FieldByName('VALOR').AsFloat;
       ADOQueryPesquisa.Next;
     End;
  DBGridConsulta.DataSource := dsConsulta;

  edTotal.Text    := Valor_Direita(ldTotal,cTamanho);
  edPagos.Text    := Valor_Direita(ldTotalPagos,cTamanho);
  edNaoPagos.Text := Valor_Direita(ldTotalNaoPagos,cTamanho);
end;

end.
