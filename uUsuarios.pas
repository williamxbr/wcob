unit uUsuarios;

interface


uses
  Variants,
  Buttons,
  Dialogs,
  Classes,
  ComCtrls,
  Controls,
  DB,
  ExtCtrls,
  Forms,
  Graphics,
  ImgList,
  Menus,
  ucLayUsuario,
  ucLayUsuario_Menu,
  ucLayMenu_Acao,
  StdCtrls,
  NumericEdit;

type
  PTreeMenu = ^TTreeMenu;

  TTreeMenu = record
    Selecionado : Integer;
    MenuName    : String;
    TagName     : String;
  end;

  TFormUsuarios = class(TForm)
    Panel1:       TPanel;
    lblTitulo: TLabel;
    Image1:       TImage;
    Panel3:       TPanel;
    BtLibera:     TBitBtn;
    BtBloqueia:   TBitBtn;
    ImageList1:   TImageList;
    PC:           TPageControl;
    PageMenu:     TTabSheet;
    TreeMenu:     TTreeView;
    pnOpcoes: TPanel;
    pnRodape: TPanel;
    BtGrava: TBitBtn;
    BtCancel: TBitBtn;
    ckPrivilegiado: TCheckBox;
    ckAtivo: TCheckBox;
    pnUsuarioId: TPanel;
    edNomeCompleto: TEdit;
    edNomeUsuario: TEdit;
    edSenha1: TEdit;
    edSenha2: TEdit;
    lblID: TLabel;
    lblUsuario: TLabel;
    lblSenha1: TLabel;
    lblSenha2: TLabel;
    lblNomeCompleto: TLabel;
    btnLimpar: TBitBtn;
    procedure BtGravaClick(Sender: TObject);
    procedure TreeMenuClick(Sender: TObject);
    procedure BtCancelClick(Sender: TObject);
    procedure BtLiberaClick(Sender: TObject);
    procedure BtBloqueiaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeActionClick(Sender: TObject);
    procedure TreeControlsClick(Sender: TObject);
    procedure TreeMenuCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure TreeMenuKeyPress(Sender: TObject; var Key: char);
    procedure TreeMenuMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ieUsuarioExit(Sender: TObject);
    procedure ieUsuarioBtnClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure ckPrivilegiadoClick(Sender: TObject);
  private
    FUsuario      :  TUSUARIO;
    FUsuario_Menu :  TUSUARIO_MENU;

    ieUsuarioId   :  TIntegerEdit;
    FMenu         :  TMenu;
    FActions      :  TObject;
    FChangingTree :  Boolean;
    FTempMPointer :  PTreeMenu;
    FTempLista    :  TStringList;
    FListaMenu    :  array of PTreeMenu;
    FTempIdUser   :  Integer;
    procedure TrataItem(IT: TMenuItem; node: TTreeNode); overload;
    procedure TreeMenuItem(marca: Boolean);
    procedure Atualiza(Selec: Boolean);
    procedure TreeActionItem(marca: Boolean);
    procedure UnCheckChild(node: TTreeNode);
    procedure TreeControlItem(marca: Boolean);
    procedure CarregaTreeviews;
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
    procedure plComponentes;
    procedure plCarregaAcessoUsuario;
    { Private declarations }
    procedure plCriarMenu;
    procedure plHabilitaTreeMenu(cHabilita : Boolean);
    procedure plLimpar;
    procedure plPesquisaUsuarios;
  public

  end;

  Procedure Usuarios;


implementation

uses
  Messages,
  SysUtils,
  uCodifica,
  uPesquisa,
  Parametros,
  Windows;

{$R *.dfm}

procedure Usuarios;
var
  formUsuarios: TFormUsuarios;
Begin
  formUsuarios := TFormUsuarios.Create(Application);
  Try
    formUsuarios.ShowModal;
  Finally
    formUsuarios.Free;
  End;
End;


procedure TFormUsuarios.BtGravaClick(Sender: TObject);
var
  Contador: Integer;
begin
  Try
    FUsuario.Carrega(False);
    FUsuario_Menu.Carrega(False);
    If   ieUsuarioId.IntegerNumber = 0 Then
        Begin
          If   Trim(UpperCase(edSenha1.Text)) = EmptyStr Then
               Raise Exception.Create('Senha em branco!');

          If   Trim(UpperCase(edSenha1.Text)) <> Trim(UpperCase(edSenha2.Text)) Then
               Raise Exception.Create('senhas não consistem!');

          If   FUsuario.FindByInd_Usuario(Trim(edNomeUsuario.Text)) Then
               Raise Exception.Create('Já existe esse usuario!');
          FUsuario.Insert;
          FUsuario.USUARIO      := edNomeUsuario.Text;
          FUsuario.SENHA        := Criptografar(Trim(UpperCase(edSenha1.Text)));
          FUsuario.NOME         := edNomeCompleto.Text;
          FUsuario.TIPO_USUARIO := ckPrivilegiado.Checked;
          FUsuario.ATIVO        := ckAtivo.Checked;
          FUsuario.Post;

          ShowMessage('Usuario incluido com sucesso!');

        End
    Else
        Begin
          If   Not FUsuario.FindBypk_Id(ieUsuarioId.IntegerNumber) Then
               Raise Exception.Create('Usuario inexistente"');
          FUsuario.Edit;
          FUsuario.NOME         := edNomeCompleto.Text;
          FUsuario.TIPO_USUARIO := ckPrivilegiado.Checked;
          FUsuario.ATIVO        := ckAtivo.Checked;
          FUsuario.Post;

          ShowMessage('Usuario alterado com sucesso!');

        End;

    for Contador := 0 to TreeMenu.Items.Count - 1 do
      If   PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado = 1 then
           Begin
             If   Not FUsuario_Menu.FindByPk_IdUsuario_IdMenu(FUsuario.ID,PTreeMenu(TreeMenu.Items[Contador].Data).TagName) Then
                  Begin
                    FUsuario_Menu.Insert;
                    FUsuario_Menu.IDUSUARIO := FUsuario.ID;
                    FUsuario_Menu.IDMENU    := PTreeMenu(TreeMenu.Items[Contador].Data).TagName;
                    FUsuario_Menu.Post;
                  End;
           End
      Else
           Begin
             If   FUsuario_Menu.FindByPk_IdUsuario_IdMenu(FUsuario.ID,PTreeMenu(TreeMenu.Items[Contador].Data).TagName) Then
                  FUsuario_Menu.Delete;
           End;


  Except
    On E: Exception Do
       ShowMessage(e.Message);
  End;
end;

procedure TFormUsuarios.TrataItem(IT: TMenuItem; node: TTreeNode);
var
  contador: Integer;
  TempNode: TTreeNode;
begin
  for contador := 0 to IT.Count - 1 do
    if IT.Items[Contador].Caption <> '-' then
      if IT.Items[Contador].Count > 0 then
      begin
        New(FTempMPointer);
        SetLength(FListaMenu, Length(FListaMenu) + 1);  //Adicionado por Luiz 18/01/06
        FListaMenu[High(FListaMenu)] := FTempMPointer;  //Adicionado por Luiz 18/01/06
        FTempMPointer.Selecionado    := 0;
        FTempMPointer.MenuName       := IT.Items[Contador].Caption;
        FTempMPointer.TagName        := IntToStr(IT.Items[Contador].Tag);
        TempNode                     := TreeMenu.Items.AddChildObject(node, StringReplace(IT.Items[Contador].Caption, '&', '', [rfReplaceAll])+' - '+IntToStr(IT.Items[Contador].Tag), FTempMPointer);
        TrataItem(IT.Items[Contador], TempNode);
      end
      else
      begin
        New(FTempMPointer);
        SetLength(FListaMenu, Length(FListaMenu) + 1);  //Adicionado por Luiz 18/01/06
        FListaMenu[High(FListaMenu)] := FTempMPointer;  //Adicionado por Luiz 18/01/06
        FTempMPointer.Selecionado    := 0;
        FTempMPointer.MenuName       := IT.Items[Contador].Caption;
        FTempMPointer.TagName        := IntToStr(IT.Items[Contador].Tag);
        TreeMenu.Items.AddChildObject(node, StringReplace(IT.Items[Contador].Caption, '&', '', [rfReplaceAll])+' - '+IntToStr(IT.Items[Contador].Tag), FTempMPointer);
      end;
end;

procedure TFormUsuarios.CarregaTreeviews;
var
  Contador: Integer;
  TempNode: TTreeNode;
  Temp:     String;
  Temp2:    String;
  Desc:     String;
begin
  FChangingTree := False;
  PC.ActivePage := PageMenu;

//  Self.FMenu              := TUserControl(Owner).ControlRight.MainMenu;

  if Assigned(FMenu) then
  begin
    TreeMenu.Items.Clear;
    for Contador := 0 to FMenu.Items.Count - 1 do
      if FMenu.Items[Contador].Count > 0 then
      begin
        New(FTempMPointer);
        SetLength(FListaMenu, Length(FListaMenu) + 1);  //Adicionado por Luiz 18/01/06
        FListaMenu[High(FListaMenu)] := FTempMPointer;  //Adicionado por Luiz 18/01/06
        FTempMPointer.Selecionado    := 0;
        FTempMPointer.MenuName       := FMenu.Items[Contador].Caption;
        FTempMPointer.TagName        := IntToStr(FMenu.Items[Contador].Tag);
        TempNode                     := TreeMenu.Items.AddObject(nil, StringReplace(FMenu.Items[Contador].Caption, '&', '', [rfReplaceAll])+' - '+IntToStr(FMenu.Items[Contador].Tag), FTempMPointer);
        TrataItem(FMenu.Items[Contador], TempNode);
      end
      else
        if FMenu.Items[Contador].Caption <> '-' then
        begin
          New(FTempMPointer);
          SetLength(FListaMenu, Length(FListaMenu) + 1);  //Adicionado por Luiz 18/01/06
          FListaMenu[High(FListaMenu)] := FTempMPointer;  //Adicionado por Luiz 18/01/06
          FTempMPointer.Selecionado    := 0;
          FTempMPointer.MenuName       := FMenu.Items[Contador].Caption;
          FTempMPointer.TagName        := IntToStr(FMenu.Items[Contador].Tag);
          TreeMenu.Items.AddObject(nil, StringReplace(FMenu.Items[Contador].Caption, '&', '', [rfReplaceAll])+' - '+IntToStr(FMenu.Items[Contador].Tag), FTempMPointer);
        end;
    TreeMenu.FullExpand;
    TreeMenu.Perform(WM_VSCROLL, SB_TOP, 0);
  end;

  PageMenu.TabVisible := Assigned(FMenu);

end;

procedure TFormUsuarios.UnCheckChild(node: TTreeNode);
var
  child: TTreeNode;
begin
  PTreemenu(node.Data).Selecionado := 0;
  node.ImageIndex                  := 0;
  node.SelectedIndex               := 0;
  child                            := node.GetFirstChild;
  repeat
    if child.HasChildren then
      UnCheckChild(child)
    else
    begin
      PTreemenu(child.Data).Selecionado := 0;
      child.ImageIndex                  := 0;
      child.SelectedIndex               := 0;
    end;
    child := node.GetNextChild(child);
  until child = nil;
end;

procedure TFormUsuarios.TreeMenuItem(Marca: Boolean);
var
  AbsIdx: Integer;
begin
  if Marca then
    if PTreemenu(TreeMenu.Selected.Data).Selecionado < 2 then
    begin
      if PTreemenu(TreeMenu.Selected.Data).Selecionado = 0 then //marcar
      begin
        AbsIdx := TreeMenu.Selected.AbsoluteIndex;
        while AbsIdx > -1 do
        begin
          PTreemenu(TreeMenu.Items.Item[AbsIdx].Data).Selecionado := 1;
          TreeMenu.Items.Item[AbsIdx].ImageIndex                  := 1;
          TreeMenu.Items.Item[AbsIdx].SelectedIndex               := 1;
          if TreeMenu.Items.Item[AbsIdx].Parent <> nil then
          begin
            AbsIdx := TreeMenu.Items.Item[AbsIdx].Parent.AbsoluteIndex;
            if PTreemenu(TreeMenu.Items.Item[AbsIdx].Data).Selecionado = 2 then
              AbsIdx := -1;
          end
          else
            AbsIdx := -1;
        end;
      end
      else
        if TreeMenu.Selected.HasChildren then
          UnCheckChild(TreeMenu.Selected)
        else
        begin
          PTreemenu(TreeMenu.Selected.Data).Selecionado := 0;
          TreeMenu.Selected.ImageIndex                  := 0;
          TreeMenu.Selected.SelectedIndex               := 0;
        end; //desmarcar
      TreeMenu.Repaint;
    end;
end;

procedure TFormUsuarios.TreeActionItem(marca: Boolean);
begin
end;

procedure TFormUsuarios.TreeControlItem(marca: Boolean);
begin
end;

procedure TFormUsuarios.TreeMenuClick(Sender: TObject);
begin
  if not FChangingTree then
    TreeMenuItem(True);
end;

procedure TFormUsuarios.BtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormUsuarios.BtLiberaClick(Sender: TObject);
begin
  Atualiza(True);
end;

procedure TFormUsuarios.Atualiza(Selec: Boolean);
var
  Contador: Integer;
  Temp:     Integer;
begin
  if Selec then
    Temp := 1
  else
    Temp := 0;

  if PC.ActivePage = PageMenu then
  begin
    for Contador := 0 to TreeMenu.Items.Count - 1 do
      if PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado < 2 then
      begin
        PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado := Temp;
        TreeMenu.Items[Contador].ImageIndex                  := Temp;
        TreeMenu.Items[Contador].SelectedIndex               := Temp;
      end;
    TreeMenu.Repaint;
  end;
end;


procedure TFormUsuarios.BtBloqueiaClick(Sender: TObject);
begin
  Atualiza(False);
end;

procedure TFormUsuarios.FormShow(Sender: TObject);
begin
  //carrega itens do menu, actions e controles
  CarregaTreeviews;
end;

procedure TFormUsuarios.TreeActionClick(Sender: TObject);
begin
  if not FChangingTree then
    TreeActionItem(True);
end;

procedure TFormUsuarios.TreeControlsClick(Sender: TObject);
begin
  if not FChangingTree then
    TreeControlItem(True);
end;

procedure TFormUsuarios.TreeMenuCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
begin
  if (Self.Showing) and (TTreeView(Sender).Focused) then
    FChangingTree := True;
end;

procedure TFormUsuarios.TreeMenuKeyPress(Sender: TObject; var Key: char);
begin
  if Key = ' ' then
  begin
    TTreeView(Sender).OnClick(Sender);
    Key := #0;
  end;
end;

procedure TFormUsuarios.TreeMenuMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FChangingTree := False;
end;

procedure TFormUsuarios.FormDestroy(Sender: TObject);
var
  Contador: Integer;
begin
  // Adicionado por Luiz 18/01/06

  if Assigned(FTempLista) then
    FreeAndNil(FTempLista);

  for Contador := 0 to High(FListaMenu) do
    Dispose(FListaMenu[Contador]);

  plFecharTabelas;
end;

procedure TFormUsuarios.plAbrirTabelas;
begin
  FUsuario      := TUSUARIO.Create(Self);
  FUsuario_Menu := TUSUARIO_MENU.Create(Self);
  FMenu         := TMenu.Create(Self);
end;

procedure TFormUsuarios.plFecharTabelas;
begin
  FUsuario.Free;
  FUsuario_Menu.Free;
  FMenu.Free;
end;

procedure TFormUsuarios.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  plCriarMenu;
  plComponentes;
end;

procedure TFormUsuarios.plComponentes;
begin
  ieUsuarioId := TIntegerEdit.Create(Self);
  With ieUsuarioId Do
    Begin
      Parent      := pnUsuarioId;
      Name        := 'ieUsuarioId';
      Width       := pnUsuarioId.ClientWidth;
      ShowButton  := True;
      OnExit      := ieUsuarioExit;
      OnBtnClick  := ieUsuarioBtnClick;
    End;
end;

procedure TFormUsuarios.plCarregaAcessoUsuario;
var
  Contador: Integer;
  Selec:    Integer;
begin
//  FUsuario.ID := FTempIdUser;
//  FSUsuario.CarregaSQL;
  // Adcionado por Luiz
  SetLength(FListaMenu, 0);
//  lbUser.Caption := FSUsuario.USUARIO;
  for Contador := 0 to TreeMenu.Items.Count - 1 do
  begin
    FUsuario_Menu.Carrega(False);
    If   FUsuario_Menu.FindByPk_IdUsuario_IdMenu(FUsuario.ID,PTreeMenu(TreeMenu.Items[Contador].Data).TagName) Then
         Selec := 1
    else Selec := 0;

    PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado := Selec;
    TreeMenu.Items[Contador].ImageIndex                  := Selec;
    TreeMenu.Items[Contador].SelectedIndex               := Selec;
  end;

  TreeMenu.Repaint;
  FChangingTree := False;
end;

procedure TFormUsuarios.ieUsuarioExit(Sender: TObject);
begin
  Try
   edNomeUsuario.Enabled := ieUsuarioId.IntegerNumber = 0;
   edSenha1.Enabled      := ieUsuarioId.IntegerNumber = 0;
   edSenha2.Enabled      := ieUsuarioId.IntegerNumber = 0;
   If   ieUsuarioId.IntegerNumber > 0 Then
        Begin
          FUsuario.Carrega(False);
          If   FUsuario.FindBypk_Id(ieUsuarioId.IntegerNumber) Then
               Begin
                 edNomeUsuario.Text     := FUsuario.USUARIO;
                 edSenha1.Text          := FUsuario.SENHA;
                 edSenha2.Text          := FUsuario.SENHA;
                 edNomeCompleto.Text    := FUsuario.NOME;
                 ckPrivilegiado.Checked := FUsuario.TIPO_USUARIO;
                 ckAtivo.Checked        := FUsuario.ATIVO;
                 plHabilitaTreeMenu(Not ckPrivilegiado.Checked);
                 plCarregaAcessoUsuario;
               End
          Else Raise Exception.Create('Usuario não encontrado!');
        End;
  Except
    On E: Exception Do
       Begin
         ShowMessage(E.Message);
         ieUsuarioId.SetFocus;
       End;
  End
end;

procedure TFormUsuarios.ieUsuarioBtnClick(Sender: TObject);
begin
  plPesquisaUsuarios;
end;

procedure TFormUsuarios.plHabilitaTreeMenu(cHabilita: Boolean);
begin
  TreeMenu.Enabled   := cHabilita;
  BtLibera.Enabled   := cHabilita;
  BtBloqueia.Enabled := cHabilita;
end;

procedure TFormUsuarios.btnLimparClick(Sender: TObject);
begin
  plLimpar;
end;

procedure TFormUsuarios.plLimpar;
begin
  Atualiza(False);
  plHabilitaTreeMenu(False);
  ckPrivilegiado.Checked := False;
  ckAtivo.Enabled        := False;
  edNomeCompleto.Text    := EmptyStr;
  edNomeUsuario.Text     := EmptyStr;
  edSenha1.Text          := EmptyStr;
  edSenha2.Text          := EmptyStr;
  ieUsuarioId.IntegerNumber := 0;
  ieUsuarioId.SetFocus;
end;

procedure TFormUsuarios.plPesquisaUsuarios;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'USUARIO';
    FConsulta.DefineCampos(['ID', 'USUARIO']);
    FConsulta.CampoCondicao := 'USUARIO';
    If   FConsulta.Execute Then
         ieUsuarioId.IntegerNumber := FConsulta.Consulta.FieldByName('ID').AsInteger;
    ieUsuarioExit(Self);
  Finally
    FConsulta.Free;
  End;
end;

procedure TFormUsuarios.ckPrivilegiadoClick(Sender: TObject);
begin
  plHabilitaTreeMenu(Not ckPrivilegiado.Checked);
end;

procedure TFormUsuarios.plCriarMenu;
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
               While (FMenu.Items.Items[Indice].Tag <> StrtoInt(FMENU_ACAO.IDMENUPAI)) Do
                      Inc(Indice);
               SubItem := FMenu.Items.Items[Indice];
               SubItem.Add(Item);
             End
        Else FMenu.Items.Add(Item);
        FMENU_ACAO.Next;
      End;
  Finally
    FMENU_ACAO.Free;
    FUsuario.Free;
    FUsu_Menu.Free;
  End;
end;

end.

