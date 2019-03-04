unit uAcertos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, jpeg, ExtCtrls, ToolWin, StdCtrls, Buttons,
  XPMan;


type
  TfrmAcertos = class(TForm)
    StatusBar1: TStatusBar;
    XPManifest1: TXPManifest;
    Button1: TButton;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FecharSistema(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure PreencherStatusBar;
  public
    { Public declarations }
  end;


var
  frmAcertos: TfrmAcertos;
  StringValue: string;
  IntegerValue: Integer;

implementation
Uses
  UDados,
  Parametros;

const
 SIDMENU  = 'IDMENU';
 SDados   = 'Dados : ';
 SVersao  = 'Versão : ';
 SUsuario = 'Usuario : ';

{$R *.dfm}

procedure TfrmAcertos.FormShow(Sender: TObject);
begin
  PreencherStatusBar;
end;

procedure TfrmAcertos.FecharSistema;
begin
  Close;
end;

procedure TfrmAcertos.PreencherStatusBar;
begin
  If   TParametros.GetParametros.EhCobrador Then
       StatusBar1.Panels[0].Text := SUsuario + ' Cobrador: ' + TParametros.GetParametros.Usuario
  Else StatusBar1.Panels[0].Text := SUsuario + TParametros.GetParametros.Usuario;
  StatusBar1.Panels[1].Text := SVersao + IntToStr(TParametros.GetParametros.Versao);
  StatusBar1.Panels[2].Text := SDados + TParametros.GetParametros.DatabaseName;
end;

procedure TfrmAcertos.Button1Click(Sender: TObject);
begin
  Button1.Enabled := False;
  Try
    Dados.TB_COBRANCA.First;
    While Not(Dados.TB_COBRANCA.Eof) Do
       Begin
         Application.ProcessMessages;
         Edit1.Text := IntToStr(Dados.TB_COBRANCACOBRANCA.AsInteger);
         Dados.TB_ACIONAMENTO.First;
         While Not(Dados.TB_ACIONAMENTO.Eof) Do
            Begin
              Dados.Comando.CommandText := ' UPDATE ACIONAMENTO A '+
                                           ' SET A.IDDEVEDOR = '+ IntToStr(Dados.TB_COBRANCADEVEDOR.AsInteger)+
                                           ' WHERE A.IDACIONAMENTO = '+ IntToStr(Dados.TB_ACIONAMENTOIDACIONAMENTO.AsInteger);
              Dados.Comando.Execute;
              Dados.TB_ACIONAMENTO.Next;
            End;
         Dados.TB_COBRANCA.Next;
       End;
  Except
    On E: Exception Do
       ShowMessage(e.Message);
  End;
  ShowMessage('Atualizado com sucesso');
  Button1.Enabled := True;
end;

end.
