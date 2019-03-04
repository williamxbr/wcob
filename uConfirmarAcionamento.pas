unit uConfirmarAcionamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayAcionamento, ucLayDevedor,
  Dialogs, DB, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, Buttons;

type
  TfrmConfirmarAcionamento = class(TForm)
    pnTela: TPanel;
    pnRodape: TPanel;
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    lstAcionamento: TListView;
    edCodigo: TEdit;
    edNome: TEdit;
    dtInicio: TDateTimePicker;
    dtFinal: TDateTimePicker;
    rgSituacao: TRadioGroup;
    btnFind: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnCarrega: TBitBtn;
    btnSair: TBitBtn;
    btnConfirma: TBitBtn;
    CheckBox1: TCheckBox;
    procedure btnFindClick(Sender: TObject);
    procedure btnCarregaClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    FACIONAMENTO : TACIONAMENTO;
    QDEVEDOR     : TSimplesDEVEDOR;
    procedure plTratarAcionamentos(cSituacao : Integer);
    procedure plChecarTodosRegistros(cChecar : Boolean);
    procedure plCarregaAcionamentos;
    { Private declarations }
    procedure plProcuraCredor;
    { Private declarations }
  public
    { Public declarations }
  end;

  Procedure plConfirmarAcionamento;


implementation
Uses
  uAguarde,
  uPesquisa;

{$R *.dfm}

procedure plConfirmarAcionamento;
var
  frmConfirmarAcionamento: TfrmConfirmarAcionamento;
Begin
  frmConfirmarAcionamento := TfrmConfirmarAcionamento.Create(Application);
  Try
    frmConfirmarAcionamento.ShowModal;
  Finally
    FreeAndNil(frmConfirmarAcionamento);
  End;
End;

procedure TfrmConfirmarAcionamento.plCarregaAcionamentos;
Var
  ListItem : TListItem;
  Ind      : Integer;
begin
  lstAcionamento.Clear;
  ShowWait('Carregando....Aguarde!');
  FACIONAMENTO.First;
  While Not FACIONAMENTO.Eof Do
     Begin
       Inc(Ind);
       GaugeWait(Round(Ind/FACIONAMENTO.RecordCount*100));
       ListItem := lstAcionamento.Items.Add;
       ListItem.Caption := IntToStr(FACIONAMENTO.IDACIONAMENTO);
       ListItem.SubItems.Add('');
       ListItem.SubItems.Add(DateToStr(FACIONAMENTO.DATA_ACIONAMENTO));
       ListItem.SubItems.Add(FACIONAMENTO.USUARIO_INCLUSAO);
       ListItem.SubItems.Add(FACIONAMENTO.HISTORICO);
       FACIONAMENTO.Next;
     End;
  HideWait;
end;

procedure TfrmConfirmarAcionamento.btnFindClick(Sender: TObject);
begin
  plProcuraCredor;
end;

procedure TfrmConfirmarAcionamento.plProcuraCredor;
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

procedure TfrmConfirmarAcionamento.btnCarregaClick(Sender: TObject);
begin
    If   (dtFinal.DateTime < dtInicio.DateTime) Then
         ShowMessage('Data Final não pode ser menor que Data Inicial! Por favor reinforme corretamente!')
    Else plCarregaAcionamentos;
end;

procedure TfrmConfirmarAcionamento.plTratarAcionamentos(
  cSituacao: Integer);
Var
  Indice      : Integer;
  Acionamento : LongInt;
begin
  ShowWait('Gravando....Aguarde!');
  For Indice := 0 to  lstAcionamento.Items.Count - 1 Do
      Begin
        GaugeWait(Round((Indice+1)/lstAcionamento.Items.Count*100));
        If  lstAcionamento.Items.Item[Indice].Checked Then
            Begin

            End;
      End;
  HideWait;
  plCarregaAcionamentos;
end;

procedure TfrmConfirmarAcionamento.btnConfirmaClick(Sender: TObject);
begin
  plTratarAcionamentos(rgSituacao.ItemIndex);
end;

procedure TfrmConfirmarAcionamento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfirmarAcionamento.FormCreate(Sender: TObject);
begin
  dtInicio.DateTime := Now;
  dtFinal.DateTime  := Now;
  rgSituacao.ItemIndex := -1;
end;

procedure TfrmConfirmarAcionamento.rgSituacaoClick(Sender: TObject);
begin
  btnConfirma.Enabled := True;
end;

procedure TfrmConfirmarAcionamento.plChecarTodosRegistros(
  cChecar: Boolean);
Var
  Indice : Integer;
begin
  For Indice := 0 to  lstAcionamento.Items.Count - 1 Do
      lstAcionamento.Items.Item[Indice].Checked := cChecar;
end;

procedure TfrmConfirmarAcionamento.CheckBox1Click(Sender: TObject);
begin
  plChecarTodosRegistros(CheckBox1.Checked);
end;

end.
