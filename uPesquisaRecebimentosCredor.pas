unit uPesquisaRecebimentosCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB, Buttons,
  uFreeReport, uFuncoes, ucLayCredor,
  ComCtrls, OleServer, Mask, DBCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, Menus, cxButtons, cxContainer, cxMaskEdit,
  cxGridExportLink, ShellApi,
  cxDropDownEdit, cxCalendar, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinValentine, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TFrmPesquisaRecebimentoCredor = class(TForm)
    pnRodape: TPanel;
    pnTop: TPanel;
    pnGrid: TPanel;
    pnCabecalho: TPanel;
    lblPesquisa: TLabel;
    edNomeCredor: TEdit;
    ADOQueryPesquisa: TADOQuery;
    dsConsulta: TDataSource;
    edCredor: TEdit;
    sbBusca: TSpeedButton;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    rgOpcoes: TRadioGroup;
    rgData: TRadioGroup;
    cbConfigurar: TCheckBox;
    GroupBox1: TGroupBox;
    edTotal: TEdit;
    edPagos: TEdit;
    edNaoPagos: TEdit;
    Label3: TLabel;
    lblNaoPagos: TLabel;
    Label4: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1NOME_DEVEDOR1: TcxGridDBColumn;
    cxGrid1DBTableView1ACORDO1: TcxGridDBColumn;
    cxGrid1DBTableView1PARCELA1: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR1: TcxGridDBColumn;
    cxGrid1DBTableView1VENCIMENTO1: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_PAGAMENTO1: TcxGridDBColumn;
    cxGrid1DBTableView1PAGO1: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_REPASSE1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxbSair: TcxButton;
    cxbImprimir: TcxButton;
    cxbExcel: TcxButton;
    cxbExecutar: TcxButton;
    cxGrid1DBTableView1NOME_CREDOR: TcxGridDBColumn;
    procedure edNomeCredorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);
    procedure edCredorExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgDataClick(Sender: TObject);
    procedure cxbSairClick(Sender: TObject);
    procedure cxbImprimirClick(Sender: TObject);
    procedure cxbExecutarClick(Sender: TObject);
    procedure cxbExcelClick(Sender: TObject);
  private
    { Private declarations }
    FSCredor : TSimplesCREDOR;
    procedure ExecutaConsulta;
    procedure CentralizarForm;
    procedure AbrirArquivos;
    procedure FecharArquivos;
    procedure plImprimir;
    procedure plTotalizar;
  public
    { Public declarations }
  end;


  Procedure ConsultaRecebimentoCredor;


implementation
Uses
  Parametros,
  uAguarde,
  uPesquisa;

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

procedure TFrmPesquisaRecebimentoCredor.ExecutaConsulta;
begin
  ShowWait('Aguarde....');
  try
    ADOQueryPesquisa.Close;
    If   Trim(edCredor.Text) <> '' Then
         ADOQueryPesquisa.Parameters.AddParameter.Name := 'CREDOR';
    If   rgData.ItemIndex <> 0 Then
         Begin
           ADOQueryPesquisa.Parameters.AddParameter.Name := 'DTINICIAL';
           ADOQueryPesquisa.Parameters.AddParameter.Name := 'DTFINAL';
         End;
    ADOQueryPesquisa.Close;
    ADOQueryPesquisa.SQL.Clear;
    ADOQueryPesquisa.SQL.Add(' SELECT ');
    ADOQueryPesquisa.SQL.Add('     * ');
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
    If   Trim(edCredor.Text) <> '' Then
    begin
        ADOQueryPesquisa.SQL.Add(' AND ');
        ADOQueryPesquisa.SQL.Add('     A.CREDOR = :CREDOR ');
    end;

    Case rgData.ItemIndex of
      1: Begin
           ADOQueryPesquisa.SQL.Add(' AND ');
           ADOQueryPesquisa.SQL.Add('    R.VENCIMENTO BETWEEN :DTINICIAL AND :DTFINAL ');
         End;
      2: Begin
           ADOQueryPesquisa.SQL.Add(' AND ');
           ADOQueryPesquisa.SQL.Add('    R.DATA_PAGAMENTO BETWEEN :DTINICIAL AND :DTFINAL ');
         End;
    End;

    If   Trim(edCredor.Text) <> '' Then
         ADOQueryPesquisa.Parameters.ParamByName('CREDOR').Value    := edCredor.Text;
    If   rgData.ItemIndex <> 0 Then
         Begin
           ADOQueryPesquisa.Parameters.ParamByName('DTINICIAL').Value := dtInicio.DateTime;
           ADOQueryPesquisa.Parameters.ParamByName('DTFINAL').Value   := dtFim.DateTime;
         End;
    ADOQueryPesquisa.Open;

    If   Not ADOQueryPesquisa.Active Then
         ADOQueryPesquisa.Active := True;
    plTotalizar;
  finally
     HideWait;
  end;
end;

procedure TFrmPesquisaRecebimentoCredor.edNomeCredorKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       ExecutaConsulta;
end;

procedure TFrmPesquisaRecebimentoCredor.CentralizarForm;
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

procedure TFrmPesquisaRecebimentoCredor.FormCreate(Sender: TObject);
begin
  ADOQueryPesquisa.Connection := TUniqueParametros.GetParametros.Conexao;
  CentralizarForm;
  AbrirArquivos;
  dtInicio.Date := Date;
  dtFim.Date    := Date;
end;

procedure TFrmPesquisaRecebimentoCredor.sbBuscaClick(Sender: TObject);
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
           edCredor.Text     := FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsVariant;
           edNomeCredor.Text := FConsulta.Consulta.FieldByName('NOME_CREDOR').AsVariant;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TFrmPesquisaRecebimentoCredor.edCredorExit(Sender: TObject);
begin
  If   Trim(edCredor.Text) <> '' Then
       Begin
         FSCredor.CODIGO_CREDOR := StrToInt(edCredor.Text);
         FSCredor.CarregaSQL;
         edNomeCredor.Text := FSCredor.NOME_CREDOR;
       End;
end;

procedure TFrmPesquisaRecebimentoCredor.AbrirArquivos;
begin
  FSCredor := TSimplesCREDOR.Create(Self);
end;

procedure TFrmPesquisaRecebimentoCredor.FecharArquivos;
begin
  FSCredor.Free;
end;

procedure TFrmPesquisaRecebimentoCredor.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TFrmPesquisaRecebimentoCredor.plImprimir;
Const
  strReportFile  = 'Recebimento_Credor.frf';
Var
  FFreeReport  : TFreeReport;
  FFreeDataset : TfrMyDBDataset;
begin
  Try
    FFreeReport           := TFreeReport.Create(Self);
    FFreeDataset          := TfrMyDBDataset.Create(Self);
    FFreeDataset.Name     := 'FrRecebimento_Credor';
    FFreeDataset.DataSet  := ADOQueryPesquisa;
    If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + strReportFile)
    And  Not(cbConfigurar.Checked)Then
         Begin
           FFreeReport.Arquivo := TUniqueParametros.GetParametros.DatabaseReport + strReportFile;
           FFreeReport.Visualiza;
         End
    Else
         FFreeReport.Desenhar;
  Finally
    FFreeDataset.Free;
    FFreeReport.Free;
  End;
end;

procedure TFrmPesquisaRecebimentoCredor.plTotalizar;
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
  edTotal.Text    := Valor_Direita(ldTotal,cTamanho);
  edPagos.Text    := Valor_Direita(ldTotalPagos,cTamanho);
  edNaoPagos.Text := Valor_Direita(ldTotalNaoPagos,cTamanho);
end;

procedure TFrmPesquisaRecebimentoCredor.rgDataClick(Sender: TObject);
begin
   dtInicio.Enabled := (rgData.ItemIndex <> 0);
   dtFim.Enabled    := (rgData.ItemIndex <> 0);
end;

procedure TFrmPesquisaRecebimentoCredor.cxbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisaRecebimentoCredor.cxbImprimirClick(Sender: TObject);
begin
  plImprimir;
end;

procedure TFrmPesquisaRecebimentoCredor.cxbExecutarClick(Sender: TObject);
begin
  ExecutaConsulta;
end;

procedure TFrmPesquisaRecebimentoCredor.cxbExcelClick(Sender: TObject);
begin
  ExportGridToExcel(TUniqueParametros.GetParametros.DatabaseWork+'Recebimento_Credor.xls',cxGrid1);
  ShellExecute(0, 'open', PChar(TUniqueParametros.GetParametros.DatabaseWork+'Recebimento_Credor.xls'), '', '', sw_ShowNormal);
end;

end.
