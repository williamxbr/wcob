unit uConsultaAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uGetFunctions,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, StdCtrls, DBCtrls, ADODB, Buttons;

type
  TFrmConsultaAcordo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGridConsultaAcordo: TDBGrid;
    QU_ACORDO: TADOQuery;
    QU_RECEBIMENTO: TADOQuery;
    DBACORDO: TDBText;
    DBCREDOR: TDBText;
    DBNOME_CREDOR: TDBText;
    DBDEVEDOR: TDBText;
    DBNOME_DEVEDOR: TDBText;
    DBNOME_COBRADOR: TDBText;
    DBCOBRANCA: TDBText;
    DBVALOR_DIVIDA: TDBText;
    DBVALOR_CORRIGIDO: TDBText;
    dsQuAcordo: TDataSource;
    dsQuRecebimento: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBDATA_ACORDO: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnSair: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    stValorTotal: TStaticText;
    stVencer: TStaticText;
    stVencidas: TStaticText;
    stPagos: TStaticText;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure plIniciarConsulta(cAcordo : Integer);
  public
    { Public declarations }
  end;

  procedure plConsultaAcordo(Acordo : Integer);


implementation
Uses
  Parametros;

{$R *.dfm}

procedure plConsultaAcordo(Acordo : Integer);
var
  FrmConsultaAcordo: TFrmConsultaAcordo;
Begin
  FrmConsultaAcordo := TFrmConsultaAcordo.Create(Application);
  Try
    FrmConsultaAcordo.plIniciarConsulta(Acordo);
    FrmConsultaAcordo.ShowModal;
  Finally
    FreeAndNil(FrmConsultaAcordo);
  End;
End;


{ TFrmConsultaAcordo }

procedure TFrmConsultaAcordo.plIniciarConsulta(cAcordo: Integer);
Var
  Total,
  Vencer,
  Vencidos,
  Pagos      : Double;

begin
  Total    := 0.00;
  Vencer   := 0.00;
  Vencidos := 0.00;
  Pagos    := 0.00;
  With QU_ACORDO Do
    Begin
      Parameters.AddParameter.Name := 'PACORDO';
      Active := False;
      SQL.Clear;

      SQL.Add(' SELECT ');
      SQL.Add('   A.IDACORDO, ');
      SQL.Add('   A.COBRANCA, ');
      SQL.Add('   A.CREDOR, ');
      SQL.Add('   A.DEVEDOR, ');
      SQL.Add('   A.VALOR_DIVIDA, ');
      SQL.Add('   A.TAXA, ');
      SQL.Add('   A.VALOR_CORRIGIDO, ');
      SQL.Add('   A.STATUS, ');
      SQL.Add('   D.NOME_COBRADOR, ');
      SQL.Add('   A.DATA_ACORDO, ');
      SQL.Add('   B.NOME_CREDOR, ');
      SQL.Add('   C.NOME_DEVEDOR ');
      SQL.Add(' FROM ACORDO A, CREDOR B, DEVEDOR C, COBRADOR D ');
      SQL.Add(' WHERE A.CREDOR = B.CODIGO_CREDOR ');
      SQL.Add(' AND A.DEVEDOR = C.CODIGO_DEVEDOR ');
      SQL.Add(' AND A.COBRADOR = D.IDCOBRADOR ');
      SQL.Add(' AND A.IDACORDO = :PACORDO ');

      Parameters.ParamByName('PACORDO').Value := cAcordo;
      Prepared;
      Open;
      Active := True;
    End;

  With QU_RECEBIMENTO Do
    Begin
      Parameters.AddParameter.Name := 'PACORDO';
      Active := False;
      SQL.Clear;

      SQL.Add(' SELECT R.PARCELA, ');
      SQL.Add('        R.VENCIMENTO, ');
      SQL.Add('        R.VALOR, ');
      SQL.Add('        R.VENCIMENTO, ');
      SQL.Add('        R.PAGO, ');
      SQL.Add('        R.DATA_PAGAMENTO, ');
      SQL.Add('        T.SIGLA_DOCUMENTO, ');
      SQL.Add('        C.NOME_COBRADOR ');
      SQL.Add('   FROM RECEBIMENTO R, TIPO_DOCUMENTO T, COBRADOR C ');
      SQL.Add('   WHERE R.TIPODOCUMENTO = T.TIPO_DOCUMENTO ');
      SQL.Add('        AND R.COBRADOR = C.IDCOBRADOR ');
      SQL.Add('        AND R.ACORDO = :PACORDO ');

      Parameters.ParamByName('PACORDO').Value := cAcordo;
      Prepared;
      Open;
      Active := True;
    End;

    QU_RECEBIMENTO.First;
    While Not(QU_RECEBIMENTO.Eof) Do
      Begin
        Total := Total + QU_RECEBIMENTO.FieldByName('VALOR').AsFloat;

        If   (QU_RECEBIMENTO.FieldByName('PAGO').AsBoolean)  Then
              Pagos := Pagos + QU_RECEBIMENTO.FieldByName('VALOR').AsFloat
        Else
              Begin
                If   QU_RECEBIMENTO.FieldByName('VENCIMENTO').AsDateTime > Date Then
                     Vencer   := Vencer + QU_RECEBIMENTO.FieldByName('VALOR').AsFloat
                Else Vencidos := Vencidos + QU_RECEBIMENTO.FieldByName('VALOR').AsFloat;
              End;
        QU_RECEBIMENTO.Next;
      End;

    stValorTotal.Caption := 'Valor Total : ' + FormatFloat('###,##0.00',Total);
    stVencer.Caption     := 'A vencer :'     + FormatFloat('###,##0.00',Vencer);
    stVencidas.Caption   := 'Vencidas :'     + FormatFloat('###,##0.00',Vencidos);
    stPagos.Caption      := 'Pagos :'        + FormatFloat('###,##0.00',Pagos);
end;

procedure TFrmConsultaAcordo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultaAcordo.FormCreate(Sender: TObject);
begin
  QU_ACORDO.Connection      := TUniqueParametros.GetParametros.Conexao;
  QU_RECEBIMENTO.Connection := TUniqueParametros.GetParametros.Conexao;
  CentralizarForm(Self);
end;

end.
