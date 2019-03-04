unit uteste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, jpeg, ExtCtrls, ToolWin, StdCtrls, Buttons,
  XPMan;


type
  TfrmTeste = class(TForm)
    StatusBar1: TStatusBar;
    XPManifest1: TXPManifest;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure FecharSistema(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmTeste: TfrmTeste;
  StringValue: string;
  IntegerValue: Integer;

implementation
Uses
  uRelPendenciasCredor,
  uAcordo,
  uPlanejamento,
  Parametros;

const
 SIDMENU  = 'IDMENU';
 SDados   = 'Dados : ';
 SVersao  = 'Versão : ';
 SUsuario = 'Usuario : ';

{$R *.dfm}

procedure TfrmTeste.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := SUsuario + TParametros.GetParametros.Usuario;
  StatusBar1.Panels[1].Text := SVersao + IntToStr(TParametros.GetParametros.Versao);
  StatusBar1.Panels[2].Text := SDados + TParametros.GetParametros.DatabaseName;
end;


procedure TfrmTeste.FecharSistema;
begin
  Close;
end;

procedure TfrmTeste.Button1Click(Sender: TObject);
begin
  RelPendenciasCredor;
end;

procedure TfrmTeste.Button2Click(Sender: TObject);
begin
  Planejamento;
end;

end.
