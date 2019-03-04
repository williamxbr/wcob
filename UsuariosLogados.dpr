program UsuariosLogados;

uses
  Forms,
  Windows,
  MidasLib,
  Controls,
  uUsuariosLogados in 'uUsuariosLogados.pas';

{Dados: TDataModule}

{$R *.res}


begin
  Application.Initialize;
  Application.Title := 'wCob Gestão de Cobranças';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
