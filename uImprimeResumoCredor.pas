unit uImprimeResumoCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, ucLayCredor,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TfrmResumoCredor = class(TForm)
    Panel1: TPanel;
    edCredor: TEdit;
    edNomeCredor: TEdit;
    sbBusca: TSpeedButton;
    pnRodape: TPanel;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cbConfigura: TCheckBox;
    procedure sbBuscaClick(Sender: TObject);
    procedure edCredorExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    FCredor : TCREDOR;
    procedure AbrirArquivos;
    procedure FecharArquivos;
    procedure pImprimirResumoCredor(Credor:LongInt;Configura : Boolean);
  public
    { Public declarations }
  end;

  procedure callImprimeResumoCredor;


implementation
Uses
  AdoDb,
  uFreeReport,
  uPesquisa,
  Parametros;

{$R *.dfm}

procedure callImprimeResumoCredor;
var
  frmResumoCredor: TfrmResumoCredor;
Begin
  frmResumoCredor := TfrmResumoCredor.Create(Application);
  Try
    frmResumoCredor.ShowModal;
  Finally
    frmResumoCredor.Free;
  End;
End;

procedure TfrmResumoCredor.sbBuscaClick(Sender: TObject);
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

procedure TfrmResumoCredor.edCredorExit(Sender: TObject);
begin
  If   Trim(edCredor.Text) <> '' Then
       Begin
         If   Not FCredor.Locate('CODIGO_CREDOR',StrToInt(edCredor.Text),[loPartialKey]) Then
              ShowMessage('Registro não encontrado')
         Else edNomeCredor.Text := FCredor.NOME_CREDOR;
       End;
End;
procedure TfrmResumoCredor.btnImprimirClick(Sender: TObject);
begin
  If   Trim(edCredor.Text) = '' Then
       pImprimirResumoCredor(0,cbConfigura.Checked)
  Else pImprimirResumoCredor(StrToInt(edCredor.Text),cbConfigura.Checked);
end;

procedure TfrmResumoCredor.AbrirArquivos;
begin
end;

procedure TfrmResumoCredor.FecharArquivos;
begin
end;

procedure TfrmResumoCredor.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
  cbConfigura.Visible := TUniqueParametros.GetParametros.Privilegiado;
end;

procedure TfrmResumoCredor.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TfrmResumoCredor.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmResumoCredor.pImprimirResumoCredor(Credor:LongInt;Configura :
    Boolean);
var
  FQuery   : TADOQuery;
  Report   : TFreeReport;
  FDataset : TfrMyDBDataset;
begin
  FQuery        := TADOQuery.Create(Self);
  FQuery.Name   := 'Q';
  Report        := TFreeReport.Create(Self);
  FDataset      := TfrMyDBDataset.Create(Self);
  FDataset.Name := 'FrResumoCredor';

  Try
    FQuery.Connection := TUniqueParametros.GetParametros.Conexao;
    FQuery.Parameters.Clear;
    FQuery.Parameters.AddParameter.Name := 'PCREDOR';

    FQuery.SQL.Add(' SELECT C.CREDOR, ');
    FQuery.SQL.Add('        A.NOME_CREDOR, ');
    FQuery.SQL.Add('        T.DESCRICAO_SITUACAO, ');
    FQuery.SQL.Add('        SUM(C.VALOR_DIVIDA) AS VALORES, ');
    FQuery.SQL.Add('        COUNT(*) AS QUANT ');
    FQuery.SQL.Add(' FROM COBRANCA C, CREDOR A, TIPO_SITUACAO T ');
    FQuery.SQL.Add(' WHERE C.CREDOR = A.CODIGO_CREDOR ');
    FQuery.SQL.Add(' AND C.SITUACAO = T.TIPO_SITUACAO ');

    If   Credor > 0 Then
         FQuery.SQL.Add(' AND C.CREDOR = :PCREDOR ');

    FQuery.SQL.Add(' GROUP BY C.CREDOR, A.NOME_CREDOR, T.DESCRICAO_SITUACAO ');
    FQuery.SQL.Add(' ORDER BY A.NOME_CREDOR ASC, COUNT(*) DESC ');

    If   Credor <> 0 Then
         FQuery.Parameters.ParamByName('PCREDOR').Value     := Credor;

    FQuery.Open;
    FQuery.Active := True;
    If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'ResumoCredor.frf') Then
         Begin
           Report.Arquivo :=  TUniqueParametros.GetParametros.DatabaseReport + 'ResumoCredor.frf';
           If   Configura Then
                Report.Desenhar
           Else Report.Visualiza;
         End
    Else Report.Desenhar;     
  Finally
    FreeAndNil(FDataset);
    FreeAndNil(FQuery);
    FreeAndNil(Report);
  End;
end;

end.
