unit uGerarRepasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayRepasse,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmGerarRepasse = class(TForm)
    pnTop: TPanel;
    pnTela: TPanel;
    pnRodape: TPanel;
    gbTela: TGroupBox;
    Label1: TLabel;
    edCodigoCredor: TEdit;
    edNomeCredor: TEdit;
    dtDataRepasse: TDateTimePicker;
    Label2: TLabel;
    sbBusca: TSpeedButton;
    lblGeracaoRepasse: TLabel;
    btnSair: TBitBtn;
    btnGrava: TBitBtn;
    lblNumeroRepasse: TLabel;
    Label3: TLabel;
    edDescricao: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
  private
    FRepasse : TREPASSE;
    procedure AbrirArquivos;
    procedure FecharArquivos;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure plGerarRepasse;

implementation
Uses
  uPesquisa,
  DB;

{$R *.dfm}

procedure plGerarRepasse;
var
  frmGerarRepasse: TfrmGerarRepasse;
Begin
  frmGerarRepasse := TfrmGerarRepasse.Create(Application);
  Try
    frmGerarRepasse.ShowModal;
  Finally
    FreeAndNil(frmGerarRepasse);
  End;
End;

procedure TfrmGerarRepasse.AbrirArquivos;
begin
  FRepasse := TREPASSE.Create(Self);
  FRepasse.Carrega(False);
end;

procedure TfrmGerarRepasse.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerarRepasse.sbBuscaClick(Sender: TObject);
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
           edCodigoCredor.Text := FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsVariant;
           edNomeCredor.Text   := FConsulta.Consulta.FieldByName('NOME_CREDOR').AsVariant;
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmGerarRepasse.FecharArquivos;
begin
  FRepasse.Free;
end;

procedure TfrmGerarRepasse.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
  dtDataRepasse.Date := Date;
end;

procedure TfrmGerarRepasse.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TfrmGerarRepasse.btnGravaClick(Sender: TObject);
begin
  Try
    FRepasse.Insert;
    FRepasse.IDCREDOR := StrToInt(edCodigoCredor.Text);
    FRepasse.DATA_REPASSE := dtDataRepasse.Date;
    FRepasse.DESCRICAO    := edDescricao.Text;
    FRepasse.VALOR_REPASSE := 0.00;
    FRepasse.SITUACAO := 0;
    FRepasse.Post;
    lblNumeroRepasse.Caption := 'Numero do Repasse : ' + IntToStr(FRepasse.IDREPASSE);
  Except
    On E: Exception Do
       Begin
         FRepasse.Cancel;
         ShowMessage(E.Message);
       End;
  End;
end;

end.
