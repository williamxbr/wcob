unit uCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayCredor, ucLayBoleto, ucLayEstado,  ucLayTIPO_PESSOA,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, ComCtrls, Mask;

type
  TfrmCredor = class(TForm)
    Panel1: TPanel;
    btnSair: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    dsCredor: TDataSource;
    DBNavCredor: TDBNavigator;
    Label1: TLabel;
    DBCODIGO_CREDOR: TDBEdit;
    DBNOME_CREDOR: TDBEdit;
    DBRAZAO_SOCIAL: TDBEdit;
    DBCNPJ_CPF: TDBEdit;
    DBDATA_CADASTRO: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBENDERECO: TDBEdit;
    DBNUMERO: TDBEdit;
    DBCOMPLEMENTO: TDBEdit;
    DBCIDADE: TDBEdit;
    DBLookupEstado: TDBLookupComboBox;
    DBCEP: TDBEdit;
    DBLookupTipoPessoa: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBBAIRRO: TDBEdit;
    DBMemo1: TDBMemo;
    Label23: TLabel;
    TabSheet3: TTabSheet;
    Label20: TLabel;
    DBSITE: TDBEdit;
    GroupBox1: TGroupBox;
    DBCONTATO01: TDBEdit;
    DBCONTATO02: TDBEdit;
    GroupBox2: TGroupBox;
    DBDDD1: TDBEdit;
    DBTELEFONE01: TDBEdit;
    DBTELEFONE02: TDBEdit;
    DBTELEFONE03: TDBEdit;
    DBDDD2: TDBEdit;
    DBDDD3: TDBEdit;
    GroupBox3: TGroupBox;
    DBEMAIL01: TDBEdit;
    DBEMAIL02: TDBEdit;
    DBEMAIL03: TDBEdit;
    tsFinanceiro: TTabSheet;
    gbFinanceiro: TGroupBox;
    DBAPLICAR_DADOS_FINANCEIROS: TDBCheckBox;
    DBMULTA: TDBEdit;
    DBPERCENTUAL_ATRASO: TDBEdit;
    gbDesconto: TGroupBox;
    DBDESCONTO_MINIMO: TDBEdit;
    DBDESCONTO_MAXIMO: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    gbBoleto: TGroupBox;
    dsBoleto: TDataSource;
    DBBOLETOS: TDBNavigator;
    DBBANCO: TDBEdit;
    DBCEDENTE: TDBEdit;
    DBCARTEIRA: TDBEdit;
    DBNOSSO_NUMERO: TDBEdit;
    DBAGENCIA: TDBEdit;
    lblBanco: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBCONTA_CORRENTE: TDBEdit;
    DBDIGITO: TDBEdit;
    Label26: TLabel;
    DBMODALIDADE: TDBEdit;
    Modalidade: TLabel;
    Label27: TLabel;
    DBCONVENIO: TDBEdit;
    dbCheckUsaBoleto: TDBCheckBox;
    dsTipoPessoa: TDataSource;
    dsEstado: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbCheckUsaBoletoClick(Sender: TObject);
    procedure dsBoletoStateChange(Sender: TObject);
    procedure DBCNPJ_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FCredor     : TCREDOR;
    FBoleto     : TBOLETO;
    FTipoPessoa : TTIPO_PESSOA;
    FEstado     : TESTADO;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure SetupHackedNavigator(const Navigator : TDBNavigator);
  public
    { Public declarations }
  end;

  procedure CallCredor;

implementation

{$R *.dfm}

procedure CallCredor;
var
  frmCredor: TfrmCredor;
Begin
  frmCredor := TfrmCredor.Create(Application);
  Try
    frmCredor.ShowModal;
  Finally
    frmCredor.Free;
  End;
End;

procedure TfrmCredor.btnSairClick(Sender: TObject);
begin
  Close
end;

procedure TfrmCredor.FecharTabelas;
begin
  FCredor.Free;
  FBoleto.Free;
  FTipoPessoa.Free;
  FEstado.Free;
end;

procedure TfrmCredor.SetupHackedNavigator(const Navigator: TDBNavigator);
begin

end;

procedure TfrmCredor.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmCredor.dbCheckUsaBoletoClick(Sender: TObject);
begin
  gbBoleto.Enabled := dbCheckUsaBoleto.Checked;
end;

procedure TfrmCredor.dsBoletoStateChange(Sender: TObject);
begin
  Case dsBoleto.State of
    dsEdit,
    dsInsert : dbCheckUsaBoleto.Enabled := False;
  Else dbCheckUsaBoleto.Enabled := True;
  End;
end;

procedure TfrmCredor.DBCNPJ_CPFKeyPress(Sender: TObject; var Key: Char);
begin
  If   Not(Key in ['0'..'9']) Then
       Key := #0;
end;

procedure TfrmCredor.AbrirTabelas;
begin
  FCredor := TCREDOR.Create(Self);
  FCredor.Carrega(False);
  FBoleto := TBOLETO.Create(Self);
  FBoleto.Carrega(False);
  FTipoPessoa := TTIPO_PESSOA.Create(Self);
  FTipoPessoa.Carrega(False);
  FEstado := TESTADO.Create(Self);
  FEstado.Carrega(False);

  dsCredor.DataSet := FCredor;
  dsBoleto.DataSet := FBoleto;
  dsTipoPessoa.DataSet := FTipoPessoa;
  dsEstado.DataSet := FEstado; 

  FBoleto.MasterSource := dsCredor;
  FBoleto.IndexFieldNames := 'IDCREDOR';
  FBoleto.MasterFields    := 'CODIGO_CREDOR';

end;

procedure TfrmCredor.FormCreate(Sender: TObject);
begin
  AbrirTabelas;
end;

end.
