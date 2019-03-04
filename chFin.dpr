program chFin;

uses
  Forms,
  uChFin in 'uChFin.pas' {FrmAtualizaFinanceiro};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmAtualizaFinanceiro, FrmAtualizaFinanceiro);
  Application.Run;
end.
