unit uPesquisaCobrancaCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uFreeReport, uGetFunctions, ucLayCredor,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB, Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TFrmPesquisaCobrancaCredor = class(TForm)
    pnRodape: TPanel;
    pnTop: TPanel;
    pnGrid: TPanel;
    pnCabecalho: TPanel;
    lblPesquisa: TLabel;
    edNomeCredor: TEdit;
    ADOQueryPesquisa: TADOQuery;
    dsConsulta: TDataSource;
    btnSair: TBitBtn;
    edCredor: TEdit;
    rgOpcoes: TRadioGroup;
    sbBusca: TSpeedButton;
    btnImprime: TBitBtn;
    ADOQueryPesquisaVALOR_DIVIDA: TFloatField;
    ADOQueryPesquisaCOBRANCA: TIntegerField;
    ADOQueryPesquisaNOME_DEVEDOR: TStringField;
    ADOQueryPesquisaDATA_CADASTRO: TDateField;
    ADOQueryPesquisaNOME_CREDOR: TStringField;
    btnExecutarConsulta: TSpeedButton;
    cbConfigurar: TCheckBox;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COBRANCA1: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_DEVEDOR1: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_CADASTRO1: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_DIVIDA1: TcxGridDBColumn;
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
    procedure edNomeCredorKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure DBGridConsultaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);
    procedure edCredorExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExecutarConsultaClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    FCredor : TCREDOR;
    procedure ExecutaConsulta;
    procedure AbrirArquivos;
    procedure FecharArquivos;
    procedure plImprimir;
  public
    { Public declarations }
  end;


  Procedure ConsultaCobrancaCredor;


implementation
Uses
  Parametros,
  uPesquisa;

{$R *.dfm}

{ TFrmPesquisa }

Procedure ConsultaCobrancaCredor;
Var
  FrmPesquisaCobrancaCredor : TFrmPesquisaCobrancaCredor;
Begin
  FrmPesquisaCobrancaCredor := TFrmPesquisaCobrancaCredor.Create(Application);
  Try
    FrmPesquisaCobrancaCredor.ShowModal;
  Finally
    FreeAndNil(FrmPesquisaCobrancaCredor);
  End;
End;

procedure TFrmPesquisaCobrancaCredor.ExecutaConsulta;
begin
  If   Trim(edCredor.Text) <> '' Then
       Begin
         ADOQueryPesquisa.Close;
         ADOQueryPesquisa.SQL.Clear;
         ADOQueryPesquisa.SQL.Add('SELECT C.COBRANCA, ');
         ADOQueryPesquisa.SQL.Add('C.CREDOR, ');
         ADOQueryPesquisa.SQL.Add('CR.NOME_CREDOR, ');
         ADOQueryPesquisa.SQL.Add('C.DEVEDOR, ');
         ADOQueryPesquisa.SQL.Add('D.NOME_DEVEDOR, ');
         ADOQueryPesquisa.SQL.Add('C.DATA_CADASTRO, ');
         ADOQueryPesquisa.SQL.Add('C.SITUACAO, ');
         ADOQueryPesquisa.SQL.Add('C.VALOR_DIVIDA ');
         ADOQueryPesquisa.SQL.Add('FROM COBRANCA C, DEVEDOR D, CREDOR CR ');
         ADOQueryPesquisa.SQL.Add('WHERE C.DEVEDOR = D.CODIGO_DEVEDOR ');
         ADOQueryPesquisa.SQL.Add('AND C.CREDOR = CR.CODIGO_CREDOR ');
         Case rgOpcoes.ItemIndex of
           0 : ADOQueryPesquisa.SQL.Add('AND C.SITUACAO = 0 ');
           1 : ADOQueryPesquisa.SQL.Add('AND C.SITUACAO = 1 ');
         End;
         ADOQueryPesquisa.SQL.Add('AND C.CREDOR = '+ edCredor.Text);
         ADOQueryPesquisa.Open;
         If   Not ADOQueryPesquisa.Active Then
              ADOQueryPesquisa.Active := True;
       End;
end;

procedure TFrmPesquisaCobrancaCredor.edNomeCredorKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       ExecutaConsulta;
end;

procedure TFrmPesquisaCobrancaCredor.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisaCobrancaCredor.DBGridConsultaDblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisaCobrancaCredor.FormCreate(Sender: TObject);
begin
  CentralizarForm(Self);
  AbrirArquivos;
end;

procedure TFrmPesquisaCobrancaCredor.sbBuscaClick(Sender: TObject);
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

procedure TFrmPesquisaCobrancaCredor.edCredorExit(Sender: TObject);
begin
  If   Trim(edCredor.Text) <> '' Then
       Begin
         If   Not FCredor.Locate('CODIGO_CREDOR',StrToInt(edCredor.Text),[loPartialKey]) Then
              ShowMessage('Registro não encontrado')
         Else edNomeCredor.Text := FCredor.NOME_CREDOR;
       End;
end;

procedure TFrmPesquisaCobrancaCredor.AbrirArquivos;
begin
end;

procedure TFrmPesquisaCobrancaCredor.FecharArquivos;
begin
end;

procedure TFrmPesquisaCobrancaCredor.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TFrmPesquisaCobrancaCredor.btnExecutarConsultaClick(
  Sender: TObject);
begin
  ExecutaConsulta;
end;

procedure TFrmPesquisaCobrancaCredor.btnImprimeClick(Sender: TObject);
begin
  plImprimir;
end;

procedure TFrmPesquisaCobrancaCredor.plImprimir;
Const
  strReportFile  = 'Conbrancas_Credor.frf';
Var
  FFreeReport  : TFreeReport;
  FFreeDataset : TfrMyDBDataset;
begin
  Try
    FFreeReport           := TFreeReport.Create(Self);
    FFreeDataset          := TfrMyDBDataset.Create(Self);
    FFreeDataset.Name     := 'FrCobrancas_Credor';
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

end.
