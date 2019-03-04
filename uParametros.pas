unit uParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids,
  NumericEdit,
  jpeg;

type
  TfrmParametros = class(TForm)
    pnRodape: TPanel;
    gbRodape: TGroupBox;
    spSair: TSpeedButton;
    pnTop: TPanel;
    lblAlines: TLabel;
    pnTela: TPanel;
    gbVersaoSistema: TGroupBox;
    pnVersaoSistema: TPanel;
    gbUltimoRecibo: TGroupBox;
    pnUltimoRecibo: TPanel;
    gbJurosDepre: TGroupBox;
    pnJurosDepre: TPanel;
    gbCredorEmpresa: TGroupBox;
    pnCredorEmpresa: TPanel;
    btnSalvarRelatorio: TSpeedButton;
    procedure spSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ieVersaoSistema : TIntegerEdit;
    ieUltimoRecibo  : TIntegerEdit;
    ieCredorEmpresa : TIntegerEdit;
    feJurosDepre    : TFloatEdit;

    procedure plComponentes;
    procedure plCarregaDados;
    procedure plGravarDados;
  public
    { Public declarations }
  end;

  procedure CallParametros;

implementation
Uses
  uclayParametros,
  Parametros,
  uGetFunctions;

{$R *.dfm}

procedure CallParametros;
var
  frmParametros: TfrmParametros;
Begin
  frmParametros := TfrmParametros.Create(Application);
  Try
    frmParametros.ShowModal;
  Finally
    FreeAndNil(frmParametros);
  End;
End;
procedure TfrmParametros.spSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParametros.FormCreate(Sender: TObject);
begin
  CentralizarForm(Self);
  plComponentes;
  plCarregaDados;
end;

procedure TfrmParametros.plComponentes;
begin
  ieVersaoSistema := TIntegerEdit.Create(Self);
  With ieVersaoSistema Do
    Begin
      Parent     := pnVersaoSistema;
      Name       := 'ieVersaoSistema';
      Align      := alClient;
      Enabled    := False;
    End;
  ieUltimoRecibo := TIntegerEdit.Create(Self);
  With ieUltimoRecibo Do
    Begin
      Parent     := pnUltimoRecibo;
      Name       := 'ieUltimoRecibo';
      Align      := alClient;
    End;
  ieCredorEmpresa := TIntegerEdit.Create(Self);
  With ieCredorEmpresa Do
    Begin
      Parent     := pnCredorEmpresa;
      Name       := 'ieCredorEmpresa';
      Align      := alClient;
    End;
  feJurosDepre := TFloatEdit.Create(Self);
  With feJurosDepre Do
    Begin
      Parent := pnJurosDepre;
      Name   := 'feJurosDepre';
      Align  := alClient;
    End;
end;

procedure TfrmParametros.plCarregaDados;
begin
  ieVersaoSistema.IntegerNumber := TUniqueParametros.GetParametros.Versao;
  ieUltimoRecibo.IntegerNumber  := TUniqueParametros.GetParametros.UltimoRecibo;
  feJurosDepre.FloatNumber      := TUniqueParametros.GetParametros.IndiceDEPRE;
  ieCredorEmpresa.IntegerNumber := TUniqueParametros.GetParametros.EmpresaIdCredor;
end;

procedure TfrmParametros.plGravarDados;
Var
  FParametros : TPARAMETROS;
begin
  FParametros := TPARAMETROS.Create(Self);
  Try
    Try
      FParametros.First;
      FParametros.Edit;
      FParametros.ULTIMO_NUM_RECIBO    := ieUltimoRecibo.IntegerNumber;
      FParametros.JUROS_DEPRE          := feJurosDepre.FloatNumber;
      FParametros.IDCREDORPROPRIETARIO := ieCredorEmpresa.IntegerNumber;
      FParametros.Post;
    Except
      FParametros.Cancel;
    End;
  Finally
    FParametros.Free;
  End;
end;

end.
