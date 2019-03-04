unit uQCobranca;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQRCobranca = class(TQuickRep)
  private

  public

  end;

  procedure Imprimir_Cobranca;



implementation

{$R *.DFM}

procedure Imprimir_Cobranca;
var
  QRCobranca: TQRCobranca;
Begin
  QRCobranca := TQRCobranca.Create(Application);
  Try
    QRCobranca.PreviewModal;
  Finally
    QRCobranca.Free;
  End;
End;


end.
