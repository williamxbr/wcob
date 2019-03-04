unit uTipoDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayTipo_Documento,
  Dialogs, ExtCtrls, Buttons, StdCtrls, DB, Mask, DBCtrls, Grids, DBGrids,
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
  TfrmTipoDocumento = class(TForm)
    Panel1: TPanel;
    gbRodape: TGroupBox;
    spSair: TSpeedButton;
    pnTop: TPanel;
    lblAlines: TLabel;
    pnTela: TPanel;
    lbNumero: TLabel;
    lblBanco: TLabel;
    DBTIPO_DOCUMENTO: TDBEdit;
    DBDESCRICAO: TDBEdit;
    dsTipoDocumento: TDataSource;
    DBSIGLA_DOCUMENTO: TDBEdit;
    Label1: TLabel;
    DBNavTipoDocumento: TDBNavigator;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1TIPO_DOCUMENTO1: TcxGridDBColumn;
    cxGrid1DBTableView1SIGLA_DOCUMENTO1: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spSairClick(Sender: TObject);
  private
    { Private declarations }
    FTipoDocumento : TTIPO_DOCUMENTO;
    procedure CentralizarForm;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure SetupHackedNavigator(const Navigator : TDBNavigator);
  public
    { Public declarations }
  end;

  procedure CallTipoDocumento;

implementation

{$R *.dfm}

procedure CallTipoDocumento;
var
  frmTipoDocumento: TfrmTipoDocumento;
Begin
  frmTipoDocumento := TfrmTipoDocumento.Create(Application);
  Try
    frmTipoDocumento.ShowModal;
  Finally
    frmTipoDocumento.Free;
  End;
End;

{ TfrmTipoDocumento }

procedure TfrmTipoDocumento.AbrirTabelas;
begin
  FTipoDocumento := TTIPO_DOCUMENTO.Create(Self);
  FTipoDocumento.Carrega(False);
  dsTipoDocumento.DataSet := FTipoDocumento;
end;

procedure TfrmTipoDocumento.CentralizarForm;
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
procedure TfrmTipoDocumento.FecharTabelas;
begin
  FTipoDocumento.Free;
end;

procedure TfrmTipoDocumento.FormCreate(Sender: TObject);
begin
  CentralizarForm;
  AbrirTabelas;
end;

procedure TfrmTipoDocumento.SetupHackedNavigator(
  const Navigator: TDBNavigator);
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

procedure TfrmTipoDocumento.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmTipoDocumento.spSairClick(Sender: TObject);
begin
  Close;
end;

end.
