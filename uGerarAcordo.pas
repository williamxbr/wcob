unit uGerarAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayAcordo, ucLayRecebimento, ucLayDevedor, ucLayCredor, ucLayCobranca,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmGerarAcordo = class(TForm)
    pnTop: TPanel;
    pnTela: TPanel;
    pnRodape: TPanel;
    gbTela: TGroupBox;
    lblCredor: TLabel;
    dtDataInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    lblGeracaoAcordo: TLabel;
    btnCancelar: TBitBtn;
    btnGrava: TBitBtn;
    lblNumeroAcordo: TLabel;
    lblCobranca: TLabel;
    lblDevedor: TLabel;
    edValor: TEdit;
    lblValor: TLabel;
    edEntrada: TEdit;
    lblEntrada: TLabel;
    edPeriodo: TEdit;
    lblPeriodo: TLabel;
    edParcelas: TEdit;
    lblParcelas: TLabel;
    lblxValorOriginal: TLabel;
    dtDataAcordo: TDateTimePicker;
    Label1: TLabel;
    rgUtilizarValor: TRadioGroup;
    lblxValorCorrigido: TLabel;
    lblValorOriginal: TLabel;
    stCobranca: TStaticText;
    lblValorCorrigido: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
  private
    FAcordo      : TACORDO;
    FRecebimento : TRECEBIMENTO;
    FCobranca    : TCOBRANCA;
    FDevedor     : TDEVEDOR;
    FCredor      : TCREDOR;     
    procedure AbrirArquivos;
    procedure FecharArquivos;
    procedure GerarAcordo(const cParcelas : Byte; const cValor : Double; const
        cPeriodo : Byte; const cValorEntrada : Double; const cDataInicial,
        cDataAcordo : TDatetime);
    procedure plRetornarCobrancaPendente;    
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure plGerarAcordo;

implementation
Uses
  uFuncoes,
  DB;

{$R *.dfm}

procedure plGerarAcordo;
var
  frmGerarAcordo: TfrmGerarAcordo;
Begin
  frmGerarAcordo := TfrmGerarAcordo.Create(Application);
  Try
    frmGerarAcordo.ShowModal;
  Finally
    FreeAndNil(frmGerarAcordo);
  End;
End;

procedure TfrmGerarAcordo.AbrirArquivos;
begin
  FAcordo := TACORDO.Create(Self);
  FRecebimento := TRECEBIMENTO.Create(Self);
  stCobranca.Caption         := IntToStr(FCobranca.COBRANCA);
  FDevedor.Locate('CODIGO_DEVEDOR',FCobranca.DEVEDOR,[]);
  lblDevedor.Caption         := FDevedor.NOME_DEVEDOR;
  FCredor.Locate('CODIGO_CREDOR',FCobranca.CREDOR,[]);
  lblCredor.Caption          := FCredor.NOME_CREDOR;
  lblValorOriginal.Caption   := FormatFloat('#,##0.00',FCobranca.VALOR_DIVIDA);
  lblValorCorrigido.Caption  := FormatFloat('#,##0.00',FCobranca.VALOR_CORRIGIDO);
end;

procedure TfrmGerarAcordo.btnCancelarClick(Sender: TObject);
begin
  plRetornarCobrancaPendente;
  Close;
end;

procedure TfrmGerarAcordo.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
end;

procedure TfrmGerarAcordo.btnGravaClick(Sender: TObject);
begin
  Try
    GerarAcordo(StrToInt(edParcelas.Text),
                StrToFloat(edValor.Text),
                StrToInt(edPeriodo.Text),
                StrToFloat(edEntrada.Text),
                dtDataInicial.Date,
                dtDataAcordo.Date);
    Close;
  Except
    On E: Exception Do
       Begin
         plRetornarCobrancaPendente;
         ShowMessage(E.Message);
       End;
  End
end;

procedure TfrmGerarAcordo.GerarAcordo(const cParcelas : Byte; const cValor :
    Double; const cPeriodo : Byte; const cValorEntrada : Double; const
    cDataInicial, cDataAcordo : TDatetime);
Var
  ValorParcela : Double;
  Indice       : Byte;
  Vencimento   : TDateTime;
begin
  Try
     If   (cValor <> 0.00) Then
           Begin
             FAcordo.Insert;
             FAcordo.COBRANCA := FCobranca.COBRANCA;
             FAcordo.CREDOR   := FCobranca.CREDOR;
             FAcordo.DEVEDOR  := FCobranca.DEVEDOR;

             Case rgUtilizarValor.ItemIndex of
               0 : FAcordo.VALOR_DIVIDA := FCobranca.VALOR_DIVIDA;
               1 : FAcordo.VALOR_DIVIDA := FCobranca.VALOR_CORRIGIDO;
             End;

             FAcordo.TAXA     := (cValor/FCobranca.VALOR_DIVIDA)-1;
             FAcordo.VALOR_CORRIGIDO := cValor;
             FAcordo.PRESTACOES      := cParcelas;
             FAcordo.PERIODO         := cPeriodo;
             FAcordo.VALOR_ENTRADA   := cValorEntrada;
             FAcordo.COBRADOR        := FCobranca.COBRANCA;
             FAcordo.DATA_ACORDO     := cDataAcordo;
             FAcordo.Post;

             For Indice := 1 to cParcelas Do
                 Begin
                   Try
                     FRecebimento.Insert;
                     FRecebimento.COBRANCA := FCobranca.COBRANCA;
                     FRecebimento.PARCELA  := Indice;
                     If   Indice = 1 Then
                          Begin
                            FRecebimento.VENCIMENTO := cDataInicial;
                            FRecebimento.VALOR      := cValorEntrada;
                          End
                     Else
                          Begin
                            ValorParcela := ((cValor - cValorEntrada) / (cParcelas - 1));
                            FRecebimento.VENCIMENTO := CalcularProximoVencimento(Vencimento,cPeriodo);
                            FRecebimento.VALOR      := ValorParcela;
                          End;
                     FRecebimento.COBRADOR  := FCobranca.COBRADOR;
                     Vencimento := FRecebimento.VENCIMENTO;
                     FRecebimento.Post;
                   Except
                     FRecebimento.Cancel;
                   End;
                 End;
           End;
  Except
    On E: Exception Do
       Begin
         FAcordo.Refresh;
         Raise;
       End;
  End;
  ShowMessage('Acordo '+IntToStr(FAcordo.IDACORDO)+' gerado!');
end;

procedure TfrmGerarAcordo.plRetornarCobrancaPendente;
begin
  If   FCobranca.State <> dsEdit Then
       FCobranca.Edit;
  FCobranca.DATA_ENCERRAMENTO := Null;
  FCobranca.SITUACAO := 0;
  FCobranca.Post;
end;

procedure TfrmGerarAcordo.FecharArquivos;
begin
  FAcordo.Free;
  FRecebimento.Free;
end;

end.
