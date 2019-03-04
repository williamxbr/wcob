unit Udepre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UcLayDepre,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DB, ExtCtrls, Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinValentine,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  Tfrmdepre = class(TForm)
    pntop: TPanel;
    pntela: TPanel;
    pnrodape: TPanel;
    dsdepre: TDataSource;
    DBANO: TDBEdit;
    DBMES: TDBEdit;
    DBINDICE: TDBEdit;
    DBNavDepre: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    cbMes: TComboBox;
    Label4: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ANO1: TcxGridDBColumn;
    cxGrid1DBTableView1MES1: TcxGridDBColumn;
    cxGrid1DBTableView1INDICE1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    procedure BitBtn1Click(Sender: TObject);
    procedure dsdepreDataChange(Sender: TObject; Field: TField);
    procedure cbMesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDepre : TDEPRE;
    procedure plAbrirArquivos;
    procedure plFecharArquivos;
  public
    { Public declarations }
  end;

    procedure CallDepre;


implementation

{$R *.dfm}

procedure CallDepre;
var
  frmdepre: Tfrmdepre;
begin
  frmdepre := Tfrmdepre.Create(Application);
  try
    frmdepre.ShowModal;
  finally
    freeandnil(frmdepre);
  end;
end;

procedure Tfrmdepre.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmdepre.dsdepreDataChange(Sender: TObject; Field: TField);
begin
  cbMes.ItemIndex := FDepre.MES - 1;
end;

procedure Tfrmdepre.cbMesClick(Sender: TObject);
begin
  Case dsdepre.State of
   dsEdit,
   dsInsert : FDepre.MES := cbMes.ItemIndex + 1;
  End;
end;

procedure Tfrmdepre.plAbrirArquivos;
begin
  FDepre := TDEPRE.Create(Self);
  FDepre.Carrega(False);
  dsdepre.DataSet := FDepre;
end;

procedure Tfrmdepre.plFecharArquivos;
begin
  FDepre.Free;
end;

procedure Tfrmdepre.FormCreate(Sender: TObject);
begin
  plAbrirArquivos;
end;

procedure Tfrmdepre.FormDestroy(Sender: TObject);
begin
  plFecharArquivos;
end;

end.
