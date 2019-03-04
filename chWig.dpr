program chWig;

uses
  Forms,
  uChWig in 'uChWig.pas' {FrmAtualizaWigCred};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmAtualizaWigCred, FrmAtualizaWigCred);
  Application.Run;
end.
