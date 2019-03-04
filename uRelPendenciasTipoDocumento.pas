unit uRelPendenciasTipoDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  AdoDB, uFreeReport,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, DB;

type
  TfrmPendenciasTipoDocumento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    edCodigo: TEdit;
    edNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnImprime: TBitBtn;
    btnFind: TSpeedButton;
    btnSair: TBitBtn;
    dsTipoDocumento: TDataSource;
    edTipoDocumento: TEdit;
    lblTipoDocumento: TLabel;
    edCodigoTipoDocumento: TEdit;
    btnProcurar: TButton;
    cbConfigurar: TCheckBox;
    procedure btnImprimeClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
  private
    procedure plImprimeRelCobrancasPendentesTipoDocumento(clCredor, clTipoDocumento
        : Integer; Configurar : Boolean);
    { Private declarations }
    procedure plProcuraCredor;
    { Private declarations }
    procedure plProcuraTipoDocumento;
  public
    { Public declarations }

  end;

  Procedure RelPendenciasTipoDocumento;


implementation
Uses
  Parametros,
  uPesquisa;

{$R *.dfm}

Procedure RelPendenciasTipoDocumento;
var
  frmPendenciasTipoDocumento: TfrmPendenciasTipoDocumento;
Begin
  frmPendenciasTipoDocumento := TfrmPendenciasTipoDocumento.Create(Application);
  Try
    frmPendenciasTipoDocumento.ShowModal;
  Finally
    frmPendenciasTipoDocumento.Free;
  End;
End;

procedure TfrmPendenciasTipoDocumento.btnImprimeClick(Sender: TObject);
begin
  Try
    plImprimeRelCobrancasPendentesTipoDocumento(StrToInt(edCodigo.Text),
                                                      StrToInt(edCodigoTipoDocumento.Text),
                                                      cbConfigurar.Checked);
  Except
    On E: Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmPendenciasTipoDocumento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPendenciasTipoDocumento.plProcuraCredor;
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

procedure TfrmPendenciasTipoDocumento.btnFindClick(Sender: TObject);
begin
  plProcuraCredor;
end;

procedure TfrmPendenciasTipoDocumento.plProcuraTipoDocumento;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'TIPO_DOCUMENTO';
    FConsulta.DefineCampos(['TIPO_DOCUMENTO','SIGLA_DOCUMENTO','DESCRICAO']);
    FConsulta.CampoCondicao := 'TIPO_DOCUMENTO';
    If   FConsulta.Execute Then
         Begin
           edCodigoTipoDocumento.Text := IntToStr(FConsulta.Consulta.FieldByName('TIPO_DOCUMENTO').AsInteger);
           edTipoDocumento.Text       := FConsulta.Consulta.FieldByName('DESCRICAO').AsString;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmPendenciasTipoDocumento.btnProcurarClick(Sender: TObject);
begin
  plProcuraTipoDocumento;
end;

procedure TfrmPendenciasTipoDocumento.plImprimeRelCobrancasPendentesTipoDocumento(
    clCredor, clTipoDocumento : Integer; Configurar : Boolean);
var
  FConsulta       : TADOQuery;
  FFreeReport     : TFreeReport;
  FMyDataset      : TfrMyDBDataset;
begin
  FConsulta       := TADOQuery.Create(Self);
  FConsulta.Name  := 'Query_Pendencia_TipoDocumento';
  FFreeReport     := TFreeReport.Create(Self);
  FMyDataset      := TfrMyDBDataset.Create(Self);
  FMyDataset.Name := 'FrCobrancasPendentesTipoDocumento';
  FMyDataset.DataSet := FConsulta;
  Try
   with FConsulta do
   begin
     Connection := TUniqueParametros.GetParametros.Conexao;
     Parameters.AddParameter.Name := 'CREDOR';
     Parameters.AddParameter.Name := 'TIPO_DOCUMENTO';
     Close;
     SQL.Clear;
     SQL.Add(' SELECT ');
     SQL.Add('   C.CREDOR, ');
     SQL.Add('   R.NOME_CREDOR, ');
     SQL.Add('   C.DEVEDOR, ');
     SQL.Add('   D.NOME_DEVEDOR, ');
     SQL.Add('   I.DATA_DIVIDA, ');
     SQL.Add('   I.TIPODOCUMENTO, ');
     SQL.Add('   T.SIGLA_DOCUMENTO, ');
     SQL.Add('   T.DESCRICAO, ');
     SQL.Add('   I.NUMERO_DOCUMENTO, ');
     SQL.Add('   I.VALOR_DOCUMENTO ');
     SQL.Add(' FROM COBRANCA C, ');
     SQL.Add('   ITENS_COBRANCA I, ');
     SQL.Add('   TIPO_DOCUMENTO T, ');
     SQL.Add('   CREDOR R, ');
     SQL.Add('   DEVEDOR D ');
     SQL.Add(' WHERE ');
     SQL.Add('   C.COBRANCA = I.COBRANCA ');
     SQL.Add(' AND ');
     SQL.Add('   I.TIPODOCUMENTO = T.TIPO_DOCUMENTO ');
     SQL.Add(' AND ');
     SQL.Add('   C.CREDOR = R.CODIGO_CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   C.DEVEDOR = D.CODIGO_DEVEDOR ');
     SQL.Add(' AND ');
     SQL.Add('   C.SITUACAO = 0 ');
     SQL.Add(' AND ');
     SQL.Add('   C.CREDOR = :CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   I.TIPODOCUMENTO = :TIPO_DOCUMENTO ');
     SQL.Add(' ORDER BY ');
     SQL.Add('   C.CREDOR, ');
     SQL.Add('   D.NOME_DEVEDOR ');

     Parameters.ParamByName('CREDOR').Value         := clCredor;
     Parameters.ParamByName('TIPO_DOCUMENTO').Value := clTipoDocumento;

     Prepared;
     Open;
     Active := True;

     FFreeReport.plAdicionaVariavel('vCredor',FConsulta.FieldByName('NOME_CREDOR').AsString);
     FFreeReport.plAdicionaVariavel('vTipoDocumento',FConsulta.FieldByName('DESCRICAO').AsString);

     If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor_TipoDocumentos.frf') Then
          FFreeReport.Arquivo   := TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor_TipoDocumentos.frf';

     If   Configurar Then
          FFreeReport.Desenhar
     Else FFreeReport.Visualiza;

   End;
  Finally
    FreeAndNil(FMyDataset);
    FreeAndNil(FConsulta);
    FreeAndNil(FFreeReport);
  End;
end;

end.
