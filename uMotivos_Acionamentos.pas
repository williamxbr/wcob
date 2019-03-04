unit uMotivos_Acionamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayMotivos_Acionamentos,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DB, ExtCtrls, Buttons,
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
  TfrmMotivos_Acionamentos = class(TForm)
    pntop: TPanel;
    pntela: TPanel;
    pnrodape: TPanel;
    dsMotivosAcionamentos: TDataSource;
    DBNavDepre: TDBNavigator;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    DBCODIGO: TDBEdit;
    DBDESCRICAO: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CODIGO1: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FMotivos_Acionamentos : TMOTIVOS_ACIONAMENTOS;
    procedure abrirtabelas;
    procedure fechartabelas;

  public
    { Public declarations }
  end;

    procedure callMotivos_Acionamentos;


implementation
{$R *.dfm}

procedure callMotivos_Acionamentos;
var
  frmMotivos_Acionamentos: TfrmMotivos_Acionamentos;
begin
  frmMotivos_Acionamentos := TfrmMotivos_Acionamentos.Create(Application);
  try
    frmMotivos_Acionamentos.ShowModal;
  finally
    freeandnil(frmMotivos_Acionamentos);
  end;
end;

procedure TfrmMotivos_Acionamentos.abrirtabelas;
begin
  FMotivos_Acionamentos := TMOTIVOS_ACIONAMENTOS.Create(Self);
  FMotivos_Acionamentos.Carrega(False);
  dsMotivosAcionamentos.DataSet := FMotivos_Acionamentos;
end;

procedure TfrmMotivos_Acionamentos.fechartabelas;
begin
  FMotivos_Acionamentos.Free;
end;

procedure TfrmMotivos_Acionamentos.FormCreate(Sender: TObject);
begin
  abrirtabelas;
end;

procedure TfrmMotivos_Acionamentos.FormDestroy(Sender: TObject);
begin
  fechartabelas;
end;

procedure TfrmMotivos_Acionamentos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
