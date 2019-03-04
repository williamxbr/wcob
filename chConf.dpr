program chConf;

uses
  Forms,
  uChConf in 'uChConf.pas' {FrmDiretorios};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := 'Configuração p/ atualização SGT';
  Application.CreateForm(TFrmDiretorios, FrmDiretorios);
  Application.Run;
end.
