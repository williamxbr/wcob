unit uUsuariosLogados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, jpeg, ExtCtrls, ToolWin, StdCtrls, Buttons,
  DB,
  XPMan, CheckLst;


type

  TUsuarioLogado = Class
    IdUsuario : Integer;
  End;


  TfrmPrincipal = class(TForm)
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CheckListBox1: TCheckListBox;
    btnDesconectar: TBitBtn;
    btnSair: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FecharSistema(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure plCarregaUsuariosLogados;
  public
    { Public declarations }
  end;


var
  frmPrincipal: TfrmPrincipal;

implementation
Uses
  ucLayUsuario,
  uSistemas,
  //Modulo

  //Parametros
  Parametros,
  uParametros;


const
 SIDMENU  = 'IDMENU';
 SDados   = 'Dados : ';
 SVersao  = 'Versão : ';
 SUsuario = 'Usuario : ';

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Try
    InicializaSistemas;
    plCarregaUsuariosLogados;
  Except
    Application.Terminate;
  End;
end;



procedure TfrmPrincipal.FecharSistema;
begin
  Close;
end;



procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  plDesconectarUsuario;
end;

procedure TfrmPrincipal.plCarregaUsuariosLogados;
Var
  FUsuarioLogado  : TUsuarioLogado;
  FSimplesUsuario : TSimplesUSUARIO;
begin
  FSimplesUsuario := TSimplesUSUARIO.Create(Self);
  CheckListBox1.Clear;
  FSimplesUsuario.CarregaSQL;
  While Not FSimplesUsuario.Eof Do
    Begin
      If   FSimplesUsuario.USUARIO_LOGADO Then
           Begin
             FUsuarioLogado := TUsuarioLogado.Create;
             FUsuarioLogado.IdUsuario := FSimplesUsuario.ID;
             CheckListBox1.Items.AddObject(FSimplesUsuario.USUARIO,FUsuarioLogado);
           End;
      FSimplesUsuario.Next;
    End;
end;

procedure TfrmPrincipal.btnDesconectarClick(Sender: TObject);
Var
  Ind : Byte;
  FUsuarioLogado  : TUsuarioLogado;
  FUsuario        : TUSUARIO;
begin
  FUsuario  := TUSUARIO.Create(Self);
  Try
    FUsuario.Carrega(False);
    For Ind := 0 to CheckListBox1.Items.Count - 1 Do
        If   CheckListBox1.Checked[Ind] Then
             Begin
               FUsuarioLogado := TUsuarioLogado(CheckListBox1.Items.Objects[Ind]);
               If  FUsuario.FindBypk_Id(FUsuarioLogado.IdUsuario) Then
                   Begin
                     FUsuario.Edit;
                     FUsuario.USUARIO_LOGADO := False;
                     FUsuario.Post;
                   End;
             End;
    plCarregaUsuariosLogados;
  Finally
    FUsuario.Free;
  End;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
