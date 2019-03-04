unit uConsultaClienteResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DBClient, ComCtrls,
  Dialogs, Grids, DBGrids, DB, ExtCtrls, StdCtrls, Buttons, OleServer,
  uLayConsultaClienteResumo,
  ucLayCredor, ucLayCobranca,
  uGetFunctions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  cxGridExportLink, ShellApi,
  Menus, cxButtons, cxContainer, cxLabel, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinValentine, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type

  TfrmConsultaResumoCredor = class(TForm)
    dsClienteResumo: TDataSource;
    pnRodape: TPanel;
    pnTop: TPanel;
    pnTela: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CODIGO_CREDOR1: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_CREDOR1: TcxGridDBColumn;
    cxGrid1DBTableView1CARTEIRA1: TcxGridDBColumn;
    cxGrid1DBTableView1ABERTO1: TcxGridDBColumn;
    cxGrid1DBTableView1ACORDO1: TcxGridDBColumn;
    cxGrid1DBTableView1QUITADOS1: TcxGridDBColumn;
    cxGrid1DBTableView1VENCIDAS1: TcxGridDBColumn;
    cxGrid1DBTableView1ENCERRADAS1: TcxGridDBColumn;
    cxGrid1DBTableView1ACIONADAS1: TcxGridDBColumn;
    cxGrid1DBTableView1NAO_ACIONADAS1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxbSair: TcxButton;
    cxbExcel: TcxButton;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxbSairClick(Sender: TObject);
    procedure cxbExcelClick(Sender: TObject);
  private
    FCredor   : TSimplesCREDOR;
    FCobranca : TSimplesCOBRANCA;
    tbClienteResumo : TConsultoClienteResumo;
    { Private declarations }
    procedure plCriarClienteResumo;
    procedure plCarregarDados;
  public
    { Public declarations }
  end;


  procedure plCarregarClienteResumo;

implementation
Uses
  Parametros,
  uAguarde;

{$R *.dfm}

{ TForm1 }


procedure plCarregarClienteResumo;
var
  frmConsultaResumoCredor : TfrmConsultaResumoCredor;
Begin
   frmConsultaResumoCredor := TfrmConsultaResumoCredor.Create(Application);
   Try
     frmConsultaResumoCredor.ShowModal;
   Finally
     FreeAndNil(frmConsultaResumoCredor);
   End;
End;

procedure TfrmConsultaResumoCredor.plCriarClienteResumo;
begin
end;

procedure TfrmConsultaResumoCredor.FormCreate(Sender: TObject);
begin
  FCredor := TSimplesCREDOR.Create(Self);
  FCobranca := TSimplesCOBRANCA.Create(Self);
  tbClienteResumo := TConsultoClienteResumo.Create(Self);
  dsClienteResumo.DataSet := tbClienteResumo;
  plCarregarDados;
end;

procedure TfrmConsultaResumoCredor.plCarregarDados;
Var
  ldAberto,
  ldAcordo,
  ldFechado : Double;
  Ind  : Integer;
begin
  Ind := 0;
  FCredor.CarregaSQL;
  FCredor.First;
  ShowWait('Carregando....Aguarde!');
  While Not FCredor.Eof Do
  Begin
    Inc(Ind);
    GaugeWait(Round(Ind/FCredor.RecordCount*100));

    FCobranca.CREDOR := FCredor.CODIGO_CREDOR;
    FCobranca.CarregaSQL;
    ldAberto      := 0.00;
    ldAcordo      := 0.00;
    ldFechado     := 0.00;
    While Not(FCobranca.Eof) Do
    Begin
        Case FCobranca.SITUACAO of
         0 :  ldAberto  := ldAberto + FCobranca.VALOR_DIVIDA;
         1 :  ldAcordo  := ldAcordo + FCobranca.VALOR_DIVIDA;
         Else ldFechado := ldFechado + FCobranca.VALOR_DIVIDA;
        End;
        FCobranca.Next;
    End;

    With tbClienteResumo do
    Begin
      Append;
      CODIGO_CREDOR := FCredor.CODIGO_CREDOR;
      NOME_CREDOR   := FCredor.NOME_CREDOR;
      CARTEIRA      := ldAberto + ldAcordo + ldFechado;
      ABERTO        := ldAberto;
      ACORDO        := ldAcordo;
      QUITADOS      := 0.00;
      VENCIDAS      := 0.00;
      ENCERRADAS    := ldFechado;
      ACIONADAS     := 0;
      NAO_ACIONADAS := 0;
      Post;
    End;

    FCredor.Next;
  End;
  HideWait;
end;

procedure TfrmConsultaResumoCredor.FormDestroy(Sender: TObject);
begin
  tbClienteResumo.Free;
  FCredor.Free;
  FCobranca.Free;
end;

procedure TfrmConsultaResumoCredor.cxbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaResumoCredor.cxbExcelClick(Sender: TObject);
begin
  ExportGridToExcel(TUniqueParametros.GetParametros.DatabaseWork+'ClienteResumo.xls',cxGrid1);
  ShellExecute(0, 'open', PChar(TUniqueParametros.GetParametros.DatabaseWork+'ClienteResumo.xls'), '', '', sw_ShowNormal);
end;

end.
