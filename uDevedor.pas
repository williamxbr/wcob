unit uDevedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Grids,
  ucLayDevedor, ucLayEnderecos, ucLayTelefones, ucLayEstado, ucLayTipo_Pessoa,
  DBGrids, Menus, dbcgrids;

type THackDBNavigator = class(TDBNavigator);

type
  TfrmDevedor = class(TForm)
    pnRodape: TPanel;
    pnTop: TPanel;
    Label1: TLabel;
    DBNavDevedor: TDBNavigator;
    gbRodape: TGroupBox;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    btnLocalizar: TBitBtn;
    dsDevedor: TDataSource;
    pnCabecalho: TPanel;
    pnTela: TPanel;
    gbCabecalho: TGroupBox;
    gbTela: TGroupBox;
    DBCODIGO_DEVEDOR: TDBEdit;
    DBNOME_DEVEDOR: TDBEdit;
    DBCNPJ_CPF: TDBEdit;
    DBLookupTipoPessoa: TDBLookupComboBox;
    pcDevedor: TPageControl;
    tsComplementar: TTabSheet;
    tsEnderecos: TTabSheet;
    gbComplementar: TGroupBox;
    gbEnderecos: TGroupBox;
    lblNome: TLabel;
    lblInscricaoFederal: TLabel;
    lblEstadoCivil: TLabel;
    lblTipoPessoa: TLabel;
    lblCodigo: TLabel;
    DBNOME_PAI: TDBEdit;
    pnEndereco: TPanel;
    DBGridEnderecos: TDBGrid;
    dsEnderecos: TDataSource;
    dsTelefones: TDataSource;
    DBESTADO_CIVIL: TDBComboBox;
    DBNOME_MAE: TDBEdit;
    DBRENDA: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Renda: TLabel;
    DBIDENTIDADE: TDBEdit;
    DBCARRO_MODELO: TDBEdit;
    DBPLACA: TDBEdit;
    Identidade: TLabel;
    Carro: TLabel;
    Label7: TLabel;
    gbTelefone: TGroupBox;
    DBPROFISSAO: TDBEdit;
    DBEMPRESA: TDBEdit;
    DBFUNCAO: TDBEdit;
    DBEMAIL01: TDBEdit;
    DBEMAIL02: TDBEdit;
    DBEMAIL03: TDBEdit;
    dbGridTelefone: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    sbLocaliza: TSpeedButton;
    DBREFERENCIA_ENDERECO: TDBEdit;
    DBENDERECO: TDBEdit;
    DBNUMERO: TDBEdit;
    DBCOMPLEMENTO: TDBEdit;
    DBBAIRRO: TDBEdit;
    DBCIDADE: TDBEdit;
    DBCEP: TDBEdit;
    DBOBSERVACAO: TDBEdit;
    pmLocalizar: TPopupMenu;
    NOME1: TMenuItem;
    ELEFONE1: TMenuItem;
    DBUF: TDBLookupComboBox;
    Image1: TImage;
    InscricaoFederal1: TMenuItem;
    ppIDENTIDADE: TMenuItem;
    DBMemoOBSERVACAO: TDBMemo;
    DBREFERENCIA_TELEFONE: TDBEdit;
    DBNUMERO_TELEFONE: TDBEdit;
    lblDDD: TLabel;
    DBDDD: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btnInserirEnderecos: TBitBtn;
    btnDeletarEnderecos: TBitBtn;
    btnConfirmarEndereco: TBitBtn;
    btnInserirTelefone: TBitBtn;
    btnDeletarTelefone: TBitBtn;
    btnConfirmarTelefone: TBitBtn;
    DBCODIGO_ALTERNATIVO: TDBEdit;
    Label13: TLabel;
    Button1: TButton;
    dsEstado: TDataSource;
    dsTipoPessoa: TDataSource;
    DBEH_LOCALIZADO: TDBCheckBox;
    procedure btnProximoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NOME1Click(Sender: TObject);
    procedure ELEFONE1Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure sbLocalizaClick(Sender: TObject);
    procedure InscricaoFederal1Click(Sender: TObject);
    procedure ppIDENTIDADEClick(Sender: TObject);
    procedure dsDevedorStateChange(Sender: TObject);
    procedure btnDeletarEnderecosClick(Sender: TObject);
    procedure btnConfirmarEnderecoClick(Sender: TObject);
    procedure btnInserirEnderecosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInserirTelefoneClick(Sender: TObject);
    procedure btnDeletarTelefoneClick(Sender: TObject);
    procedure btnConfirmarTelefoneClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEnderecosDblClick(Sender: TObject);
    procedure DBGridEnderecosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbGridTelefoneDblClick(Sender: TObject);
    procedure dbGridTelefoneDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBCNPJ_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FDevedor : TDEVEDOR;
    FEnderecos : TENDERECOS;
    FTelefones : TTELEFONES;
    FEstado : TESTADO;
    FTipoPessoa : TTIPO_PESSOA;
    procedure DesFocalizarComponentesBase(sender: TObject);
    procedure FocalizarComponentesBase(sender: TObject);
    procedure AbrirTabelas;
    procedure BuscaDevedorNome;
    procedure BuscaDevedorInscricaoFederal;
    procedure BuscaDevedorIDENTIDADE;
    procedure CarregaAcionamento;
    procedure BuscaDevedorTelefone;
    procedure FecharTabelas;
    procedure SetupHackedNavigator(const Navigator : TDBNavigator);
    { Private declarations }
    function EnderecoCEP(CEP : String): Boolean;
    procedure plEditandoCadastro;
    procedure plNavegandoCadastro;
  public
    { Public declarations }

  end;

Const
 VK_F1 = 112;
 VK_F2 = 113;
 VK_F3 = 114;
 VK_F4 = 115;
 VK_F5 = 116;
 VK_F6 = 117;
 VK_F7 = 118;
 VK_F8 = 119;
 VK_F9 = 120;
 VK_F10 = 121;
 VK_F11 = 122;
 VK_F12 = 123;



  procedure CallDevedor(CodigoDevedor : Integer = 0);

implementation
Uses
  uGetFunctions,
  Parametros,
  uPesquisa,
  IdHTTP, Math;

resourcestring
 STemCertezaQueDesejaExcluirEsteRe = 'Tem Certeza Que deseja Excluir Este Registro?';

{$R *.dfm}

procedure CallDevedor;
var
  frmDevedor: TfrmDevedor;
Begin
  frmDevedor := TfrmDevedor.Create(Application);
  Try
    If   CodigoDevedor > 0 Then
         Begin
           frmDevedor.dsDevedor.DataSet.Filtered := False;
           frmDevedor.dsDevedor.DataSet.Filter := 'CODIGO_DEVEDOR = '+IntToStr(CodigoDevedor);
           frmDevedor.dsDevedor.DataSet.Filtered := True;
         End
    Else frmDevedor.dsDevedor.DataSet.Filtered := False;
    frmDevedor.ShowModal;
  Finally
    FreeAndNil(frmDevedor);
  End;
End;

{ TfrmDevedor }

procedure TfrmDevedor.AbrirTabelas;
begin
  FDevedor := TDEVEDOR.Create(Self);
  FDevedor.Carrega(False);
  FEnderecos := TENDERECOS.Create(Self);
  FEnderecos.Carrega(False);
  FTelefones := TTELEFONES.Create(Self);
  FTelefones.Carrega(False);
  FEstado := TESTADO.Create(Self);
  FEstado.Carrega(False);
  FTipoPessoa := TTIPO_PESSOA.Create(Self);
  FTipoPessoa.Carrega(False);

  dsDevedor.DataSet := FDevedor;
  dsEnderecos.DataSet := FEnderecos;
  dsTelefones.DataSet := FTelefones;
  dsEstado.DataSet := FEstado;
  dsTipoPessoa.DataSet := FTipoPessoa;

  FEnderecos.MasterSource := dsDevedor;
  FEnderecos.IndexFieldNames := 'CODIGO_DEVEDOR';
  FEnderecos.MasterFields := 'CODIGO_DEVEDOR';

  FTelefones.MasterSource := dsDevedor;
  FTelefones.IndexFieldNames := 'CODIGO_DEVEDOR';
  FTelefones.MasterFields := 'CODIGO_DEVEDOR';

end;

procedure TfrmDevedor.FecharTabelas;
begin
  FDevedor.Free;
  FEnderecos.Free;
  FTelefones.Free;
  FEstado.Free;
  FTipoPessoa.Free;
end;

procedure TfrmDevedor.btnProximoClick(Sender: TObject);
begin
  FDevedor.Next;
end;

procedure TfrmDevedor.FormCreate(Sender: TObject);
Var
  Cont : Byte;
begin
  AbrirTabelas;
  SetupHackedNavigator(DBNavDevedor);
  CentralizarForm(Self);
  pcDevedor.TabIndex  := 0;
  btnExcluir.Enabled  := TUniqueParametros.GetParametros.Privilegiado;
  gbCabecalho.Enabled := Not TUniqueParametros.GetParametros.EhCobrador;
  for cont := 0 to self.ComponentCount - 1 do
    begin
      if(self.Components[cont] is TDBEdit)then
        begin
          (Components[cont] as TDBEdit).OnEnter := FocalizarComponentesBase;
          (Components[cont] as TDBEdit).OnExit  := DesFocalizarComponentesBase;
        end;
    end;
end;

procedure TfrmDevedor.FormDestroy(Sender: TObject);
begin
  FecharTabelas;
end;

procedure TfrmDevedor.btnAnteriorClick(Sender: TObject);
begin
  FDevedor.Prior;
end;

procedure TfrmDevedor.btnNovoClick(Sender: TObject);
begin
  FDevedor.Insert;
  DBNOME_DEVEDOR.SetFocus;
end;

procedure TfrmDevedor.btnExcluirClick(Sender: TObject);
begin
  if   MessageDlg(STemCertezaQueDesejaExcluirEsteRe, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       FDevedor.Delete;
end;

procedure TfrmDevedor.btnConfirmarClick(Sender: TObject);
begin
  FDevedor.Post;
end;

procedure TfrmDevedor.btnCancelarClick(Sender: TObject);
begin
  FDevedor.Cancel;
end;                                                                

procedure TfrmDevedor.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDevedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       begin
         Perform (CM_DialogKey, VK_TAB, 0);
         key:=#0;
       end;
end;

procedure TfrmDevedor.SetupHackedNavigator(const Navigator: TDBNavigator);
const
  Captions : array[TNavigateBtn] of string =
      ('Initial', 'Previous', 'Later', 'Final', 'Add',
       'Erase', 'Correct', 'Send', 'Withdraw', 'Revive');
var
  btn : TNavigateBtn;
begin
  for btn := Low(TNavigateBtn) to High(TNavigateBtn) do
  with THackDBNavigator(Navigator).Buttons[btn] do
  begin
    Caption := Captions[btn];
    Layout := blGlyphTop;
  end;
end;

procedure TfrmDevedor.NOME1Click(Sender: TObject);
begin
  BuscaDevedorNome;
end;

procedure TfrmDevedor.ELEFONE1Click(Sender: TObject);
begin
  BuscaDevedorTelefone;
end;

procedure TfrmDevedor.btnLocalizarClick(Sender: TObject);
Var
  X,Y : Integer;
begin
  X := Self.Left + btnLocalizar.Left + btnLocalizar.Width;
  Y := Self.Top + pnRodape.Top + btnLocalizar.Top + btnLocalizar.Height;
  pmLocalizar.AutoPopup := False;
  pmLocalizar.Popup(X,Y);
end;

procedure TfrmDevedor.BuscaDevedorNome;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['CODIGO_DEVEDOR','NOME_DEVEDOR']);
    FConsulta.CampoCondicao := 'NOME_DEVEDOR';
    If   FConsulta.Execute Then
         dsDevedor.DataSet.Locate('CODIGO_DEVEDOR',FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsVariant,[loPartialKey]);
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmDevedor.BuscaDevedorInscricaoFederal;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['CNPJ_CPF','NOME_DEVEDOR','CODIGO_DEVEDOR']);
    FConsulta.CampoCondicao := 'CNPJ_CPF';
    If   FConsulta.Execute Then
         dsDevedor.DataSet.Locate('CODIGO_DEVEDOR',FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsVariant,[loPartialKey]);
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmDevedor.BuscaDevedorIDENTIDADE;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['IDENTIDADE','NOME_DEVEDOR','CODIGO_DEVEDOR']);
    FConsulta.CampoCondicao := 'IDENTIDADE';
    If   FConsulta.Execute Then
         dsDevedor.DataSet.Locate('CODIGO_DEVEDOR',FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsVariant,[loPartialKey]);
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmDevedor.CarregaAcionamento;
begin
end;

procedure TfrmDevedor.BuscaDevedorTelefone;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'TELEFONES';
    FConsulta.DefineCampos(['NUMERO_TELEFONE','REFERENCIA_TELEFONE','CODIGO_DEVEDOR']);
    FConsulta.CampoCondicao := 'NUMERO_TELEFONE';
    If   FConsulta.Execute Then
         dsDevedor.DataSet.Locate('CODIGO_DEVEDOR',FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsVariant,[loPartialKey]);
  Finally
    FConsulta.Free;
  End;
end;

procedure TfrmDevedor.sbLocalizaClick(Sender: TObject);
begin
  Try
    If   Not dsDevedor.DataSet.Locate('CODIGO_DEVEDOR',InputBox('Localizar Devedor','Digite o Código do Devedor',''),[loPartialKey]) Then
         ShowMessage('Registro não encontrado');
  Except
  End;
end;

procedure TfrmDevedor.DesFocalizarComponentesBase(sender: TObject);
begin
   (sender as TDBEdit).Color:=clWindow;
   (sender as TDBEdit).Font.Color:=clBlack;
end;

procedure TfrmDevedor.FocalizarComponentesBase(sender: TObject);
begin
   (sender as TDBEdit).Color:=clBlue;
   (sender as TDBEdit).Font.Color:=clWindow;
end;


procedure TfrmDevedor.InscricaoFederal1Click(Sender: TObject);
begin
  BuscaDevedorInscricaoFederal;
end;

procedure TfrmDevedor.plEditandoCadastro;
begin
  tsEnderecos.TabVisible   := False;
  gbTelefone.Visible    := False;
  btnProximo.Enabled    := False;
  btnAnterior.Enabled   := False;
  btnNovo.Enabled       := False;
  btnExcluir.Enabled    := False;
  btnConfirmar.Enabled  := True;
  btnLocalizar.Enabled  := False;
  btnCancelar.Enabled   := True;
  btnSair.Enabled       := False;
end;

procedure TfrmDevedor.plNavegandoCadastro;
begin
  tsEnderecos.TabVisible   := True;
  gbTelefone.Visible    := True;
  btnProximo.Enabled    := True;
  btnAnterior.Enabled   := True;
  btnNovo.Enabled       := True;
  btnExcluir.Enabled    := True;
  btnConfirmar.Enabled  := False;
  btnLocalizar.Enabled  := True;
  btnCancelar.Enabled   := False;
  btnSair.Enabled       := True;
end;

procedure TfrmDevedor.ppIDENTIDADEClick(Sender: TObject);
begin
  BuscaDevedorIDENTIDADE;
end;

procedure TfrmDevedor.dsDevedorStateChange(Sender: TObject);
begin
  case dsDevedor.State of
   dsBrowse : plNavegandoCadastro;
   dsEdit,
   dsInsert : plEditandoCadastro;
  end;
end;

procedure TfrmDevedor.btnDeletarEnderecosClick(Sender: TObject);
begin
  FEnderecos.Delete;
end;

procedure TfrmDevedor.btnConfirmarEnderecoClick(Sender: TObject);
begin
  FEnderecos.Post;
end;

procedure TfrmDevedor.btnInserirEnderecosClick(Sender: TObject);
begin
  FEnderecos.Insert;
end;

procedure TfrmDevedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F2 : If btnNovo.Enabled Then dsDevedor.DataSet.Insert;
    VK_F3 : If btnExcluir.Enabled Then dsDevedor.DataSet.Delete;
    VK_F4 : If btnConfirmar.Enabled Then dsDevedor.DataSet.Post;
    VK_F7 : If btnLocalizar.Enabled Then  btnLocalizarClick(Sender);
    VK_F5 : If btnCancelar.Enabled Then dsDevedor.DataSet.Cancel;
  End;
end;

procedure TfrmDevedor.btnInserirTelefoneClick(Sender: TObject);
begin
  FTelefones.Insert;
end;

procedure TfrmDevedor.btnDeletarTelefoneClick(Sender: TObject);
begin
  FTelefones.Delete;
end;

procedure TfrmDevedor.btnConfirmarTelefoneClick(Sender: TObject);
begin
  FTelefones.Post;
end;

procedure TfrmDevedor.Button1Click(Sender: TObject);
begin
  Case dsEnderecos.State of
    dsEdit,
    dsInsert : EnderecoCEP(DBCEP.Text);
  End;
end;

function TfrmDevedor.EnderecoCEP(CEP : String): Boolean;
var
  IDHTTP_CEP : TIdHTTP ;
  SDADOS : TStringList ;
  URL : String ;
begin
{ Cria as Variaveis }
  SDADOS := TStringList.Create ;
  IDHTTP_CEP := TIdHTTP.Create( nil );
  URL := 'http://republicavirtual.com.br/web_cep.php?cep=' + CEP + '&formato=query_string' ;

{ Texto Recebido da INternet }
try
  Try
  SDADOS.Text := StringReplace( IDHTTP_CEP.URL.URLDecode( IDHTTP_CEP.Get( URL ) ) , '&' , #13#10 , [rfReplaceAll] );

{ verifica se achou alguma coisa }
  if    SDADOS.Values['RESULTADO'] = '0' then
        Result := False
  else
      begin
        FEnderecos.ENDERECO := SDADOS.Values['TIPO_LOGRADOURO'] + ' ' + SDADOS.Values['LOGRADOURO'];
        FEnderecos.BAIRRO   := SDADOS.Values['BAIRRO'];
        FEnderecos.CIDADE   := SDADOS.Values['CIDADE'];
        FEnderecos.ESTADO   := SDADOS.Values['UF'];
      End;

  if   Trim ( SDADOS.Values['UF'] ) <> '' then
       Result := True
  else
       Result := False ;
  except
    Result := False ;
  end;
Finally
{ Finaliza }
 SDADOS.Free ;
 IDHTTP_CEP.Free ;
End;
end;

procedure TfrmDevedor.DBGridEnderecosDblClick(Sender: TObject);
begin
  If   Not(DBGridEnderecos.Fields[0].Value = Null) Then
       Begin
         FDevedor.Edit;
         FDevedor.ENDERECO_PRINCIPAL := FEnderecos.NUMERO_ENDERECO;
         FDevedor.Post;
       End;
end;

procedure TfrmDevedor.DBGridEnderecosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If  (FEnderecos.NUMERO_ENDERECO = FDevedor.ENDERECO_PRINCIPAL) then
     begin
       DBGridEnderecos.Canvas.Font.Color  := clBlack;
       DBGridEnderecos.Canvas.Brush.Color := clSkyBlue;
       DBGridEnderecos.Canvas.Font.Style  := [fsBold];
     end
  else
     begin
       DBGridEnderecos.Canvas.Font.Color  := clBlack;
       DBGridEnderecos.Canvas.Brush.Color := clWhite;
     end;
end;

procedure TfrmDevedor.dbGridTelefoneDblClick(Sender: TObject);
begin
  If   Not(dbGridTelefone.Fields[0].Value = Null) Then
       Begin
         FDevedor.Edit;
         FDevedor.TELEFONE_PRINCIPAL := FTelefones.ITEM_TELEFONE;
         FDevedor.Post;
       End;
end;

procedure TfrmDevedor.dbGridTelefoneDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If  (FTelefones.ITEM_TELEFONE = FDevedor.TELEFONE_PRINCIPAL) then
     begin
       dbGridTelefone.Canvas.Font.Color  := clBlack;
       dbGridTelefone.Canvas.Brush.Color := clSkyBlue;
       dbGridTelefone.Canvas.Font.Style  := [fsBold];
     end
  else
     begin
       dbGridTelefone.Canvas.Font.Color  := clBlack;
       dbGridTelefone.Canvas.Brush.Color := clWhite;
     end;
  If   Not(dbGridTelefone.Fields[0].Value = Null) Then
       Begin
         dbGridTelefone.Canvas.FillRect(Rect);
         dbGridTelefone.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsVariant);
       End;
end;

procedure TfrmDevedor.DBCNPJ_CPFKeyPress(Sender: TObject; var Key: Char);
begin
  If   Not(Key in ['0'..'9']) Then
       Key := #0;
end;


procedure TfrmDevedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := True;
    If   (dsDevedor.State in [dsEdit,dsInsert])
    Or   (dsEnderecos.State in [dsEdit,dsInsert])
    Or   (dsTelefones.State in [dsEdit,dsInsert]) Then
         Begin
           ShowMessage('Registro em edição, por favor confirme!');
           CanClose := False;
         End;
end;

End.

