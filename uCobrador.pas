unit uCobrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, Mask, Grids, DBGrids,
  NumericEdit,
  uclayCobrador, ucLayUsuario,
  ComCtrls, DB;

type THackDBNavigator = class(TDBNavigator);

type
  TfrmCobrador = class(TForm)
    pnTop: TPanel;
    lblAlines: TLabel;
    pnRodape: TPanel;
    gbRodape: TGroupBox;
    pnTela: TPanel;
    gbIdCobrador: TGroupBox;
    pnIdCobrador: TPanel;
    gbNome: TGroupBox;
    gbUsuario: TGroupBox;
    pnUsuario: TPanel;
    pnNomeUsuario: TPanel;
    ckAtivo: TCheckBox;
    btnGrava: TBitBtn;
    btnLimpar: TBitBtn;
    btnSair: TBitBtn;
    edNomeCobrador: TEdit;
    procedure spSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnieCobradorClick(Sender: TObject);
    procedure btnieCobradorOnExit(Sender: TObject);
    procedure btnieUsuarioClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
  private
    ieCobrador : TIntegerEdit;
    ieUsuario  : TIntegerEdit;
    FCobrador : TCOBRADOR;
    FSUsuario : TSimplesUSUARIO;
    procedure plFecharTabelas;
    procedure plAbrirTabelas;
    procedure plComponentes;
    procedure plProcuraCobrador;
    procedure plProcuraUsuario;
    procedure plGravarCobrador;
    procedure plCarregaCobrador;
    procedure plLimparCampos;
    procedure plConsistirUsuario;
  public
    { Public declarations }
  end;

  procedure CadastraCobrador;

implementation
Uses
  uPesquisa,
  uGetFunctions, Math;

{$R *.dfm}

procedure CadastraCobrador;
var
  frmCobrador: TfrmCobrador;
Begin
  frmCobrador := TfrmCobrador.Create(Application);
  Try
    frmCobrador.ShowModal;
  Finally
    FreeAndNil(frmCobrador);
  End;
End;

procedure TfrmCobrador.plFecharTabelas;
begin
  FCobrador.Free;
  FSUsuario.Free;
end;

procedure TfrmCobrador.spSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCobrador.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  CentralizarForm(Self);
  plComponentes;
end;

procedure TfrmCobrador.FormDestroy(Sender: TObject);
begin
  plFecharTabelas;
end;

procedure TfrmCobrador.plAbrirTabelas;
begin
  FSUsuario := TSimplesUSUARIO.Create(Self);
  FCobrador := TCOBRADOR.Create(Self);
end;

procedure TfrmCobrador.plComponentes;
begin
  ieCobrador := TIntegerEdit.Create(Self);
  With ieCobrador Do
    Begin
      Parent     := pnIdCobrador;
      Name       := 'ieCobrador';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := btnieCobradorClick;
      OnExit     := btnieCobradorOnExit;
    End;
  ieUsuario := TIntegerEdit.Create(Self);
  With ieUsuario Do
    Begin
      Parent     := pnUsuario;
      Name       := 'ieUsuario';
      Align      := alClient;
      ShowButton := True;
      OnBtnClick := btnieUsuarioClick;
//      OnExit     := ieCobradorOnExit;
    End;
end;

procedure TfrmCobrador.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCobrador.plProcuraCobrador;
Var
  FPesquisa : TFrmPesquisa;
begin
  FPesquisa := TFrmPesquisa.Create(Application);
  Try
    FPesquisa.Tabela := 'COBRADOR';
    FPesquisa.DefineCampos(['IDCOBRADOR','NOME_COBRADOR']);
    FPesquisa.CampoCondicao := 'NOME_COBRADOR';
    If   FPesquisa.Execute Then
         Begin
           ieCobrador.IntegerNumber := FPesquisa.Consulta.FieldByName('IDCOBRADOR').AsInteger;
           edNomeCobrador.Text      := FPesquisa.Consulta.FieldByName('NOME_COBRADOR').AsString;
         End;
  Finally
    FPesquisa.Free;
  End;
end;

procedure TfrmCobrador.plProcuraUsuario;
Var
  FPesquisa : TFrmPesquisa;
begin
  FPesquisa := TFrmPesquisa.Create(Application);
  Try
    FPesquisa.Tabela := 'USUARIO';
    FPesquisa.DefineCampos(['ID','USUARIO']);
    FPesquisa.CampoCondicao := 'USUARIO';
    If   FPesquisa.Execute Then
         Begin
           ieUsuario.IntegerNumber := FPesquisa.Consulta.FieldByName('ID').AsInteger;
           pnNomeUsuario.Caption   := FPesquisa.Consulta.FieldByName('USUARIO').AsString;
         End;
  Finally
    FPesquisa.Free;
  End;
end;

procedure TfrmCobrador.btnieCobradorClick(Sender: TObject);
begin
  plProcuraCobrador;
end;

procedure TfrmCobrador.btnieUsuarioClick(Sender: TObject);
begin
  plProcuraUsuario;
end;

procedure TfrmCobrador.plGravarCobrador;
begin
  Try
    FCobrador.Carrega(False);
    If   FCobrador.FindBypk_IdCobrador(ieCobrador.IntegerNumber) Then
         FCobrador.Edit
    Else FCobrador.Insert;
    FCobrador.NOME_COBRADOR := edNomeCobrador.Text;
    FCobrador.IDUSUARIO := ieUsuario.IntegerNumber;
    FCobrador.ATIVO     := ckAtivo.Checked;
    FCobrador.Post;
    ShowMessage('Cadastro efetuado com sucesso!');
  Except
    On E: Exception do
       ShowMessage(E.Message);
  End;
end;

procedure TfrmCobrador.btnieCobradorOnExit(Sender: TObject);
begin
  plCarregaCobrador;
end;

procedure TfrmCobrador.plCarregaCobrador;
begin
  Try
    FCobrador.Carrega(False);
    If  Not FCobrador.FindBypk_IdCobrador(ieCobrador.IntegerNumber) Then
        Raise Exception.Create('Cobrador Inexistente!');
    ieCobrador.Enabled      := False;    
    edNomeCobrador.Text     := FCobrador.NOME_COBRADOR;
    ckAtivo.Checked         := FCobrador.ATIVO; 
    ieUsuario.IntegerNumber := FCobrador.IDUSUARIO;
    plConsistirUsuario;
  Except
    On E: Exception Do
       Begin
         ShowMessage(E.Message);
         ieCobrador.SetFocus;
       End;
  End;
end;

procedure TfrmCobrador.plLimparCampos;
begin
  pnTela.Enabled           := True;
  ieCobrador.Enabled       := True;
  ieCobrador.IntegerNumber := 0;
  ieUsuario.IntegerNumber  := 0;
  edNomeCobrador.Text      := '';
  pnNomeUsuario.Caption    := '';
  ckAtivo.Checked          := False;
  ieCobrador.SetFocus;
end;

procedure TfrmCobrador.btnLimparClick(Sender: TObject);
begin
  plLimparCampos;
end;

procedure TfrmCobrador.btnGravaClick(Sender: TObject);
begin
  plGravarCobrador;
end;

procedure TfrmCobrador.plConsistirUsuario;
begin
  Try
    FSUsuario.ID := ieUsuario.IntegerNumber;
    FSUsuario.CarregaSQL;

    If  FSUsuario.Eof Then
        Raise Exception.Create('Usuario inexistente!');

    pnNomeUsuario.Caption := FSUsuario.USUARIO;

    If  Not FSUsuario.ATIVO Then
        Raise Exception.Create('Usuario desativado!');

  Except
    On E: Exception Do
       Begin
         ShowMessage(E.Message);
         ieUsuario.SetFocus;
         pnTela.Enabled := False;
       End;
  End;
end;

end.
