program Atualizador_wCob;

uses
  Forms,
  uAtualizador_wCob in 'uAtualizador_wCob.pas' {FrmAtualizador};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Atualizador eCob';
  Application.CreateForm(TFrmAtualizador, FrmAtualizador);
  Application.Run;
end.
