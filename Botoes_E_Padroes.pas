   {
     @abstract(Unit com a definição dos padrões dos formularios do SGT windows)
     @author(Leandro Henrique Karasinski (leandro@operacionaltextil.com.br))
     @created(10 jul 2003)
     @modified(10 jul 2003)
   }
unit Botoes_E_Padroes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, AdvGrid, ExtCtrls, ComCtrls, BaseGrid;

type
  TfrmBotoesPadroes = class(TForm)
    gbGrid: TGroupBox;
    gbCheckBox: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    btnInserirItem: TBitBtn;
    btnExcluirItem: TBitBtn;
    btnExcluirTodos: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label5: TLabel;
    gbObservacoes: TGroupBox;
    Label10: TLabel;
    gbbotoes: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    pnlTOP: TPanel;
    lblTOP: TLabel;
    gbCampos: TGroupBox;
    lblTres: TLabel;
    lblOutroCaption: TLabel;
    lblCaptionUm: TLabel;
    lblCaptionAuxiliar: TLabel;
    Label16: TLabel;
    edtUm: TEdit;
    edtDois: TEdit;
    edtTres: TEdit;
    edtQuatro: TEdit;
    cbxCheckBoxPadrao: TCheckBox;
    cobComoBox: TComboBox;
    Label2: TLabel;
    Label6: TLabel;
    pcBotoes: TPageControl;
    tsAcessoDados: TTabSheet;
    btnExclui: TBitBtn;
    btnGravaTodos: TBitBtn;
    btnGrava: TBitBtn;
    btnConsulta: TBitBtn;
    btnCarregar: TBitBtn;
    btnRecarrega: TBitBtn;
    btnReplicar: TBitBtn;
    tsGraficos: TTabSheet;
    btnGraficoBarra: TBitBtn;
    btnGraficoPizza: TBitBtn;
    btnGraficoLinha: TBitBtn;
    tsDataHora: TTabSheet;
    btnHora: TBitBtn;
    btnData: TBitBtn;
    btnDataHora: TBitBtn;
    tsColetores: TTabSheet;
    btnEnviaColetor: TBitBtn;
    btnRecebeColetor: TBitBtn;
    btnTransmite: TBitBtn;
    tsAcoes: TTabSheet;
    btnConfirma: TBitBtn;
    btnTroca: TBitBtn;
    btnNovo: TBitBtn;
    btnDesconfirma: TBitBtn;
    btnCancela: TBitBtn;
    btnOK: TBitBtn;
    btnSair: TBitBtn;
    btnLimpar: TBitBtn;
    btnEfetivar: TBitBtn;
    btnVerifica: TBitBtn;
    tsImpressao: TTabSheet;
    btnImprimir: TBitBtn;
    btnF7: TBitBtn;
    btnLocaliza: TBitBtn;
    tsMiscelania: TTabSheet;
    btnConfigurar: TBitBtn;
    btnDigita: TBitBtn;
    StaticText1: TStaticText;
    btnLerArquivoColetor: TBitBtn;
    btnRetalhos: TBitBtn;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBotoesPadroes: TfrmBotoesPadroes;

implementation

{$R *.DFM}

procedure TfrmBotoesPadroes.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
