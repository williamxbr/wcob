unit uCadastro_Usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uclayUsuario,
  Dialogs, DBCtrls, DB, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TFrmUsuarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dsUsuarios: TDataSource;
    DBNavUsuarios: TDBNavigator;
    DBNOME: TDBEdit;
    DBSENHA: TDBEdit;
    DBUSUARIO: TDBEdit;
    DBTIPO_USUARIO: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sbSair: TSpeedButton;
    Label5: TLabel;
    btnPermissao: TBitBtn;
    DB_ATIVO: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
  private
    { Private declarations }
    FUsuario : TUSUARIO;
    procedure AbrirArquivos;
    procedure FecharArquivos;
  public
    { Public declarations }
  end;

  procedure Cadastro_Usuarios;


implementation
Uses
  uPermissao;

{$R *.dfm}

procedure Cadastro_Usuarios;
var
  FrmUsuarios: TFrmUsuarios;
Begin
  FrmUsuarios := TFrmUsuarios.Create(Application);
  Try
    FrmUsuarios.ShowModal;
  Finally
    FrmUsuarios.Free;
  End;
End;

{ TFrmUsuarios }

procedure TFrmUsuarios.AbrirArquivos;
begin
  FUsuario := TUSUARIO.Create(Self);
  FUsuario.Carrega(False);
  dsUsuarios.DataSet := FUsuario;
end;

procedure TFrmUsuarios.FecharArquivos;
begin
  FUsuario.Free;
end;

procedure TFrmUsuarios.FormCreate(Sender: TObject);
begin
  AbrirArquivos;
end;

procedure TFrmUsuarios.FormDestroy(Sender: TObject);
begin
  FecharArquivos;
end;

procedure TFrmUsuarios.sbSairClick(Sender: TObject);
begin
  Close;
end;

end.
