unit uBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids,
  ucLayBanco,
  jpeg, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  cxContainer, cxDBEdit, cxLabel, cxNavigator,
  cxDBNavigator, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint;

type THackDBNavigator = class(TDBNavigator);

type
  TfrmBanco = class(TForm)
    pnRodape: TPanel;
    gbRodape: TGroupBox;
    spSair: TSpeedButton;
    DBNavBanco: TDBNavigator;
    pnTop: TPanel;
    lblAlines: TLabel;
    pnTela: TPanel;
    dsBanco: TDataSource;
    lbNumero: TLabel;
    lblBanco: TLabel;
    Image1: TImage;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1NUMERO_BANCO1: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_BANCO1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DBXNUMERO_BANCO: TcxDBTextEdit;
    DBXNOME_BANCO: TcxDBTextEdit;
    procedure spSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FBanco : TBANCO;
    procedure plInicializa;
    procedure FecharTabelas;
    procedure SetupHackedNavigator(const Navigator : TDBNavigator);
  public
    { Public declarations }
  end;

  procedure CallBanco;

implementation
Uses
  uGetFunctions;

{$R *.dfm}

procedure CallBanco;
var
  frmBanco: TfrmBanco;
Begin
  frmBanco := TfrmBanco.Create(Application);
  Try
    frmBanco.ShowModal;
  Finally
    FreeAndNil(frmBanco);
  End;
End;

procedure TfrmBanco.FecharTabelas;
begin
  FBanco.Free;
end;

procedure TfrmBanco.SetupHackedNavigator(const Navigator: TDBNavigator);
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

procedure TfrmBanco.spSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  plInicializa;
  SetupHackedNavigator(DBNavBanco);
  CentralizarForm(Self);
end;

procedure TfrmBanco.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmBanco.plInicializa;
begin
  FBanco := TBANCO.Create(Self);
  FBanco.Carrega(False);
  dsBanco.DataSet := FBanco;
end;

end.
