program Acertos;

uses
  Forms,
  Windows,
  Controls,
  uDados in 'uDados.pas' {Dados: TDataModule},
  uAcertos in 'uAcertos.pas' {frmAcertos};

{Dados: TDataModule}

{$R *.res}


begin
  Application.Initialize;
  Application.Title := 'WigCred Cobranças e Cadastros Ltda. - ME';
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmAcertos, frmAcertos);
  Application.Run;
end.
