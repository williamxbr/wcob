unit uImprimeCobrancaCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, ADODB, uFreeReport,  ucLayCredor,
  Dialogs, Buttons, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, Menus, cxButtons, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridExportLink, Shellapi,
  cxGridDBTableView, cxGrid, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmCobrancaCredor = class(TForm)
    Panel1: TPanel;
    pnRodape: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GridCredorDBTableView1: TcxGridDBTableView;
    GridCredorLevel1: TcxGridLevel;
    GridCredor: TcxGrid;
    cbConfigura: TCheckBox;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxbExcel: TcxButton;
    cxbImprimir: TcxButton;
    cxbSair: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridCredorDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxbExcelClick(Sender: TObject);
    procedure cxbImprimirClick(Sender: TObject);
    procedure cxbSairClick(Sender: TObject);
  private
    { Private declarations }
    FCredor : TCREDOR;
    procedure AbrirArquivos;
    procedure FecharArquivos;
    procedure pImprimirCobrancaCredor(Credor:LongInt;Configura : Boolean);
    procedure plCarregaGrid(Credor:LongInt);
    procedure plCarregaGridCredor;
  public
    { Public declarations }
  end;

  procedure callImprimeCobrancaCredor;


implementation
Uses
  uPesquisa,
  Parametros;

{$R *.dfm}

procedure callImprimeCobrancaCredor;
var
  frmCobrancaCredor: TfrmCobrancaCredor;
Begin
  frmCobrancaCredor := TfrmCobrancaCredor.Create(Application);
  Try
    frmCobrancaCredor.ShowModal;
  Finally
    frmCobrancaCredor.Free;
  End;
End;

procedure TfrmCobrancaCredor.AbrirArquivos;
begin
  FCredor := TCREDOR.Create(Self);
  FCredor.Carrega(False);
  plCarregaGridCredor;
end;

procedure TfrmCobrancaCredor.FecharArquivos;
begin
  FCredor.Free;
end;

procedure TfrmCobrancaCredor.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
  cbConfigura.Visible := TUniqueParametros.GetParametros.Privilegiado;
end;

procedure TfrmCobrancaCredor.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TfrmCobrancaCredor.pImprimirCobrancaCredor(Credor: Integer;Configura
    : Boolean);
var
  FQuery    : TADOQuery;
  Report    : TFreeReport;
  FrDataset : TfrMyDBDataset;
begin
  FQuery         := TADOQuery.Create(Self);
  FQuery.Name    := 'QUERY_COBRANCA_CREDOR';
  Report         := TFreeReport.Create(Self);
  FrDataset      := TfrMyDBDataset.Create(Self);
  FrDataset.Name := 'FR_COBRANCA_CREDOR';
  FrDataset.DataSet := FQuery;
  Try
    FQuery.Connection := TUniqueParametros.GetParametros.Conexao;
    FQuery.SQL.Add(' Select * ');
    FQuery.SQL.Add(' From Cobranca Cob, Credor C, Devedor D ');
    FQuery.SQL.Add(' Where Cob.Credor = C.Codigo_Credor ');
    FQuery.SQL.Add(' And Cob.Devedor = D.Codigo_Devedor ');
    FQuery.SQL.Add(' And Cob.Credor = '+IntToStr(Credor));
    FQuery.SQL.Add(' And Cob.Situacao = 0');
    FQuery.SQL.Add(' Order By Cob.Credor, D.Nome_Devedor');
    FQuery.Open;
    FQuery.Active    := True;
    Report.plAdicionaVariavel('vNomeRelatorio',TUniqueParametros.GetParametros.DatabaseReport + 'CobrancaCredor.frf');
    If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'CobrancaCredor.frf') Then
         Report.Arquivo :=  TUniqueParametros.GetParametros.DatabaseReport + 'CobrancaCredor.frf';
    If   Configura Then
         Report.Desenhar
    Else Report.Visualiza;
  Finally
    FreeAndNil(FQuery);
    FreeAndNil(FrDataset);
    FreeAndNil(Report);
  End;
end;

procedure TfrmCobrancaCredor.plCarregaGrid(Credor: Integer);
var
  FQuery    : TADOQuery;
  FDataSource : TDataSource;
  aSummaryItem: TcxDataSummaryItem;
begin
  FQuery         := TADOQuery.Create(Self);
  FDataSource    := TDataSource.Create(Self);
  FDataSource.DataSet := FQuery;
  cxGrid1DBTableView1.DataController.DataSource := FDataSource;
  Try
    FQuery.Connection := TUniqueParametros.GetParametros.Conexao;
    FQuery.SQL.Add(' Select D.Nome_Devedor as Devedor,  iif( eh_localizado=true,"Sim","Não") as Localizado, cob.valor_divida as Divida ');
    FQuery.SQL.Add(' From Cobranca Cob, Credor C, Devedor D ');
    FQuery.SQL.Add(' Where Cob.Credor = C.Codigo_Credor ');
    FQuery.SQL.Add(' And Cob.Devedor = D.Codigo_Devedor ');
    FQuery.SQL.Add(' And Cob.Credor = '+IntToStr(Credor));
    FQuery.SQL.Add(' And Cob.Situacao = 0');
    FQuery.SQL.Add(' Order By Cob.Credor, D.Nome_Devedor');
    FQuery.Open;
    FQuery.Active    := True;
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems;
    with cxGrid1DBTableView1.DataController.Summary.FooterSummaryItems.Add do
    begin
       ItemLink := cxGrid1DBTableView1.GetColumnByFieldName('Divida');
       Kind := skSum;
       Format := '#,###,##0.00;-#,###,##0.00';
    end;
    cxGrid1DBTableView1.ApplyBestFit;
  Finally
 //   FreeAndNil(FQuery);
  End;
end;

procedure TfrmCobrancaCredor.plCarregaGridCredor;
Var
  FQuery    : TADOQuery;
  FDataSource : TDataSource;
begin
  FQuery := TADOQuery.Create(Self);
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FQuery;
  GridCredorDBTableView1.DataController.DataSource := FDataSource;
  Try
    FQuery.Connection := TUniqueParametros.GetParametros.Conexao;
    FQuery.SQL.Add('Select codigo_credor, trim(nome_credor) as Credor from Credor Order By Nome_Credor');
    FQuery.Open;
    FQuery.Active := True;
    GridCredorDBTableView1.ClearItems;
    GridCredorDBTableView1.DataController.CreateAllItems;
    GridCredorDBTableView1.Columns[0].Visible := False;
    GridCredorDBTableView1.ApplyBestFit;
    GridCredor.Width := GridCredorDBTableView1.Columns[1].Width + 50;
  Finally
  //  FreeAndNil(FQuery);
  //  FreeAndNil(FDataSource);
  End;
end;

procedure TfrmCobrancaCredor.GridCredorDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   plCarregaGrid(GridCredorDBTableView1.Controller.SelectedRows[0].Values[0]);
end;

procedure TfrmCobrancaCredor.cxbExcelClick(Sender: TObject);
begin
  ExportGridToExcel(TUniqueParametros.GetParametros.DatabaseWork+'ImprimeCobrancaCredor.xls',cxGrid1);
  ShellExecute(0, 'open', PChar(TUniqueParametros.GetParametros.DatabaseWork+'ImprimeCobrancaCredor.xls'), '', '', sw_ShowNormal);
end;

procedure TfrmCobrancaCredor.cxbImprimirClick(Sender: TObject);
begin
  pImprimirCobrancaCredor(GridCredorDBTableView1.Controller.SelectedRows[0].Values[0],cbConfigura.Checked);
end;

procedure TfrmCobrancaCredor.cxbSairClick(Sender: TObject);
begin
  Close;
end;

end.
