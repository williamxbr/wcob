unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, jpeg, ExtCtrls, ToolWin, StdCtrls, Buttons,
  DB, Registry,
  ucLayMenu_Acao, ucLayUsuario, ucLayUsuario_Menu,
  XPMan, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinsdxBarPainter,
  cxClasses, dxBar, cxLookAndFeels, dxSkinsForm, dxSkinsdxRibbonPainter,
  cxGraphics, cxControls, cxLookAndFeelPainters, dxRibbon, dxRibbonGallery,
  dxSkinsdxDockControlPainter, dxDockControl, ImgList, dxStatusBar,
  dxRibbonStatusBar, cxEdit, ActnList, cxDropDownEdit, cxBarEditItem,
  dxDockPanel, dxSkinscxPCPainter, cxContainer, cxCurrencyEdit, cxCalc,
  cxMemo, cxTextEdit, cxMaskEdit, cxButtonEdit, dxLayoutLookAndFeels,
  dxLayoutControl, cxStyles, cxButtons, cxGroupBox,
  cxPropertiesStore, cxCheckBox, dxRibbonSkins, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinValentine,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxScreenTip,
  dxCustomHint, cxHint;


type
  TfrmPrincipal = class(TForm)
    dxBarManager1: TdxBarManager;
    dxrCadastro: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    ActionList1: TActionList;
    dxrPlanejamento: TdxRibbonTab;
    dxrFinanceiro: TdxRibbonTab;
    dxrConsulta: TdxRibbonTab;
    actCredor: TAction;
    actDevedor: TAction;
    actAlines: TAction;
    actBanco: TAction;
    actTipoDocumento: TAction;
    rbtnCredor: TdxBarLargeButton;
    rbtnDevedor: TdxBarLargeButton;
    rbrnAlines: TdxBarLargeButton;
    rbtnBanco: TdxBarLargeButton;
    rbtnTipoDocumento: TdxBarLargeButton;
    actTipoSituacao: TAction;
    actCadastraCobrador: TAction;
    actDepre: TAction;
    actMotivos_Acionamentos: TAction;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxrRelatorios: TdxRibbonTab;
    dxrConfiguracoes: TdxRibbonTab;
    actPlanejamento: TAction;
    actAtendimentoSequencial: TAction;
    actAtendimentoLivre: TAction;
    actConfirmarAcionamento: TAction;
    actPlanejamentoNovo: TAction;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarManager1Bar3: TdxBar;
    dxBarManager1Bar4: TdxBar;
    actCobrancaClick: TAction;
    actGerarAcordoClick: TAction;
    actGerarRepasse: TAction;
    actRepasse: TAction;
    actConsultaClienteResumo: TAction;
    actCobranasemabertoporCredor1Click: TAction;
    actRelatorioPendenciasCredor: TAction;
    actConsultaRecebimentoCredor: TAction;
    actRelatorioPendenciasAcionamento: TAction;
    actRelatorioPendenciasTipoDocumento: TAction;
    actImprimirAvisoDevedor: TAction;
    actRelChamadosCobrador: TAction;
    actCadastroUsuarios1Click: TAction;
    actParametros: TAction;
    actAlterarSenha: TAction;
    dxBarManager1Bar5: TdxBar;
    dxBarManager1Bar6: TdxBar;
    dxBarManager1Bar7: TdxBar;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarManager1Bar8: TdxBar;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarManager1Bar9: TdxBar;
    dxBarLargeButton23: TdxBarLargeButton;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarLargeButton26: TdxBarLargeButton;
    dxBarLargeButton27: TdxBarLargeButton;
    dxBarLargeButton28: TdxBarLargeButton;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarManager1Bar10: TdxBar;
    dxBarManager1Bar11: TdxBar;
    dxBarLargeButton30: TdxBarLargeButton;
    dxBarLargeButton31: TdxBarLargeButton;
    dxBarLargeButton32: TdxBarLargeButton;
    dxBarManager1Bar12: TdxBar;
    dxSkinController1: TdxSkinController;
    cxLookAndFeelController1: TcxLookAndFeelController;
    dxBarManager1Bar1: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    dxBarCombo1: TdxBarCombo;
    cxHintStyleController1: TcxHintStyleController;
    procedure mnuCobrancaClick(Sender: TObject);
    procedure mnuAlinesClick(Sender: TObject);
    procedure mnuDevedorClick(Sender: TObject);
    procedure mnuGerarAcordoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuBancoClick(Sender: TObject);
    procedure CobranasemabertoporCredor1Click(Sender: TObject);
    procedure CadastroUsuarios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuCredorClick(Sender: TObject);
    procedure mnuCobrancaCredorClick(Sender: TObject);
    procedure mnuTipoDocumentoClick(Sender: TObject);
    procedure FecharSistema(Sender: TObject);
    procedure mnuRelatorioPendenciasCredor(Sender : TObject);
    procedure mnuBaixarRecebimentos(Sender : TObject);
    procedure mnuConsultaRecebimentoCredor(Sender : TObject);
    procedure mnuRelatorioPendenciasAcionamento(Sender : TObject);
    procedure mnuRelatorioPendenciasTipoDocumento(Sender : TObject);
    procedure mnuCadastraCobrador(Sender : TObject);
    procedure mnuImprimirAvisoDevedor(Sender : TObject);
    procedure mnuPlanejamento(Sender : TObject);
    procedure mnuAtendimentoLivre(Sender : TObject);
    procedure mnuDepre(Sender : TObject);
    procedure mnuMotivos_Acionamentos(Sender : TObject);
    procedure mnuParametros(Sender : TObject);
    procedure mnuGerarRepasse(Sender : TObject);
    procedure mnuRepasse(Sender : TObject);
    procedure mnuTipoSituacao(Sender : TObject);
    procedure mnuAlterarSenha(Sender : TObject);
    procedure mnuImprimeResumoCredor(Sender : TObject);
    procedure mnuConsultaClienteResumo(Sender : TObject);
    procedure mnuConfirmarAcionamento(Sender : TObject);
    procedure mnuRelChamadosCobrador(Sender : TObject);
    procedure mnuChamaNovaDepre(Sender : TObject);
    procedure mnuPlanejamentoNovo(Sender : TObject);
    procedure mnuAtendimentoSequencial(Sender : TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarCombo1Change(Sender: TObject);
  private
    { Private declarations }
    procedure plCriarMenu;
    procedure PreencherStatusBar;
    procedure CarregaAlerta;
    procedure plCarregaAcesso;
    procedure plGravarSkinRegistro(Skin : String);
    function flLerRegistroSkin: string;
  public
    { Public declarations }
  end;


var
  frmPrincipal: TfrmPrincipal;
  StringValue: string;
  IntegerValue: Integer;

implementation
Uses
  uNewDepre,
  uSistemas,
  //Modulo

  //Parametros
  Parametros,
  uParametros,

  //Cadastros
  uAlines,
  uBanco,
  uCredor,
  uDevedor,
  uTipoDocumento,
  uTipoSituacao,
  uUsuarios,
  uDepre,
  uMotivos_Acionamentos,
  uCobrador,
  uAlterarSenha,

  //Movimentacao
  uPlanejamento,
  uAtendimento,
  uAtendimentoProgramado,
  uConfirmarAcionamento,
  uGerarRepasse,
  uGerarAcordo,
  uRepasse,
  uCobranca,
  uBaixaRecebimento,
  uAcordo,
  uPlano,

  //Consultas
  uConsultaClienteResumo,

  //Relatorios
  uImprimeCobrancaCredor,
  uRelPendenciasCredor,
  uPesquisaRecebimentosCredor,
  uRelPendenciasAcionamento,
  uRelPendenciasTipoDocumento,
  uImprimeAvisoDevedor,
  uRelChamadosCobrador,
  uImprimeResumoCredor,

  // Funções Auxiliares
  uAlerta,
  uPesquisaCobrancaCredor,
  Math;

const
 SIDMENU  = 'IDMENU';
 SDados   = 'Dados : ';
 SVersao  = 'Versão : ';
 SUsuario = 'Usuario : ';

{$R *.dfm}

procedure TfrmPrincipal.mnuCobrancaClick(Sender: TObject);
begin
  CallCobranca(0,False);
end;

procedure TfrmPrincipal.mnuAlinesClick(Sender: TObject);
begin
  CallAlines;
end;

procedure TfrmPrincipal.mnuDevedorClick(Sender: TObject);
begin
  CallDevedor;
end;

procedure TfrmPrincipal.mnuGerarAcordoClick(Sender: TObject);
begin
  CallGerarAcordo;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
Const
  Skins = 'AllSkins.skinres';
begin
  Try
    If   FileExists(Skins) then
    begin
        dxSkinsUserSkinPopulateSkinNames(Skins, dxBarCombo1.Items);
        dxBarCombo1.Text := flLerRegistroSkin;
    end
    Else
    begin
        If FileExists(TUniqueParametros.GetParametros.DatabaseWork + Skins) then
        begin
            CopyFile(pChar(TUniqueParametros.GetParametros.DatabaseWork + Skins),pChar(Skins), False);
            dxSkinsUserSkinPopulateSkinNames(Skins, dxBarCombo1.Items);
        end;
    end;
    InicializaSistemas;
//    plCriarMenu;
    plCarregaAcesso;
  Except
    Application.Terminate;
  End;
end;

procedure TfrmPrincipal.mnuBancoClick(Sender: TObject);
begin
  CallBanco;
end;

procedure TfrmPrincipal.CobranasemabertoporCredor1Click(Sender: TObject);
begin
  callImprimeCobrancaCredor;
end;

procedure TfrmPrincipal.CadastroUsuarios1Click(Sender: TObject);
begin
  Usuarios;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  PreencherStatusBar;
end;

procedure TfrmPrincipal.mnuCredorClick(Sender: TObject);
begin
  CallCredor;
end;

procedure TfrmPrincipal.mnuCobrancaCredorClick(Sender: TObject);
begin
  ConsultaCobrancaCredor;
end;

procedure TfrmPrincipal.mnuTipoDocumentoClick(Sender: TObject);
begin
  CallTipoDocumento;
end;

procedure TfrmPrincipal.plCriarMenu;
Var
  Item,
  SubItem    : TMenuItem;
  Address    : TMethod;
  Indice     : Byte;
  FMENU_ACAO : TSimplesMENU_ACAO;
  FUsuario   : TSimplesUSUARIO;
  FUsu_Menu  : TSimplesUSUARIO_MENU;

  function plLiberaAcessoMenu(Menu: String): Boolean;
  begin
    Try
      If   Not FUsuario.Locate('USUARIO',TUniqueParametros.GetParametros.Usuario,[]) Then
           Raise Exception.Create('Usuario não encontrado');

      If   FUsu_Menu.Locate('IDUSUARIO;IDMENU', VarArrayOf([FUsuario.ID,Menu]), [loPartialKey]) then
           Result := True
      else Result := False;

    Except
      Result := False;
    End;
  end;

begin
  FMENU_ACAO := TSimplesMENU_ACAO.Create(Self);
  FUsuario   := TSimplesUSUARIO.Create(Self);
  FUsu_Menu  := TSimplesUSUARIO_MENU.Create(Self);
  Try
    FMENU_ACAO.plOrdenarPor(menu_acaopk_IdMenu);
    FMENU_ACAO.CarregaSQL;
    FUsuario.CarregaSQL;
    FUsu_Menu.CarregaSQL;
    FMENU_ACAO.First;
    While Not FMENU_ACAO.Eof Do
      Begin
        Item         := TMenuItem.Create(Self);
        Item.Caption := FMENU_ACAO.DESCRICAO_MENU;
        Item.Tag     := StrToInt(FMENU_ACAO.IDMENU);
        If   Trim(FMENU_ACAO.ACAO_MENU) <> '' Then
             Begin
               Address.Data := Pointer(Self);
               Address.Code := Self.MethodAddress(Trim(FMENU_ACAO.ACAO_MENU));
               If   Assigned(Address.Code) Then
                    Item.OnClick := TNotifyEvent(Address);
             End
        Else Item.OnClick := Nil;
        Item.Enabled := (TUniqueParametros.GetParametros.SenhaMestre) or
                        (TUniqueParametros.GetParametros.Privilegiado) or
                         plLiberaAcessoMenu(FMENU_ACAO.IDMENU);
        If   Trim(FMENU_ACAO.IDMENUPAI) <> '1' Then
             Begin
               SubItem := TMenuItem.Create(Self);
               Indice := 0;
               While (Menu.Items.Items[Indice].Tag <> StrtoInt(FMENU_ACAO.IDMENUPAI)) Do
                      Inc(Indice);
               SubItem := Menu.Items.Items[Indice];
               SubItem.Add(Item);
             End
        Else Menu.Items.Add(Item);
        FMENU_ACAO.Next;
      End;
  Finally
    FMENU_ACAO.Free;
    FUsuario.Free;
    FUsu_Menu.Free;
  End;
end;


procedure TfrmPrincipal.FecharSistema;
begin
  Close;
end;

procedure TfrmPrincipal.mnuRelatorioPendenciasCredor(Sender: TObject);
begin
  RelPendenciasCredor;
end;

procedure TfrmPrincipal.mnuBaixarRecebimentos(Sender: TObject);
begin
  BaixarRecebimento;
end;

procedure TfrmPrincipal.mnuConsultaRecebimentoCredor(Sender: TObject);
begin
  ConsultaRecebimentoCredor;
end;

procedure TfrmPrincipal.mnuRelatorioPendenciasAcionamento(Sender : TObject);
begin
  RelPendenciasAcionamento;
end;

procedure TfrmPrincipal.mnuRelatorioPendenciasTipoDocumento(Sender : TObject);
begin
  RelPendenciasTipoDocumento;
end;

procedure TfrmPrincipal.mnuCadastraCobrador(Sender: TObject);
begin
  CadastraCobrador;
end;

procedure TfrmPrincipal.mnuImprimirAvisoDevedor(Sender: TObject);
begin
  callImprimeAvisoDevedor;
end;

procedure TfrmPrincipal.mnuPlanejamento(Sender: TObject);
begin
  Planejamento;
end;

procedure TfrmPrincipal.PreencherStatusBar;
begin
  If   TUniqueParametros.GetParametros.EhCobrador Then
       dxRibbonStatusBar1.Panels[0].Text := SUsuario + ' Cobrador: ' + TUniqueParametros.GetParametros.Usuario
  Else dxRibbonStatusBar1.Panels[0].Text := SUsuario + TUniqueParametros.GetParametros.Usuario;
  dxRibbonStatusBar1.Panels[1].Text := SVersao + IntToStr(TUniqueParametros.GetParametros.Versao);
  dxRibbonStatusBar1.Panels[2].Text := SDados + TUniqueParametros.GetParametros.DatabaseName;
  dxRibbonStatusBar1.Panels[3].Text := 'Maquina : ' + TUniqueParametros.GetParametros.HostName;
  dxRibbonStatusBar1.Panels[4].Text := 'IP : ' + TUniqueParametros.GetParametros.IPNumber;
  dxRibbonStatusBar1.Panels[5].Text := 'Usuario Sistema : ' + TUniqueParametros.GetParametros.UsuarioSistema;
  dxRibbonStatusBar1.Panels[6].Text := 'Controle : ' + TUniqueParametros.GetParametros.VersaoSw;
end;

procedure TfrmPrincipal.mnuAtendimentoLivre(Sender: TObject);
begin
  AtendimentoLivre;
end;

procedure TfrmPrincipal.mnuDepre(Sender : TObject);
begin
 calldepre;
end;

procedure TfrmPrincipal.mnuMotivos_Acionamentos(Sender: TObject);
begin
  callMotivos_Acionamentos;
end;

procedure TfrmPrincipal.mnuParametros(Sender: TObject);
begin
  callParametros;
end;

procedure TfrmPrincipal.CarregaAlerta;
var
  I            : Integer;
  fAlertaMsn   : TForm;
  BarraIniciar : HWND; {Barra Iniciar}
  tmAltura     : Integer;
  tmRect       : TRect;
  xTop         : Integer;
  xIniTop      : Integer;
begin
  //localiza o Handle da janela iniciar
  BarraIniciar := FindWindow('Shell_TrayWnd', nil);
  //Pega o "retângulo" que envolve a barra e sua altura
  GetWindowRect(BarraIniciar, tmRect);
  tmAltura := tmRect.Bottom - tmRect.Top;
  fAlertaMsn := TFrmAlerta.Create(Self);
  with fAlertaMsn do
  begin
    Left := Screen.Width - ClientWidth;
    if tmRect.Top = -2 then
      tmAltura := 30;
    //Pega o top final
    xTop := Screen.Height - ClientHeight - tmAltura;
    //Pega o top inicial
    xIniTop := Screen.Height + ClientHeight + tmAltura;
    Top := xIniTop;
    for I := xIniTop downto xTop do
    begin
      Top := Top - 1;
      Show;
      Update;
      Application.ProcessMessages;
      Sleep(10);
    end;
    Sleep(3000);
    Close;
    FreeAndNil(fAlertaMsn);
  end;
end;

procedure TfrmPrincipal.mnuGerarRepasse(Sender: TObject);
begin
  plGerarRepasse;
end;

procedure TfrmPrincipal.mnuRepasse(Sender: TObject);
begin
  ChamaRepasse;
end;

procedure TfrmPrincipal.mnuTipoSituacao(Sender: TObject);
begin
  CallTipoSituacao;
end;

procedure TfrmPrincipal.mnuAlterarSenha(Sender: TObject);
begin
  plCallAlterarSenha;
end;

procedure TfrmPrincipal.mnuImprimeResumoCredor(Sender: TObject);
begin
  callImprimeResumoCredor;
end;

procedure TfrmPrincipal.mnuConsultaClienteResumo(Sender: TObject);
begin
  plCarregarClienteResumo;
end;

procedure TfrmPrincipal.mnuConfirmarAcionamento(Sender: TObject);
begin
  plConfirmarAcionamento;
end;

procedure TfrmPrincipal.mnuRelChamadosCobrador(Sender: TObject);
begin
  RelChamadosCobrador;
end;

procedure TfrmPrincipal.mnuChamaNovaDepre(Sender: TObject);
begin
  ChamaNovaDepre;
end;

procedure TfrmPrincipal.mnuAtendimentoSequencial(Sender: TObject);
begin
  AtendimentoSequencial;
end;

procedure TfrmPrincipal.mnuPlanejamentoNovo(Sender: TObject);
begin
  plIniciarPlano;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  plDesconectarUsuario;
end;

procedure TfrmPrincipal.plCarregaAcesso;
var
  i          : byte;
  FUsuario   : TSimplesUSUARIO;
  FUsu_Menu  : TSimplesUSUARIO_MENU;

  function plLiberaAcessoMenu(Menu: String): Boolean;
  begin
    Try
      If   Not FUsuario.Locate('USUARIO',TUniqueParametros.GetParametros.Usuario,[]) Then
           Raise Exception.Create('Usuario não encontrado');

      If   FUsu_Menu.Locate('IDUSUARIO;IDMENU', VarArrayOf([FUsuario.ID,Menu]), [loPartialKey]) then
           Result := True
      else Result := False;

    Except

      Result := False;
    End;
  end;


begin
  FUsuario   := TSimplesUSUARIO.Create(Self);
  FUsu_Menu  := TSimplesUSUARIO_MENU.Create(Self);
  Try
    FUsuario.CarregaSQL;
    FUsu_Menu.CarregaSQL;
    For i := 0 to ActionList1.ActionCount - 1 do
    begin
      TCustomAction(ActionList1.Actions[i]).Enabled := (TUniqueParametros.GetParametros.SenhaMestre) or
                                                       (TUniqueParametros.GetParametros.Privilegiado) or
                                                       (plLiberaAcessoMenu(IntToStr(ActionList1.Actions[i].Tag)));
    end;
  Finally
    FUsuario.Free;
    FUsu_Menu.Free;
  End;
end;

procedure TfrmPrincipal.dxBarCombo1Change(Sender: TObject);
begin
   if  (FileExists('AllSkins.skinres'))
   and (dxSkinsUserSkinLoadFromFile('AllSkins.skinres', TdxBarCombo(Sender).Text)) then
       begin
         dxSkinController1.NativeStyle        := false;
         cxLookAndFeelController1.NativeStyle := false;
         dxSkinController1.SkinName           := 'UserSkin';
         cxLookAndFeelController1.SkinName    := 'UserSkin';
         dxRibbon1.ColorSchemeName            := 'UserSkin';
         dxSkinController1.UseSkins           := true;
         dxSkinController1.Refresh;
         plGravarSkinRegistro(TdxBarCombo(Sender).Text);
       end;
end;

procedure TfrmPrincipal.plGravarSkinRegistro(Skin: String);
var
  Reg : TRegistry;
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('Software\Projecao\wCob',true);
   Reg.WriteString('Skin',Skin);
   Reg.CloseKey;
   Reg.Free;
end;

function TfrmPrincipal.flLerRegistroSkin: string;
var
   reg: TRegistry;
begin
   reg := TRegistry.Create;
   reg.RootKey := HKEY_CURRENT_USER;
   reg.OpenKey('Software\Projecao\wCob',true);
   Result := reg.ReadString('Skin');
   reg.CloseKey;
   reg.Free;
end;

end.
