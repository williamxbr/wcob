unit uAlines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, Mask, Grids, DBGrids,
  ucLayAlines,
  ComCtrls, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint;

type THackDBNavigator = class(TDBNavigator);

type
  TfrmAlines = class(TForm)
    pnTop: TPanel;
    lblAlines: TLabel;
    pnRodape: TPanel;
    gbRodape: TGroupBox;
    spSair: TSpeedButton;
    DBNavAlines: TDBNavigator;
    dsAlines: TDataSource;
    pnTela: TPanel;
    pcAlines: TPageControl;
    tsCadastro: TTabSheet;
    tsConsulta: TTabSheet;
    gbAlines: TGroupBox;
    DBDESCRICAO_ALINIAS: TDBMemo;
    DBMOTIVO: TDBEdit;
    DBTIPO_ALINIAS: TDBComboBox;
    lblMotivo: TLabel;
    lblTipo: TLabel;
    lblDescricao: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1MOTIVO1: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO_ALINIAS1: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_ALINIAS1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure spSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FAlines  : TALINES;
    procedure plAbrirArquivos;
    procedure FecharTabelas;
    procedure SetupHackedNavigator(const Navigator : TDBNavigator);
  public
    { Public declarations }
  end;

  procedure CallAlines;

implementation
Uses
  uGetFunctions;

{$R *.dfm}

procedure CallAlines;
var
  frmAlines: TfrmAlines;
Begin
  frmAlines := TfrmAlines.Create(Application);
  Try
    frmAlines.ShowModal;
  Finally
    FreeAndNil(frmAlines);
  End;
End;

procedure TfrmAlines.FecharTabelas;
begin
  FAlines.Free;
end;

procedure TfrmAlines.spSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAlines.FormCreate(Sender: TObject);
begin
  plAbrirArquivos;
  SetupHackedNavigator(DBNavAlines);
  CentralizarForm(Self);
end;

procedure TfrmAlines.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmAlines.SetupHackedNavigator(const Navigator: TDBNavigator);

Const
  Captions : array[TNavigateBtn] of string =
      ('Primeiro', 'Anterior', 'Proximo', 'Ultimo', 'Inserir',
       'Deletar', 'Editar', 'Confirmar', 'Cancelar', 'Atualizar');

var
  btn : TNavigateBtn;

begin
  for   btn := Low(TNavigateBtn) to High(TNavigateBtn) do
  with  THackDBNavigator(Navigator).Buttons[btn] do
        begin
          Caption := Captions[btn];
          Layout  := blGlyphTop;
        end;
end;

procedure TfrmAlines.plAbrirArquivos;
begin
  FAlines := TALINES.Create(Self);
  FAlines.Carrega(False);
  dsAlines.DataSet := FAlines;
end;

end.
