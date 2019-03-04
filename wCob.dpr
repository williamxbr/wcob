program wCob;

uses
  Forms,
  Windows,
  MidasLib,
  Controls,
  uPrincipal in 'uPrincipal.pas';

{Dados: TDataModule}

{$R *.res}


begin
  Application.Initialize;
  Application.Title := 'wCob Gestão de Cobranças';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
