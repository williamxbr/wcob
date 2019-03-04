unit uRelPendenciasCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ADODB, uFreeReport,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB;

type
  TfrmPendenciasCredor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    edCodigo: TEdit;
    edNome: TEdit;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnImprime: TBitBtn;
    btnFind: TSpeedButton;
    btnSair: TBitBtn;
    QU_PENDENCIAS_CREDOR: TADOQuery;
    cbConfigurar: TCheckBox;
    procedure btnImprimeClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure plImprimeRelCobrancasPendentes(clCredor  : Integer; dtInicial,
        dtFinal   : TDateTime);
    { Private declarations }
    procedure plProcuraCredor;
  public
    { Public declarations }

  end;

  Procedure RelPendenciasCredor;


implementation
Uses
  Parametros,
  uPesquisa;

{$R *.dfm}

Procedure RelPendenciasCredor;
var
  frmPendenciasCredor: TfrmPendenciasCredor;
Begin
  frmPendenciasCredor := TfrmPendenciasCredor.Create(Application);
  Try
    frmPendenciasCredor.ShowModal;
  Finally
    frmPendenciasCredor.Free;
  End;
End;

procedure TfrmPendenciasCredor.btnImprimeClick(Sender: TObject);
begin
  Try
    plImprimeRelCobrancasPendentes(StrToInt(edCodigo.Text),dtpInicial.Date,dtpFinal.Date);
  Except
    On E: Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmPendenciasCredor.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPendenciasCredor.plProcuraCredor;
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
           edCodigo.Text := IntToStr(FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsInteger);
           edNome.Text   := FConsulta.Consulta.FieldByName('NOME_CREDOR').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmPendenciasCredor.btnFindClick(Sender: TObject);
begin
  plProcuraCredor;
end;

procedure TfrmPendenciasCredor.FormCreate(Sender: TObject);
begin
  dtpInicial.DateTime := Now;
  dtpFinal.DateTime   := Now;
  cbConfigurar.Enabled := TUniqueParametros.GetParametros.Privilegiado;   
end;

procedure TfrmPendenciasCredor.plImprimeRelCobrancasPendentes(clCredor  :
    Integer; dtInicial, dtFinal   : TDateTime);
Var
  FFreeReport  : TFreeReport;
  FFreeDataset : TfrMyDBDataset;
begin
  Try
   FFreeReport          := TFreeReport.Create(Self);
   FFreeDataset         := TfrMyDBDataset.Create(Self);
   FFreeDataset.Name    := 'FrPendencias_Credor';
   FFreeDataset.DataSet := QU_PENDENCIAS_CREDOR;
   with QU_PENDENCIAS_CREDOR do
   begin
     Connection := TUniqueParametros.GetParametros.Conexao;
     Parameters.AddParameter.Name := 'CREDOR';
     Parameters.AddParameter.Name := 'DATAINICIAL';
     Parameters.AddParameter.Name := 'DATAFINAL';
     Close;
     SQL.Clear;
     SQL.Add(' SELECT ');
     SQL.Add('   A.CREDOR, ');
     SQL.Add('   C.NOME_CREDOR, ');
     SQL.Add('   A.DEVEDOR, ');
     SQL.Add('   D.NOME_DEVEDOR, ');
     SQL.Add('   D.CNPJ_CPF, ');
     SQL.Add('   T.SIGLA_DOCUMENTO, ');
     SQL.Add('   A.COBRANCA, ');
     SQL.Add('   B.ITEM, ');
     SQL.Add('   B.NUMERO_DOCUMENTO, ');
     SQL.Add('   B.EMISSAO_DOCUMENTO, ');
     SQL.Add('   B.DATA_DIVIDA, ');
     SQL.Add('   B.VENCIMENTO_DOCUMENTO, ');
     SQL.Add('   B.VALOR_DOCUMENTO ');
     SQL.Add(' FROM ');
     SQL.Add('   COBRANCA A, ');
     SQL.Add('   ITENS_COBRANCA B, ');
     SQL.Add('   CREDOR C, ');
     SQL.Add('   DEVEDOR D, ');
     SQL.Add('   TIPO_DOCUMENTO T ');
     SQL.Add(' WHERE ');
     SQL.Add('   A.COBRANCA = B.COBRANCA ');
     SQL.Add(' AND ');
     SQL.Add('   A.CREDOR = C.CODIGO_CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   A.DEVEDOR = D.CODIGO_DEVEDOR ');
     SQL.Add(' AND ');
     SQL.Add('   B.TIPODOCUMENTO = T.TIPO_DOCUMENTO ');
     SQL.Add(' AND ');
     SQL.Add('   A.CREDOR = :CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   A.SITUACAO = 0 ');
     SQL.Add(' AND ');
     SQL.Add('   B.DATA_DIVIDA BETWEEN :DATAINICIAL AND :DATAFINAL ');
     SQL.Add(' ORDER BY ');
     SQL.Add('     D.NOME_DEVEDOR, ');
     SQL.Add('     B.DATA_DIVIDA, ');
     SQL.Add('     B.VENCIMENTO_DOCUMENTO ');
     Parameters.ParamByName('CREDOR').Value      := clCredor;
     Parameters.ParamByName('DATAINICIAL').Value := dtInicial;
     Parameters.ParamByName('DATAFINAL').Value   := dtFinal;
     Prepared;
     Open;
     Active := True;
     FFreeReport.plAdicionaVariavel('vCredor',QU_PENDENCIAS_CREDOR.FieldByName('NOME_CREDOR').AsString);
     FFreeReport.plAdicionaVariavel('vDataInicial',DateToStr(dtInicial));
     FFreeReport.plAdicionaVariavel('vDataFinal',DateToStr(dtFinal));
     FFreeReport.plAdicionaVariavel('vRelatorio',TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor.frf');
     If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor.frf') Then
          Begin
            FFreeReport.Arquivo := TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor.frf';
            If   cbConfigurar.Checked Then
                 FFreeReport.Desenhar
            Else FFreeReport.Visualiza;
          End
     Else
          FFreeReport.Desenhar;
   End;
  Finally
    FreeAndNil(FFreeDataset);
    FreeAndNil(FFreeReport);
  End;
end;

end.
