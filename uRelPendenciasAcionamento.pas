unit uRelPendenciasAcionamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  AdoDB, uFreeReport,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmPendenciasAcionamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    edCodigo: TEdit;
    edNome: TEdit;
    dtpInicio: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnImprime: TBitBtn;
    btnFind: TSpeedButton;
    btnSair: TBitBtn;
    cbConfigurar: TCheckBox;
    procedure btnImprimeClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure plProcuraCredor;
  public
    procedure plImprimeRelCobrancasPendentesAcionamentos(clCredor  : Integer;
        dtInicial, dtFinal   : TDateTime; cbConfigurar : Boolean);
    { Public declarations }

  end;

  Procedure RelPendenciasAcionamento;


implementation
Uses
  Parametros,
  uPesquisa;

{$R *.dfm}

Procedure RelPendenciasAcionamento;
var
  frmPendenciasAcionamento: TfrmPendenciasAcionamento;
Begin
  frmPendenciasAcionamento := TfrmPendenciasAcionamento.Create(Application);
  Try
    frmPendenciasAcionamento.ShowModal;
  Finally
    frmPendenciasAcionamento.Free;
  End;
End;

procedure TfrmPendenciasAcionamento.btnImprimeClick(Sender: TObject);
begin
  Try
     plImprimeRelCobrancasPendentesAcionamentos(StrToInt(edCodigo.Text),dtpInicio.Date,dtpFinal.Date,cbConfigurar.Checked);
  Except
    On E: Exception Do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmPendenciasAcionamento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPendenciasAcionamento.plProcuraCredor;
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

procedure TfrmPendenciasAcionamento.btnFindClick(Sender: TObject);
begin
  plProcuraCredor;
end;

procedure TfrmPendenciasAcionamento.FormCreate(Sender: TObject);
begin
  dtpInicio.Date := Date;
  dtpFinal.Date  := Date;
end;

procedure TfrmPendenciasAcionamento.plImprimeRelCobrancasPendentesAcionamentos(
    clCredor  : Integer; dtInicial, dtFinal   : TDateTime; cbConfigurar :
    Boolean);
var
  FConsulta       : TADOQuery;
  FFreeReport     : TFreeReport;
  FMyDataset      : TfrMyDBDataset;
begin
  FConsulta       := TADOQuery.Create(Self);
  FConsulta.Name  := 'QUERY_PENDENTES_ACIONAMENTOS';
  FFreeReport     := TFreeReport.Create(Self);
  FMyDataset      := TfrMyDBDataset.Create(Self);
  FMyDataset.Name := 'FR_PENDENTES_ACIONAMENTOS';
  FMyDataset.DataSet := FConsulta;
  Try
   with FConsulta do
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
     SQL.Add('   A.COBRANCA, ');
     SQL.Add('   A.DATA_CADASTRO, ');
     SQL.Add('   A.VALOR_DIVIDA, ');
     SQL.Add('   E.DATA_ACIONAMENTO, ');
     SQL.Add('   E.USUARIO_INCLUSAO, ');
     SQL.Add('   E.HISTORICO ');
     SQL.Add(' FROM ');
     SQL.Add('   COBRANCA A, ');
     SQL.Add('   CREDOR C, ');
     SQL.Add('   DEVEDOR D, ');
     SQL.Add('   ACIONAMENTO E ');
     SQL.Add(' WHERE ');
     SQL.Add('   A.CREDOR = C.CODIGO_CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   A.DEVEDOR = D.CODIGO_DEVEDOR ');
     SQL.Add(' AND ');
     SQL.Add('   A.COBRANCA = E.COBRANCA ');
     SQL.Add(' AND ');
     SQL.Add('   A.CREDOR = :CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   A.SITUACAO = 0 ');
     SQL.Add(' AND ');
     SQL.Add('   A.DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL ');
     SQL.Add(' ORDER BY ');
     SQL.Add('     A.CREDOR, ');
     SQL.Add('     D.NOME_DEVEDOR, ');
     SQL.Add('     A.COBRANCA, ');
     SQL.Add('     E.DATA_ACIONAMENTO');

     Parameters.ParamByName('CREDOR').Value      := clCredor;
     Parameters.ParamByName('DATAINICIAL').Value := dtInicial;
     Parameters.ParamByName('DATAFINAL').Value   := dtFinal;

     Prepared;
     Open;
     Active := True;

     If   Not Eof Then
          Begin

            If    FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor_Acionamentos.frf') Then
                  FFreeReport.Arquivo   := TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor_Acionamentos.frf';

            If   cbConfigurar Then
                 FFreeReport.Desenhar
            Else FFreeReport.Visualiza;

          End;
   End;
  Finally
    FreeAndNil(FMyDataset);
    FreeAndNil(FConsulta);
    FreeAndNil(FFreeReport);
  End;
end;

end.
