program DefineDir;

uses
  Forms,
  uDefineDir in 'uDefineDir.pas' {FrmDiretorios};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := 'Configuração p/ atualização WigCred';
  Application.CreateForm(TFrmDiretorios, FrmDiretorios);
  Application.Run;
end.
