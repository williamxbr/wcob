unit uTipoSituacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uclayTipo_Situacao,
  NumericEdit,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls, DB, Buttons, Mask;

type
  TfrmTipoSituacao = class(TForm)
    pnTop: TPanel;
    Label1: TLabel;
    pnBottom: TPanel;
    pnDados: TPanel;
    gbIdCobrador: TGroupBox;
    pnIdCobrador: TPanel;
    gbNome: TGroupBox;
    edNomeSituacao: TEdit;
    rgTipo: TRadioGroup;
    btnSair: TBitBtn;
    btnGrava: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ieTipoSituacaoOnExit(Sender : TObject);
    procedure ieTipoSituacaoBtnClick(Sender : TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ieTipoSituacao : TIntegerEdit;
    FTipoSituacao  : TTIPO_SITUACAO;
    procedure AbrirTabelas;
    procedure CentralizarForm;
    procedure FecharTabelas;
    procedure plComponentes;
    procedure plLimpar;
  public
    { Public declarations }
  end;

  procedure CallTipoSituacao;

implementation
Uses
  uPesquisa;

{$R *.dfm}

procedure CallTipoSituacao;
var
  frmTipoSituacao: TfrmTipoSituacao;
Begin
  frmTipoSituacao := TfrmTipoSituacao.Create(Application);
  Try
    frmTipoSituacao.ShowModal;
  Finally
    frmTipoSituacao.Free;
  End;
End;

procedure TfrmTipoSituacao.AbrirTabelas;
begin
  FTipoSituacao := TTIPO_SITUACAO.Create(Self);
  FTipoSituacao.Carrega(False);
end;

{ TfrmTipoSituacao }

procedure TfrmTipoSituacao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTipoSituacao.CentralizarForm;
var 
  r   : TRect;
  osv : TOSVersionInfo;
begin
  osv.dwOSVersionInfoSize := sizeof(osv);
  GetVersionEx(osv);
  if    osv.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
        begin
          SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);
          Left := ((r.right - r.left) - Width) div 2;
          Top := ((r.bottom - r.top) - Height) div 2;
        end
  else  begin
          Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
          Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
        end;
end;

procedure TfrmTipoSituacao.FecharTabelas;
begin
  FTipoSituacao.Free;
end;

procedure TfrmTipoSituacao.FormCreate(Sender: TObject);
begin
  plComponentes;
  CentralizarForm;
  AbrirTabelas;
end;

procedure TfrmTipoSituacao.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmTipoSituacao.ieTipoSituacaoBtnClick(Sender: TObject);
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'TIPO_SITUACAO';
    FConsulta.DefineCampos(['TIPO_SITUACAO','DESCRICAO_SITUACAO']);
    FConsulta.CampoCondicao := 'DESCRICAO_SITUACAO';
    If   FConsulta.Execute Then
         Begin
           ieTipoSituacao.IntegerNumber := FConsulta.Consulta.FieldByName('TIPO_SITUACAO').AsInteger;
           ieTipoSituacaoOnExit(Sender);
         End;
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmTipoSituacao.ieTipoSituacaoOnExit(Sender: TObject);
begin
  If   FTipoSituacao.FindBypk_TipoSituacao(ieTipoSituacao.IntegerNumber) Then
       Begin
         edNomeSituacao.Text := FTipoSituacao.DESCRICAO_SITUACAO;
         rgTipo.ItemIndex    := FTipoSituacao.SITUACAO;
       End;
end;

procedure TfrmTipoSituacao.plComponentes;
begin
  ieTipoSituacao := TIntegerEdit.Create(Self);
  With ieTipoSituacao Do
    Begin
      Parent     := pnIdCobrador;
      Name       := 'ieTipoSituacao';
      Align      := alClient;
      OnExit     := ieTipoSituacaoOnExit;
      ShowButton := True;
      OnBtnClick := ieTipoSituacaoBtnClick;
    End;
end;

procedure TfrmTipoSituacao.btnGravaClick(Sender: TObject);
begin
  Try
    If   FTipoSituacao.FindBypk_TipoSituacao(ieTipoSituacao.IntegerNumber) Then
         FTipoSituacao.Edit
    Else FTipoSituacao.Insert;
    FTipoSituacao.DESCRICAO_SITUACAO := edNomeSituacao.Text;
    FTipoSituacao.SITUACAO := rgTipo.ItemIndex;
    FTipoSituacao.Post;
    MessageDlg('Dados gravados com sucesso!',mtInformation,[mbOK],0);
    plLimpar;
  Except
    FTipoSituacao.Cancel;
  End;
end;

procedure TfrmTipoSituacao.plLimpar;
begin
  ieTipoSituacao.IntegerNumber := 0;
  edNomeSituacao.Text          := '';
  rgTipo.ItemIndex             := -1;
  ieTipoSituacao.SetFocus;
end;

procedure TfrmTipoSituacao.FormShow(Sender: TObject);
begin
  ieTipoSituacao.SetFocus;
end;

end.
