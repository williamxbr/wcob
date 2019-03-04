unit uqAcordo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TQRAcordo = class(TQuickRep)
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private
    procedure Preenche_Dados(Cob : LongInt);
    procedure AbrirTabelas;
    procedure FecharTabelas;
  public

  end;

  procedure Imprimir_Acordo(Cobranca : LongInt);


implementation
Uses
  uDados;

{$R *.DFM}

procedure Imprimir_Acordo(Cobranca : LongInt);
var
  QRAcordo: TQRAcordo;
Begin
  QRAcordo := TQRAcordo.Create(Application);
  Try
    QRAcordo.Preenche_Dados(Cobranca);
    QRAcordo.Preview;
  Finally
    QRAcordo.Free;
  End;
End;

{ TQRAcordo }

procedure TQRAcordo.AbrirTabelas;
begin
  HabilitaTabelas(True);
end;

procedure TQRAcordo.FecharTabelas;
begin
  HabilitaTabelas(False);
end;

procedure TQRAcordo.Preenche_Dados(Cob: Integer);
begin
  If   Dados.TB_COBRANCA.Locate('COBRANCA',Cob,[loPartialKey]) Then
       Begin
         If   Dados.TB_DEVEDOR.Locate('CODIGO_DEVEDOR',Dados.TB_COBRANCADEVEDOR.Value,[loPartialKey]) Then
              Begin
                QRCampoDevedor.Caption := Dados.TB_DEVEDORNOME_DEVEDOR.Value;
              End;
       End;
end;

procedure TQRAcordo.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  AbrirTabelas;
end;

procedure TQRAcordo.QuickRepEndPage(Sender: TCustomQuickRep);
begin
  FecharTabelas;
end;

end.
