unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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

Type EnumTipoCampo = (eNenhum, eTexto, eNumero, eData);  

type
  TFrmPesquisa = class(TForm)
    pnRodape: TPanel;
    pnTop: TPanel;
    pnGrid: TPanel;
    pnCabecalho: TPanel;
    lblPesquisa: TLabel;
    edCampo: TEdit;
    ADOQueryPesquisa: TADOQuery;
    dsConsulta: TDataSource;
    btnSair: TBitBtn;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure edCampoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCampoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    FCampoCondicao : String;
    FTabela        : String;
    FTipoCampo     : EnumTipoCampo;
    procedure ExecutaConsulta;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Consulta      : TADOQuery     read  ADOQueryPesquisa write ADOQueryPesquisa;
    property CampoCondicao : String        write FCampoCondicao;
    property Tabela        : String        write FTabela;
    property TipoCampo     : EnumTipoCampo write FTipoCampo;
    Function Execute       : Boolean;
    Procedure DefineCampos(Campos  : array of String);
  end;


implementation
Uses
  Parametros,
  uGetFunctions;

{$R *.dfm}

{ TFrmPesquisa }


constructor TFrmPesquisa.Create(AOwner: TComponent);
begin
  inherited;
  KeyPreview := False;
  ADOQueryPesquisa.Connection :=  TUniqueParametros.GetParametros.Conexao;
end;


procedure TFrmPesquisa.DefineCampos(Campos  : array of String);
Var
  Indice : Integer;
begin
//  DBGridConsulta.Columns.Clear;
  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  For Indice := Low(Campos) To High(Campos) Do
     Begin
       With cxGrid1DBTableView1 Do
          Begin
            CreateColumn;
            Columns[Indice].DataBinding.FieldName := Campos[Indice];
            Columns[Indice].Caption := PrimeiraLetraMaiscula(Campos[Indice]);
//            Items[Indice].FieldName :=
          End;
     End;
  ExecutaConsulta;
end;

destructor TFrmPesquisa.Destroy;
begin
  ADOQueryPesquisa.Active := False;
  inherited;
end;

function TFrmPesquisa.Execute: Boolean;
begin
  Result := True;
  Try
    ShowModal;
  Except
    Result := False;
  End;
end;

procedure TFrmPesquisa.ExecutaConsulta;
begin
  If   Trim(edCampo.Text) <> '' Then
       Begin
         ADOQueryPesquisa.Close;
         ADOQueryPesquisa.SQL.Clear;
         ADOQueryPesquisa.SQL.Add('SELECT * FROM ' + FTabela);
         Case FTipoCampo of
           eNumero : ADOQueryPesquisa.SQL.Add(' WHERE ' + FCampoCondicao + ' = ' + edCampo.Text);
           Else ADOQueryPesquisa.SQL.Add(' WHERE ' + FCampoCondicao + ' LIKE ' + AnsiQuotedStr(UpperCase(edCampo.Text) +'%','"'));
         End;
         ADOQueryPesquisa.Open;
         If   Not ADOQueryPesquisa.Active Then
              ADOQueryPesquisa.Active := True;
       End
  Else
       Begin
         ADOQueryPesquisa.Close;
         ADOQueryPesquisa.SQL.Clear;
         ADOQueryPesquisa.SQL.Add('SELECT * FROM '+FTabela);
         ADOQueryPesquisa.Open;
         If   Not ADOQueryPesquisa.Active Then
              ADOQueryPesquisa.Active := True;
       End;
end;

procedure TFrmPesquisa.edCampoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  ExecutaConsulta;
end;

procedure TFrmPesquisa.edCampoKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       ExecutaConsulta;
end;

procedure TFrmPesquisa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisa.FormCreate(Sender: TObject);
begin
  CentralizarForm(Self);
end;

procedure TFrmPesquisa.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  Close;
end;

end.
