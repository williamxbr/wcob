unit uExemplos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XLSWrite, otBitBtn, Grids, DBGrids, ComCtrls,
  ExtCtrls;

type
  TfrmExemplos = class(TForm)
    btnInserirRomaneio: TBitBtn;
    btnConfigura: TBitBtn;
    btnImprime: TBitBtn;
    btnConfirma: TBitBtn;
    btnDesconfirma: TBitBtn;
    btnAdicionaNatOperacao: TBitBtn;
    btnRemoveNatOperacao: TBitBtn;
    btnRetornaItensNota: TBitBtn;
    btnAvancaItensNota: TBitBtn;
    btnAlterarItem: TBitBtn;
    btnNovo: TBitBtn;
    BitBtn1: TBitBtn;
    btnExcluir: TBitBtn;
    SpeedButton3: TSpeedButton;
    sbQCancelar: TSpeedButton;
    BitBtn2: TBitBtn;
    BBVoltar: TBitBtn;
    btnExcluiTodosDefeitos: TBitBtn;
    SpeedButton1: TSpeedButton;
    btnExecutarEditor: TSpeedButton;
    btnExecutarRelatorio: TSpeedButton;
    btnSalvarRelatorio: TSpeedButton;
    btnAbrirRelatorio: TSpeedButton;
    btnNovoRelatorio: TSpeedButton;
    btnPrimeira_Posicao: TBitBtn;
    btnPosicao_Anterior: TBitBtn;
    btnPosicao_Posterior: TBitBtn;
    btnUltima_Posicao: TBitBtn;
    btnFind: TSpeedButton;
    btExportaExcel: TBitBtn;
    BitBtn3: TBitBtn;
    btConf: TBitBtn;
    btnRecarrega: TBitBtn;
    bbAjustarProdDep: TBitBtn;
    btnIncluirOrdem: TBitBtn;
    btnGerarOMs: TBitBtn;
    btAdiciona: TBitBtn;
    btRemove: TBitBtn;
    btnBuscaOB: TBitBtn;
    btnRetorno: TBitBtn;
    btnExcel: TBitBtn;
    btnTodos: TBitBtn;
    btnNenhum: TBitBtn;
    BBVisualizar: TBitBtn;
    BBConfigurar: TBitBtn;
    BitBtn4: TBitBtn;
    btnCarregar: TBitBtn;
    btnSair: TBitBtn;
    bbExecutar: TBitBtn;
    btnConfigurar: TBitBtn;
    btnGrava: TBitBtn;
    Btn_Gera_Ressoma: TBitBtn;
    Panel_Secao: TPanel;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    LV_Secao: TListView;
    Panel3: TPanel;
    BitBtn5: TBitBtn;
    btnSimulacao: TBitBtn;
    SBRegiao: TSpeedButton;
    btnTelaCheia: TBitBtn;
    btnDesmarcarTodas: TBitBtn;
    btnDesmarcarNaoReservadas: TBitBtn;
    btnCordas: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExemplos: TfrmExemplos;

implementation

{$R *.dfm}

end.
