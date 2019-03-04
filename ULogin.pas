unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DBITYPES, DBIPROCS, DBIERRS,  
  Dialogs, ExtCtrls, StdCtrls, DB, DBTables, jpeg, dxGDIPlusClasses;

type
  TFLogin = class(TForm)
    Button1: TButton;
    Button2: TButton;
    LVersao: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdNome: TEdit;
    EdSenha: TEdit;
    Image2: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure EdNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EdSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega;
    procedure Descarrega;
    function  UsuarioSistema : String;
  public
    { Public declarations }
  end;


  Procedure CarregaLogin;


implementation
Uses
  Parametros,
  WinSock,
  uCodifica, DateUtils;

{$R *.dfm}



procedure CarregaLogin;
var
  FLogin: TFLogin;
Begin
  FLogin := TFLogin.Create(Application);
  Try
    FLogin.ShowModal;
  Finally
    FLogin.Free;
  End;
End;


procedure TFLogin.FormActivate(Sender: TObject);
begin
  EdNome.SetFocus;
end;

procedure TFLogin.EdNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       begin
         SelectNext(ActiveControl, True, True);
         key:= #0;
       end;
end;

procedure TFLogin.EdSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if   key = #13 then
       begin
         SelectNext(ActiveControl, True, True);
         key:= #0;
       end;
end;


procedure TFLogin.Button1Click(Sender: TObject);
begin
  TUniqueParametros.GetParametros.Usuario      := EdNome.Text;
  if    AnsiUpperCase(Trim(EdNome.Text)) = 'MESTRE' then
        TUniqueParametros.GetParametros.Senha  := EdSenha.Text
   else TUniqueParametros.GetParametros.Senha  := Criptografar(Trim(UpperCase(EdSenha.Text)));
  TUniqueParametros.GetParametros.CancelaLogin := False;
  Close;
end;

procedure TFLogin.Button2Click(Sender: TObject);
begin
  TUniqueParametros.GetParametros.CancelaLogin := True;
  Close;
end;

procedure TFLogin.Carrega;
var
  wVersionRequested : WORD;
  wsaData : TWSAData;
  p : PHostEnt;
  s : array[0..128] of char;
  p2 : pchar;
begin
  wVersionRequested := MAKEWORD(1, 1);
  WSAStartup(wVersionRequested, wsaData);
  GetHostName(@s, 128);
  p := GetHostByName(@s);
  TUniqueParametros.GetParametros.HostName := p^.h_Name;
  Label4.Caption := 'Maquina : ' + TUniqueParametros.GetParametros.HostName;
//  p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  TUniqueParametros.GetParametros.IPNumber := p2;
  Label5.Caption := 'IP : ' + TUniqueParametros.GetParametros.IPNumber;
  TUniqueParametros.GetParametros.UsuarioSistema := UsuarioSistema;
  Label6.Caption := 'Usuario Windows : ' + TUniqueParametros.GetParametros.UsuarioSistema;
  If   DaysBetween(TUniqueParametros.GetParametros.Validade,Date) <= 10 Then
       Label7.Caption := 'Atenção! O Sistema irá expirar em ' + IntToStr(DaysBetween(TUniqueParametros.GetParametros.Validade,Date)) + ' dias!';
  LVersao.Caption := 'Controle : ' + TUniqueParametros.GetParametros.VersaoSw;
end;

procedure TFLogin.Descarrega;
begin
  WSACleanup;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  Carrega;
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
  Descarrega;
end;

function TFLogin.UsuarioSistema: String;
var
  NetUserNameLength: DWord;
begin
  NetUserNameLength := 50;
  SetLength(Result, NetUserNameLength);
  GetUserName(pChar(Result), NetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
end;

end.
