unit uEncerramento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayTipo_Situacao, NumericEdit,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEncerramento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    MMotivoEncerramento: TMemo;
    GroupBox1: TGroupBox;
    pnSituacao: TPanel;
    lblDescricaoSituacao: TLabel;
    btnGravarEncerramento: TBitBtn;
    btnCancelarEncerramento: TBitBtn;
  private
    { Private declarations }
    FSTipoSituacao : TSimplesTIPO_SITUACAO;

    ieTipoSituacao : TIntegerEdit;

    procedure plAbrirTabelas;
    procedure plFecharTabelas;
    procedure plComponentes;
  public
    { Public declarations }
  end;

  procedure plEncerrarCobranca(Var ldStatus : Byte; lsMotivo : String);


implementation

{$R *.dfm}

procedure plEncerrarCobranca(Var ldStatus : Byte; lsMotivo : String);
var
  frmEncerramento: TfrmEncerramento;
Begin
  frmEncerramento := TfrmEncerramento.Create(Application);
  Try
    frmEncerramento.ShowModal;
    lsMotivo := frmEncerramento.MMotivoEncerramento.Text;
  Finally
    frmEncerramento.Free;
  End;
End;

{ TfrmEncerramento }

procedure TfrmEncerramento.plAbrirTabelas;
begin
  FSTipoSituacao := TSimplesTIPO_SITUACAO.Create(Self);
end;

procedure TfrmEncerramento.plComponentes;
begin
  ieTipoSituacao := TIntegerEdit.Create(Self);
  With ieTipoSituacao Do
    Begin
      Parent      := pnSituacao;
      Name        := 'ieTipoSituacao';
      Width       := pnSituacao.ClientWidth;
    End;
end;

procedure TfrmEncerramento.plFecharTabelas;
begin
  FSTipoSituacao.Free;
end;

end.
