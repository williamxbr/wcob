unit uAlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayUsuario,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAlterarSenha = class(TForm)
    pnTop: TPanel;
    pnTela: TPanel;
    pnRodape: TPanel;
    edSenhaAtual: TEdit;
    edNovaSenha: TEdit;
    edRepetirNovaSenha: TEdit;
    lblUsuario: TLabel;
    lblSenhaAtual: TLabel;
    lblNovaSenha: TLabel;
    lblRepetirNovaSenha: TLabel;
    btnSair: TBitBtn;
    lblNomeUsuario: TLabel;
    Label6: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSenhaAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edNovaSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edRepetirNovaSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FUsuario : TUSUARIO;
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
  public
    { Public declarations }
  end;

  procedure plCallAlterarSenha;

implementation
Uses
  Parametros,
  uCodifica;

{$R *.dfm}

Procedure plCallAlterarSenha;
var
  frmAlterarSenha: TfrmAlterarSenha;
Begin
  frmAlterarSenha := TfrmAlterarSenha.Create(Application);
  Try
    frmAlterarSenha.ShowModal;
  Finally
    FreeAndNil(frmAlterarSenha);
  End;
End;



procedure TfrmAlterarSenha.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAlterarSenha.FormCreate(Sender: TObject);
begin
  lblNomeUsuario.Caption := TUniqueParametros.GetParametros.Usuario;
  plAbrirTabelas;
end;

procedure TfrmAlterarSenha.edSenhaAtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  If   Key = #13 Then
       Begin
         If  Not FUsuario.Locate('USUARIO;SENHA', VarArrayOf([TUniqueParametros.GetParametros.Usuario,
                                                  Criptografar(edSenhaAtual.Text)]), []) Then
             Raise Exception.Create('Senha Invalida!')
         Else
             Begin
               edNovaSenha.Enabled := True;
               edRepetirNovaSenha.Enabled := True;
               edNovaSenha.SetFocus;
             End;
       End;
end;

procedure TfrmAlterarSenha.edNovaSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If   Key = #13 Then
       edRepetirNovaSenha.SetFocus;
end;

procedure TfrmAlterarSenha.edRepetirNovaSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If   Key = #13 Then
       Begin
         If  (trim(edNovaSenha.Text) <> EmptyStr)
         and (edNovaSenha.Text = edRepetirNovaSenha.Text) Then
              Begin
                If   MessageBox(Self.Handle,'Tem certeza que gostaria de alterar a sua senha?','Atenção',MB_YESNO+MB_ICONQUESTION) = 6 Then
                Begin
                    FUsuario.Edit;
                    Try
                      FUsuario.SENHA := Criptografar(UpperCase(edRepetirNovaSenha.Text));
                      FUsuario.Post;
                      ShowMessage('Senha alterada com sucesso!');
                    Except
                      FUsuario.Cancel;
                    End;
                End;
              End
         Else
              ShowMessage('As senhas não coincidem! Por favor reinforme!');
       End;
end;

procedure TfrmAlterarSenha.plAbrirTabelas;
begin
  FUsuario := TUSUARIO.Create(Self);
  FUsuario.Carrega(False);
end;

procedure TfrmAlterarSenha.plFecharTabelas;
begin
  FUsuario.Free;
end;

procedure TfrmAlterarSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  plFecharTabelas;
end;

end.
