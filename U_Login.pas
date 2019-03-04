unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, DBTables, jpeg;

type
  TFLogin = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ValorNome: TEdit;
    ValorSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    LVersao: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ValorNomeKeyPress(Sender: TObject; var Key: Char);
    procedure ValorSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    FALogin: String;
    procedure SetALogin(const Value: String);
    { Private declarations }
  public
    property Login: String read FALogin write SetALogin;
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  usuario: string;


implementation

uses U_Principal;

{$R *.dfm}

procedure TFLogin.Button2Click(Sender: TObject);
begin
  FPrincipal.Close;
end;

procedure TFLogin.Button1Click(Sender: TObject);
var
  mensagem : string;
  v        : string;
begin
//a conexão com o banco é necessária por senha pois coloquei senha na tebela!
//vc pode tirar isso se não quiser colocar senha na tabela.

  FPrincipal.QLogin.DBSession.AddPassword('1234'); //1234 é a senha da tabela.

 if   (ValorNome.Text <> '') and (ValorSenha.Text <> '') then
      begin
        FPrincipal.QLogin.Close;
        FPrincipal.QLogin.SQL.Clear;
        FPrincipal.QLogin.SQL.Add(' SELECT * FROM USUARIOS' +
                                  ' WHERE Login = :vNome' +
                                  ' AND Senha = :vSenha');
        FPrincipal.QLogin.Params[0].Value:= ValorNome.Text;
        FPrincipal.QLogin.Params[1].Value:= ValorSenha.Text;
        FPrincipal.QLogin.Open;

        usuario:= ValorNome.Text;
        FALogin := usuario;

        if   (FPrincipal.QLogin.RecordCount) = 1 then
             begin
               v:= 'S';
               FPrincipal.QLogin.SQL.Add(' AND STATUS = '+ #39 + v + #39);
               FPrincipal.QLogin.Open;
               if   (FPrincipal.QLogin.RecordCount) = 1 then
                    begin
                      FPrincipal.Logoffde1.Caption:= 'Logoff de: ' + FPrincipal.QLogin.fieldbyname('LOGIN').AsString;
                      FPrincipal.Logoffde1.Hint:= 'Logoff de: ' + FPrincipal.QLogin.fieldbyname('LOGIN').AsString;
                      FPrincipal.StatusBar1.Panels[2].Text:= ' ' + 'Usuário: ' + usuario;
                      FLogin.Close;
                    end
               Else
                     Application.MessageBox(PChar('Você foi Bloqueado!' + #13 +
                                                  'Consulte o administrador do sistema.'), 'Login não autorizado', MB_OK+MB_IconError);
             end
        else
             begin
               mensagem:= 'Nome ou senha do usuário inválidos.' + #13 + #13
                       + 'Se você esqueceu sua senha, consulte' + #13
                       + 'o administrador do sistema.';
               Application.MessageBox(PChar(mensagem), 'Login não autorizado', MB_OK+MB_IconError);
               ValorSenha.Text:= '';
               ValorNome.SetFocus;
             end;
      End;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
  ValorNome.SetFocus;
end;

procedure TFLogin.ValorNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       begin
         SelectNext(ActiveControl, True, True);
         key:= #0;
       end;
end;

procedure TFLogin.ValorSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       begin
         SelectNext(ActiveControl, True, True);
         key:= #0;
       end;
end;

procedure TFLogin.SetALogin(const Value: String);
begin
  FALogin := usuario;
end;

end.
