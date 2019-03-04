program VerSenha;

uses
  Forms,
  Windows,
  MidasLib,
  Controls,
  uVerSenha in 'uVerSenha.pas';

{Dados: TDataModule}

{$R *.res}


begin
  Application.Initialize;
  Application.Title := 'wCob Gestão de Cobranças';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
