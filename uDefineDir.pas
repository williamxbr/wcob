unit uDefineDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Registry, jpeg;

type
  TFrmDiretorios = class(TForm)
    pnRodape: TPanel;
    pnTela: TPanel;
    edVersao: TEdit;
    lblVersao: TLabel;
    sbVersao: TSpeedButton;
    sbCancela: TSpeedButton;
    sbConfirma: TSpeedButton;
    edDatabase: TEdit;
    lblDatabase: TLabel;
    sbDatabase: TSpeedButton;
    Image1: TImage;
    procedure sbVersaoClick(Sender: TObject);
    procedure sbCancelaClick(Sender: TObject);
    procedure sbConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDatabaseClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveConfigurations(const APath: String; Const AFileName: String);
    procedure LoadConfigurations(AFileName: String; var edCaminho : TEdit );
  public
    { Public declarations }
  end;

var
  FrmDiretorios: TFrmDiretorios;

implementation

{$R *.DFM}

uses
  FileCtrl;

const
  ARQUIVOSISTEMA   = 'SISTEMA.CFG';
  ARQUIVOSDATABASE = 'DATABASE.CFG';

procedure TFrmDiretorios.sbVersaoClick(Sender: TObject);
var
  Dir: String;
begin
  Dir := ExtractFilePath(Application.ExeName);
  if   SelectDirectory('Selecione os Diretorios de Configuração'  , '', Dir) then
       edVersao.Text := Dir;
end;

procedure TFrmDiretorios.sbCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDiretorios.sbConfirmaClick(Sender: TObject);
begin
  SaveConfigurations(edVersao.Text,ARQUIVOSISTEMA);
  SaveConfigurations(edDatabase.Text,ARQUIVOSDATABASE);
  Close;
end;

procedure TFrmDiretorios.FormCreate(Sender: TObject);
begin
  try
    edVersao.Text   := '';
    edDatabase.Text := '';
    LoadConfigurations(ARQUIVOSISTEMA, edVersao);
    LoadConfigurations(ARQUIVOSDATABASE, edDatabase);
    If   edVersao.Text = '' Then
         edVersao.Text := 'C:\' ;
    If   edDatabase.Text = '' Then
         edDatabase.Text := 'C:\' ;
  finally
  end;
end;

procedure TFrmDiretorios.SaveConfigurations(const APath: String; Const AFileName: String);
var
  F: TextFile;
begin
  assignFile(F, AFileName);
  Rewrite(F);
  try
    Writeln(F, APath);
  finally
    CloseFile(F);
  end;
end;

procedure TFrmDiretorios.LoadConfigurations(AFileName: String; var edCaminho : TEdit );
var
  F     : TextFile;
  APath : String;
begin
  assignFile(F, AFileName);
  if   FileExists(AFileName) then
       begin
         Reset(F);
         If   IoResult = 0 Then
              Begin
                ReadLn(F, APath);
                If   ioResult = 0 Then
                     edCaminho.Text:=APath
                Else
                     edCaminho.Text:='';
                CloseFile(F);
              End;
       End;
end;

procedure TFrmDiretorios.sbDatabaseClick(Sender: TObject);
var
  Dir: String;
begin
  Dir := ExtractFilePath(Application.ExeName);
  if   SelectDirectory('Selecione os Diretorios de Configuração'  , '', Dir) then
       edDatabase.Text := Dir;
end;

end.
