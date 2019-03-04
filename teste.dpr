program teste;

uses
  Forms,
  Windows,
  Controls,
  uteste in 'uteste.pas' {frmTeste},
  uDados in 'uDados.pas' {Dados: TDataModule},
  uSplash in 'uSplash.pas' {frmSplash},
  uCodifica in 'uCodifica.pas';

{$R *.res}

Var
  Splash : TfrmSplash;

begin
  Splash := TfrmSplash.Create(Application);
  Try
    Splash.Show;
    Application.Initialize;
    Splash.Update;
    Splash.Contar;
    Application.Title := 'WigCred Cobranças e Cadastros Ltda. - ME';
    Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmTeste, frmTeste);
  Splash.Hide;
  Finally
    Splash.Free;
  End;
  Application.Run;
end.
