unit U_AlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, jpeg, ExtCtrls;

type
  TFAlteraSenha = class(TForm)
    SenhaAtual: TEdit;
    NovaSenha1: TEdit;
    NovaSenha2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Table1: TTable;
    Image1: TImage;
    Table1STATUS: TStringField;
    Table1DT_INC: TDateField;
    Table1DT_ALT: TDateField;
    Table1NOME: TStringField;
    Table1LOGIN: TStringField;
    Table1SENHA: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlteraSenha: TFAlteraSenha;

implementation

uses U_Login, U_Principal;

{$R *.dfm}

procedure TFAlteraSenha.BitBtn1Click(Sender: TObject);
begin

  Table1.Filtered:= false;
  Table1.Filter:= 'LOGIN = ' + #39 + FLogin.Login + #39;
  Table1.Filtered:= true;

  if Table1SENHA.Value = SenhaAtual.Text then
  begin
    if NovaSenha1.Text = NovaSenha2.Text then
    begin
    Table1.Edit;
    Table1.FieldByName('SENHA').AsString:= NovaSenha1.Text;
    Table1.Post;
    Application.MessageBox('Senha Alterada com Sucesso!', 'Confiração', MB_ICONINFORMATION);
    Close;
    end
    else
      begin
      Application.MessageBox('A Nova Senha não confere com Repetir Nova Senha!', 'Erro', MB_ICONERROR);
      NovaSenha1.SetFocus;
      end;
  end
  else
    begin
    Application.MessageBox('Senha Atual Incorreta', 'Erro', MB_ICONERROR);
    SenhaAtual.SetFocus;
    end;

end;

procedure TFAlteraSenha.FormActivate(Sender: TObject);
begin
Table1.Open;
SenhaAtual.SetFocus;
end;

procedure TFAlteraSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Table1.Close;
SenhaAtual.Text:= '';
NovaSenha1.Text:= '';
NovaSenha2.Text:= '';
end;

procedure TFAlteraSenha.BitBtn2Click(Sender: TObject);
begin
Close;
end;

end.
