unit uImprimeAvisoDevedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, ADODB,
  Dialogs, Buttons, StdCtrls, ExtCtrls,
  ucLayCredor, ucLayDevedor, ucLayAviso, ucLayItens_Aviso, uFreeReport,
  ComCtrls;

type
  TfrmAvisoDevedor = class(TForm)
    Panel1: TPanel;
    pnRodape: TPanel;
    btnSair: TBitBtn;
    cbConfigurar: TCheckBox;
    Panel2: TPanel;
    btnImprime: TBitBtn;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    DateTimePicker1: TDateTimePicker;
    Panel4: TPanel;
    btnAdicionaNatOperacao: TBitBtn;
    btnRemoveNatOperacao: TBitBtn;
    BitBtn1: TBitBtn;
    btnGrava: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Public declarations }
    procedure AbrirArquivos;
    procedure FecharArquivos;
    procedure plBusca;
    procedure plImprimeAvisoDevedor(clDevedor  : Integer; Configura : Boolean);
    { Private declarations }
  public
  end;

  procedure callImprimeAvisoDevedor;


implementation
Uses
  uPesquisa,
  Parametros;

{$R *.dfm}

procedure callImprimeAvisoDevedor;
var
  frmImprimeAvisoDevedor: TfrmAvisoDevedor;
Begin
  frmImprimeAvisoDevedor := TfrmAvisoDevedor.Create(Application);
  Try
    frmImprimeAvisoDevedor.ShowModal;
  Finally
    frmImprimeAvisoDevedor.Free;
  End;
End;

procedure TfrmAvisoDevedor.AbrirArquivos;
begin
  If   TUniqueParametros.GetParametros.Privilegiado Then
       cbConfigurar.Visible := True;
end;

procedure TfrmAvisoDevedor.FecharArquivos;
begin
end;

procedure TfrmAvisoDevedor.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
end;

procedure TfrmAvisoDevedor.FormDestroy(Sender: TObject);
begin
  FecharArquivos
end;

procedure TfrmAvisoDevedor.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvisoDevedor.plImprimeAvisoDevedor(clDevedor  : Integer;
    Configura : Boolean);
Var
  FFreeReport  : TFreeReport;
  FFreeDataset : TfrMyDBDataset;
begin

end;

procedure TfrmAvisoDevedor.btnImprimeClick(Sender: TObject);
begin
//  plImprimeAvisoDevedor(StrToInt(edDevedor.Text),cbConfigurar.Checked);
end;

procedure TfrmAvisoDevedor.plBusca;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['CODIGO_DEVEDOR','NOME_DEVEDOR']);
    FConsulta.CampoCondicao := 'NOME_DEVEDOR';
    If   FConsulta.Execute Then
         Begin
//           edDevedor.Text     := FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsVariant;
//           edNomeDevedor.Text := FConsulta.Consulta.FieldByName('NOME_DEVEDOR').AsVariant;
         End;
  Finally
    FConsulta.Free;
  End;
end;

end.
