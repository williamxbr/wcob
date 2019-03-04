program SelecionaDiretorio;

uses
  Forms,
  uChConf in 'uChConf.pas' {FrmDiretorios};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := 'Configuração p/ atualização eCob';
  Application.CreateForm(TFrmDiretorios, FrmDiretorios);
  Application.Run;
end.
